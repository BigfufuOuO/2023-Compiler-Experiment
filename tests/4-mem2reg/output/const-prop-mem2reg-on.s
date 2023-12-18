	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# br label %label29
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -128
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -132
	b .main_label29
.main_label1:
# %op2 = fmul float 0x3ff3c0c200000000, 0x4016f06a20000000
	lu12i.w $t8, 260576
	ori $t8, $t8, 1552
	movgr2fr.w $ft0, $t8
	lu12i.w $t8, 265080
	ori $t8, $t8, 849
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -24
# %op3 = fmul float %op2, 0x4002aa9940000000
	fld.s $ft0, $fp, -24
	lu12i.w $t8, 262485
	ori $t8, $t8, 1226
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -28
# %op4 = fmul float %op3, 0x4011781d80000000
	fld.s $ft0, $fp, -28
	lu12i.w $t8, 264380
	ori $t8, $t8, 236
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -32
# %op5 = fmul float %op4, 0x401962ac40000000
	fld.s $ft0, $fp, -32
	lu12i.w $t8, 265393
	ori $t8, $t8, 1378
	movgr2fr.w $ft1, $t8
	fmul.s $ft2, $ft0, $ft1
	fst.s $ft2, $fp, -36
# %op6 = fptosi float %op5 to i32
	fld.s $ft0, $fp, -36
	ftintrz.w.s $ft1, $ft0
	movfr2gr.s $t0, $ft1
	st.w $t0, $fp, -40
# %op7 = mul i32 %op6, %op6
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op8 = mul i32 %op7, %op6
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op9 = mul i32 %op8, %op6
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# %op10 = mul i32 %op9, %op6
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# %op11 = mul i32 %op10, %op6
	ld.w $t0, $fp, -56
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# %op12 = mul i32 %op11, %op11
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -64
# %op13 = mul i32 %op12, %op11
	ld.w $t0, $fp, -64
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# %op14 = mul i32 %op13, %op11
	ld.w $t0, $fp, -68
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# %op15 = mul i32 %op14, %op11
	ld.w $t0, $fp, -72
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op16 = mul i32 %op15, %op11
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -60
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -80
# %op17 = mul i32 %op16, %op16
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# %op18 = mul i32 %op17, %op16
	ld.w $t0, $fp, -84
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -88
# %op19 = mul i32 %op18, %op16
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# %op20 = mul i32 %op19, %op16
	ld.w $t0, $fp, -92
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op21 = mul i32 %op20, %op16
	ld.w $t0, $fp, -96
	ld.w $t1, $fp, -80
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op22 = mul i32 %op21, %op21
	ld.w $t0, $fp, -100
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -104
# %op23 = mul i32 %op22, %op21
	ld.w $t0, $fp, -104
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -108
# %op24 = mul i32 %op23, %op21
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -112
# %op25 = mul i32 %op24, %op21
	ld.w $t0, $fp, -112
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op26 = mul i32 %op25, %op21
	ld.w $t0, $fp, -116
	ld.w $t1, $fp, -100
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op27 = add i32 %op30, 1
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -124
# br label %label29
	ld.w $t1, $fp, -124
	st.w $t1, $fp, -128
	ld.w $t1, $fp, -120
	st.w $t1, $fp, -132
	b .main_label29
.main_label28:
# call void @output(i32 %op31)
	ld.w $a0, $fp, -132
	bl output
# ret void
	add.w $a0, $zero, $zero
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label29:
# %op30 = phi i32 [ 0, %label_entry ], [ %op27, %label1 ]
# %op31 = phi i32 [ 0, %label_entry ], [ %op26, %label1 ]
# %op32 = icmp slt i32 %op30, %op0
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# %op33 = zext i1 %op32 to i32
	ld.b $t0, $fp, -133
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -140
# %op34 = icmp ne i32 %op33, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -141
# br i1 %op34, label %label1, label %label28
	ld.b $t0, $fp, -141
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label28
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
