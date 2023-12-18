	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# %op0 = icmp ne i32 1, 0
	addi.w $t0, $zero, 1
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label3
	ld.b $t0, $fp, -17
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label3
.main_label1:
# %op2 = icmp ne i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -18
# br i1 %op2, label %label6, label %label7
	ld.b $t0, $fp, -18
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label6
	b .main_label7
.main_label3:
# br label %label4
	addi.w $t1, $zero, 2
	st.w $t1, $fp, -24
	b .main_label4
.main_label4:
# %op5 = phi i32 [ %op9, %label8 ], [ 2, %label3 ]
# ret i32 %op5
	ld.w $a0, $fp, -24
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label6:
# br label %label8
	addi.w $t1, $zero, 4
	st.w $t1, $fp, -28
	b .main_label8
.main_label7:
# br label %label8
	addi.w $t1, $zero, 3
	st.w $t1, $fp, -28
	b .main_label8
.main_label8:
# %op9 = phi i32 [ 4, %label6 ], [ 3, %label7 ]
# br label %label4
	ld.w $t1, $fp, -28
	st.w $t1, $fp, -24
	b .main_label4
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
