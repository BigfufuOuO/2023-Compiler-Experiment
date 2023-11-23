	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -112
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# %op1 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
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
# %op3 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
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
# store i32 1234, i32* %op3
	ld.d $t0, $fp, -80
	addi.w $t1, $zero, 1234
	st.w $t1, $t0, 0
# %op6 = icmp sge i32 3, 0
	addi.w $t0, $zero, 3
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -81
# br i1 %op6, label %label7, label %label10
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label7
	b .main_label10
.main_label7:
# %op8 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 3
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 3
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
# %op9 = load i32, i32* %op8
	ld.d $t0, $fp, -96
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -100
# br label %label11
	b .main_label11
.main_label10:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label11
	b .main_label11
.main_label11:
# ret i32 %op9
	ld.w $a0, $fp, -100
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 112
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
