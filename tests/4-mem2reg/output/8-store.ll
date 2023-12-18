; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/4-mem2reg/functional-cases/8-store.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @store(i32* %arg0, i32 %arg1, i32 %arg2) {
label_entry:
  %op3 = icmp sge i32 %arg1, 0
  br i1 %op3, label %label4, label %label6
label4:                                                ; preds = %label_entry
  %op5 = getelementptr i32, i32* %arg0, i32 %arg1
  br label %label7
label6:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label7
label7:                                                ; preds = %label4, %label6
  store i32 %arg2, i32* %op5
  ret i32 %arg2
}
define i32 @main() {
label_entry:
  %op0 = alloca [10 x i32]
  br label %label7
label1:                                                ; preds = %label7
  %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
  %op3 = mul i32 %op8, 2
  %op4 = call i32 @store(i32* %op2, i32 %op8, i32 %op3)
  %op5 = add i32 %op8, 1
  br label %label7
label6:                                                ; preds = %label7
  br label %label15
label7:                                                ; preds = %label_entry, %label1
  %op8 = phi i32 [ 0, %label_entry ], [ %op5, %label1 ]
  %op9 = icmp slt i32 %op8, 10
  %op10 = zext i1 %op9 to i32
  %op11 = icmp ne i32 %op10, 0
  br i1 %op11, label %label1, label %label6
label12:                                                ; preds = %label15
  %op13 = icmp sge i32 %op16, 0
  br i1 %op13, label %label21, label %label24
label14:                                                ; preds = %label15
  call void @output(i32 %op17)
  ret i32 0
label15:                                                ; preds = %label6, %label25
  %op16 = phi i32 [ 0, %label6 ], [ %op27, %label25 ]
  %op17 = phi i32 [ 0, %label6 ], [ %op26, %label25 ]
  %op18 = icmp slt i32 %op16, 10
  %op19 = zext i1 %op18 to i32
  %op20 = icmp ne i32 %op19, 0
  br i1 %op20, label %label12, label %label14
label21:                                                ; preds = %label12
  %op22 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op16
  %op23 = load i32, i32* %op22
  br label %label25
label24:                                                ; preds = %label12
  call void @neg_idx_except()
  br label %label25
label25:                                                ; preds = %label21, %label24
  %op26 = add i32 %op17, %op23
  %op27 = add i32 %op16, 1
  br label %label15
}
