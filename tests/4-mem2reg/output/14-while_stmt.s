	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -32
.main_label_entry:
# br label %label3
	addi.w $t1, $zero, 10
	st.w $t1, $fp, -24
	b .main_label3
.main_label0:
# %op1 = sub i32 %op4, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -20
# br label %label3
	ld.w $t1, $fp, -20
	st.w $t1, $fp, -24
	b .main_label3
.main_label2:
# ret void
	add.w $a0, $zero, $zero
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label3:
# %op4 = phi i32 [ 10, %label_entry ], [ %op1, %label0 ]
# %op5 = icmp ne i32 %op4, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -25
# br i1 %op5, label %label0, label %label2
	ld.b $t0, $fp, -25
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label0
	b .main_label2
	addi.d $sp, $sp, 32
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
