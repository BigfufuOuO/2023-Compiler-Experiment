; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/12-global.cminus"

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
  %op0 = alloca i32
  %op1 = alloca i32
  store i32 0, i32* %op0
  store i32 0, i32* %op1
  br label %label6
label2:                                                ; preds = %label6
  %op3 = call i32 @randBin()
  %op4 = icmp ne i32 %op3, 0
  br i1 %op4, label %label11, label %label14
label5:                                                ; preds = %label6
  ret i32 20
label6:                                                ; preds = %label_entry, %label27
  %op7 = load i32, i32* %op1
  %op8 = icmp slt i32 %op7, 20
  %op9 = zext i1 %op8 to i32
  %op10 = icmp ne i32 %op9, 0
  br i1 %op10, label %label2, label %label5
label11:                                                ; preds = %label2
  %op12 = load i32, i32* %op0
  %op13 = add i32 %op12, 1
  store i32 %op13, i32* %op0
  br label %label17
label14:                                                ; preds = %label2
  %op15 = load i32, i32* %op0
  %op16 = sub i32 %op15, 1
  store i32 %op16, i32* %op0
  br label %label17
label17:                                                ; preds = %label11, %label14
  %op18 = load i32, i32* %op1
  %op19 = add i32 %op18, 1
  store i32 %op19, i32* %op1
  %op20 = load i32, i32* %op0
  %op21 = icmp eq i32 %op20, 0
  %op22 = zext i1 %op21 to i32
  %op23 = icmp ne i32 %op22, 0
  br i1 %op23, label %label24, label %label26
label24:                                                ; preds = %label17
  %op25 = load i32, i32* %op1
  ret i32 %op25
label26:                                                ; preds = %label17
  br label %label27
label27:                                                ; preds = %label26
  br label %label6
}
define i32 @main() {
label_entry:
  %op0 = alloca i32
  store i32 0, i32* %op0
  store i32 3407, i32* @seed
  br label %label6
label1:                                                ; preds = %label6
  %op2 = call i32 @returnToZeroSteps()
  call void @output(i32 %op2)
  %op3 = load i32, i32* %op0
  %op4 = add i32 %op3, 1
  store i32 %op4, i32* %op0
  br label %label6
label5:                                                ; preds = %label6
  ret i32 0
label6:                                                ; preds = %label_entry, %label1
  %op7 = load i32, i32* %op0
  %op8 = icmp slt i32 %op7, 20
  %op9 = zext i1 %op8 to i32
  %op10 = icmp ne i32 %op9, 0
  br i1 %op10, label %label1, label %label5
}
