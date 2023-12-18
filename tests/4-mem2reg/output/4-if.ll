; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/4-if.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = icmp sgt i32 11, 22
  %op1 = zext i1 %op0 to i32
  %op2 = icmp ne i32 %op1, 0
  br i1 %op2, label %label3, label %label7
label3:                                                ; preds = %label_entry
  %op4 = icmp sgt i32 11, 33
  %op5 = zext i1 %op4 to i32
  %op6 = icmp ne i32 %op5, 0
  br i1 %op6, label %label12, label %label13
label7:                                                ; preds = %label_entry
  %op8 = icmp slt i32 33, 22
  %op9 = zext i1 %op8 to i32
  %op10 = icmp ne i32 %op9, 0
  br i1 %op10, label %label15, label %label16
label11:                                                ; preds = %label14, %label17
  ret i32 0
label12:                                                ; preds = %label3
  call void @output(i32 11)
  br label %label14
label13:                                                ; preds = %label3
  call void @output(i32 33)
  br label %label14
label14:                                                ; preds = %label12, %label13
  br label %label11
label15:                                                ; preds = %label7
  call void @output(i32 22)
  br label %label17
label16:                                                ; preds = %label7
  call void @output(i32 33)
  br label %label17
label17:                                                ; preds = %label15, %label16
  br label %label11
}
