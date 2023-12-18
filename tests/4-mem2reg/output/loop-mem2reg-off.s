	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 1, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 1
	st.w $t1, $t0, 0
# br label %label6
	b .main_label6
.main_label1:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -32
# %op3 = add i32 %op2, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -36
	st.w $t1, $t0, 0
# br label %label6
	b .main_label6
.main_label4:
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -40
# ret i32 %op5
	ld.w $a0, $fp, -40
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label6:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -44
# %op8 = icmp slt i32 %op7, 999999999
	ld.w $t0, $fp, -44
	lu12i.w $t1, 244140
	ori $t1, $t1, 2559
	slt $t2, $t0, $t1
	st.b $t2, $fp, -45
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -45
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -52
# %op10 = icmp ne i32 %op9, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -53
# br i1 %op10, label %label1, label %label4
	ld.b $t0, $fp, -53
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label4
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
