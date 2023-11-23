	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label5
	b .main_label5
.main_label1:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -32
# %op3 = sub i32 %op2, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -36
	st.w $t1, $t0, 0
# br label %label5
	b .main_label5
.main_label4:
# ret void
	add.w $a0, $zero, $zero
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label5:
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -40
# %op7 = icmp ne i32 %op6, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -41
# br i1 %op7, label %label1, label %label4
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label4
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
