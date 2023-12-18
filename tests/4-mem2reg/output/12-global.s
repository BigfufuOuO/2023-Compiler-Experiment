# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl seed
	.type seed, @object
	.size seed, 4
seed:
	.space 4
	.text
	.globl randomLCG
	.type randomLCG, @function
randomLCG:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randomLCG_label_entry:
# %op0 = load i32, i32* @seed
	la.local $t0, seed
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -20
# %op1 = mul i32 %op0, 1103515245
	ld.w $t0, $fp, -20
	lu12i.w $t1, 269412
	ori $t1, $t1, 3693
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# %op2 = add i32 %op1, 12345
	ld.w $t0, $fp, -24
	lu12i.w $t1, 3
	ori $t1, $t1, 57
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -28
# store i32 %op2, i32* @seed
	la.local $t0, seed
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op3 = load i32, i32* @seed
	la.local $t0, seed
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -32
# ret i32 %op3
	ld.w $a0, $fp, -32
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl randBin
	.type randBin, @function
randBin:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.randBin_label_entry:
# %op0 = call i32 @randomLCG()
	bl randomLCG
	st.w $a0, $fp, -20
# %op1 = icmp sgt i32 %op0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t1, $t0
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
	bnez $t1, .randBin_label4
	b .randBin_label5
.randBin_label4:
# ret i32 1
	addi.w $a0, $zero, 1
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.randBin_label5:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.randBin_label6:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl returnToZeroSteps
	.type returnToZeroSteps, @function
returnToZeroSteps:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.returnToZeroSteps_label_entry:
# br label %label4
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -28
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -32
	b .returnToZeroSteps_label4
.returnToZeroSteps_label0:
# %op1 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -20
# %op2 = icmp ne i32 %op1, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -21
# br i1 %op2, label %label10, label %label12
	ld.b $t0, $fp, -21
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .returnToZeroSteps_label10
	b .returnToZeroSteps_label12
.returnToZeroSteps_label3:
# ret i32 20
	addi.w $a0, $zero, 20
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.returnToZeroSteps_label4:
# %op5 = phi i32 [ 0, %label_entry ], [ %op15, %label22 ]
# %op6 = phi i32 [ 0, %label_entry ], [ %op16, %label22 ]
# %op7 = icmp slt i32 %op6, 20
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -33
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -40
# %op9 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -41
# br i1 %op9, label %label0, label %label3
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .returnToZeroSteps_label0
	b .returnToZeroSteps_label3
.returnToZeroSteps_label10:
# %op11 = add i32 %op5, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# br label %label14
	ld.w $t1, $fp, -48
	st.w $t1, $fp, -56
	b .returnToZeroSteps_label14
.returnToZeroSteps_label12:
# %op13 = sub i32 %op5, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# br label %label14
	ld.w $t1, $fp, -52
	st.w $t1, $fp, -56
	b .returnToZeroSteps_label14
.returnToZeroSteps_label14:
# %op15 = phi i32 [ %op11, %label10 ], [ %op13, %label12 ]
# %op16 = add i32 %op6, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op17 = icmp eq i32 %op15, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -61
# %op18 = zext i1 %op17 to i32
	ld.b $t0, $fp, -61
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -68
# %op19 = icmp ne i32 %op18, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -69
# br i1 %op19, label %label20, label %label21
	ld.b $t0, $fp, -69
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .returnToZeroSteps_label20
	b .returnToZeroSteps_label21
.returnToZeroSteps_label20:
# ret i32 %op16
	ld.w $a0, $fp, -60
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.returnToZeroSteps_label21:
# br label %label22
	b .returnToZeroSteps_label22
.returnToZeroSteps_label22:
# br label %label4
	ld.w $t1, $fp, -56
	st.w $t1, $fp, -28
	ld.w $t1, $fp, -60
	st.w $t1, $fp, -32
	b .returnToZeroSteps_label4
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
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label4
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -28
	b .main_label4
.main_label0:
# %op1 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
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
# %op6 = icmp slt i32 %op5, 20
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 20
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
