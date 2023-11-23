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
# %op1 = alloca i32
	addi.d $t0, $fp, -76
	st.d $t0, $fp, -72
# store i32 0, i32* %op1
	ld.d $t0, $fp, -72
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# %op2 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -77
# br i1 %op2, label %label3, label %label5
	ld.b $t0, $fp, -77
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label3
	b .main_label5
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
	st.d $t0, $fp, -88
# br label %label6
	b .main_label6
.main_label5:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label6
	b .main_label6
.main_label6:
# store i32 11, i32* %op4
	ld.d $t0, $fp, -88
	addi.w $t1, $zero, 11
	st.w $t1, $t0, 0
# %op7 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -89
# br i1 %op7, label %label8, label %label10
	ld.b $t0, $fp, -89
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label8
	b .main_label10
.main_label8:
# %op9 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
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
	st.d $t0, $fp, -104
# br label %label11
	b .main_label11
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label11
	b .main_label11
.main_label11:
# store i32 22, i32* %op9
	ld.d $t0, $fp, -104
	addi.w $t1, $zero, 22
	st.w $t1, $t0, 0
# %op12 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -105
# br i1 %op12, label %label13, label %label15
	ld.b $t0, $fp, -105
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label13
	b .main_label15
.main_label13:
# %op14 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
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
	st.d $t0, $fp, -120
# br label %label16
	b .main_label16
.main_label15:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label16
	b .main_label16
.main_label16:
# store i32 33, i32* %op14
	ld.d $t0, $fp, -120
	addi.w $t1, $zero, 33
	st.w $t1, $t0, 0
# %op17 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -121
# br i1 %op17, label %label18, label %label21
	ld.b $t0, $fp, -121
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label18
	b .main_label21
.main_label18:
# %op19 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
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
	st.d $t0, $fp, -136
# %op20 = load i32, i32* %op19
	ld.d $t0, $fp, -136
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -140
# br label %label22
	b .main_label22
.main_label21:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label22
	b .main_label22
.main_label22:
# call void @output(i32 %op20)
	ld.w $a0, $fp, -140
	bl output
# %op23 = icmp sge i32 4, 0
	addi.w $t0, $zero, 4
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -141
# br i1 %op23, label %label24, label %label27
	ld.b $t0, $fp, -141
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label24
	b .main_label27
.main_label24:
# %op25 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 4
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
	st.d $t0, $fp, -152
# %op26 = load i32, i32* %op25
	ld.d $t0, $fp, -152
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -156
# br label %label28
	b .main_label28
.main_label27:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label28
	b .main_label28
.main_label28:
# call void @output(i32 %op26)
	ld.w $a0, $fp, -156
	bl output
# %op29 = icmp sge i32 9, 0
	addi.w $t0, $zero, 9
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -157
# br i1 %op29, label %label30, label %label33
	ld.b $t0, $fp, -157
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label30
	b .main_label33
.main_label30:
# %op31 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 9
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
	st.d $t0, $fp, -168
# %op32 = load i32, i32* %op31
	ld.d $t0, $fp, -168
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# br label %label34
	b .main_label34
.main_label33:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label34
	b .main_label34
.main_label34:
# call void @output(i32 %op32)
	ld.w $a0, $fp, -172
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
