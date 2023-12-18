# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl n
	.type n, @object
	.size n, 4
n:
	.space 4
	.globl m
	.type m, @object
	.size m, 4
m:
	.space 4
	.globl w
	.type w, @object
	.size w, 20
w:
	.space 20
	.globl v
	.type v, @object
	.size v, 20
v:
	.space 20
	.globl dp
	.type dp, @object
	.size dp, 264
dp:
	.space 264
	.text
	.globl max
	.type max, @function
max:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = icmp sgt i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	slt $t2, $t1, $t0
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -32
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .max_label5
	b .max_label6
.max_label5:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.max_label6:
# ret i32 %arg1
	ld.w $a0, $fp, -24
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.max_label7:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = icmp sle i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t1, $t1, 1
	slt $t2, $t0, $t1
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -32
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label5
	b .knapsack_label6
.knapsack_label5:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label6:
# br label %label7
	b .knapsack_label7
.knapsack_label7:
# %op8 = icmp eq i32 %arg0, 0
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
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
# br i1 %op10, label %label11, label %label12
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label11
	b .knapsack_label12
.knapsack_label11:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label12:
# br label %label13
	b .knapsack_label13
.knapsack_label13:
# %op14 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op15 = add i32 %op14, %arg1
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op16 = icmp sge i32 %op15, 0
	ld.w $t0, $fp, -52
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -53
# br i1 %op16, label %label25, label %label28
	ld.b $t0, $fp, -53
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label25
	b .knapsack_label28
.knapsack_label17:
# %op18 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op19 = add i32 %op18, %arg1
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op20 = icmp sge i32 %op19, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op20, label %label33, label %label36
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label33
	b .knapsack_label36
.knapsack_label21:
# br label %label22
	b .knapsack_label22
.knapsack_label22:
# %op23 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op24 = icmp sge i32 %op23, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -73
# br i1 %op24, label %label52, label %label55
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label52
	b .knapsack_label55
.knapsack_label25:
# %op26 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op15
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -52
	lu12i.w $t3, 0
	ori $t3, $t3, 264
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -88
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -92
# br label %label29
	b .knapsack_label29
.knapsack_label28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label29
	b .knapsack_label29
.knapsack_label29:
# %op30 = icmp sge i32 %op27, 0
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -93
# %op31 = zext i1 %op30 to i32
	ld.b $t0, $fp, -93
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -100
# %op32 = icmp ne i32 %op31, 0
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -101
# br i1 %op32, label %label17, label %label21
	ld.b $t0, $fp, -101
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label17
	b .knapsack_label21
.knapsack_label33:
# %op34 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op19
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -64
	lu12i.w $t3, 0
	ori $t3, $t3, 264
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -112
# %op35 = load i32, i32* %op34
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -116
# br label %label37
	b .knapsack_label37
.knapsack_label36:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label37
	b .knapsack_label37
.knapsack_label37:
# ret i32 %op35
	ld.w $a0, $fp, -116
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label38:
# %op39 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op40 = call i32 @knapsack(i32 %op39, i32 %arg1)
	ld.w $a0, $fp, -120
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -124
# br label %label47
	ld.w $t1, $fp, -124
	st.w $t1, $fp, -148
	b .knapsack_label47
.knapsack_label41:
# %op42 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op43 = call i32 @knapsack(i32 %op42, i32 %arg1)
	ld.w $a0, $fp, -128
	ld.w $a1, $fp, -24
	bl knapsack
	st.w $a0, $fp, -132
# %op44 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op45 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# %op46 = icmp sge i32 %op45, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -141
# br i1 %op46, label %label60, label %label63
	ld.b $t0, $fp, -141
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label60
	b .knapsack_label63
.knapsack_label47:
# %op48 = phi i32 [ %op40, %label38 ], [ %op75, %label73 ]
# %op49 = mul i32 %arg0, 11
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op50 = add i32 %op49, %arg1
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -24
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -156
# %op51 = icmp sge i32 %op50, 0
	ld.w $t0, $fp, -156
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -157
# br i1 %op51, label %label76, label %label78
	ld.b $t0, $fp, -157
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label76
	b .knapsack_label78
.knapsack_label52:
# %op53 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op23
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -72
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -168
# %op54 = load i32, i32* %op53
	ld.d $t0, $fp, -168
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# br label %label56
	b .knapsack_label56
.knapsack_label55:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label56
	b .knapsack_label56
.knapsack_label56:
# %op57 = icmp slt i32 %arg1, %op54
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -172
	slt $t2, $t0, $t1
	st.b $t2, $fp, -173
# %op58 = zext i1 %op57 to i32
	ld.b $t0, $fp, -173
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -180
# %op59 = icmp ne i32 %op58, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -181
# br i1 %op59, label %label38, label %label41
	ld.b $t0, $fp, -181
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label38
	b .knapsack_label41
.knapsack_label60:
# %op61 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op45
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -140
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -192
# %op62 = load i32, i32* %op61
	ld.d $t0, $fp, -192
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -196
# br label %label64
	b .knapsack_label64
.knapsack_label63:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label64
	b .knapsack_label64
.knapsack_label64:
# %op65 = sub i32 %arg1, %op62
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -196
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op66 = call i32 @knapsack(i32 %op44, i32 %op65)
	ld.w $a0, $fp, -136
	ld.w $a1, $fp, -200
	bl knapsack
	st.w $a0, $fp, -204
# %op67 = sub i32 %arg0, 1
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -208
# %op68 = icmp sge i32 %op67, 0
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -209
# br i1 %op68, label %label69, label %label72
	ld.b $t0, $fp, -209
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label69
	b .knapsack_label72
.knapsack_label69:
# %op70 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op67
	la.local $t0, v
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -208
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -224
# %op71 = load i32, i32* %op70
	ld.d $t0, $fp, -224
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -228
# br label %label73
	b .knapsack_label73
.knapsack_label72:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label73
	b .knapsack_label73
.knapsack_label73:
# %op74 = add i32 %op66, %op71
	ld.w $t0, $fp, -204
	ld.w $t1, $fp, -228
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -232
# %op75 = call i32 @max(i32 %op43, i32 %op74)
	ld.w $a0, $fp, -132
	ld.w $a1, $fp, -232
	bl max
	st.w $a0, $fp, -236
# br label %label47
	ld.w $t1, $fp, -236
	st.w $t1, $fp, -148
	b .knapsack_label47
.knapsack_label76:
# %op77 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op50
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -156
	lu12i.w $t3, 0
	ori $t3, $t3, 264
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -248
# br label %label79
	b .knapsack_label79
.knapsack_label78:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label79
	b .knapsack_label79
.knapsack_label79:
# store i32 %op48, i32* %op77
	ld.d $t0, $fp, -248
	ld.w $t1, $fp, -148
	st.w $t1, $t0, 0
# ret i32 %op48
	ld.w $a0, $fp, -148
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -224
.main_label_entry:
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op0 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label3
	ld.b $t0, $fp, -17
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label3
.main_label1:
# %op2 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -32
# br label %label4
	b .main_label4
.main_label3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label4
	b .main_label4
.main_label4:
# store i32 2, i32* %op2
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op5 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op5, label %label6, label %label8
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label6
	b .main_label8
.main_label6:
# %op7 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 1
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -48
# br label %label9
	b .main_label9
.main_label8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label9
	b .main_label9
.main_label9:
# store i32 2, i32* %op7
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op10 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -49
# br i1 %op10, label %label11, label %label13
	ld.b $t0, $fp, -49
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label11
	b .main_label13
.main_label11:
# %op12 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 2
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -64
# br label %label14
	b .main_label14
.main_label13:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label14
	b .main_label14
.main_label14:
# store i32 6, i32* %op12
	ld.d $t0, $fp, -64
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op15 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op15, label %label16, label %label18
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label16
	b .main_label18
.main_label16:
# %op17 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -80
# br label %label19
	b .main_label19
.main_label18:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label19
	b .main_label19
.main_label19:
# store i32 5, i32* %op17
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op20 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op20, label %label21, label %label23
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label21
	b .main_label23
.main_label21:
# %op22 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
	la.local $t0, w
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -96
# br label %label24
	b .main_label24
.main_label23:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label24
	b .main_label24
.main_label24:
# store i32 4, i32* %op22
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op25 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -97
# br i1 %op25, label %label26, label %label28
	ld.b $t0, $fp, -97
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label26
	b .main_label28
.main_label26:
# %op27 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -112
# br label %label29
	b .main_label29
.main_label28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label29
	b .main_label29
.main_label29:
# store i32 6, i32* %op27
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op30 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -113
# br i1 %op30, label %label31, label %label33
	ld.b $t0, $fp, -113
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label31
	b .main_label33
.main_label31:
# %op32 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 1
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -128
# br label %label34
	b .main_label34
.main_label33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label34
	b .main_label34
.main_label34:
# store i32 3, i32* %op32
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op35 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -129
# br i1 %op35, label %label36, label %label38
	ld.b $t0, $fp, -129
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label36
	b .main_label38
.main_label36:
# %op37 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 2
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -144
# br label %label39
	b .main_label39
.main_label38:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label39
	b .main_label39
.main_label39:
# store i32 5, i32* %op37
	ld.d $t0, $fp, -144
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op40 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -145
# br i1 %op40, label %label41, label %label43
	ld.b $t0, $fp, -145
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label41
	b .main_label43
.main_label41:
# %op42 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -160
# br label %label44
	b .main_label44
.main_label43:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label44
	b .main_label44
.main_label44:
# store i32 4, i32* %op42
	ld.d $t0, $fp, -160
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op45 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -161
# br i1 %op45, label %label46, label %label48
	ld.b $t0, $fp, -161
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label46
	b .main_label48
.main_label46:
# %op47 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
	la.local $t0, v
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
	lu12i.w $t3, 0
	ori $t3, $t3, 20
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -176
# br label %label49
	b .main_label49
.main_label48:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label49
	b .main_label49
.main_label49:
# store i32 6, i32* %op47
	ld.d $t0, $fp, -176
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label56
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -196
	b .main_label56
.main_label50:
# %op51 = icmp sge i32 %op57, 0
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -177
# br i1 %op51, label %label61, label %label63
	ld.b $t0, $fp, -177
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label61
	b .main_label63
.main_label52:
# %op53 = load i32, i32* @n
	la.local $t0, n
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -184
# %op54 = load i32, i32* @m
	la.local $t0, m
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -188
# %op55 = call i32 @knapsack(i32 %op53, i32 %op54)
	ld.w $a0, $fp, -184
	ld.w $a1, $fp, -188
	bl knapsack
	st.w $a0, $fp, -192
# call void @output(i32 %op55)
	ld.w $a0, $fp, -192
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 224
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label56:
# %op57 = phi i32 [ 0, %label49 ], [ %op66, %label64 ]
# %op58 = icmp slt i32 %op57, 66
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 66
	slt $t2, $t0, $t1
	st.b $t2, $fp, -197
# %op59 = zext i1 %op58 to i32
	ld.b $t0, $fp, -197
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -204
# %op60 = icmp ne i32 %op59, 0
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -205
# br i1 %op60, label %label50, label %label52
	ld.b $t0, $fp, -205
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label50
	b .main_label52
.main_label61:
# %op62 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op57
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -196
	lu12i.w $t3, 0
	ori $t3, $t3, 264
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -216
# br label %label64
	b .main_label64
.main_label63:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label64
	b .main_label64
.main_label64:
# %op65 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# store i32 %op65, i32* %op62
	ld.d $t0, $fp, -216
	ld.w $t1, $fp, -220
	st.w $t1, $t0, 0
# %op66 = add i32 %op57, 1
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -224
# br label %label56
	ld.w $t1, $fp, -224
	st.w $t1, $fp, -196
	b .main_label56
	addi.d $sp, $sp, 224
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
