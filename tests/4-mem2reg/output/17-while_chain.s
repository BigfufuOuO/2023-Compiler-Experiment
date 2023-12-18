	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
.main_label_entry:
# br label %label4
	addi.w $t1, $zero, 10
	st.w $t1, $fp, -28
	b .main_label4
.main_label0:
# %op1 = sub i32 %op5, 1
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# br label %label11
	ld.w $t1, $fp, -20
	st.w $t1, $fp, -44
	b .main_label11
.main_label2:
# %op3 = add i32 %op5, %op6
	ld.w $t0, $fp, -28
	ld.w $t1, $fp, -32
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -24
# ret i32 %op3
	ld.w $a0, $fp, -24
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label4:
# %op5 = phi i32 [ 10, %label_entry ], [ %op1, %label10 ]
# %op6 = phi i32 [ %op12, %label10 ], [ undef, %label_entry ]
# %op7 = icmp ne i32 %op5, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -33
# br i1 %op7, label %label0, label %label2
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label0
	b .main_label2
.main_label8:
# %op9 = sub i32 %op12, 1
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label11
	ld.w $t1, $fp, -40
	st.w $t1, $fp, -44
	b .main_label11
.main_label10:
# br label %label4
	ld.w $t1, $fp, -20
	st.w $t1, $fp, -28
	ld.w $t1, $fp, -44
	st.w $t1, $fp, -32
	b .main_label4
.main_label11:
# %op12 = phi i32 [ %op1, %label0 ], [ %op9, %label8 ]
# %op13 = icmp ne i32 %op12, 0
	ld.w $t0, $fp, -44
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -45
# br i1 %op13, label %label8, label %label10
	ld.b $t0, $fp, -45
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label8
	b .main_label10
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
