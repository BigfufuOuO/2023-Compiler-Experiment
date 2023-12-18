#include "Dominators.hpp"

void Dominators::run() {
    for (auto &f1 : m_->get_functions()) {
        auto f = &f1;
        if (f->get_basic_blocks().size() == 0)
            continue;
        for (auto &bb1 : f->get_basic_blocks()) {
            auto bb = &bb1;
            idom_.insert({bb, {}});
            dom_frontier_.insert({bb, {}});
            dom_tree_succ_blocks_.insert({bb, {}});
        }

        create_idom(f);
        create_dominance_frontier(f);
        create_dom_tree_succ(f);
    }
}

void Dominators::create_idom(Function *f) {
    // TODO 分析得到 f 中各个基本块的 idom
    //idom_.clear();
    idom_[f->get_entry_block()] = f->get_entry_block();
    bool changed = true;
    std::list<BasicBlock *> Queue;
    BasicBlock *new_idom = nullptr;
    BBSet processed;
    
    while (changed) {
        processed.clear();
        changed = false;
        Queue.push_back(f->get_entry_block());
        while (!Queue.empty())
        {
            /*reverse postorder*/
            BasicBlock *b = Queue.front();
            Queue.pop_front();
            //processed.insert(b);
            //------FIX ME------
            if (processed.insert(b).second)//insert success
            {
                for (auto &bb : b->get_succ_basic_blocks())
                {
                    if(bb != nullptr)
                        Queue.push_back(bb);
                }
                /*reverse postorder END*/
                if (b != f->get_entry_block())
                {
                    new_idom = first_processed_predecessor(b, processed);
                    //for all other predecessors, p, of b
                    for (auto &p : b->get_pre_basic_blocks())
                    {
                        if (p != new_idom && p != nullptr && idom_[p] != nullptr)
                        {
                            new_idom = intersect(p, new_idom);
                        }
                    }
                    if (idom_[b] != new_idom)
                    {
                        idom_[b] = new_idom;
                        changed = true;
                    }
                }
            }
        }
        
    }
}

void Dominators::create_dominance_frontier(Function *f) {
    // TODO 分析得到 f 中各个基本块的支配边界集合
    //dom_frontier_.clear();
    BasicBlock *runner = nullptr;
    for (auto b = f->get_basic_blocks().begin(); b != f->get_basic_blocks().end(); b++)
    {
        //for all predecessors, p, of b
        if ((&*b)->get_pre_basic_blocks().size() >= 2)
        {
            for (auto &p : (&*b)->get_pre_basic_blocks())
            {
                runner = p;
                while (runner != idom_[&*b])
                {
                    dom_frontier_[runner].insert(&*b);
                    runner = idom_[runner];
                }
            }
        }
    }
}

void Dominators::create_dom_tree_succ(Function *f) {
    // TODO 分析得到 f 中各个基本块的支配树后继
    for (auto b = f->get_basic_blocks().begin(); b != f->get_basic_blocks().end(); b++)
    {
        if ((&*b) != f->get_entry_block())
        {
            dom_tree_succ_blocks_[idom_[&*b]].insert(&*b);
        }
    }
}

//补充需要的函数
BasicBlock* Dominators::first_processed_predecessor(BasicBlock *bb, BBSet &processed)
{
    for (auto &bb1 : bb->get_pre_basic_blocks())
    {
        if (processed.find(bb1) != processed.end()) 
            return bb1;
    }
    return nullptr;
}

/*
BasicBlock* Dominators::intersect(BasicBlock *b1, BasicBlock *b2)
{
    BasicBlock *finger1 = b1;
    BasicBlock *finger2 = b2;
    
    while (finger1 != finger2)
    {
        //-----------------FIX ME-----------------
        while (finger1->get_name() < finger2->get_name())
        {
            finger1 = idom_[finger1];
        }
        while (finger2->get_name() < finger1->get_name())
        {
            finger2 = idom_[finger2];
        }
    }
    return finger1;
}*/

//-----------------FIX ME-----------------

bool Dominators::bb_lt(BasicBlock* b1, BasicBlock* b2) {
    BasicBlock* finger1 = b1;
    BasicBlock* finger2 = b2;
    while (!finger1->get_pre_basic_blocks().empty() && !finger2->get_pre_basic_blocks().empty()) 
    {
        finger1 = finger1->get_pre_basic_blocks().front();
        finger2 = finger2->get_pre_basic_blocks().front();
    }
    return !(finger1->get_pre_basic_blocks().empty());
}
bool Dominators::bb_eq(BasicBlock* b1, BasicBlock* b2) {
    BasicBlock* finger1 = b1;
    BasicBlock* finger2 = b2;
    while (!finger1->get_pre_basic_blocks().empty() && !finger2->get_pre_basic_blocks().empty()) 
    {
        finger1 = finger1->get_pre_basic_blocks().front();
        finger2 = finger2->get_pre_basic_blocks().front();
    }
    return finger1->get_pre_basic_blocks().empty() && finger2->get_pre_basic_blocks().empty();
}

BasicBlock* Dominators::intersect(BasicBlock* b1, BasicBlock* b2) {
    BasicBlock* finger1 = b1;
    BasicBlock* finger2 = b2;
    while (finger1 != finger2) {
        if (bb_eq(finger1, finger2)) finger1 = idom_[finger1];
        while (bb_lt(finger1, finger2)) 
        {
            finger1 = idom_[finger1];
        }
        while (bb_lt(finger2, finger1)) 
        {
            finger2 = idom_[finger2];
        }
    }
    return finger1;
}

