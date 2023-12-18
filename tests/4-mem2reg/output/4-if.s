	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = icmp sgt i32 11, 22
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 22
	slt $t2, $t1, $t0
	st.b $t2, $fp, -17
# %op1 = zext i1 %op0 to i32
	ld.b $t0, $fp, -17
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -24
# %op2 = icmp ne i32 %op1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -25
# br i1 %op2, label %label3, label %label7
	ld.b $t0, $fp, -25
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label3
	b .main_label7
.main_label3:
# %op4 = icmp sgt i32 11, 33
	addi.w $t0, $zero, 11
	addi.w $t1, $zero, 33
	slt $t2, $t1, $t0
	st.b $t2, $fp, -26
# %op5 = zext i1 %op4 to i32
	ld.b $t0, $fp, -26
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -32
# %op6 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -33
# br i1 %op6, label %label12, label %label13
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label12
	b .main_label13
.main_label7:
# %op8 = icmp slt i32 33, 22
	addi.w $t0, $zero, 33
	addi.w $t1, $zero, 22
	slt $t2, $t0, $t1
	st.b $t2, $fp, -34
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -34
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -40
# %op10 = icmp ne i32 %op9, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -41
# br i1 %op10, label %label15, label %label16
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label15
	b .main_label16
.main_label11:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label12:
# call void @output(i32 11)
	addi.w $a0, $zero, 11
	bl output
# br label %label14
	b .main_label14
.main_label13:
# call void @output(i32 33)
	addi.w $a0, $zero, 33
	bl output
# br label %label14
	b .main_label14
.main_label14:
# br label %label11
	b .main_label11
.main_label15:
# call void @output(i32 22)
	addi.w $a0, $zero, 22
	bl output
# br label %label17
	b .main_label17
.main_label16:
# call void @output(i32 33)
	addi.w $a0, $zero, 33
	bl output
# br label %label17
	b .main_label17
.main_label17:
# br label %label11
	b .main_label11
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
