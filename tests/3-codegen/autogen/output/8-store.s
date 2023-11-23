	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = alloca i32*
	addi.d $t0, $fp, -48
	st.d $t0, $fp, -40
# store i32* %arg0, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t1, $fp, -24
	st.d $t1, $t0, 0
# %op4 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store i32 %arg1, i32* %op4
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -28
	st.w $t1, $t0, 0
# %op5 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op4
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -80
# %op7 = icmp sge i32 %op6, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op7, label %label8, label %label11
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .store_label8
	b .store_label11
.store_label8:
# %op9 = load i32*, i32** %op3
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.d $t0, $fp, -96
# %op10 = getelementptr i32, i32* %op9, i32 %op6
	ld.d $t0, $fp, -96
	ld.w $t1, $fp, -80
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -104
# br label %label12
	b .store_label12
.store_label11:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label12
	b .store_label12
.store_label12:
# %op13 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -108
# store i32 %op13, i32* %op10
	ld.d $t0, $fp, -104
	ld.w $t1, $fp, -108
	st.w $t1, $t0, 0
# %op14 = load i32, i32* %op5
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -112
# ret i32 %op14
	ld.w $a0, $fp, -112
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
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
	addi.d $sp, $sp, -208
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# %op2 = alloca i32
	addi.d $t0, $fp, -92
	st.d $t0, $fp, -88
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label12
	b .main_label12
.main_label3:
# %op4 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 40
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -104
# %op5 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -108
# %op6 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -112
# %op7 = mul i32 %op6, 2
	ld.w $t0, $fp, -112
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# %op8 = call i32 @store(i32* %op4, i32 %op5, i32 %op7)
	ld.d $a0, $fp, -104
	ld.w $a1, $fp, -108
	ld.w $a2, $fp, -116
	bl store
	st.w $a0, $fp, -120
# %op9 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -124
# %op10 = add i32 %op9, 1
	ld.w $t0, $fp, -124
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# store i32 %op10, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -128
	st.w $t1, $t0, 0
# br label %label12
	b .main_label12
.main_label11:
# store i32 0, i32* %op2
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# br label %label23
	b .main_label23
.main_label12:
# %op13 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -132
# %op14 = icmp slt i32 %op13, 10
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -133
# %op15 = zext i1 %op14 to i32
	ld.b $t0, $fp, -133
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -140
# %op16 = icmp ne i32 %op15, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -141
# br i1 %op16, label %label3, label %label11
	ld.b $t0, $fp, -141
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label3
	b .main_label11
.main_label17:
# %op18 = load i32, i32* %op2
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -148
# %op19 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -152
# %op20 = icmp sge i32 %op19, 0
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -153
# br i1 %op20, label %label28, label %label31
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label28
	b .main_label31
.main_label21:
# %op22 = load i32, i32* %op2
	ld.d $t0, $fp, -88
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -160
# call void @output(i32 %op22)
	ld.w $a0, $fp, -160
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label23:
# %op24 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -164
# %op25 = icmp slt i32 %op24, 10
	ld.w $t0, $fp, -164
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -165
# %op26 = zext i1 %op25 to i32
	ld.b $t0, $fp, -165
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -172
# %op27 = icmp ne i32 %op26, 0
	ld.w $t0, $fp, -172
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -173
# br i1 %op27, label %label17, label %label21
	ld.b $t0, $fp, -173
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label17
	b .main_label21
.main_label28:
# %op29 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op19
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -152
	lu12i.w $t3, 0
	ori $t3, $t3, 40
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -184
# %op30 = load i32, i32* %op29
	ld.d $t0, $fp, -184
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -188
# br label %label32
	b .main_label32
.main_label31:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label32
	b .main_label32
.main_label32:
# %op33 = add i32 %op18, %op30
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -188
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -192
# store i32 %op33, i32* %op2
	ld.d $t0, $fp, -88
	ld.w $t1, $fp, -192
	st.w $t1, $t0, 0
# %op34 = load i32, i32* %op1
	ld.d $t0, $fp, -72
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -196
# %op35 = add i32 %op34, 1
	ld.w $t0, $fp, -196
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -200
# store i32 %op35, i32* %op1
	ld.d $t0, $fp, -72
	ld.w $t1, $fp, -200
	st.w $t1, $t0, 0
# br label %label23
	b .main_label23
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
