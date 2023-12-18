; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/15-if_while.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  br label %label7
label0:                                                ; preds = %label7
  %op1 = sub i32 %op8, 1
  %op2 = icmp slt i32 %op1, 5
  %op3 = zext i1 %op2 to i32
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label12, label %label14
label5:                                                ; preds = %label7
  %op6 = add i32 %op9, %op10
  ret i32 %op6
label7:                                                ; preds = %label_entry, %label16
  %op8 = phi i32 [ 10, %label_entry ], [ %op1, %label16 ]
  %op9 = phi i32 [ 0, %label_entry ], [ %op17, %label16 ]
  %op10 = phi i32 [ 0, %label_entry ], [ %op18, %label16 ]
  %op11 = icmp ne i32 %op8, 0
  br i1 %op11, label %label0, label %label5
label12:                                                ; preds = %label0
  %op13 = add i32 %op9, %op1
  br label %label16
label14:                                                ; preds = %label0
  %op15 = add i32 %op10, %op1
  br label %label16
label16:                                                ; preds = %label12, %label14
  %op17 = phi i32 [ %op13, %label12 ], [ %op9, %label14 ]
  %op18 = phi i32 [ %op10, %label12 ], [ %op15, %label14 ]
  br label %label7
}
