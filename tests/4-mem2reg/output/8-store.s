	.text
	.globl store
	.type store, @function
store:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -48
	st.d $a0, $fp, -24
	st.w $a1, $fp, -28
	st.w $a2, $fp, -32
.store_label_entry:
# %op3 = icmp sge i32 %arg1, 0
	ld.w $t0, $fp, -28
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op3, label %label4, label %label6
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .store_label4
	b .store_label6
.store_label4:
# %op5 = getelementptr i32, i32* %arg0, i32 %arg1
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -28
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# br label %label7
	b .store_label7
.store_label6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label7
	b .store_label7
.store_label7:
# store i32 %arg2, i32* %op5
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# ret i32 %arg2
	ld.w $a0, $fp, -32
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 48
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -144
.main_label_entry:
# %op0 = alloca [10 x i32]
	addi.d $t0, $fp, -64
	st.d $t0, $fp, -24
# br label %label7
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -88
	b .main_label7
.main_label1:
# %op2 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 0
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
	st.d $t0, $fp, -72
# %op3 = mul i32 %op8, 2
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 2
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -76
# %op4 = call i32 @store(i32* %op2, i32 %op8, i32 %op3)
	ld.d $a0, $fp, -72
	ld.w $a1, $fp, -88
	ld.w $a2, $fp, -76
	bl store
	st.w $a0, $fp, -80
# %op5 = add i32 %op8, 1
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# br label %label7
	ld.w $t1, $fp, -84
	st.w $t1, $fp, -88
	b .main_label7
.main_label6:
# br label %label15
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -104
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -108
	b .main_label15
.main_label7:
# %op8 = phi i32 [ 0, %label_entry ], [ %op5, %label1 ]
# %op9 = icmp slt i32 %op8, 10
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -89
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -89
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -96
# %op11 = icmp ne i32 %op10, 0
	ld.w $t0, $fp, -96
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -97
# br i1 %op11, label %label1, label %label6
	ld.b $t0, $fp, -97
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label6
.main_label12:
# %op13 = icmp sge i32 %op16, 0
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -98
# br i1 %op13, label %label21, label %label24
	ld.b $t0, $fp, -98
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label21
	b .main_label24
.main_label14:
# call void @output(i32 %op17)
	ld.w $a0, $fp, -108
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label15:
# %op16 = phi i32 [ 0, %label6 ], [ %op27, %label25 ]
# %op17 = phi i32 [ 0, %label6 ], [ %op26, %label25 ]
# %op18 = icmp slt i32 %op16, 10
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 10
	slt $t2, $t0, $t1
	st.b $t2, $fp, -109
# %op19 = zext i1 %op18 to i32
	ld.b $t0, $fp, -109
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -116
# %op20 = icmp ne i32 %op19, 0
	ld.w $t0, $fp, -116
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -117
# br i1 %op20, label %label12, label %label14
	ld.b $t0, $fp, -117
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label12
	b .main_label14
.main_label21:
# %op22 = getelementptr [10 x i32], [10 x i32]* %op0, i32 0, i32 %op16
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -104
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
# %op23 = load i32, i32* %op22
	ld.d $t0, $fp, -128
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -132
# br label %label25
	b .main_label25
.main_label24:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label25
	b .main_label25
.main_label25:
# %op26 = add i32 %op17, %op23
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -132
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -136
# %op27 = add i32 %op16, 1
	ld.w $t0, $fp, -104
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -140
# br label %label15
	ld.w $t1, $fp, -140
	st.w $t1, $fp, -104
	ld.w $t1, $fp, -136
	st.w $t1, $fp, -108
	b .main_label15
	addi.d $sp, $sp, 144
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
