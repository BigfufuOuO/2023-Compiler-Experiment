	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label7
	b .main_label7
.main_label2:
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -48
# call void @output(i32 %op3)
	ld.w $a0, $fp, -48
	bl output
# %op4 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -52
# %op5 = add i32 %op4, 1
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# store i32 %op5, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# br label %label7
	b .main_label7
.main_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label7:
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -60
# %op9 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -64
# %op10 = icmp slt i32 %op8, %op9
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -64
	slt $t2, $t0, $t1
	st.b $t2, $fp, -65
# %op11 = zext i1 %op10 to i32
	ld.b $t0, $fp, -65
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -72
# %op12 = icmp ne i32 %op11, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -73
# br i1 %op12, label %label2, label %label6
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label2
	b .main_label6
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
