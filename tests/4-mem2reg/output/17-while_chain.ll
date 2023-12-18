; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/17-while_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label4
label0:                                                ; preds = %label4
  %op1 = sub i32 %op5, 1
  br label %label11
label2:                                                ; preds = %label4
  %op3 = add i32 %op5, %op6
  ret i32 %op3
label4:                                                ; preds = %label_entry, %label10
  %op5 = phi i32 [ 10, %label_entry ], [ %op1, %label10 ]
  %op6 = phi i32 [ %op12, %label10 ], [ undef, %label_entry ]
  %op7 = icmp ne i32 %op5, 0
  br i1 %op7, label %label0, label %label2
label8:                                                ; preds = %label11
  %op9 = sub i32 %op12, 1
  br label %label11
label10:                                                ; preds = %label11
  br label %label4
label11:                                                ; preds = %label0, %label8
  %op12 = phi i32 [ %op1, %label0 ], [ %op9, %label8 ]
  %op13 = icmp ne i32 %op12, 0
  br i1 %op13, label %label8, label %label10
}
