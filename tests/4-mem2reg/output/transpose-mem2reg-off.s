# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl matrix
	.type matrix, @object
	.size matrix, 80000000
matrix:
	.space 80000000
	.globl ad
	.type ad, @object
	.size ad, 400000
ad:
	.space 400000
	.globl len
	.type len, @object
	.size len, 4
len:
	.space 4
	.text
	.globl readarray
	.type readarray, @function
readarray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.readarray_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label5
	b .readarray_label5
.readarray_label1:
# %op2 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -32
# %op3 = icmp sge i32 %op2, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op3, label %label11, label %label13
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .readarray_label11
	b .readarray_label13
.readarray_label4:
# ret void
	add.w $a0, $zero, $zero
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.readarray_label5:
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -40
# %op7 = load i32, i32* @len
	la.local $t0, len
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -44
# %op8 = icmp slt i32 %op6, %op7
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -44
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
	bnez $t1, .readarray_label1
	b .readarray_label4
.readarray_label11:
# %op12 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op2
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -32
	lu12i.w $t3, 97
	ori $t3, $t3, 2688
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
	b .readarray_label14
.readarray_label13:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label14
	b .readarray_label14
.readarray_label14:
# %op15 = call i32 @input()
	bl input
	st.w $a0, $fp, -68
# store i32 %op15, i32* %op12
	ld.d $t0, $fp, -64
	ld.w $t1, $fp, -68
	st.w $t1, $t0, 0
# %op16 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op17 = add i32 %op16, 1
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# store i32 %op17, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -76
	st.w $t1, $t0, 0
# br label %label5
	b .readarray_label5
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -432
	st.w $a0, $fp, -20
	st.d $a1, $fp, -32
	st.w $a2, $fp, -36
.transpose_label_entry:
# %op3 = alloca i32
	addi.d $t0, $fp, -52
	st.d $t0, $fp, -48
# store i32 %arg0, i32* %op3
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -20
	st.w $t1, $t0, 0
# %op4 = alloca i32*
	addi.d $t0, $fp, -72
	st.d $t0, $fp, -64
# store i32* %arg1, i32** %op4
	ld.d $t0, $fp, -64
	ld.d $t1, $fp, -32
	st.d $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t0, $fp, -84
	st.d $t0, $fp, -80
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -80
	ld.w $t1, $fp, -36
	st.w $t1, $t0, 0
# %op6 = alloca i32
	addi.d $t0, $fp, -100
	st.d $t0, $fp, -96
# %op7 = alloca i32
	addi.d $t0, $fp, -116
	st.d $t0, $fp, -112
# %op8 = alloca i32
	addi.d $t0, $fp, -132
	st.d $t0, $fp, -128
# %op9 = alloca i32
	addi.d $t0, $fp, -148
	st.d $t0, $fp, -144
# %op10 = load i32, i32* %op3
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -152
# %op11 = load i32, i32* %op5
	ld.d $t0, $fp, -80
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -156
# %op12 = sdiv i32 %op10, %op11
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# store i32 %op12, i32* %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -160
	st.w $t1, $t0, 0
# store i32 0, i32* %op7
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op8
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label16
	b .transpose_label16
.transpose_label13:
# store i32 0, i32* %op8
	ld.d $t0, $fp, -128
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label31
	b .transpose_label31
.transpose_label14:
# %op15 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -164
# ret i32 %op15
	ld.w $a0, $fp, -164
	addi.d $sp, $sp, 432
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.transpose_label16:
# %op17 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -168
# %op18 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# %op19 = icmp slt i32 %op17, %op18
	ld.w $t0, $fp, -168
	ld.w $t1, $fp, -172
	slt $t2, $t0, $t1
	st.b $t2, $fp, -173
# %op20 = zext i1 %op19 to i32
	ld.b $t0, $fp, -173
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -180
# %op21 = icmp ne i32 %op20, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -181
# br i1 %op21, label %label13, label %label14
	ld.b $t0, $fp, -181
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label13
	b .transpose_label14
.transpose_label22:
# %op23 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -188
# %op24 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -192
# %op25 = icmp slt i32 %op23, %op24
	ld.w $t0, $fp, -188
	ld.w $t1, $fp, -192
	slt $t2, $t0, $t1
	st.b $t2, $fp, -193
# %op26 = zext i1 %op25 to i32
	ld.b $t0, $fp, -193
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -200
# %op27 = icmp ne i32 %op26, 0
	ld.w $t0, $fp, -200
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -201
# br i1 %op27, label %label37, label %label40
	ld.b $t0, $fp, -201
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label37
	b .transpose_label40
.transpose_label28:
# %op29 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -208
# %op30 = add i32 %op29, 1
	ld.w $t0, $fp, -208
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# store i32 %op30, i32* %op7
	ld.d $t0, $fp, -112
	ld.w $t1, $fp, -212
	st.w $t1, $t0, 0
# br label %label16
	b .transpose_label16
.transpose_label31:
# %op32 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -216
# %op33 = load i32, i32* %op5
	ld.d $t0, $fp, -80
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -220
# %op34 = icmp slt i32 %op32, %op33
	ld.w $t0, $fp, -216
	ld.w $t1, $fp, -220
	slt $t2, $t0, $t1
	st.b $t2, $fp, -221
# %op35 = zext i1 %op34 to i32
	ld.b $t0, $fp, -221
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -228
# %op36 = icmp ne i32 %op35, 0
	ld.w $t0, $fp, -228
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -229
# br i1 %op36, label %label22, label %label28
	ld.b $t0, $fp, -229
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label22
	b .transpose_label28
.transpose_label37:
# %op38 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -236
# %op39 = add i32 %op38, 1
	ld.w $t0, $fp, -236
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -240
# store i32 %op39, i32* %op8
	ld.d $t0, $fp, -128
	ld.w $t1, $fp, -240
	st.w $t1, $t0, 0
# br label %label47
	b .transpose_label47
.transpose_label40:
# %op41 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -244
# %op42 = load i32, i32* %op5
	ld.d $t0, $fp, -80
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -248
# %op43 = mul i32 %op41, %op42
	ld.w $t0, $fp, -244
	ld.w $t1, $fp, -248
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -252
# %op44 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -256
# %op45 = add i32 %op43, %op44
	ld.w $t0, $fp, -252
	ld.w $t1, $fp, -256
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -260
# %op46 = icmp sge i32 %op45, 0
	ld.w $t0, $fp, -260
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -261
# br i1 %op46, label %label48, label %label52
	ld.b $t0, $fp, -261
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label48
	b .transpose_label52
.transpose_label47:
# br label %label31
	b .transpose_label31
.transpose_label48:
# %op49 = load i32*, i32** %op4
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -272
# %op50 = getelementptr i32, i32* %op49, i32 %op45
	ld.d $t0, $fp, -272
	ld.w $t1, $fp, -260
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -280
# %op51 = load i32, i32* %op50
	ld.d $t0, $fp, -280
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -284
# br label %label53
	b .transpose_label53
.transpose_label52:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label53
	b .transpose_label53
.transpose_label53:
# store i32 %op51, i32* %op9
	ld.d $t0, $fp, -144
	ld.w $t1, $fp, -284
	st.w $t1, $t0, 0
# %op54 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -288
# %op55 = load i32, i32* %op6
	ld.d $t0, $fp, -96
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -292
# %op56 = mul i32 %op54, %op55
	ld.w $t0, $fp, -288
	ld.w $t1, $fp, -292
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -296
# %op57 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -300
# %op58 = add i32 %op56, %op57
	ld.w $t0, $fp, -296
	ld.w $t1, $fp, -300
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -304
# %op59 = icmp sge i32 %op58, 0
	ld.w $t0, $fp, -304
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -305
# br i1 %op59, label %label60, label %label63
	ld.b $t0, $fp, -305
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label60
	b .transpose_label63
.transpose_label60:
# %op61 = load i32*, i32** %op4
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -320
# %op62 = getelementptr i32, i32* %op61, i32 %op58
	ld.d $t0, $fp, -320
	ld.w $t1, $fp, -304
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -328
# br label %label64
	b .transpose_label64
.transpose_label63:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label64
	b .transpose_label64
.transpose_label64:
# %op65 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -332
# %op66 = load i32, i32* %op5
	ld.d $t0, $fp, -80
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -336
# %op67 = mul i32 %op65, %op66
	ld.w $t0, $fp, -332
	ld.w $t1, $fp, -336
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -340
# %op68 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -344
# %op69 = add i32 %op67, %op68
	ld.w $t0, $fp, -340
	ld.w $t1, $fp, -344
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -348
# %op70 = icmp sge i32 %op69, 0
	ld.w $t0, $fp, -348
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -349
# br i1 %op70, label %label71, label %label75
	ld.b $t0, $fp, -349
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label71
	b .transpose_label75
.transpose_label71:
# %op72 = load i32*, i32** %op4
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -360
# %op73 = getelementptr i32, i32* %op72, i32 %op69
	ld.d $t0, $fp, -360
	ld.w $t1, $fp, -348
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -368
# %op74 = load i32, i32* %op73
	ld.d $t0, $fp, -368
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -372
# br label %label76
	b .transpose_label76
.transpose_label75:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label76
	b .transpose_label76
.transpose_label76:
# store i32 %op74, i32* %op62
	ld.d $t0, $fp, -328
	ld.w $t1, $fp, -372
	st.w $t1, $t0, 0
# %op77 = load i32, i32* %op7
	ld.d $t0, $fp, -112
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -376
# %op78 = load i32, i32* %op5
	ld.d $t0, $fp, -80
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -380
# %op79 = mul i32 %op77, %op78
	ld.w $t0, $fp, -376
	ld.w $t1, $fp, -380
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -384
# %op80 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -388
# %op81 = add i32 %op79, %op80
	ld.w $t0, $fp, -384
	ld.w $t1, $fp, -388
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -392
# %op82 = icmp sge i32 %op81, 0
	ld.w $t0, $fp, -392
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -393
# br i1 %op82, label %label83, label %label86
	ld.b $t0, $fp, -393
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label83
	b .transpose_label86
.transpose_label83:
# %op84 = load i32*, i32** %op4
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -408
# %op85 = getelementptr i32, i32* %op84, i32 %op81
	ld.d $t0, $fp, -408
	ld.w $t1, $fp, -392
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -416
# br label %label87
	b .transpose_label87
.transpose_label86:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label87
	b .transpose_label87
.transpose_label87:
# %op88 = load i32, i32* %op9
	ld.d $t0, $fp, -144
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -420
# store i32 %op88, i32* %op85
	ld.d $t0, $fp, -416
	ld.w $t1, $fp, -420
	st.w $t1, $t0, 0
# %op89 = load i32, i32* %op8
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -424
# %op90 = add i32 %op89, 1
	ld.w $t0, $fp, -424
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -428
# store i32 %op90, i32* %op8
	ld.d $t0, $fp, -128
	ld.w $t1, $fp, -428
	st.w $t1, $t0, 0
# br label %label47
	b .transpose_label47
	addi.d $sp, $sp, 432
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -288
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
# %op3 = call i32 @input()
	bl input
	st.w $a0, $fp, -64
# store i32 %op3, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -64
	st.w $t1, $t0, 0
# %op4 = call i32 @input()
	bl input
	st.w $a0, $fp, -68
# store i32 %op4, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -68
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label9
	b .main_label9
.main_label5:
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op7 = icmp sge i32 %op6, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -73
# br i1 %op7, label %label15, label %label17
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label15
	b .main_label17
.main_label8:
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label28
	b .main_label28
.main_label9:
# %op10 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -80
# %op11 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -84
# %op12 = icmp slt i32 %op10, %op11
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -84
	slt $t2, $t0, $t1
	st.b $t2, $fp, -85
# %op13 = zext i1 %op12 to i32
	ld.b $t0, $fp, -85
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -92
# %op14 = icmp ne i32 %op13, 0
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -93
# br i1 %op14, label %label5, label %label8
	ld.b $t0, $fp, -93
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label5
	b .main_label8
.main_label15:
# %op16 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op6
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -72
	lu12i.w $t3, 19531
	ori $t3, $t3, 1024
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -104
# br label %label18
	b .main_label18
.main_label17:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label18
	b .main_label18
.main_label18:
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -108
# store i32 %op19, i32* %op16
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -108
	st.w $t1, $t0, 0
# %op20 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -112
# %op21 = add i32 %op20, 1
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# store i32 %op21, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
# br label %label9
	b .main_label9
.main_label22:
# %op23 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -120
# %op24 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 19531
	ori $t3, $t3, 1024
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -128
# %op25 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -132
# %op26 = icmp sge i32 %op25, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -133
# br i1 %op26, label %label34, label %label37
	ld.b $t0, $fp, -133
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label34
	b .main_label37
.main_label27:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label54
	b .main_label54
.main_label28:
# %op29 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -140
# %op30 = load i32, i32* @len
	la.local $t0, len
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -144
# %op31 = icmp slt i32 %op29, %op30
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -144
	slt $t2, $t0, $t1
	st.b $t2, $fp, -145
# %op32 = zext i1 %op31 to i32
	ld.b $t0, $fp, -145
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -152
# %op33 = icmp ne i32 %op32, 0
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -153
# br i1 %op33, label %label22, label %label27
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label22
	b .main_label27
.main_label34:
# %op35 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op25
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -132
	lu12i.w $t3, 97
	ori $t3, $t3, 2688
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -168
# %op36 = load i32, i32* %op35
	ld.d $t0, $fp, -168
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# br label %label38
	b .main_label38
.main_label37:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label38
	b .main_label38
.main_label38:
# %op39 = call i32 @transpose(i32 %op23, i32* %op24, i32 %op36)
	ld.w $a0, $fp, -120
	ld.d $a1, $fp, -128
	ld.w $a2, $fp, -172
	bl transpose
	st.w $a0, $fp, -176
# %op40 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -180
# %op41 = add i32 %op40, 1
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# store i32 %op41, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -184
	st.w $t1, $t0, 0
# br label %label28
	b .main_label28
.main_label42:
# %op43 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -188
# %op44 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -192
# %op45 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -196
# %op46 = mul i32 %op44, %op45
	ld.w $t0, $fp, -192
	ld.w $t1, $fp, -196
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# %op47 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -204
# %op48 = icmp sge i32 %op47, 0
	ld.w $t0, $fp, -204
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -205
# br i1 %op48, label %label60, label %label63
	ld.b $t0, $fp, -205
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label60
	b .main_label63
.main_label49:
# %op50 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -212
# %op51 = icmp slt i32 %op50, 0
	ld.w $t0, $fp, -212
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -213
# %op52 = zext i1 %op51 to i32
	ld.b $t0, $fp, -213
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -220
# %op53 = icmp ne i32 %op52, 0
	ld.w $t0, $fp, -220
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -221
# br i1 %op53, label %label69, label %label72
	ld.b $t0, $fp, -221
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label69
	b .main_label72
.main_label54:
# %op55 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -228
# %op56 = load i32, i32* @len
	la.local $t0, len
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -232
# %op57 = icmp slt i32 %op55, %op56
	ld.w $t0, $fp, -228
	ld.w $t1, $fp, -232
	slt $t2, $t0, $t1
	st.b $t2, $fp, -233
# %op58 = zext i1 %op57 to i32
	ld.b $t0, $fp, -233
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -240
# %op59 = icmp ne i32 %op58, 0
	ld.w $t0, $fp, -240
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -241
# br i1 %op59, label %label42, label %label49
	ld.b $t0, $fp, -241
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label42
	b .main_label49
.main_label60:
# %op61 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op47
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -204
	lu12i.w $t3, 19531
	ori $t3, $t3, 1024
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -256
# %op62 = load i32, i32* %op61
	ld.d $t0, $fp, -256
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -260
# br label %label64
	b .main_label64
.main_label63:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label64
	b .main_label64
.main_label64:
# %op65 = mul i32 %op46, %op62
	ld.w $t0, $fp, -200
	ld.w $t1, $fp, -260
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -264
# %op66 = add i32 %op43, %op65
	ld.w $t0, $fp, -188
	ld.w $t1, $fp, -264
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -268
# store i32 %op66, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -268
	st.w $t1, $t0, 0
# %op67 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -272
# %op68 = add i32 %op67, 1
	ld.w $t0, $fp, -272
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -276
# store i32 %op68, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -276
	st.w $t1, $t0, 0
# br label %label54
	b .main_label54
.main_label69:
# %op70 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -280
# %op71 = sub i32 0, %op70
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -280
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -284
# store i32 %op71, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -284
	st.w $t1, $t0, 0
# br label %label73
	b .main_label73
.main_label72:
# br label %label73
	b .main_label73
.main_label73:
# %op74 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -288
# call void @output(i32 %op74)
	ld.w $a0, $fp, -288
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 288
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 288
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
