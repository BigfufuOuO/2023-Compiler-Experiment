; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/16-if_chain.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = icmp ne i32 1, 0
  br i1 %op0, label %label1, label %label3
label1:                                                ; preds = %label_entry
  %op2 = icmp ne i32 0, 0
  br i1 %op2, label %label6, label %label7
label3:                                                ; preds = %label_entry
  br label %label4
label4:                                                ; preds = %label8, %label3
  %op5 = phi i32 [ %op9, %label8 ], [ 2, %label3 ]
  ret i32 %op5
label6:                                                ; preds = %label1
  br label %label8
label7:                                                ; preds = %label1
  br label %label8
label8:                                                ; preds = %label6, %label7
  %op9 = phi i32 [ 4, %label6 ], [ 3, %label7 ]
  br label %label4
}
