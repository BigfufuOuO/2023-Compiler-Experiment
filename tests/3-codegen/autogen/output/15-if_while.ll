; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/15-if_while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 0, i32* %op1
  store i32 0, i32* %op2
  store i32 10, i32* %op0
  br label %label14
label3:                                                ; preds = %label14
  %op4 = load i32, i32* %op0
  %op5 = sub i32 %op4, 1
  store i32 %op5, i32* %op0
  %op6 = load i32, i32* %op0
  %op7 = icmp slt i32 %op6, 5
  %op8 = zext i1 %op7 to i32
  %op9 = icmp ne i32 %op8, 0
  br i1 %op9, label %label17, label %label21
label10:                                                ; preds = %label14
  %op11 = load i32, i32* %op1
  %op12 = load i32, i32* %op2
  %op13 = add i32 %op11, %op12
  ret i32 %op13
label14:                                                ; preds = %label_entry, %label25
  %op15 = load i32, i32* %op0
  %op16 = icmp ne i32 %op15, 0
  br i1 %op16, label %label3, label %label10
label17:                                                ; preds = %label3
  %op18 = load i32, i32* %op1
  %op19 = load i32, i32* %op0
  %op20 = add i32 %op18, %op19
  store i32 %op20, i32* %op1
  br label %label25
label21:                                                ; preds = %label3
  %op22 = load i32, i32* %op2
  %op23 = load i32, i32* %op0
  %op24 = add i32 %op22, %op23
  store i32 %op24, i32* %op2
  br label %label25
label25:                                                ; preds = %label17, %label21
  br label %label14
}
