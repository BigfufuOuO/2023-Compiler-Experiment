; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/20-gcd_array.cminus"

@x = global [1 x i32] zeroinitializer
@y = global [1 x i32] zeroinitializer
declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @gcd(i32 %arg0, i32 %arg1) {
label_entry:
  %op2 = icmp eq i32 %arg1, 0
  %op3 = zext i1 %op2 to i32
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label5, label %label6
label5:                                                ; preds = %label_entry
  ret i32 %arg0
label6:                                                ; preds = %label_entry
  %op7 = sdiv i32 %arg0, %arg1
  %op8 = mul i32 %op7, %arg1
  %op9 = sub i32 %arg0, %op8
  %op10 = call i32 @gcd(i32 %arg1, i32 %op9)
  ret i32 %op10
label11:
  ret i32 0
}
define i32 @funArray(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = icmp sge i32 0, 0
  br i1 %op2, label %label3, label %label6
label3:                                                ; preds = %label_entry
  %op4 = getelementptr i32, i32* %arg0, i32 0
  %op5 = load i32, i32* %op4
  br label %label7
label6:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label7
label7:                                                ; preds = %label3, %label6
  %op8 = icmp sge i32 0, 0
  br i1 %op8, label %label9, label %label12
label9:                                                ; preds = %label7
  %op10 = getelementptr i32, i32* %arg1, i32 0
  %op11 = load i32, i32* %op10
  br label %label13
label12:                                                ; preds = %label7
  call void @neg_idx_except()
  br label %label13
label13:                                                ; preds = %label9, %label12
  %op14 = icmp slt i32 %op5, %op11
  %op15 = zext i1 %op14 to i32
  %op16 = icmp ne i32 %op15, 0
  br i1 %op16, label %label17, label %label18
label17:                                                ; preds = %label13
  br label %label19
label18:                                                ; preds = %label13
  br label %label19
label19:                                                ; preds = %label17, %label18
  %op20 = phi i32 [ %op5, %label17 ], [ %op11, %label18 ]
  %op21 = phi i32 [ %op11, %label17 ], [ %op5, %label18 ]
  %op22 = call i32 @gcd(i32 %op21, i32 %op20)
  ret i32 %op22
}
define i32 @main() {
label_entry:
  %op0 = icmp sge i32 0, 0
  br i1 %op0, label %label1, label %label3
label1:                                                ; preds = %label_entry
  %op2 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
  br label %label4
label3:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label4
label4:                                                ; preds = %label1, %label3
  store i32 90, i32* %op2
  %op5 = icmp sge i32 0, 0
  br i1 %op5, label %label6, label %label8
label6:                                                ; preds = %label4
  %op7 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
  br label %label9
label8:                                                ; preds = %label4
  call void @neg_idx_except()
  br label %label9
label9:                                                ; preds = %label6, %label8
  store i32 18, i32* %op7
  %op10 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
  %op11 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
  %op12 = call i32 @funArray(i32* %op10, i32* %op11)
  ret i32 %op12
}
