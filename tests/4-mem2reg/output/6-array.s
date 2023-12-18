	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -176
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -65
# br i1 %op1, label %label2, label %label4
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label2
	b .main_label4
.main_label2:
# %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
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
	st.d $t0, $fp, -80
# br label %label5
	b .main_label5
.main_label4:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label5
	b .main_label5
.main_label5:
# store i32 11, i32* %op3
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op6 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op6, label %label7, label %label9
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label7
	b .main_label9
.main_label7:
# %op8 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
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
	st.d $t0, $fp, -96
# br label %label10
	b .main_label10
.main_label9:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label10
	b .main_label10
.main_label10:
# store i32 22, i32* %op8
	ld.d $t0, $fp, -96
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op11 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -97
# br i1 %op11, label %label12, label %label14
	ld.b $t0, $fp, -97
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label12
	b .main_label14
.main_label12:
# %op13 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 9
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
	st.d $t0, $fp, -112
# br label %label15
	b .main_label15
.main_label14:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label15
	b .main_label15
.main_label15:
# store i32 33, i32* %op13
	ld.d $t0, $fp, -112
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op16 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -113
# br i1 %op16, label %label17, label %label20
	ld.b $t0, $fp, -113
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label17
	b .main_label20
.main_label17:
# %op18 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
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
	st.d $t0, $fp, -128
# %op19 = load i32, i32* %op18
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -132
# br label %label21
	b .main_label21
.main_label20:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label21
	b .main_label21
.main_label21:
# call void @output(i32 %op19)
	ld.w $a0, $fp, -132
	bl output
# %op22 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -133
# br i1 %op22, label %label23, label %label26
	ld.b $t0, $fp, -133
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label23
	b .main_label26
.main_label23:
# %op24 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 4
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
	st.d $t0, $fp, -144
# %op25 = load i32, i32* %op24
	ld.d $t0, $fp, -144
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -148
# br label %label27
	b .main_label27
.main_label26:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label27
	b .main_label27
.main_label27:
# call void @output(i32 %op25)
	ld.w $a0, $fp, -148
	bl output
# %op28 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -149
# br i1 %op28, label %label29, label %label32
	ld.b $t0, $fp, -149
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label29
	b .main_label32
.main_label29:
# %op30 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 9
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
	st.d $t0, $fp, -160
# %op31 = load i32, i32* %op30
	ld.d $t0, $fp, -160
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -164
# br label %label33
	b .main_label33
.main_label32:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label33
	b .main_label33
.main_label33:
# call void @output(i32 %op31)
	ld.w $a0, $fp, -164
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 176
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
