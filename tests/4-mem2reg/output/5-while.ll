; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/5-while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label3
label0:                                                ; preds = %label3
  call void @output(i32 %op4)
  %op1 = add i32 %op4, 1
  br label %label3
label2:                                                ; preds = %label3
  ret i32 0
label3:                                                ; preds = %label_entry, %label0
  %op4 = phi i32 [ 0, %label_entry ], [ %op1, %label0 ]
  %op5 = icmp slt i32 %op4, 10
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label0, label %label2
}
