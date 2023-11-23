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
  %op2 = alloca i32
  store i32 %arg0, i32* %op2
  %op3 = alloca i32
  store i32 %arg1, i32* %op3
  %op4 = load i32, i32* %op3
  %op5 = icmp eq i32 %op4, 0
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label10
label8:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op2
  ret i32 %op9
label10:                                                ; preds = %label_entry
  %op11 = load i32, i32* %op3
  %op12 = load i32, i32* %op2
  %op13 = load i32, i32* %op2
  %op14 = load i32, i32* %op3
  %op15 = sdiv i32 %op13, %op14
  %op16 = load i32, i32* %op3
  %op17 = mul i32 %op15, %op16
  %op18 = sub i32 %op12, %op17
  %op19 = call i32 @gcd(i32 %op11, i32 %op18)
  ret i32 %op19
label20:
  ret i32 0
}
define i32 @funArray(i32* %arg0, i32* %arg1) {
label_entry:
  %op2 = alloca i32*
  store i32* %arg0, i32** %op2
  %op3 = alloca i32*
  store i32* %arg1, i32** %op3
  %op4 = alloca i32
  %op5 = alloca i32
  %op6 = alloca i32
  %op7 = icmp sge i32 0, 0
  br i1 %op7, label %label8, label %label12
label8:                                                ; preds = %label_entry
  %op9 = load i32*, i32** %op2
  %op10 = getelementptr i32, i32* %op9, i32 0
  %op11 = load i32, i32* %op10
  br label %label13
label12:                                                ; preds = %label_entry
  call void @neg_idx_except()
  br label %label13
label13:                                                ; preds = %label8, %label12
  store i32 %op11, i32* %op4
  %op14 = icmp sge i32 0, 0
  br i1 %op14, label %label15, label %label19
label15:                                                ; preds = %label13
  %op16 = load i32*, i32** %op3
  %op17 = getelementptr i32, i32* %op16, i32 0
  %op18 = load i32, i32* %op17
  br label %label20
label19:                                                ; preds = %label13
  call void @neg_idx_except()
  br label %label20
label20:                                                ; preds = %label15, %label19
  store i32 %op18, i32* %op5
  %op21 = load i32, i32* %op4
  %op22 = load i32, i32* %op5
  %op23 = icmp slt i32 %op21, %op22
  %op24 = zext i1 %op23 to i32
  %op25 = icmp ne i32 %op24, 0
  br i1 %op25, label %label26, label %label30
label26:                                                ; preds = %label20
  %op27 = load i32, i32* %op4
  store i32 %op27, i32* %op6
  %op28 = load i32, i32* %op5
  store i32 %op28, i32* %op4
  %op29 = load i32, i32* %op6
  store i32 %op29, i32* %op5
  br label %label31
label30:                                                ; preds = %label20
  br label %label31
label31:                                                ; preds = %label26, %label30
  %op32 = load i32, i32* %op4
  %op33 = load i32, i32* %op5
  %op34 = call i32 @gcd(i32 %op32, i32 %op33)
  ret i32 %op34
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
