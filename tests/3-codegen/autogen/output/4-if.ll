; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/3-codegen/autogen/testcases/4-if.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define i32 @main() {
label_entry:
  %op0 = alloca i32
  %op1 = alloca i32
  %op2 = alloca i32
  store i32 11, i32* %op0
  store i32 22, i32* %op1
  store i32 33, i32* %op2
  %op3 = load i32, i32* %op0
  %op4 = load i32, i32* %op1
  %op5 = icmp sgt i32 %op3, %op4
  %op6 = zext i1 %op5 to i32
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label8, label %label14
label8:                                                ; preds = %label_entry
  %op9 = load i32, i32* %op0
  %op10 = load i32, i32* %op2
  %op11 = icmp sgt i32 %op9, %op10
  %op12 = zext i1 %op11 to i32
  %op13 = icmp ne i32 %op12, 0
  br i1 %op13, label %label21, label %label23
label14:                                                ; preds = %label_entry
  %op15 = load i32, i32* %op2
  %op16 = load i32, i32* %op1
  %op17 = icmp slt i32 %op15, %op16
  %op18 = zext i1 %op17 to i32
  %op19 = icmp ne i32 %op18, 0
  br i1 %op19, label %label26, label %label28
label20:                                                ; preds = %label25, %label30
  ret i32 0
label21:                                                ; preds = %label8
  %op22 = load i32, i32* %op0
  call void @output(i32 %op22)
  br label %label25
label23:                                                ; preds = %label8
  %op24 = load i32, i32* %op2
  call void @output(i32 %op24)
  br label %label25
label25:                                                ; preds = %label21, %label23
  br label %label20
label26:                                                ; preds = %label14
  %op27 = load i32, i32* %op1
  call void @output(i32 %op27)
  br label %label30
label28:                                                ; preds = %label14
  %op29 = load i32, i32* %op2
  call void @output(i32 %op29)
  br label %label30
label30:                                                ; preds = %label26, %label28
  br label %label20
}
