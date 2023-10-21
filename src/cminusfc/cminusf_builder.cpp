#include "cminusf_builder.hpp"

#define CONST_FP(num) ConstantFP::get((float)num, module.get())
#define CONST_INT(num) ConstantInt::get(num, module.get())

// types
Type *VOID_T;
Type *INT1_T;
Type *INT32_T;
Type *INT32PTR_T;
Type *FLOAT_T;
Type *FLOATPTR_T;

/*
 * use CMinusfBuilder::Scope to construct scopes
 * scope.enter: enter a new scope
 * scope.exit: exit current scope
 * scope.push: add a new binding to current scope
 * scope.find: find and return the value bound to the name
 */

Value* CminusfBuilder::visit(ASTProgram &node) {
    VOID_T = module->get_void_type();
    INT1_T = module->get_int1_type();
    INT32_T = module->get_int32_type();
    INT32PTR_T = module->get_int32_ptr_type();
    FLOAT_T = module->get_float_type();
    FLOATPTR_T = module->get_float_ptr_type();

    Value *ret_val = nullptr;
    for (auto &decl : node.declarations) {
        ret_val = decl->accept(*this);
    }
    return ret_val;
}

Value* CminusfBuilder::visit(ASTNum &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if(node.type == TYPE_INT) //current value : int
        this->context.val = CONST_INT(node.i_val);
    else
        this->context.val = CONST_FP(node.f_val);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTVarDeclaration &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Value *var;
    Type *type;
    //variable
    if(node.num == nullptr)
    {
        if(node.type == TYPE_INT)
            type = INT32_T;
        else
            type = FLOAT_T;
    }
    else //array
    {
        if(node.type == TYPE_INT)
            type = ArrayType::get(INT32_T, node.num->i_val);
        else
            type = ArrayType::get(FLOAT_T, node.num->i_val);
    }
    // 全局变量判断
    if(scope.in_global())//全局变量
        var = GlobalVariable::create(node.id, module.get(), type, false, ConstantZero::get(type, module.get()));
    else
        var = builder->create_alloca(type);
    
    scope.push(node.id, var);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTFunDeclaration &node) {
    FunctionType *fun_type;
    Type *ret_type;
    std::vector<Type *> param_types;
    if (node.type == TYPE_INT)
        ret_type = INT32_T;
    else if (node.type == TYPE_FLOAT)
        ret_type = FLOAT_T;
    else
        ret_type = VOID_T;

    for (auto &param : node.params) {
        // TODO: Please accomplish param_types.
        if(param->type == TYPE_INT)
        {
            if(param->isarray)//数组
                param_types.push_back(INT32PTR_T);//使用vector的方法push_back将指针插入vector容器末尾
            else
                param_types.push_back(INT32_T);
        }
        else //flaot
        {
            if(param->isarray)
                param_types.push_back(FLOATPTR_T);
            else
                param_types.push_back(FLOAT_T);
        }
    }

    fun_type = FunctionType::get(ret_type, param_types);
    auto func = Function::create(fun_type, node.id, module.get());
    scope.push(node.id, func);
    context.func = func;
    auto funBB = BasicBlock::create(module.get(), "entry", func);
    builder->set_insert_point(funBB);
    scope.enter();
    std::vector<Value *> args;
    for (auto &arg : func->get_args()) {
        args.push_back(&arg);
    }

    Type *type_temp;
    Value *var;
    for (int i = 0; i < node.params.size(); ++i) {
        // TODO: You need to deal with params and store them in the scope.

        if(node.params[i]->type == TYPE_INT)
        {
            if(node.params[i]->isarray)
                type_temp = INT32PTR_T;
            else
                type_temp = INT32_T;
        }
        else //float
        {
            if(node.params[i]->isarray)
                type_temp = FLOATPTR_T;
            else
                type_temp = FLOAT_T;
        }
        var = builder->create_alloca(type_temp);
        builder->create_store(args[i], var);
        scope.push(node.params[i]->id, var);
    }
    node.compound_stmt->accept(*this);
    if (not builder->get_insert_block()->is_terminated())
    {
        if (context.func->get_return_type()->is_void_type())
            builder->create_void_ret();
        else if (context.func->get_return_type()->is_float_type())
            builder->create_ret(CONST_FP(0.));
        else
            builder->create_ret(CONST_INT(0));
    }
    scope.exit();
    return nullptr;
}

Value* CminusfBuilder::visit(ASTParam &node) {
    // TODO: This function is empty now.
    // Add some code here.

    return nullptr;
}

Value* CminusfBuilder::visit(ASTCompoundStmt &node) {
    // TODO: This function is not complete.
    // You may need to add some code here
    // to deal with complex statements.
    scope.enter();
    for (auto &decl : node.local_declarations) {
        decl->accept(*this);
    }

    for (auto &stmt : node.statement_list) {
        stmt->accept(*this);
        if (builder->get_insert_block()->is_terminated())
            break;
    }
    return nullptr;
    scope.exit();
}

Value* CminusfBuilder::visit(ASTExpressionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if(node.expression != nullptr)
        node.expression->accept(*this);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSelectionStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto trueBB = BasicBlock::create(module.get(), "trueBB", this->context.func);
    auto falseBB = BasicBlock::create(module.get(), "falseBB", this->context.func);
    auto endBB = BasicBlock::create(module.get(), "endBB", this->context.func);

    node.expression->accept(*this);
    if(this->context.val->get_type()->is_integer_type())
        this->context.val = builder->create_icmp_ne(this->context.val, CONST_INT(0));
    else
        this->context.val = builder->create_fcmp_ne(this->context.val, CONST_INT(0));

    builder->create_cond_br(this->context.val, trueBB, falseBB);
    builder->set_insert_point(trueBB);
    //tureBB
    scope.enter();
    node.if_statement->accept(*this);
    scope.exit();
    if(builder->get_insert_block()->get_terminator() == nullptr)
    {
        builder->create_br(endBB);
    }   
    
    //false BB(else)
    builder->set_insert_point(falseBB);
    if(node.else_statement != nullptr)
    {
        scope.enter();
        node.else_statement->accept(*this);
        scope.exit();
        if(builder->get_insert_block()->get_terminator() == nullptr)
        {
            builder->create_br(endBB);
        }
    }
    else
    {
        builder->create_br(endBB);
    }
    builder->set_insert_point(endBB);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTIterationStmt &node) {
    // TODO: This function is empty now.
    // Add some code here.
    auto trueBB = BasicBlock::create(module.get(), "trueBB", this->context.func);
    auto falseBB = BasicBlock::create(module.get(), "falseBB", this->context.func);
    auto testBB = BasicBlock::create(module.get(), "testBB", this->context.func);
    builder->create_br(testBB);
    builder->set_insert_point(testBB);
    node.expression->accept(*this);

    this->context.val = builder->create_icmp_ne(this->context.val,CONST_INT(0));
    builder->create_cond_br(this->context.val, trueBB, falseBB);
    builder->set_insert_point(trueBB);
    scope.enter();
    node.statement->accept(*this);
    scope.exit();

    if (builder->get_insert_block()->get_terminator() == nullptr) {
        builder->create_br(testBB);
    }
    builder->set_insert_point(falseBB);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTReturnStmt &node) {
    if (node.expression == nullptr) {
        builder->create_void_ret();
        return nullptr;
    } else {
        // TODO: The given code is incomplete.
        // You need to solve other return cases (e.g. return an integer).
        node.expression->accept(*this);
        //类型转换
        if(this->context.func->get_function_type()->get_return_type() != this->context.val->get_type())//类型不同
        {
            if(this->context.val->get_type()->is_integer_type())
                this->context.val = builder->create_sitofp(this->context.val, FLOAT_T);
            else
                this->context.val = builder->create_fptosi(this->context.val, INT32_T);
        }
        builder->create_ret(this->context.val);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTVar &node) {
    // TODO: This function is empty now.
    // Add some code here.
    this->context.val = scope.find(node.id);
    if(node.expression == nullptr)
    {
        if(!this->context.islvalue) //不是左值，尝试获取该值
        {
            if(this->context.val->get_type()->get_pointer_element_type()->is_array_type())
                this->context.val = builder->create_gep(this->context.val, {CONST_INT(0),CONST_INT(0)});//数组地址
            else
                this->context.val = builder->create_load(this->context.val);
        }
    }
    else
    {
        Value *val_id = this->context.val;
        
        bool islvalue_post = this->context.islvalue;
        //expression
        this->context.islvalue = false; 
        node.expression->accept(*this);
        this->context.islvalue = islvalue_post;

        Value *val_exp = this->context.val;
        if(val_exp->get_type()->is_float_type())
            val_exp = builder->create_fptosi(val_exp, INT32_T);

        auto trueBB = BasicBlock::create(module.get(), "trueBB", this->context.func);
        auto falseBB = BasicBlock::create(module.get(), "falseBB", this->context.func);
        auto endBB = BasicBlock::create(module.get(), "endBB", this->context.func);
        //判断数组下标
        Value *icmp = builder->create_icmp_ge(val_exp, CONST_INT(0));
        builder->create_cond_br(icmp, trueBB, falseBB);

        builder->set_insert_point(trueBB);//未越界
        if(val_id->get_type()->get_pointer_element_type()->is_integer_type() || 
            val_id->get_type()->get_pointer_element_type()->is_float_type())
            this->context.val = builder->create_gep(val_id,{val_exp});
        else if(val_id->get_type()->get_pointer_element_type()->is_pointer_type())
        {
            val_id = builder->create_load(val_id);
            this->context.val = builder->create_gep(val_id,{val_exp});
        }
        else
            this->context.val = builder->create_gep(val_id,{CONST_INT(0),val_exp});
            
        //不返回左值
        if(!this->context.islvalue)
            this->context.val = builder->create_load(this->context.val);
        builder->create_br(endBB);

        //数组下表越界
        builder->set_insert_point(falseBB);
        builder->create_call(scope.find("neg_idx_except"), {});
        builder->create_br(endBB);
        builder->set_insert_point(endBB);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAssignExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    this->context.islvalue = true;
    node.var->accept(*this);
    this->context.islvalue = false;

    Value *varL = this->context.val;
    node.expression->accept(*this);
    Value *varR = this->context.val;
    
    //类型转换
    if(varL->get_type()->get_pointer_element_type() != varR->get_type())
    {
        if(varR->get_type()->is_integer_type())
            this->context.val = builder->create_sitofp(varR, FLOAT_T);
        else
            this->context.val = builder->create_fptosi(varR, INT32_T);
    }
    builder->create_store(this->context.val, varL);
    return nullptr;
}

Value* CminusfBuilder::visit(ASTSimpleExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if(node.additive_expression_r == nullptr)
        node.additive_expression_l->accept(*this);
    else
    {
        CminusType type = TYPE_INT;
        node.additive_expression_l->accept(*this);
        Value *var1 = this->context.val;
        node.additive_expression_r->accept(*this);
        Value *var2 = this->context.val;
        //float转换
        if(var1->get_type()->is_float_type() || var2->get_type()->is_float_type())
        {
            type = TYPE_FLOAT;
            if(var1->get_type()->is_integer_type())
                var1 = builder->create_sitofp(var1, FLOAT_T);
            if(var2->get_type()->is_integer_type())
                var2 = builder->create_sitofp(var2, FLOAT_T);
        }

        switch (node.op)
        {
        case OP_LE: //<=
            if(type == TYPE_INT)    
                this->context.val = builder->create_icmp_le(var1, var2);
            else
                this->context.val = builder->create_fcmp_le(var1, var2);
            break;

        case OP_LT: //<
            if(type == TYPE_INT)    
                this->context.val = builder->create_icmp_lt(var1, var2);
            else
                this->context.val = builder->create_fcmp_lt(var1, var2);
            break;

        case OP_GT: //>
            if(type == TYPE_INT)    
                this->context.val = builder->create_icmp_gt(var1, var2);
            else
                this->context.val = builder->create_fcmp_gt(var1, var2);
            break;
        
        case OP_GE: //>=
            if(type == TYPE_INT)    
                this->context.val = builder->create_icmp_ge(var1, var2);
            else
                this->context.val = builder->create_fcmp_ge(var1, var2);
            break;

        case OP_EQ: //=
            if(type == TYPE_INT)    
                this->context.val = builder->create_icmp_eq(var1, var2);
            else
                this->context.val = builder->create_fcmp_eq(var1, var2);
            break;

        case OP_NEQ: //!=
            if(type == TYPE_INT)    
                this->context.val = builder->create_icmp_ne(var1, var2);
            else
                this->context.val = builder->create_fcmp_ne(var1, var2);
            break;
        
        default:
            break;
        }
        this->context.val = builder->create_zext(this->context.val, INT32_T);
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTAdditiveExpression &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if(node.additive_expression == nullptr)
        node.term->accept(*this);
    else
    {
        CminusType type = TYPE_INT;
        node.additive_expression->accept(*this);
        Value *var1 = this->context.val;
        node.term->accept(*this);
        Value *var2 = this->context.val;
        //float转换
        if(var1->get_type()->is_float_type() || var2->get_type()->is_float_type())
        {
            type = TYPE_FLOAT;
            if(var1->get_type()->is_integer_type())
                var1 = builder->create_sitofp(var1, FLOAT_T);
            if(var2->get_type()->is_integer_type())
                var2 = builder->create_sitofp(var2, FLOAT_T);
        }

        switch (node.op)
        {
        case OP_PLUS:
            if(type == TYPE_INT)
                this->context.val = builder->create_iadd(var1, var2);
            else
                this->context.val = builder->create_fadd(var1, var2);
            break;

        case OP_MINUS:
            if(type == TYPE_INT)
                this->context.val = builder->create_isub(var1, var2);
            else
                this->context.val = builder->create_fsub(var1, var2);
            break;
        
        default:
            break;
        }

    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTTerm &node) {
    // TODO: This function is empty now.
    // Add some code here.
    if(node.term == nullptr)
        node.factor->accept(*this);
    else
    {
         CminusType type = TYPE_INT;
        node.term->accept(*this);
        Value *var1 = this->context.val;
        node.factor->accept(*this);
        Value *var2 = this->context.val;

        //float转换
        if(var1->get_type()->is_float_type() || var2->get_type()->is_float_type())
        {
            type = TYPE_FLOAT;
            if(var1->get_type()->is_integer_type())
                var1 = builder->create_sitofp(var1, FLOAT_T);
            if(var2->get_type()->is_integer_type())
                var2 = builder->create_sitofp(var2, FLOAT_T);
        }
        switch (node.op)
        {
        case OP_MUL:
            if(type == TYPE_INT)
                this->context.val = builder->create_imul(var1, var2);
            else
                this->context.val = builder->create_fmul(var1, var2);
            break;
        
        case OP_DIV:
            if(type == TYPE_INT)
                this->context.val = builder->create_isdiv(var1, var2);
            else
                this->context.val = builder->create_fdiv(var1, var2);
            break;
        
        default:
            break;
        }
    }
    return nullptr;
}

Value* CminusfBuilder::visit(ASTCall &node) {
    // TODO: This function is empty now.
    // Add some code here.
    Function *fun = (Function *)(scope.find(node.id));
    std::vector <Value*> arguments;
    auto param = fun->get_function_type()->param_begin();
    for (auto &argu : node.args)
    {
        argu->accept(*this);
        if(this->context.val->get_type() != *param)
        {
            if(this->context.val->get_type()->is_integer_type())
                this->context.val = builder->create_sitofp(this->context.val, *param);
            else
                this->context.val = builder->create_fptosi(this->context.val, *param);
        }
        param++;
        arguments.push_back(this->context.val);
    }
    this->context.val = builder->create_call(fun, arguments);
    return nullptr;
}
