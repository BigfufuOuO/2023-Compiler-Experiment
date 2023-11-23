; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/5-while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 10, i32* %op0
  store i32 0, i32* %op1
  br label %label7
label2:                                                ; preds = %label7
  %op3 = load i32, i32* %op1
  call void @output(i32 %op3)
  %op4 = load i32, i32* %op1
  %op5 = add i32 %op4, 1
  store i32 %op5, i32* %op1
  br label %label7
label6:                                                ; preds = %label7
  ret i32 0
label7:                                                ; preds = %label_entry, %label2
  %op8 = load i32, i32* %op1
  %op9 = load i32, i32* %op0
  %op10 = icmp slt i32 %op8, %op9
  %op11 = zext i1 %op10 to i32
  %op12 = icmp ne i32 %op11, 0
  br i1 %op12, label %label2, label %label6
}
