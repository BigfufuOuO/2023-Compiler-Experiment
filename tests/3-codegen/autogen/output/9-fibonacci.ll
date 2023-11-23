; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/9-fibonacci.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @fibonacci(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp eq i32 %op2, 0
  %op4 = zext i1 %op3 to i32
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label7
label6:                                                ; preds = %label_entry
  ret i32 0
label7:                                                ; preds = %label_entry
  %op8 = load i32, i32* %op1
  %op9 = icmp eq i32 %op8, 1
  %op10 = zext i1 %op9 to i32
  %op11 = icmp ne i32 %op10, 0
  br i1 %op11, label %label13, label %label14
label12:                                                ; preds = %label22
  ret i32 0
label13:                                                ; preds = %label7
  ret i32 1
label14:                                                ; preds = %label7
  %op15 = load i32, i32* %op1
  %op16 = sub i32 %op15, 1
  %op17 = call i32 @fibonacci(i32 %op16)
  %op18 = load i32, i32* %op1
  %op19 = sub i32 %op18, 2
  %op20 = call i32 @fibonacci(i32 %op19)
  %op21 = add i32 %op17, %op20
  ret i32 %op21
label22:
  br label %label12
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  store i32 0, i32* %op1
  br label %label8
label2:                                                ; preds = %label8
  %op3 = load i32, i32* %op1
  %op4 = call i32 @fibonacci(i32 %op3)
  call void @output(i32 %op4)
  %op5 = load i32, i32* %op1
  %op6 = add i32 %op5, 1
  store i32 %op6, i32* %op1
  br label %label8
label7:                                                ; preds = %label8
  ret i32 0
label8:                                                ; preds = %label_entry, %label2
  %op9 = load i32, i32* %op1
  %op10 = load i32, i32* %op0
  %op11 = icmp slt i32 %op9, %op10
  %op12 = zext i1 %op11 to i32
  %op13 = icmp ne i32 %op12, 0
  br i1 %op13, label %label2, label %label7
}
