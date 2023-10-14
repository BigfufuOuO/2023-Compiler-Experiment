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
    //callee函数
    std::vector<Type *> Ints(1, Int32Type);//1个参数
    auto calleeFunTy = FunctionType::get(Int32Type, Ints);
    auto calleeFun = Function::create(calleeFunTy,"callee", module);
    auto bb = BasicBlock::create(module, "entry", calleeFun);
    builder->set_insert_point(bb);
    //获取形参
    std::vector<Value *> args;
    for (auto &arg: calleeFun->get_args()) {
        args.push_back(&arg);
    }
    //根据ll
    auto retmul =builder->create_imul(args[0], CONST_INT(2));
    builder->create_ret(retmul);

    //main函数
    auto mainFun = Function::create(FunctionType::get(Int32Type, {}),"main", module);
    bb = BasicBlock::create(module, "entry", mainFun);
    builder->set_insert_point(bb);
    //根据ll
    auto call = builder->create_call(calleeFun, {CONST_INT(110)}); // 创建call指令
    builder->create_ret(call);

    // 输出 module 中的所有 IR 指令
    std::cout << module->print();
    delete module;
    return 0;
}
