; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/12-global.cminus"

@seed = global i32 zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @randomLCG() {
label_entry:
  %op0 = load i32, i32* @seed
  %op1 = mul i32 %op0, 1103515245
  %op2 = add i32 %op1, 12345
  store i32 %op2, i32* @seed
  %op3 = load i32, i32* @seed
  ret i32 %op3
}
define i32 @randBin() {
label_entry:
  %op0 = call i32 @randomLCG()
  %op1 = icmp sgt i32 %op0, 0
  %op2 = zext i1 %op1 to i32
  %op3 = icmp ne i32 %op2, 0
  br i1 %op3, label %label4, label %label5
label4:                                                ; preds = %label_entry
  ret i32 1
label5:                                                ; preds = %label_entry
  ret i32 0
label6:
  ret i32 0
}
define i32 @returnToZeroSteps() {
label_entry:
  br label %label4
label0:                                                ; preds = %label4
  %op1 = call i32 @randBin()
  %op2 = icmp ne i32 %op1, 0
  br i1 %op2, label %label10, label %label12
label3:                                                ; preds = %label4
  ret i32 20
label4:                                                ; preds = %label_entry, %label22
  %op5 = phi i32 [ 0, %label_entry ], [ %op15, %label22 ]
  %op6 = phi i32 [ 0, %label_entry ], [ %op16, %label22 ]
  %op7 = icmp slt i32 %op6, 20
  %op8 = zext i1 %op7 to i32
  %op9 = icmp ne i32 %op8, 0
  br i1 %op9, label %label0, label %label3
label10:                                                ; preds = %label0
  %op11 = add i32 %op5, 1
  br label %label14
label12:                                                ; preds = %label0
  %op13 = sub i32 %op5, 1
  br label %label14
label14:                                                ; preds = %label10, %label12
  %op15 = phi i32 [ %op11, %label10 ], [ %op13, %label12 ]
  %op16 = add i32 %op6, 1
  %op17 = icmp eq i32 %op15, 0
  %op18 = zext i1 %op17 to i32
  %op19 = icmp ne i32 %op18, 0
  br i1 %op19, label %label20, label %label21
label20:                                                ; preds = %label14
  ret i32 %op16
label21:                                                ; preds = %label14
  br label %label22
label22:                                                ; preds = %label21
  br label %label4
}
define i32 @main() {
label_entry:
  store i32 3407, i32* @seed
  br label %label4
label0:                                                ; preds = %label4
  %op1 = call i32 @returnToZeroSteps()
  call void @output(i32 %op1)
  %op2 = add i32 %op5, 1
  br label %label4
label3:                                                ; preds = %label4
  ret i32 0
label4:                                                ; preds = %label_entry, %label0
  %op5 = phi i32 [ 0, %label_entry ], [ %op2, %label0 ]
  %op6 = icmp slt i32 %op5, 20
  %op7 = zext i1 %op6 to i32
  %op8 = icmp ne i32 %op7, 0
  br i1 %op8, label %label0, label %label3
}
