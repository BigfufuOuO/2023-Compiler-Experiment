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
# %op2 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store i32 0, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 2, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# store i32 1, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -64
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -65
# br i1 %op4, label %label5, label %label8
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label5
	b .main_label8
.main_label5:
# %op6 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -73
# br i1 %op7, label %label11, label %label12
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label11
	b .main_label12
.main_label8:
# br label %label9
	b .main_label9
.main_label9:
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -80
# ret i32 %op10
	ld.w $a0, $fp, -80
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label11:
# store i32 4, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# br label %label13
	b .main_label13
.main_label12:
# store i32 3, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# br label %label13
	b .main_label13
.main_label13:
# br label %label9
	b .main_label9
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
