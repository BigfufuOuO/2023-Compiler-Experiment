; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/9-fibonacci.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @fibonacci(i32 %arg0) {
label_entry:
  %op1 = icmp eq i32 %arg0, 0
  %op2 = zext i1 %op1 to i32
  %op3 = icmp ne i32 %op2, 0
  br i1 %op3, label %label4, label %label5
label4:                                                ; preds = %label_entry
  ret i32 0
label5:                                                ; preds = %label_entry
  %op6 = icmp eq i32 %arg0, 1
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label10, label %label11
label9:                                                ; preds = %label17
  ret i32 0
label10:                                                ; preds = %label5
  ret i32 1
label11:                                                ; preds = %label5
  %op12 = sub i32 %arg0, 1
  %op13 = call i32 @fibonacci(i32 %op12)
  %op14 = sub i32 %arg0, 2
  %op15 = call i32 @fibonacci(i32 %op14)
  %op16 = add i32 %op13, %op15
  ret i32 %op16
label17:
  br label %label9
}
define i32 @main() {
label_entry:
  br label %label4
label0:                                                ; preds = %label4
  %op1 = call i32 @fibonacci(i32 %op5)
  call void @output(i32 %op1)
  %op2 = add i32 %op5, 1
  br label %label4
label3:                                                ; preds = %label4
  ret i32 0
label4:                                                ; preds = %label_entry, %label0
  %op5 = phi i32 [ 0, %label_entry ], [ %op2, %label0 ]
  %op6 = icmp slt i32 %op5, 10
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label0, label %label3
}
