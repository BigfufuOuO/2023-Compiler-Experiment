	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# br label %label7
	addi.w $t1, $zero, 10
	st.w $t1, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -44
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -48
	b .main_label7
.main_label0:
# %op1 = sub i32 %op8, 1
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# %op2 = icmp slt i32 %op1, 5
	ld.w $t0, $fp, -20
	addi.w $t1, $zero, 5
	slt $t2, $t0, $t1
	st.b $t2, $fp, -21
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -21
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -28
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -29
# br i1 %op4, label %label12, label %label14
	ld.b $t0, $fp, -29
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label12
	b .main_label14
.main_label5:
# %op6 = add i32 %op9, %op10
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -48
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -36
# ret i32 %op6
	ld.w $a0, $fp, -36
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label7:
# %op8 = phi i32 [ 10, %label_entry ], [ %op1, %label16 ]
# %op9 = phi i32 [ 0, %label_entry ], [ %op17, %label16 ]
# %op10 = phi i32 [ 0, %label_entry ], [ %op18, %label16 ]
# %op11 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -49
# br i1 %op11, label %label0, label %label5
	ld.b $t0, $fp, -49
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label0
	b .main_label5
.main_label12:
# %op13 = add i32 %op9, %op1
	ld.w $t0, $fp, -44
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# br label %label16
	ld.w $t1, $fp, -56
	st.w $t1, $fp, -64
	ld.w $t1, $fp, -48
	st.w $t1, $fp, -68
	b .main_label16
.main_label14:
# %op15 = add i32 %op10, %op1
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -20
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# br label %label16
	ld.w $t1, $fp, -44
	st.w $t1, $fp, -64
	ld.w $t1, $fp, -60
	st.w $t1, $fp, -68
	b .main_label16
.main_label16:
# %op17 = phi i32 [ %op13, %label12 ], [ %op9, %label14 ]
# %op18 = phi i32 [ %op10, %label12 ], [ %op15, %label14 ]
# br label %label7
	ld.w $t1, $fp, -20
	st.w $t1, $fp, -40
	ld.w $t1, $fp, -64
	st.w $t1, $fp, -44
	ld.w $t1, $fp, -68
	st.w $t1, $fp, -48
	b .main_label7
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
