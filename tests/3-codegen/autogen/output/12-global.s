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
	addi.d $sp, $sp, -112
.returnToZeroSteps_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label6
	b .returnToZeroSteps_label6
.returnToZeroSteps_label2:
# %op3 = call i32 @randBin()
	bl randBin
	st.w $a0, $fp, -48
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -49
# br i1 %op4, label %label11, label %label14
	ld.b $t0, $fp, -49
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .returnToZeroSteps_label11
	b .returnToZeroSteps_label14
.returnToZeroSteps_label5:
# ret i32 20
	addi.w $a0, $zero, 20
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.returnToZeroSteps_label6:
# %op7 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -56
# %op8 = icmp slt i32 %op7, 20
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -57
# %op9 = zext i1 %op8 to i32
	ld.b $t0, $fp, -57
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -64
# %op10 = icmp ne i32 %op9, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -65
# br i1 %op10, label %label2, label %label5
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .returnToZeroSteps_label2
	b .returnToZeroSteps_label5
.returnToZeroSteps_label11:
# %op12 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op13 = add i32 %op12, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# store i32 %op13, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
# br label %label17
	b .returnToZeroSteps_label17
.returnToZeroSteps_label14:
# %op15 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -80
# %op16 = sub i32 %op15, 1
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# store i32 %op16, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -84
	st.w $t1, $t0, 0
# br label %label17
	b .returnToZeroSteps_label17
.returnToZeroSteps_label17:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -88
# %op19 = add i32 %op18, 1
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# store i32 %op19, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -92
	st.w $t1, $t0, 0
# %op20 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -96
# %op21 = icmp eq i32 %op20, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -97
# %op22 = zext i1 %op21 to i32
	ld.b $t0, $fp, -97
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -104
# %op23 = icmp ne i32 %op22, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -105
# br i1 %op23, label %label24, label %label26
	ld.b $t0, $fp, -105
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .returnToZeroSteps_label24
	b .returnToZeroSteps_label26
.returnToZeroSteps_label24:
# %op25 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -112
# ret i32 %op25
	ld.w $a0, $fp, -112
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.returnToZeroSteps_label26:
# br label %label27
	b .returnToZeroSteps_label27
.returnToZeroSteps_label27:
# br label %label6
	b .returnToZeroSteps_label6
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
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
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 3407, i32* @seed
	la.local $t0, seed
	lu12i.w $t1, 0
	ori $t1, $t1, 3407
	st.w $t1, $t0, 0
# br label %label6
	b .main_label6
.main_label1:
# %op2 = call i32 @returnToZeroSteps()
	bl returnToZeroSteps
	st.w $a0, $fp, -32
# call void @output(i32 %op2)
	ld.w $a0, $fp, -32
	bl output
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -36
# %op4 = add i32 %op3, 1
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# store i32 %op4, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -40
	st.w $t1, $t0, 0
# br label %label6
	b .main_label6
.main_label5:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label6:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -44
# %op8 = icmp slt i32 %op7, 20
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 20
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
# br i1 %op10, label %label1, label %label5
	ld.b $t0, $fp, -53
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label5
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
