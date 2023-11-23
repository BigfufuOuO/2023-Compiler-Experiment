; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/13-complex.cminus"

@n = global i32 zeroinitializer
@m = global i32 zeroinitializer
@w = global [5 x i32] zeroinitializer
@v = global [5 x i32] zeroinitializer
@dp = global [66 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @max(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op2
  %op5 = load i32, i32* %op3
  %op6 = icmp sgt i32 %op4, %op5
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label9, label %label11
label9:                                                ; preds = %label_entry
  %op10 = load i32, i32* %op2
  ret i32 %op10
label11:                                                ; preds = %label_entry
  %op12 = load i32, i32* %op3
  ret i32 %op12
label13:
  ret i32 0
}
define i32 @knapsack(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = alloca i32
  %op5 = load i32, i32* %op3
  %op6 = icmp sle i32 %op5, 0
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label9, label %label10
label9:                                                ; preds = %label_entry
  ret i32 0
label10:                                                ; preds = %label_entry
  br label %label11
label11:                                                ; preds = %label10
  %op12 = load i32, i32* %op2
  %op13 = icmp eq i32 %op12, 0
  %op14 = zext i1 %op13 to i32
  %op15 = icmp ne i32 %op14, 0
  br i1 %op15, label %label16, label %label17
label16:                                                ; preds = %label11
  ret i32 0
label17:                                                ; preds = %label11
  br label %label18
label18:                                                ; preds = %label17
  %op19 = load i32, i32* %op2
  %op20 = mul i32 %op19, 11
  %op21 = load i32, i32* %op3
  %op22 = add i32 %op20, %op21
  %op23 = icmp sge i32 %op22, 0
  br i1 %op23, label %label36, label %label39
label24:                                                ; preds = %label40
  %op25 = load i32, i32* %op2
  %op26 = mul i32 %op25, 11
  %op27 = load i32, i32* %op3
  %op28 = add i32 %op26, %op27
  %op29 = icmp sge i32 %op28, 0
  br i1 %op29, label %label44, label %label47
label30:                                                ; preds = %label40
  br label %label31
label31:                                                ; preds = %label30
  %op32 = load i32, i32* %op3
  %op33 = load i32, i32* %op2
  %op34 = sub i32 %op33, 1
  %op35 = icmp sge i32 %op34, 0
  br i1 %op35, label %label71, label %label74
label36:                                                ; preds = %label18
  %op37 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op22
  %op38 = load i32, i32* %op37
  br label %label40
label39:                                                ; preds = %label18
  call void @neg_idx_except()
  br label %label40
label40:                                                ; preds = %label36, %label39
  %op41 = icmp sge i32 %op38, 0
  %op42 = zext i1 %op41 to i32
  %op43 = icmp ne i32 %op42, 0
  br i1 %op43, label %label24, label %label30
label44:                                                ; preds = %label24
  %op45 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op28
  %op46 = load i32, i32* %op45
  br label %label48
label47:                                                ; preds = %label24
  call void @neg_idx_except()
  br label %label48
label48:                                                ; preds = %label44, %label47
  ret i32 %op46
label49:                                                ; preds = %label75
  %op50 = load i32, i32* %op2
  %op51 = sub i32 %op50, 1
  %op52 = load i32, i32* %op3
  %op53 = call i32 @knapsack(i32 %op51, i32 %op52)
  store i32 %op53, i32* %op4
  br label %label65
label54:                                                ; preds = %label75
  %op55 = load i32, i32* %op2
  %op56 = sub i32 %op55, 1
  %op57 = load i32, i32* %op3
  %op58 = call i32 @knapsack(i32 %op56, i32 %op57)
  %op59 = load i32, i32* %op2
  %op60 = sub i32 %op59, 1
  %op61 = load i32, i32* %op3
  %op62 = load i32, i32* %op2
  %op63 = sub i32 %op62, 1
  %op64 = icmp sge i32 %op63, 0
  br i1 %op64, label %label79, label %label82
label65:                                                ; preds = %label49, %label93
  %op66 = load i32, i32* %op2
  %op67 = mul i32 %op66, 11
  %op68 = load i32, i32* %op3
  %op69 = add i32 %op67, %op68
  %op70 = icmp sge i32 %op69, 0
  br i1 %op70, label %label96, label %label98
label71:                                                ; preds = %label31
  %op72 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op34
  %op73 = load i32, i32* %op72
  br label %label75
label74:                                                ; preds = %label31
  call void @neg_idx_except()
  br label %label75
label75:                                                ; preds = %label71, %label74
  %op76 = icmp slt i32 %op32, %op73
  %op77 = zext i1 %op76 to i32
  %op78 = icmp ne i32 %op77, 0
  br i1 %op78, label %label49, label %label54
label79:                                                ; preds = %label54
  %op80 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op63
  %op81 = load i32, i32* %op80
  br label %label83
label82:                                                ; preds = %label54
  call void @neg_idx_except()
  br label %label83
label83:                                                ; preds = %label79, %label82
  %op84 = sub i32 %op61, %op81
  %op85 = call i32 @knapsack(i32 %op60, i32 %op84)
  %op86 = load i32, i32* %op2
  %op87 = sub i32 %op86, 1
  %op88 = icmp sge i32 %op87, 0
  br i1 %op88, label %label89, label %label92
label89:                                                ; preds = %label83
  %op90 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op87
  %op91 = load i32, i32* %op90
  br label %label93
label92:                                                ; preds = %label83
  call void @neg_idx_except()
  br label %label93
label93:                                                ; preds = %label89, %label92
  %op94 = add i32 %op85, %op91
  %op95 = call i32 @max(i32 %op58, i32 %op94)
  store i32 %op95, i32* %op4
  br label %label65
label96:                                                ; preds = %label65
  %op97 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op69
  br label %label99
label98:                                                ; preds = %label65
  call void @neg_idx_except()
  br label %label99
label99:                                                ; preds = %label96, %label98
  %op100 = load i32, i32* %op4
  store i32 %op100, i32* %op97
  %op101 = load i32, i32* %op4
  ret i32 %op101
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  store i32 5, i32* @n
  store i32 10, i32* @m
  %op1 = icmp sge i32 0, 0
  br i1 %op1, label %label2, label %label4
label2:                                                ; preds = %label_entry
  %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
  br label %label5
label4:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label5
label5:                                                ; preds = %label2, %label4
  store i32 2, i32* %op3
  %op6 = icmp sge i32 1, 0
  br i1 %op6, label %label7, label %label9
label7:                                                ; preds = %label5
  %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
  br label %label10
label9:                                                ; preds = %label5
  call void @neg_idx_except()
  br label %label10
label10:                                                ; preds = %label7, %label9
  store i32 2, i32* %op8
  %op11 = icmp sge i32 2, 0
  br i1 %op11, label %label12, label %label14
label12:                                                ; preds = %label10
  %op13 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
  br label %label15
label14:                                                ; preds = %label10
  call void @neg_idx_except()
  br label %label15
label15:                                                ; preds = %label12, %label14
  store i32 6, i32* %op13
  %op16 = icmp sge i32 3, 0
  br i1 %op16, label %label17, label %label19
label17:                                                ; preds = %label15
  %op18 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
  br label %label20
label19:                                                ; preds = %label15
  call void @neg_idx_except()
  br label %label20
label20:                                                ; preds = %label17, %label19
  store i32 5, i32* %op18
  %op21 = icmp sge i32 4, 0
  br i1 %op21, label %label22, label %label24
label22:                                                ; preds = %label20
  %op23 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
  br label %label25
label24:                                                ; preds = %label20
  call void @neg_idx_except()
  br label %label25
label25:                                                ; preds = %label22, %label24
  store i32 4, i32* %op23
  %op26 = icmp sge i32 0, 0
  br i1 %op26, label %label27, label %label29
label27:                                                ; preds = %label25
  %op28 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
  br label %label30
label29:                                                ; preds = %label25
  call void @neg_idx_except()
  br label %label30
label30:                                                ; preds = %label27, %label29
  store i32 6, i32* %op28
  %op31 = icmp sge i32 1, 0
  br i1 %op31, label %label32, label %label34
label32:                                                ; preds = %label30
  %op33 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
  br label %label35
label34:                                                ; preds = %label30
  call void @neg_idx_except()
  br label %label35
label35:                                                ; preds = %label32, %label34
  store i32 3, i32* %op33
  %op36 = icmp sge i32 2, 0
  br i1 %op36, label %label37, label %label39
label37:                                                ; preds = %label35
  %op38 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
  br label %label40
label39:                                                ; preds = %label35
  call void @neg_idx_except()
  br label %label40
label40:                                                ; preds = %label37, %label39
  store i32 5, i32* %op38
  %op41 = icmp sge i32 3, 0
  br i1 %op41, label %label42, label %label44
label42:                                                ; preds = %label40
  %op43 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
  br label %label45
label44:                                                ; preds = %label40
  call void @neg_idx_except()
  br label %label45
label45:                                                ; preds = %label42, %label44
  store i32 4, i32* %op43
  %op46 = icmp sge i32 4, 0
  br i1 %op46, label %label47, label %label49
label47:                                                ; preds = %label45
  %op48 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
  br label %label50
label49:                                                ; preds = %label45
  call void @neg_idx_except()
  br label %label50
label50:                                                ; preds = %label47, %label49
  store i32 6, i32* %op48
  br label %label58
label51:                                                ; preds = %label58
  %op52 = load i32, i32* %op0
  %op53 = icmp sge i32 %op52, 0
  br i1 %op53, label %label63, label %label65
label54:                                                ; preds = %label58
  %op55 = load i32, i32* @n
  %op56 = load i32, i32* @m
  %op57 = call i32 @knapsack(i32 %op55, i32 %op56)
  call void @output(i32 %op57)
  ret i32 0
label58:                                                ; preds = %label50, %label66
  %op59 = load i32, i32* %op0
  %op60 = icmp slt i32 %op59, 66
  %op61 = zext i1 %op60 to i32
  %op62 = icmp ne i32 %op61, 0
  br i1 %op62, label %label51, label %label54
label63:                                                ; preds = %label51
  %op64 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op52
  br label %label66
label65:                                                ; preds = %label51
  call void @neg_idx_except()
  br label %label66
label66:                                                ; preds = %label63, %label65
  %op67 = sub i32 0, 1
  store i32 %op67, i32* %op64
  %op68 = load i32, i32* %op0
  %op69 = add i32 %op68, 1
  store i32 %op69, i32* %op0
  br label %label58
}
