; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/17-while_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  br label %label10
label2:                                                ; preds = %label10
  %op3 = load i32, i32* %op0
  %op4 = sub i32 %op3, 1
  store i32 %op4, i32* %op0
  %op5 = load i32, i32* %op0
  store i32 %op5, i32* %op1
  br label %label17
label6:                                                ; preds = %label10
  %op7 = load i32, i32* %op0
  %op8 = load i32, i32* %op1
  %op9 = add i32 %op7, %op8
  ret i32 %op9
label10:                                                ; preds = %label_entry, %label16
  %op11 = load i32, i32* %op0
  %op12 = icmp ne i32 %op11, 0
  br i1 %op12, label %label2, label %label6
label13:                                                ; preds = %label17
  %op14 = load i32, i32* %op1
  %op15 = sub i32 %op14, 1
  store i32 %op15, i32* %op1
  br label %label17
label16:                                                ; preds = %label17
  br label %label10
label17:                                                ; preds = %label2, %label13
  %op18 = load i32, i32* %op1
  %op19 = icmp ne i32 %op18, 0
  br i1 %op19, label %label13, label %label16
}
