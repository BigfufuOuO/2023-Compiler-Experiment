	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -368
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
# %op3 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op4 = alloca i32
	addi.d $t0, $fp, -92
	st.d $t0, $fp, -88
# %op5 = alloca i32
	addi.d $t0, $fp, -108
	st.d $t0, $fp, -104
# %op6 = alloca i32
	addi.d $t0, $fp, -124
	st.d $t0, $fp, -120
# %op7 = call i32 @input()
	bl input
	st.w $a0, $fp, -128
# store i32 %op7, i32* %op6
	ld.d $t0, $fp, -120
	ld.w $t1, $fp, -128
	st.w $t1, $t0, 0
# store i32 0, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op5
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label62
	b .main_label62
.main_label8:
# %op9 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -132
# %op10 = fmul float %op9, 0x4002aa9940000000
	fld.s $ft0, $fp, -132
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -136
# %op11 = fmul float %op10, 0x4011781d80000000
	fld.s $ft0, $fp, -136
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -140
# %op12 = fmul float %op11, 0x401962ac40000000
	fld.s $ft0, $fp, -140
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -144
# %op13 = fptosi float %op12 to i32
	fld.s $ft0, $fp, -144
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -148
# store i32 %op13, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -148
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -152
# %op15 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -156
# %op16 = mul i32 %op14, %op15
	ld.w $t0, $fp, -152
	ld.w $t1, $fp, -156
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -160
# %op17 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -164
# %op18 = mul i32 %op16, %op17
	ld.w $t0, $fp, -160
	ld.w $t1, $fp, -164
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -168
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# %op20 = mul i32 %op18, %op19
	ld.w $t0, $fp, -168
	ld.w $t1, $fp, -172
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op21 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -180
# %op22 = mul i32 %op20, %op21
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -180
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# %op23 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -188
# %op24 = mul i32 %op22, %op23
	ld.w $t0, $fp, -184
	ld.w $t1, $fp, -188
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# store i32 %op24, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -192
	st.w $t1, $t0, 0
# %op25 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -196
# %op26 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -200
# %op27 = mul i32 %op25, %op26
	ld.w $t0, $fp, -196
	ld.w $t1, $fp, -200
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -204
# %op28 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -208
# %op29 = mul i32 %op27, %op28
	ld.w $t0, $fp, -204
	ld.w $t1, $fp, -208
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -212
# %op30 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -216
# %op31 = mul i32 %op29, %op30
	ld.w $t0, $fp, -212
	ld.w $t1, $fp, -216
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -220
# %op32 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -224
# %op33 = mul i32 %op31, %op32
	ld.w $t0, $fp, -220
	ld.w $t1, $fp, -224
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -228
# %op34 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -232
# %op35 = mul i32 %op33, %op34
	ld.w $t0, $fp, -228
	ld.w $t1, $fp, -232
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -236
# store i32 %op35, i32* %op3
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -236
	st.w $t1, $t0, 0
# %op36 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -240
# %op37 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -244
# %op38 = mul i32 %op36, %op37
	ld.w $t0, $fp, -240
	ld.w $t1, $fp, -244
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -248
# %op39 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -252
# %op40 = mul i32 %op38, %op39
	ld.w $t0, $fp, -248
	ld.w $t1, $fp, -252
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -256
# %op41 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -260
# %op42 = mul i32 %op40, %op41
	ld.w $t0, $fp, -256
	ld.w $t1, $fp, -260
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -264
# %op43 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -268
# %op44 = mul i32 %op42, %op43
	ld.w $t0, $fp, -264
	ld.w $t1, $fp, -268
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -272
# %op45 = load i32, i32* %op3
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -276
# %op46 = mul i32 %op44, %op45
	ld.w $t0, $fp, -272
	ld.w $t1, $fp, -276
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -280
# store i32 %op46, i32* %op4
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -280
	st.w $t1, $t0, 0
# %op47 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -284
# %op48 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -288
# %op49 = mul i32 %op47, %op48
	ld.w $t0, $fp, -284
	ld.w $t1, $fp, -288
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -292
# %op50 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -296
# %op51 = mul i32 %op49, %op50
	ld.w $t0, $fp, -292
	ld.w $t1, $fp, -296
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -300
# %op52 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -304
# %op53 = mul i32 %op51, %op52
	ld.w $t0, $fp, -300
	ld.w $t1, $fp, -304
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -308
# %op54 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -312
# %op55 = mul i32 %op53, %op54
	ld.w $t0, $fp, -308
	ld.w $t1, $fp, -312
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -316
# %op56 = load i32, i32* %op4
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -320
# %op57 = mul i32 %op55, %op56
	ld.w $t0, $fp, -316
	ld.w $t1, $fp, -320
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -324
# store i32 %op57, i32* %op5
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -324
	st.w $t1, $t0, 0
# %op58 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -328
# %op59 = add i32 %op58, 1
	ld.w $t0, $fp, -328
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -332
# store i32 %op59, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -332
	st.w $t1, $t0, 0
# br label %label62
	b .main_label62
.main_label60:
# %op61 = load i32, i32* %op5
	ld.d $t0, $fp, -104
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -336
# call void @output(i32 %op61)
	ld.w $a0, $fp, -336
	bl output
# ret void
	add.w $a0, $zero, $zero
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label62:
# %op63 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -340
# %op64 = load i32, i32* %op6
	ld.d $t0, $fp, -120
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -344
# %op65 = icmp slt i32 %op63, %op64
	ld.w $t0, $fp, -340
	ld.w $t1, $fp, -344
	slt $t2, $t0, $t1
	st.b $t2, $fp, -345
# %op66 = zext i1 %op65 to i32
	ld.b $t0, $fp, -345
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -352
# %op67 = icmp ne i32 %op66, 0
	ld.w $t0, $fp, -352
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -353
# br i1 %op67, label %label8, label %label60
	ld.b $t0, $fp, -353
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label8
	b .main_label60
	addi.d $sp, $sp, 368
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
