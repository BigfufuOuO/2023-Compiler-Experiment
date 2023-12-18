# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl x
	.type x, @object
	.size x, 4
x:
	.space 4
	.globl y
	.type y, @object
	.size y, 4
y:
	.space 4
	.text
	.globl gcd
	.type gcd, @function
gcd:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
	st.w $a0, $fp, -20
	st.w $a1, $fp, -24
.gcd_label_entry:
# %op2 = icmp eq i32 %arg1, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	nor $t2, $t3, $t2
	st.b $t2, $fp, -25
# %op3 = zext i1 %op2 to i32
	ld.b $t0, $fp, -25
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -32
# %op4 = icmp ne i32 %op3, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -33
# br i1 %op4, label %label5, label %label6
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .gcd_label5
	b .gcd_label6
.gcd_label5:
# ret i32 %arg0
	ld.w $a0, $fp, -20
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.gcd_label6:
# %op7 = sdiv i32 %arg0, %arg1
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -24
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# %op8 = mul i32 %op7, %arg1
	ld.w $t0, $fp, -40
	ld.w $t1, $fp, -24
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# %op9 = sub i32 %arg0, %op8
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -44
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -48
# %op10 = call i32 @gcd(i32 %arg1, i32 %op9)
	ld.w $a0, $fp, -24
	ld.w $a1, $fp, -48
	bl gcd
	st.w $a0, $fp, -52
# ret i32 %op10
	ld.w $a0, $fp, -52
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.gcd_label11:
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl funArray
	.type funArray, @function
funArray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
	st.d $a0, $fp, -24
	st.d $a1, $fp, -32
.funArray_label_entry:
# %op2 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op2, label %label3, label %label6
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .funArray_label3
	b .funArray_label6
.funArray_label3:
# %op4 = getelementptr i32, i32* %arg0, i32 0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -48
# %op5 = load i32, i32* %op4
	ld.d $t0, $fp, -48
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -52
# br label %label7
	b .funArray_label7
.funArray_label6:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label7
	b .funArray_label7
.funArray_label7:
# %op8 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -53
# br i1 %op8, label %label9, label %label12
	ld.b $t0, $fp, -53
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .funArray_label9
	b .funArray_label12
.funArray_label9:
# %op10 = getelementptr i32, i32* %arg1, i32 0
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -64
# %op11 = load i32, i32* %op10
	ld.d $t0, $fp, -64
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -68
# br label %label13
	b .funArray_label13
.funArray_label12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label13
	b .funArray_label13
.funArray_label13:
# %op14 = icmp slt i32 %op5, %op11
	ld.w $t0, $fp, -52
	ld.w $t1, $fp, -68
	slt $t2, $t0, $t1
	st.b $t2, $fp, -69
# %op15 = zext i1 %op14 to i32
	ld.b $t0, $fp, -69
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -76
# %op16 = icmp ne i32 %op15, 0
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -77
# br i1 %op16, label %label17, label %label18
	ld.b $t0, $fp, -77
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .funArray_label17
	b .funArray_label18
.funArray_label17:
# br label %label19
	ld.w $t1, $fp, -52
	st.w $t1, $fp, -84
	ld.w $t1, $fp, -68
	st.w $t1, $fp, -88
	b .funArray_label19
.funArray_label18:
# br label %label19
	ld.w $t1, $fp, -68
	st.w $t1, $fp, -84
	ld.w $t1, $fp, -52
	st.w $t1, $fp, -88
	b .funArray_label19
.funArray_label19:
# %op20 = phi i32 [ %op5, %label17 ], [ %op11, %label18 ]
# %op21 = phi i32 [ %op11, %label17 ], [ %op5, %label18 ]
# %op22 = call i32 @gcd(i32 %op21, i32 %op20)
	ld.w $a0, $fp, -88
	ld.w $a1, $fp, -84
	bl gcd
	st.w $a0, $fp, -92
# ret i32 %op22
	ld.w $a0, $fp, -92
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -80
.main_label_entry:
# %op0 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -17
# br i1 %op0, label %label1, label %label3
	ld.b $t0, $fp, -17
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label1
	b .main_label3
.main_label1:
# %op2 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -32
# br label %label4
	b .main_label4
.main_label3:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label4
	b .main_label4
.main_label4:
# store i32 90, i32* %op2
	ld.d $t0, $fp, -32
	addi.w $t1, $zero, 90
	st.w $t1, $t0, 0
# %op5 = icmp sge i32 0, 0
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -33
# br i1 %op5, label %label6, label %label8
	ld.b $t0, $fp, -33
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label6
	b .main_label8
.main_label6:
# %op7 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -48
# br label %label9
	b .main_label9
.main_label8:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label9
	b .main_label9
.main_label9:
# store i32 18, i32* %op7
	ld.d $t0, $fp, -48
	addi.w $t1, $zero, 18
	st.w $t1, $t0, 0
# %op10 = getelementptr [1 x i32], [1 x i32]* @x, i32 0, i32 0
	la.local $t0, x
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -56
# %op11 = getelementptr [1 x i32], [1 x i32]* @y, i32 0, i32 0
	la.local $t0, y
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -64
# %op12 = call i32 @funArray(i32* %op10, i32* %op11)
	ld.d $a0, $fp, -56
	ld.d $a1, $fp, -64
	bl funArray
	st.w $a0, $fp, -68
# ret i32 %op12
	ld.w $a0, $fp, -68
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 80
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
