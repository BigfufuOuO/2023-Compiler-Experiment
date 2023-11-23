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
	addi.d $sp, $sp, -80
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.max_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -56
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -60
# %op6 = icmp sgt i32 %op4, %op5
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -60
	slt $t2, $t1, $t0
	st.b $t2, $fp, -61
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -61
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -68
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -68
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -69
# br i1 %op8, label %label9, label %label11
	ld.b $t0, $fp, -69
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .max_label9
	b .max_label11
.max_label9:
# %op10 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -76
# ret i32 %op10
	ld.w $a0, $fp, -76
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.max_label11:
# %op12 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -80
# ret i32 %op12
	ld.w $a0, $fp, -80
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.max_label13:
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
	.globl knapsack
	.type knapsack, @function
knapsack:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -368
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.knapsack_label_entry:
# %op2 = alloca i32
	addi.d $t0, $fp, -36
	st.d $t0, $fp, -32
# store i32 %arg0, i32* %op2
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op3 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# store i32 %arg1, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -68
	st.d $t0, $fp, -64
# %op5 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op6 = icmp sle i32 %op5, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	addi.w $t1, $t1, 1
	slt $t2, $t0, $t1
	st.b $t2, $fp, -73
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -73
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -80
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -81
# br i1 %op8, label %label9, label %label10
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label9
	b .knapsack_label10
.knapsack_label9:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label10:
# br label %label11
	b .knapsack_label11
.knapsack_label11:
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -88
# %op13 = icmp eq i32 %op12, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -89
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -89
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -96
# %op15 = icmp ne i32 %op14, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -97
# br i1 %op15, label %label16, label %label17
	ld.b $t0, $fp, -97
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label16
	b .knapsack_label17
.knapsack_label16:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label17:
# br label %label18
	b .knapsack_label18
.knapsack_label18:
# %op19 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -104
# %op20 = mul i32 %op19, 11
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op21 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -112
# %op22 = add i32 %op20, %op21
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -112
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op23 = icmp sge i32 %op22, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -117
# br i1 %op23, label %label36, label %label39
	ld.b $t0, $fp, -117
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label36
	b .knapsack_label39
.knapsack_label24:
# %op25 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -124
# %op26 = mul i32 %op25, 11
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op27 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -132
# %op28 = add i32 %op26, %op27
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op29 = icmp sge i32 %op28, 0
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -137
# br i1 %op29, label %label44, label %label47
	ld.b $t0, $fp, -137
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label44
	b .knapsack_label47
.knapsack_label30:
# br label %label31
	b .knapsack_label31
.knapsack_label31:
# %op32 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -144
# %op33 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -148
# %op34 = sub i32 %op33, 1
	ld.w $t0, $fp, -148
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op35 = icmp sge i32 %op34, 0
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -153
# br i1 %op35, label %label71, label %label74
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label71
	b .knapsack_label74
.knapsack_label36:
# %op37 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op22
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -116
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
	st.d $t0, $fp, -168
# %op38 = load i32, i32* %op37
	ld.d $t0, $fp, -168
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# br label %label40
	b .knapsack_label40
.knapsack_label39:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label40
	b .knapsack_label40
.knapsack_label40:
# %op41 = icmp sge i32 %op38, 0
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -173
# %op42 = zext i1 %op41 to i32
	ld.b $t0, $fp, -173
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -180
# %op43 = icmp ne i32 %op42, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -181
# br i1 %op43, label %label24, label %label30
	ld.b $t0, $fp, -181
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label24
	b .knapsack_label30
.knapsack_label44:
# %op45 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op28
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -136
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
	st.d $t0, $fp, -192
# %op46 = load i32, i32* %op45
	ld.d $t0, $fp, -192
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -196
# br label %label48
	b .knapsack_label48
.knapsack_label47:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label48
	b .knapsack_label48
.knapsack_label48:
# ret i32 %op46
	ld.w $a0, $fp, -196
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.knapsack_label49:
# %op50 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -200
# %op51 = sub i32 %op50, 1
	ld.w $t0, $fp, -200
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op52 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -208
# %op53 = call i32 @knapsack(i32 %op51, i32 %op52)
	ld.w $a0, $fp, -204
	ld.w $a1, $fp, -208
	bl knapsack
	st.w $a0, $fp, -212
# store i32 %op53, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
# br label %label65
	b .knapsack_label65
.knapsack_label54:
# %op55 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -216
# %op56 = sub i32 %op55, 1
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# %op57 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -224
# %op58 = call i32 @knapsack(i32 %op56, i32 %op57)
	ld.w $a0, $fp, -220
	ld.w $a1, $fp, -224
	bl knapsack
	st.w $a0, $fp, -228
# %op59 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -232
# %op60 = sub i32 %op59, 1
	ld.w $t0, $fp, -232
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# %op61 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -240
# %op62 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -244
# %op63 = sub i32 %op62, 1
	ld.w $t0, $fp, -244
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -248
# %op64 = icmp sge i32 %op63, 0
	ld.w $t0, $fp, -248
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -249
# br i1 %op64, label %label79, label %label82
	ld.b $t0, $fp, -249
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label79
	b .knapsack_label82
.knapsack_label65:
# %op66 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -256
# %op67 = mul i32 %op66, 11
	ld.w $t0, $fp, -256
	addi.w $t1, $zero, 11
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -260
# %op68 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -264
# %op69 = add i32 %op67, %op68
	ld.w $t0, $fp, -260
	ld.w $t1, $fp, -264
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -268
# %op70 = icmp sge i32 %op69, 0
	ld.w $t0, $fp, -268
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -269
# br i1 %op70, label %label96, label %label98
	ld.b $t0, $fp, -269
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label96
	b .knapsack_label98
.knapsack_label71:
# %op72 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op34
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -152
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
	st.d $t0, $fp, -280
# %op73 = load i32, i32* %op72
	ld.d $t0, $fp, -280
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -284
# br label %label75
	b .knapsack_label75
.knapsack_label74:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label75
	b .knapsack_label75
.knapsack_label75:
# %op76 = icmp slt i32 %op32, %op73
	ld.w $t0, $fp, -144
	ld.w $t1, $fp, -284
	slt $t2, $t0, $t1
	st.b $t2, $fp, -285
# %op77 = zext i1 %op76 to i32
	ld.b $t0, $fp, -285
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -292
# %op78 = icmp ne i32 %op77, 0
	ld.w $t0, $fp, -292
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -293
# br i1 %op78, label %label49, label %label54
	ld.b $t0, $fp, -293
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label49
	b .knapsack_label54
.knapsack_label79:
# %op80 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 %op63
	la.local $t0, w
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -248
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
	st.d $t0, $fp, -304
# %op81 = load i32, i32* %op80
	ld.d $t0, $fp, -304
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -308
# br label %label83
	b .knapsack_label83
.knapsack_label82:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label83
	b .knapsack_label83
.knapsack_label83:
# %op84 = sub i32 %op61, %op81
	ld.w $t0, $fp, -240
	ld.w $t1, $fp, -308
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -312
# %op85 = call i32 @knapsack(i32 %op60, i32 %op84)
	ld.w $a0, $fp, -236
	ld.w $a1, $fp, -312
	bl knapsack
	st.w $a0, $fp, -316
# %op86 = load i32, i32* %op2
	ld.d $t0, $fp, -32
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -320
# %op87 = sub i32 %op86, 1
	ld.w $t0, $fp, -320
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -324
# %op88 = icmp sge i32 %op87, 0
	ld.w $t0, $fp, -324
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -325
# br i1 %op88, label %label89, label %label92
	ld.b $t0, $fp, -325
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .knapsack_label89
	b .knapsack_label92
.knapsack_label89:
# %op90 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 %op87
	la.local $t0, v
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -324
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
	st.d $t0, $fp, -336
# %op91 = load i32, i32* %op90
	ld.d $t0, $fp, -336
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -340
# br label %label93
	b .knapsack_label93
.knapsack_label92:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label93
	b .knapsack_label93
.knapsack_label93:
# %op94 = add i32 %op85, %op91
	ld.w $t0, $fp, -316
	ld.w $t1, $fp, -340
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -344
# %op95 = call i32 @max(i32 %op58, i32 %op94)
	ld.w $a0, $fp, -228
	ld.w $a1, $fp, -344
	bl max
	st.w $a0, $fp, -348
# store i32 %op95, i32* %op4
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -348
	st.w $t1, $t0, 0
# br label %label65
	b .knapsack_label65
.knapsack_label96:
# %op97 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op69
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -268
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
	st.d $t0, $fp, -360
# br label %label99
	b .knapsack_label99
.knapsack_label98:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label99
	b .knapsack_label99
.knapsack_label99:
# %op100 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -364
# store i32 %op100, i32* %op97
	ld.d $t0, $fp, -360
	ld.w $t1, $fp, -364
	st.w $t1, $t0, 0
# %op101 = load i32, i32* %op4
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -368
# ret i32 %op101
	ld.w $a0, $fp, -368
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -256
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 5, i32* @n
	la.local $t0, n
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# store i32 10, i32* @m
	la.local $t0, m
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# %op1 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -29
# br i1 %op1, label %label2, label %label4
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label2
	b .main_label4
.main_label2:
# %op3 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 0
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
	st.d $t0, $fp, -40
# br label %label5
	b .main_label5
.main_label4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label5
	b .main_label5
.main_label5:
# store i32 2, i32* %op3
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op6 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -41
# br i1 %op6, label %label7, label %label9
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label7
	b .main_label9
.main_label7:
# %op8 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 1
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
	st.d $t0, $fp, -56
# br label %label10
	b .main_label10
.main_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label10
	b .main_label10
.main_label10:
# store i32 2, i32* %op8
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 2
	st.w $t1, $t0, 0
# %op11 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -57
# br i1 %op11, label %label12, label %label14
	ld.b $t0, $fp, -57
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label12
	b .main_label14
.main_label12:
# %op13 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 2
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
	st.d $t0, $fp, -72
# br label %label15
	b .main_label15
.main_label14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label15
	b .main_label15
.main_label15:
# store i32 6, i32* %op13
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op16 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -73
# br i1 %op16, label %label17, label %label19
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label17
	b .main_label19
.main_label17:
# %op18 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 3
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
	st.d $t0, $fp, -88
# br label %label20
	b .main_label20
.main_label19:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label20
	b .main_label20
.main_label20:
# store i32 5, i32* %op18
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op21 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -89
# br i1 %op21, label %label22, label %label24
	ld.b $t0, $fp, -89
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label22
	b .main_label24
.main_label22:
# %op23 = getelementptr [5 x i32], [5 x i32]* @w, i32 0, i32 4
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
	st.d $t0, $fp, -104
# br label %label25
	b .main_label25
.main_label24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label25
	b .main_label25
.main_label25:
# store i32 4, i32* %op23
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op26 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -105
# br i1 %op26, label %label27, label %label29
	ld.b $t0, $fp, -105
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label27
	b .main_label29
.main_label27:
# %op28 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 0
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
	st.d $t0, $fp, -120
# br label %label30
	b .main_label30
.main_label29:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label30
	b .main_label30
.main_label30:
# store i32 6, i32* %op28
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# %op31 = icmp sge i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -121
# br i1 %op31, label %label32, label %label34
	ld.b $t0, $fp, -121
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label32
	b .main_label34
.main_label32:
# %op33 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 1
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
	st.d $t0, $fp, -136
# br label %label35
	b .main_label35
.main_label34:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label35
	b .main_label35
.main_label35:
# store i32 3, i32* %op33
	ld.d $t0, $fp, -136
	addi.w $t1, $zero, 3
	st.w $t1, $t0, 0
# %op36 = icmp sge i32 2, 0
	addi.w $t0, $zero, 2
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -137
# br i1 %op36, label %label37, label %label39
	ld.b $t0, $fp, -137
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label37
	b .main_label39
.main_label37:
# %op38 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 2
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
	st.d $t0, $fp, -152
# br label %label40
	b .main_label40
.main_label39:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label40
	b .main_label40
.main_label40:
# store i32 5, i32* %op38
	ld.d $t0, $fp, -152
	addi.w $t1, $zero, 5
	st.w $t1, $t0, 0
# %op41 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -153
# br i1 %op41, label %label42, label %label44
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label42
	b .main_label44
.main_label42:
# %op43 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 3
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
	st.d $t0, $fp, -168
# br label %label45
	b .main_label45
.main_label44:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label45
	b .main_label45
.main_label45:
# store i32 4, i32* %op43
	ld.d $t0, $fp, -168
	addi.w $t1, $zero, 4
	st.w $t1, $t0, 0
# %op46 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -169
# br i1 %op46, label %label47, label %label49
	ld.b $t0, $fp, -169
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label47
	b .main_label49
.main_label47:
# %op48 = getelementptr [5 x i32], [5 x i32]* @v, i32 0, i32 4
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
	st.d $t0, $fp, -184
# br label %label50
	b .main_label50
.main_label49:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label50
	b .main_label50
.main_label50:
# store i32 6, i32* %op48
	ld.d $t0, $fp, -184
	addi.w $t1, $zero, 6
	st.w $t1, $t0, 0
# br label %label58
	b .main_label58
.main_label51:
# %op52 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -188
# %op53 = icmp sge i32 %op52, 0
	ld.w $t0, $fp, -188
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -189
# br i1 %op53, label %label63, label %label65
	ld.b $t0, $fp, -189
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label63
	b .main_label65
.main_label54:
# %op55 = load i32, i32* @n
	la.local $t0, n
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -196
# %op56 = load i32, i32* @m
	la.local $t0, m
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -200
# %op57 = call i32 @knapsack(i32 %op55, i32 %op56)
	ld.w $a0, $fp, -196
	ld.w $a1, $fp, -200
	bl knapsack
	st.w $a0, $fp, -204
# call void @output(i32 %op57)
	ld.w $a0, $fp, -204
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label58:
# %op59 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -208
# %op60 = icmp slt i32 %op59, 66
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 66
	slt $t2, $t0, $t1
	st.b $t2, $fp, -209
# %op61 = zext i1 %op60 to i32
	ld.b $t0, $fp, -209
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -216
# %op62 = icmp ne i32 %op61, 0
	ld.w $t0, $fp, -216
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -217
# br i1 %op62, label %label51, label %label54
	ld.b $t0, $fp, -217
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label51
	b .main_label54
.main_label63:
# %op64 = getelementptr [66 x i32], [66 x i32]* @dp, i32 0, i32 %op52
	la.local $t0, dp
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -188
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
	st.d $t0, $fp, -232
# br label %label66
	b .main_label66
.main_label65:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label66
	b .main_label66
.main_label66:
# %op67 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# store i32 %op67, i32* %op64
	ld.d $t0, $fp, -232
	ld.w $t1, $fp, -236
	st.w $t1, $t0, 0
# %op68 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -240
# %op69 = add i32 %op68, 1
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -244
# store i32 %op69, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -244
	st.w $t1, $t0, 0
# br label %label58
	b .main_label58
	addi.d $sp, $sp, 256
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
