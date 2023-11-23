; ModuleID = 'cminus'
source_filename = "/home/owobestsup/2023ustc-jianmu-compiler/tests/testcases_general/14-while_stmt.cminus"

declare i32 @input()

declare void @output(i32)

declare void @outputFloat(float)

declare void @neg_idx_except()

define void @main() {
label_entry:
  %op0 = alloca i32
  store i32 10, i32* %op0
  br label %label5
label1:                                                ; preds = %label5
  %op2 = load i32, i32* %op0
  %op3 = sub i32 %op2, 1
  store i32 %op3, i32* %op0
  br label %label5
label4:                                                ; preds = %label5
  ret void
label5:                                                ; preds = %label_entry, %label1
  %op6 = load i32, i32* %op0
  %op7 = icmp ne i32 %op6, 0
  br i1 %op7, label %label1, label %label4
}
