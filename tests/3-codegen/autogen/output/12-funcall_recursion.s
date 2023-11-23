	.text
	.globl factorial
	.type factorial, @function
factorial:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
.factorial_label_entry:
# %op1 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op1
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -40
# %op3 = icmp eq i32 %op2, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -41
# %op4 = zext i1 %op3 to i32
	ld.b $t0, $fp, -41
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -48
# %op5 = icmp ne i32 %op4, 0
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -49
# br i1 %op5, label %label6, label %label7
	ld.b $t0, $fp, -49
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .factorial_label6
	b .factorial_label7
.factorial_label6:
# ret i32 1
	addi.w $a0, $zero, 1
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.factorial_label7:
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -56
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -60
# %op10 = sub i32 %op9, 1
	ld.w $t0, $fp, -60
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op11 = call i32 @factorial(i32 %op10)
	ld.w $a0, $fp, -64
	bl factorial
	st.w $a0, $fp, -68
# %op12 = mul i32 %op8, %op11
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -68
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# ret i32 %op12
	ld.w $a0, $fp, -72
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.factorial_label13:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
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
# %op1 = call i32 @factorial(i32 10)
	addi.w $a0, $zero, 10
	bl factorial
	st.w $a0, $fp, -32
# store i32 %op1, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -36
# ret i32 %op2
	ld.w $a0, $fp, -36
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
