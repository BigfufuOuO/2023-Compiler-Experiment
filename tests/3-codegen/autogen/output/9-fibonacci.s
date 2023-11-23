	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
	st.w $a0, $fp, -20
.fibonacci_label_entry:
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
	bnez $t1, .fibonacci_label6
	b .fibonacci_label7
.fibonacci_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label7:
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -56
# %op9 = icmp eq i32 %op8, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -57
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -57
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -64
# %op11 = icmp ne i32 %op10, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -65
# br i1 %op11, label %label13, label %label14
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .fibonacci_label13
	b .fibonacci_label14
.fibonacci_label12:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label13:
# ret i32 1
	addi.w $a0, $zero, 1
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label14:
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op16 = sub i32 %op15, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op17 = call i32 @fibonacci(i32 %op16)
	ld.w $a0, $fp, -76
	bl fibonacci
	st.w $a0, $fp, -80
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -84
# %op19 = sub i32 %op18, 2
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op20 = call i32 @fibonacci(i32 %op19)
	ld.w $a0, $fp, -88
	bl fibonacci
	st.w $a0, $fp, -92
# %op21 = add i32 %op17, %op20
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -92
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# ret i32 %op21
	ld.w $a0, $fp, -96
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label22:
# br label %label12
	b .fibonacci_label12
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
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
# br label %label8
	b .main_label8
.main_label2:
# %op3 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -48
# %op4 = call i32 @fibonacci(i32 %op3)
	ld.w $a0, $fp, -48
	bl fibonacci
	st.w $a0, $fp, -52
# call void @output(i32 %op4)
	ld.w $a0, $fp, -52
	bl output
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -56
# %op6 = add i32 %op5, 1
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# store i32 %op6, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -60
	st.w $t1, $t0, 0
# br label %label8
	b .main_label8
.main_label7:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label8:
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -64
# %op10 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -68
# %op11 = icmp slt i32 %op9, %op10
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -68
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op12 = zext i1 %op11 to i32
	ld.b $t0, $fp, -69
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -76
# %op13 = icmp ne i32 %op12, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -77
# br i1 %op13, label %label2, label %label7
	ld.b $t0, $fp, -77
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label2
	b .main_label7
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
