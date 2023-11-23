; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/8-store.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @store(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = alloca i32*
  store i32* %arg0, i32** %op3
  %op4 = alloca i32
  store i32 %arg1, i32* %op4
  %op5 = alloca i32
  store i32 %arg2, i32* %op5
  %op6 = load i32, i32* %op4
  %op7 = icmp sge i32 %op6, 0
  br i1 %op7, label %label8, label %label11
label8:                                                ; preds = %label_entry
  %op9 = load i32*, i32** %op3
  %op10 = getelementptr i32, i32* %op9, i32 %op6
  br label %label12
label11:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label12
label12:                                                ; preds = %label8, %label11
  %op13 = load i32, i32* %op5
  store i32 %op13, i32* %op10
  %op14 = load i32, i32* %op5
  ret i32 %op14
}
define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 0, i32* %op1
  br label %label12
label3:                                                ; preds = %label12
  %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op5 = load i32, i32* %op1
  %op6 = load i32, i32* %op1
  %op7 = mul i32 %op6, 2
  %op8 = call i32 @store(i32* %op4, i32 %op5, i32 %op7)
  %op9 = load i32, i32* %op1
  %op10 = add i32 %op9, 1
  store i32 %op10, i32* %op1
  br label %label12
label11:                                                ; preds = %label12
  store i32 0, i32* %op2
  store i32 0, i32* %op1
  br label %label23
label12:                                                ; preds = %label_entry, %label3
  %op13 = load i32, i32* %op1
  %op14 = icmp slt i32 %op13, 10
  %op15 = zext i1 %op14 to i32
  %op16 = icmp ne i32 %op15, 0
  br i1 %op16, label %label3, label %label11
label17:                                                ; preds = %label23
  %op18 = load i32, i32* %op2
  %op19 = load i32, i32* %op1
  %op20 = icmp sge i32 %op19, 0
  br i1 %op20, label %label28, label %label31
label21:                                                ; preds = %label23
  %op22 = load i32, i32* %op2
  call void @output(i32 %op22)
  ret i32 0
label23:                                                ; preds = %label11, %label32
  %op24 = load i32, i32* %op1
  %op25 = icmp slt i32 %op24, 10
  %op26 = zext i1 %op25 to i32
  %op27 = icmp ne i32 %op26, 0
  br i1 %op27, label %label17, label %label21
label28:                                                ; preds = %label17
  %op29 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op19
  %op30 = load i32, i32* %op29
  br label %label32
label31:                                                ; preds = %label17
  call void @neg_idx_except()
  br label %label32
label32:                                                ; preds = %label28, %label31
  %op33 = add i32 %op18, %op30
  store i32 %op33, i32* %op2
  %op34 = load i32, i32* %op1
  %op35 = add i32 %op34, 1
  store i32 %op35, i32* %op1
  br label %label23
}
