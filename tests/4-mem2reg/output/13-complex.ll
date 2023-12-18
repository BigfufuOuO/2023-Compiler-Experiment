; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/13-complex.cminus"

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
  %op2 = icmp sgt i32 %arg0, %arg1
  %op3 = zext i1 %op2 to i32
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label5, label %label6
label5:                                                ; preds = %label_entry
  ret i32 %arg0
label6:                                                ; preds = %label_entry
  ret i32 %arg1
label7:
  ret i32 0
}
define i32 @knapsack(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp sle i32 %arg1, 0
  %op3 = zext i1 %op2 to i32
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label5, label %label6
label5:                                                ; preds = %label_entry
  ret i32 0
label6:                                                ; preds = %label_entry
  br label %label7
label7:                                                ; preds = %label6
  %op8 = icmp eq i32 %arg0, 0
  %op9 = zext i1 %op8 to i32
  %op10 = icmp ne i32 %op9, 0
  br i1 %op10, label %label11, label %label12
label11:                                                ; preds = %label7
  ret i32 0
label12:                                                ; preds = %label7
  br label %label13
label13:                                                ; preds = %label12
  %op14 = mul i32 %arg0, 11
  %op15 = add i32 %op14, %arg1
  %op16 = icmp sge i32 %op15, 0
  br i1 %op16, label %label25, label %label28
label17:                                                ; preds = %label29
  %op18 = mul i32 %arg0, 11
  %op19 = add i32 %op18, %arg1
  %op20 = icmp sge i32 %op19, 0
  br i1 %op20, label %label33, label %label36
label21:                                                ; preds = %label29
  br label %label22
label22:                                                ; preds = %label21
  %op23 = sub i32 %arg0, 1
  %op24 = icmp sge i32 %op23, 0
  br i1 %op24, label %label52, label %label55
label25:                                                ; preds = %label13
  %op26 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op15
  %op27 = load i32, i32* %op26
  br label %label29
label28:                                                ; preds = %label13
  call void @neg_idx_except()
  br label %label29
label29:                                                ; preds = %label25, %label28
  %op30 = icmp sge i32 %op27, 0
  %op31 = zext i1 %op30 to i32
  %op32 = icmp ne i32 %op31, 0
  br i1 %op32, label %label17, label %label21
label33:                                                ; preds = %label17
  %op34 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op19
  %op35 = load i32, i32* %op34
  br label %label37
label36:                                                ; preds = %label17
  call void @neg_idx_except()
  br label %label37
label37:                                                ; preds = %label33, %label36
  ret i32 %op35
label38:                                                ; preds = %label56
  %op39 = sub i32 %arg0, 1
  %op40 = call i32 @knapsack(i32 %op39, i32 %arg1)
  br label %label47
label41:                                                ; preds = %label56
  %op42 = sub i32 %arg0, 1
  %op43 = call i32 @knapsack(i32 %op42, i32 %arg1)
  %op44 = sub i32 %arg0, 1
  %op45 = sub i32 %arg0, 1
  %op46 = icmp sge i32 %op45, 0
  br i1 %op46, label %label60, label %label63
label47:                                                ; preds = %label38, %label73
  %op48 = phi i32 [ %op40, %label38 ], [ %op75, %label73 ]
  %op49 = mul i32 %arg0, 11
  %op50 = add i32 %op49, %arg1
  %op51 = icmp sge i32 %op50, 0
  br i1 %op51, label %label76, label %label78
label52:                                                ; preds = %label22
  %op53 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op23
  %op54 = load i32, i32* %op53
  br label %label56
label55:                                                ; preds = %label22
  call void @neg_idx_except()
  br label %label56
label56:                                                ; preds = %label52, %label55
  %op57 = icmp slt i32 %arg1, %op54
  %op58 = zext i1 %op57 to i32
  %op59 = icmp ne i32 %op58, 0
  br i1 %op59, label %label38, label %label41
label60:                                                ; preds = %label41
  %op61 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op45
  %op62 = load i32, i32* %op61
  br label %label64
label63:                                                ; preds = %label41
  call void @neg_idx_except()
  br label %label64
label64:                                                ; preds = %label60, %label63
  %op65 = sub i32 %arg1, %op62
  %op66 = call i32 @knapsack(i32 %op44, i32 %op65)
  %op67 = sub i32 %arg0, 1
  %op68 = icmp sge i32 %op67, 0
  br i1 %op68, label %label69, label %label72
label69:                                                ; preds = %label64
  %op70 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op67
  %op71 = load i32, i32* %op70
  br label %label73
label72:                                                ; preds = %label64
  call void @neg_idx_except()
  br label %label73
label73:                                                ; preds = %label69, %label72
  %op74 = add i32 %op66, %op71
  %op75 = call i32 @max(i32 %op43, i32 %op74)
  br label %label47
label76:                                                ; preds = %label47
  %op77 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op50
  br label %label79
label78:                                                ; preds = %label47
  call void @neg_idx_except()
  br label %label79
label79:                                                ; preds = %label76, %label78
  store i32 %op48, i32* %op77
  ret i32 %op48
}
define i32 @main() {
label_entry:
  store i32 5, i32* @n
  store i32 10, i32* @m
  %op0 = icmp sge i32 0, 0
  br i1 %op0, label %label1, label %label3
label1:                                                ; preds = %label_entry
  %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
  br label %label4
label3:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label4
label4:                                                ; preds = %label1, %label3
  store i32 2, i32* %op2
  %op5 = icmp sge i32 1, 0
  br i1 %op5, label %label6, label %label8
label6:                                                ; preds = %label4
  %op7 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
  br label %label9
label8:                                                ; preds = %label4
  call void @neg_idx_except()
  br label %label9
label9:                                                ; preds = %label6, %label8
  store i32 2, i32* %op7
  %op10 = icmp sge i32 2, 0
  br i1 %op10, label %label11, label %label13
label11:                                                ; preds = %label9
  %op12 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
  br label %label14
label13:                                                ; preds = %label9
  call void @neg_idx_except()
  br label %label14
label14:                                                ; preds = %label11, %label13
  store i32 6, i32* %op12
  %op15 = icmp sge i32 3, 0
  br i1 %op15, label %label16, label %label18
label16:                                                ; preds = %label14
  %op17 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
  br label %label19
label18:                                                ; preds = %label14
  call void @neg_idx_except()
  br label %label19
label19:                                                ; preds = %label16, %label18
  store i32 5, i32* %op17
  %op20 = icmp sge i32 4, 0
  br i1 %op20, label %label21, label %label23
label21:                                                ; preds = %label19
  %op22 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
  br label %label24
label23:                                                ; preds = %label19
  call void @neg_idx_except()
  br label %label24
label24:                                                ; preds = %label21, %label23
  store i32 4, i32* %op22
  %op25 = icmp sge i32 0, 0
  br i1 %op25, label %label26, label %label28
label26:                                                ; preds = %label24
  %op27 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
  br label %label29
label28:                                                ; preds = %label24
  call void @neg_idx_except()
  br label %label29
label29:                                                ; preds = %label26, %label28
  store i32 6, i32* %op27
  %op30 = icmp sge i32 1, 0
  br i1 %op30, label %label31, label %label33
label31:                                                ; preds = %label29
  %op32 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
  br label %label34
label33:                                                ; preds = %label29
  call void @neg_idx_except()
  br label %label34
label34:                                                ; preds = %label31, %label33
  store i32 3, i32* %op32
  %op35 = icmp sge i32 2, 0
  br i1 %op35, label %label36, label %label38
label36:                                                ; preds = %label34
  %op37 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
  br label %label39
label38:                                                ; preds = %label34
  call void @neg_idx_except()
  br label %label39
label39:                                                ; preds = %label36, %label38
  store i32 5, i32* %op37
  %op40 = icmp sge i32 3, 0
  br i1 %op40, label %label41, label %label43
label41:                                                ; preds = %label39
  %op42 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
  br label %label44
label43:                                                ; preds = %label39
  call void @neg_idx_except()
  br label %label44
label44:                                                ; preds = %label41, %label43
  store i32 4, i32* %op42
  %op45 = icmp sge i32 4, 0
  br i1 %op45, label %label46, label %label48
label46:                                                ; preds = %label44
  %op47 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
  br label %label49
label48:                                                ; preds = %label44
  call void @neg_idx_except()
  br label %label49
label49:                                                ; preds = %label46, %label48
  store i32 6, i32* %op47
  br label %label56
label50:                                                ; preds = %label56
  %op51 = icmp sge i32 %op57, 0
  br i1 %op51, label %label61, label %label63
label52:                                                ; preds = %label56
  %op53 = load i32, i32* @n
  %op54 = load i32, i32* @m
  %op55 = call i32 @knapsack(i32 %op53, i32 %op54)
  call void @output(i32 %op55)
  ret i32 0
label56:                                                ; preds = %label49, %label64
  %op57 = phi i32 [ 0, %label49 ], [ %op66, %label64 ]
  %op58 = icmp slt i32 %op57, 66
  %op59 = zext i1 %op58 to i32
  %op60 = icmp ne i32 %op59, 0
  br i1 %op60, label %label50, label %label52
label61:                                                ; preds = %label50
  %op62 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op57
  br label %label64
label63:                                                ; preds = %label50
  call void @neg_idx_except()
  br label %label64
label64:                                                ; preds = %label61, %label63
  %op65 = sub i32 0, 1
  store i32 %op65, i32* %op62
  %op66 = add i32 %op57, 1
  br label %label56
}
