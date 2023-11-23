; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/12-funcall_recursion.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @factorial(i32 %arg0) {
label_entry:
  %op1 = alloca i32
  store i32 %arg0, i32* %op1
  %op2 = load i32, i32* %op1
  %op3 = icmp eq i32 %op2, 0
  %op4 = zext i1 %op3 to i32
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label6, label %label7
label6:                                                ; preds = %label_entry
  ret i32 1
label7:                                                ; preds = %label_entry
  %op8 = load i32, i32* %op1
  %op9 = load i32, i32* %op1
  %op10 = sub i32 %op9, 1
  %op11 = call i32 @factorial(i32 %op10)
  %op12 = mul i32 %op8, %op11
  ret i32 %op12
label13:
  ret i32 0
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = call i32 @factorial(i32 10)
  store i32 %op1, i32* %op0
  %op2 = load i32, i32* %op0
  ret i32 %op2
}
