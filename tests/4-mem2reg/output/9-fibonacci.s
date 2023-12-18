	.text
	.globl fibonacci
	.type fibonacci, @function
fibonacci:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
.fibonacci_label_entry:
# %op1 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -21
# %op2 = zext i1 %op1 to i32
	ld.b $t0, $fp, -21
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -28
# %op3 = icmp ne i32 %op2, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -29
# br i1 %op3, label %label4, label %label5
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .fibonacci_label4
	b .fibonacci_label5
.fibonacci_label4:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label5:
# %op6 = icmp eq i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -30
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -30
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -36
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -37
# br i1 %op8, label %label10, label %label11
	ld.b $t0, $fp, -37
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .fibonacci_label10
	b .fibonacci_label11
.fibonacci_label9:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label10:
# ret i32 1
	addi.w $a0, $zero, 1
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label11:
# %op12 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op13 = call i32 @fibonacci(i32 %op12)
	ld.w $a0, $fp, -44
	bl fibonacci
	st.w $a0, $fp, -48
# %op14 = sub i32 %arg0, 2
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 2
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op15 = call i32 @fibonacci(i32 %op14)
	ld.w $a0, $fp, -52
	bl fibonacci
	st.w $a0, $fp, -56
# %op16 = add i32 %op13, %op15
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -56
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# ret i32 %op16
	ld.w $a0, $fp, -60
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.fibonacci_label17:
# br label %label9
	b .fibonacci_label9
	addi.d $sp, $sp, 64
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
# br label %label4
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -28
	b .main_label4
.main_label0:
# %op1 = call i32 @fibonacci(i32 %op5)
	ld.w $a0, $fp, -28
	bl fibonacci
	st.w $a0, $fp, -20
# call void @output(i32 %op1)
	ld.w $a0, $fp, -20
	bl output
# %op2 = add i32 %op5, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# br label %label4
	ld.w $t1, $fp, -24
	st.w $t1, $fp, -28
	b .main_label4
.main_label3:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label4:
# %op5 = phi i32 [ 0, %label_entry ], [ %op2, %label0 ]
# %op6 = icmp slt i32 %op5, 10
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -29
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -36
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -37
# br i1 %op8, label %label0, label %label3
	ld.b $t0, $fp, -37
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label0
	b .main_label3
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
