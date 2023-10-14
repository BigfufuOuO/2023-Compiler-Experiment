#include "BasicBlock.hpp"
#include "Constant.hpp"
#include "Function.hpp"
#include "IRBuilder.hpp"
#include "Module.hpp"
#include "Type.hpp"

#include<iostream>
#include<memory>

// 定义一个从常数值获取/创建 ConstantInt 类实例化的宏，方便多次调用
#define CONST_INT(num) \
    ConstantInt::get(num, module)

// 定义一个从常数值获取/创建 ConstantFP 类实例化的宏，方便多次调用
#define CONST_FP(num) \
    ConstantFP::get(num, module)

int main() {
    auto module = new Module();
    auto builder = new IRBuilder(nullptr, module);
    Type *Int32Type = module->get_int32_type();

    //main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type, {}),"main", module);
    auto bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
    //根据ll
    auto aAlloca = builder->create_alloca(Int32Type);
    auto iAlloca = builder->create_alloca(Int32Type);
    builder->create_store(CONST_INT(10), aAlloca);
    builder->create_store(CONST_INT(0), iAlloca);
    auto iLoad = builder->create_load(iAlloca);
    auto icmp = builder->create_icmp_lt(iLoad, CONST_INT(10));
    //创建分支
    auto trueBB = BasicBlock::create(module, "trueBB", mainFun);
    auto falseBB = BasicBlock::create(module, "falseBB", mainFun);
    auto br = builder->create_cond_br(icmp, trueBB, falseBB);

    //tureBB
    builder->set_insert_point(trueBB);
    iLoad = builder->create_load(iAlloca);
    auto iadd = builder->create_iadd(iLoad, CONST_INT(1));
    builder->create_store(iadd, iAlloca);
    auto aLoad = builder->create_load(aAlloca);
    iLoad = builder->create_load(iAlloca);
    iadd = builder->create_iadd(aLoad,iLoad);
    builder->create_store(iadd, aAlloca);
    icmp = builder->create_icmp_lt(iLoad, CONST_INT(10));
    br = builder->create_cond_br(icmp, trueBB, falseBB);

    //falseBB
    builder->set_insert_point(falseBB);
    aLoad = builder->create_load(aAlloca);
    builder->create_ret(aLoad);

    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}
