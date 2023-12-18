; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/14-while_stmt.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  br label %label3
label0:                                                ; preds = %label3
  %op1 = sub i32 %op4, 1
  br label %label3
label2:                                                ; preds = %label3
  ret void
label3:                                                ; preds = %label_entry, %label0
  %op4 = phi i32 [ 10, %label_entry ], [ %op1, %label0 ]
  %op5 = icmp ne i32 %op4, 0
  br i1 %op5, label %label0, label %label2
}
