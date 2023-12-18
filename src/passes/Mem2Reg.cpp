#include "Mem2Reg.hpp"
#include "IRBuilder.hpp"
#include "Value.hpp"

#include <memory>

void Mem2Reg::run() {
    // 创建支配树分析 Pass 的实例
    dominators_ = std::make_unique<Dominators>(m_);
    // 建立支配树
    dominators_->run();
    // 以函数为单元遍历实现 Mem2Reg 算法
    for (auto &f : m_->get_functions()) {
        if (f.is_declaration())
            continue;
        func_ = &f;
        if (func_->get_basic_blocks().size() >= 1) {
            // 对应伪代码中 phi 指令插入的阶段
            generate_phi();
            // 对应伪代码中重命名阶段
            rename(func_->get_entry_block());
        }
        // 后续 DeadCode 将移除冗余的局部变量的分配空间
    }
}

void Mem2Reg::generate_phi() {
    // TODO
    // 步骤一：找到活跃在多个 block 的全局名字集合，以及它们所属的 bb 块
    // 步骤二：从支配树获取支配边界信息，并在对应位置插入 phi 指令
    BBSet F;//已经插入关于变量 v 的 phi 函数的基本块集合
    BBSet W;//所有定义了变量 v 的基本块集合
    BasicBlock* X;
    //F.clear();
    //W.clear();

    /*记录所有变量出现的alloca/load/store指令*/
    for (auto &bb : func_->get_basic_blocks())
    {
        for (auto &inst : bb.get_instructions())
        {
            //------FIX ME------
            if (inst.is_alloca() && !(dynamic_cast<AllocaInst*>(&inst)->get_alloca_type()->is_array_type()))
            {
                //variables[inst.get_operand(0)].push_back(&bb);
                variables[&inst].push_back(&bb);
            }
            else if (inst.is_store())
            {
                if(variables[inst.get_operand(1)].size() != 0 && variables[inst.get_operand(1)].back() != &bb)
                    variables[inst.get_operand(1)].push_back(&bb);
            }
            else if (inst.is_load())
            {
                if(variables[inst.get_operand(0)].size() != 0 && (variables[inst.get_operand(0)].back()) != &bb) 
                    variables[inst.get_operand(0)].push_back(&bb);
            }
        }

    }

    /*计算Defs*/
    for (auto &bb : func_->get_basic_blocks())
    {
        for (auto &inst : bb.get_instructions())
        {
            if (inst.is_store() && variables[inst.get_operand(1)].size() > 1
                && 
                (Defs[inst.get_operand(1)].size() == 0 || Defs[inst.get_operand(1)].back() != &bb))
            {
                Defs[inst.get_operand(1)].push_back(&bb);
            }
        }
    }

    /*插入phi函数*/
    //-------------FIX ME----------------
    for (auto &v : variables)
    {
        if (v.second.size() > 1)//如果变量v在多个基本块中活跃
        {
            F.clear();
            W.clear();
            for (auto &bb : Defs[v.first])
            {
                W.insert(bb);
            }

            while (!W.empty())
            {
                X = *W.begin();
                W.erase(W.begin()); // remove a basic block X from W
                for (auto Y : dominators_->get_dominance_frontier(X)) // Y : basic block in DF(X)
                {
                    //if Y not in F then
                    if (F.find(Y) == F.end())
                    {
                        //insert phi function for v in Y
                        //---------------------------------FIX ME----------------------------------
                        auto phi = PhiInst::create_phi(v.first->get_type()->get_pointer_element_type(), Y);
                        Y->add_instr_begin(phi);
                        phi_belongs[phi] = v.first; //记录
                        //F = F U {Y}
                        F.insert(Y);
                        //if Y not in Defs(v)
                        if (std::find(Defs[v.first].begin(), Defs[v.first].end(), Y) == Defs[v.first].end())
                        {
                            //W = W U {Y}
                            W.insert(Y);
                        }
                    }
                }
            }
            
        }
    }

}

void Mem2Reg::rename(BasicBlock *bb) {
    // TODO
    // 步骤三：将 phi 指令作为 lval 的最新定值，lval 即是为局部变量 alloca 出的地址空间
    // 步骤四：用 lval 最新的定值替代对应的load指令
    // 步骤五：将 store 指令的 rval，也即被存入内存的值，作为 lval 的最新定值
    // 步骤六：为 lval 对应的 phi 指令参数补充完整
    // 步骤七：对 bb 在支配树上的所有后继节点，递归执行 re_name 操作
    // 步骤八：pop出 lval 的最新定值
    // 步骤九：清除冗余的指令
    
    /*stack*/
    for (auto &inst : bb->get_instructions())
    {
        if (inst.is_phi())
        {
            stack[phi_belongs[&inst]].push_back(&inst);
        }
        else if (inst.is_store() && variables[inst.get_operand(1)].size() != 0)
        {
            stack[inst.get_operand(1)].push_back(inst.get_operand(0));
        }
        else if (inst.is_load() && variables[inst.get_operand(0)].size() != 0 && stack[inst.get_operand(0)].size() != 0)
        {
            inst.replace_all_use_with(stack[inst.get_operand(0)].back());
        }
    }

    /*填写phi函数*/
    //foreach S in successor of B in the CFG 
    for (auto S : bb->get_succ_basic_blocks())
    {
        for (auto &inst : S->get_instructions())
        {
            if (inst.is_phi() && stack[phi_belongs[&inst]].size() != 0)
            {
                dynamic_cast<PhiInst*>(&inst)->add_phi_pair_operand(stack[phi_belongs[&inst]].back(), bb);
            }
        }
    }

    /*递归遍历基本块*/
    // foreach S in successor of B in the dominator tree
    for (auto S : dominators_->get_dom_tree_succ_blocks(bb))
    {
        rename(S);
    }

    /*恢复栈空间状态，退出本次调用*/
    //foreach “store val, i” in B and each i’phi function in B 
    std::set<Instruction*> ins_set;
    for (auto &inst : bb->get_instructions())
    {
        if (inst.is_store() && variables[inst.get_operand(1)].size() != 0 && stack[inst.get_operand(1)].size() != 0)
        {
            stack[inst.get_operand(1)].pop_back();
            ins_set.insert(&inst);

        }
        else if (inst.is_phi() && stack[phi_belongs[&inst]].size() != 0)
        {
            stack[phi_belongs[&inst]].pop_back();
        }
    }

    /*删除多余指令*/
    //---------------------------------FIX ME----------------------------------
    for (auto &inst : ins_set)
    {
        bb->get_instructions().erase(inst);
    }
}
