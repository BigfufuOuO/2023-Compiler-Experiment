# Global variables
	.text
	.section .bss, "aw", @nobits
	.globl matrix
	.type matrix, @object
	.size matrix, 80000000
matrix:
	.space 80000000
	.globl ad
	.type ad, @object
	.size ad, 400000
ad:
	.space 400000
	.globl len
	.type len, @object
	.size len, 4
len:
	.space 4
	.text
	.globl readarray
	.type readarray, @function
readarray:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -64
.readarray_label_entry:
# br label %label3
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -24
	b .readarray_label3
.readarray_label0:
# %op1 = icmp sge i32 %op4, 0
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -17
# br i1 %op1, label %label9, label %label11
	ld.b $t0, $fp, -17
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .readarray_label9
	b .readarray_label11
.readarray_label2:
# ret void
	add.w $a0, $zero, $zero
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.readarray_label3:
# %op4 = phi i32 [ 0, %label_entry ], [ %op14, %label12 ]
# %op5 = load i32, i32* @len
	la.local $t0, len
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -28
# %op6 = icmp slt i32 %op4, %op5
	ld.w $t0, $fp, -24
	ld.w $t1, $fp, -28
	slt $t2, $t0, $t1
	st.b $t2, $fp, -29
# %op7 = zext i1 %op6 to i32
	ld.b $t0, $fp, -29
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -36
# %op8 = icmp ne i32 %op7, 0
	ld.w $t0, $fp, -36
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -37
# br i1 %op8, label %label0, label %label2
	ld.b $t0, $fp, -37
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .readarray_label0
	b .readarray_label2
.readarray_label9:
# %op10 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op4
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -24
	lu12i.w $t3, 97
	ori $t3, $t3, 2688
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -48
# br label %label12
	b .readarray_label12
.readarray_label11:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label12
	b .readarray_label12
.readarray_label12:
# %op13 = call i32 @input()
	bl input
	st.w $a0, $fp, -52
# store i32 %op13, i32* %op10
	ld.d $t0, $fp, -48
	ld.w $t1, $fp, -52
	st.w $t1, $t0, 0
# %op14 = add i32 %op4, 1
	ld.w $t0, $fp, -24
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -56
# br label %label3
	ld.w $t1, $fp, -56
	st.w $t1, $fp, -24
	b .readarray_label3
	addi.d $sp, $sp, 64
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl transpose
	.type transpose, @function
transpose:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -208
	st.w $a0, $fp, -20
	st.d $a1, $fp, -32
	st.w $a2, $fp, -36
.transpose_label_entry:
# %op3 = sdiv i32 %arg0, %arg2
	ld.w $t0, $fp, -20
	ld.w $t1, $fp, -36
	div.w $t2, $t0, $t1
	st.w $t2, $fp, -40
# br label %label7
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -48
	b .transpose_label7
.transpose_label4:
# br label %label18
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -76
	b .transpose_label18
.transpose_label5:
# %op6 = sub i32 0, 1
	addi.w $t0, $zero, 0
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -44
# ret i32 %op6
	ld.w $a0, $fp, -44
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.transpose_label7:
# %op8 = phi i32 [ 0, %label_entry ], [ %op17, %label16 ]
# %op9 = icmp slt i32 %op8, %op3
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -40
	slt $t2, $t0, $t1
	st.b $t2, $fp, -49
# %op10 = zext i1 %op9 to i32
	ld.b $t0, $fp, -49
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -56
# %op11 = icmp ne i32 %op10, 0
	ld.w $t0, $fp, -56
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -57
# br i1 %op11, label %label4, label %label5
	ld.b $t0, $fp, -57
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label4
	b .transpose_label5
.transpose_label12:
# %op13 = icmp slt i32 %op8, %op19
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -76
	slt $t2, $t0, $t1
	st.b $t2, $fp, -58
# %op14 = zext i1 %op13 to i32
	ld.b $t0, $fp, -58
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -64
# %op15 = icmp ne i32 %op14, 0
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -65
# br i1 %op15, label %label23, label %label25
	ld.b $t0, $fp, -65
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label23
	b .transpose_label25
.transpose_label16:
# %op17 = add i32 %op8, 1
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -72
# br label %label7
	ld.w $t1, $fp, -72
	st.w $t1, $fp, -48
	b .transpose_label7
.transpose_label18:
# %op19 = phi i32 [ 0, %label4 ], [ %op30, %label29 ]
# %op20 = icmp slt i32 %op19, %arg2
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -36
	slt $t2, $t0, $t1
	st.b $t2, $fp, -77
# %op21 = zext i1 %op20 to i32
	ld.b $t0, $fp, -77
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -84
# %op22 = icmp ne i32 %op21, 0
	ld.w $t0, $fp, -84
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -85
# br i1 %op22, label %label12, label %label16
	ld.b $t0, $fp, -85
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label12
	b .transpose_label16
.transpose_label23:
# %op24 = add i32 %op19, 1
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -92
# br label %label29
	ld.w $t1, $fp, -92
	st.w $t1, $fp, -108
	b .transpose_label29
.transpose_label25:
# %op26 = mul i32 %op8, %arg2
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# %op27 = add i32 %op26, %op19
	ld.w $t0, $fp, -96
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -100
# %op28 = icmp sge i32 %op27, 0
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -101
# br i1 %op28, label %label31, label %label34
	ld.b $t0, $fp, -101
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label31
	b .transpose_label34
.transpose_label29:
# %op30 = phi i32 [ %op24, %label23 ], [ %op58, %label57 ]
# br label %label18
	ld.w $t1, $fp, -108
	st.w $t1, $fp, -76
	b .transpose_label18
.transpose_label31:
# %op32 = getelementptr i32, i32* %arg1, i32 %op27
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -100
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -120
# %op33 = load i32, i32* %op32
	ld.d $t0, $fp, -120
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -124
# br label %label35
	b .transpose_label35
.transpose_label34:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label35
	b .transpose_label35
.transpose_label35:
# %op36 = mul i32 %op19, %op3
	ld.w $t0, $fp, -76
	ld.w $t1, $fp, -40
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# %op37 = add i32 %op36, %op8
	ld.w $t0, $fp, -128
	ld.w $t1, $fp, -48
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -132
# %op38 = icmp sge i32 %op37, 0
	ld.w $t0, $fp, -132
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -133
# br i1 %op38, label %label39, label %label41
	ld.b $t0, $fp, -133
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label39
	b .transpose_label41
.transpose_label39:
# %op40 = getelementptr i32, i32* %arg1, i32 %op37
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -132
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -144
# br label %label42
	b .transpose_label42
.transpose_label41:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label42
	b .transpose_label42
.transpose_label42:
# %op43 = mul i32 %op8, %arg2
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -148
# %op44 = add i32 %op43, %op19
	ld.w $t0, $fp, -148
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -152
# %op45 = icmp sge i32 %op44, 0
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -153
# br i1 %op45, label %label46, label %label49
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label46
	b .transpose_label49
.transpose_label46:
# %op47 = getelementptr i32, i32* %arg1, i32 %op44
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -152
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -168
# %op48 = load i32, i32* %op47
	ld.d $t0, $fp, -168
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# br label %label50
	b .transpose_label50
.transpose_label49:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label50
	b .transpose_label50
.transpose_label50:
# store i32 %op48, i32* %op40
	ld.d $t0, $fp, -144
	ld.w $t1, $fp, -172
	st.w $t1, $t0, 0
# %op51 = mul i32 %op8, %arg2
	ld.w $t0, $fp, -48
	ld.w $t1, $fp, -36
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op52 = add i32 %op51, %op19
	ld.w $t0, $fp, -176
	ld.w $t1, $fp, -76
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op53 = icmp sge i32 %op52, 0
	ld.w $t0, $fp, -180
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -181
# br i1 %op53, label %label54, label %label56
	ld.b $t0, $fp, -181
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .transpose_label54
	b .transpose_label56
.transpose_label54:
# %op55 = getelementptr i32, i32* %arg1, i32 %op52
	ld.d $t0, $fp, -32
	ld.w $t1, $fp, -180
	lu12i.w $t3, 0
	ori $t3, $t3, 4
	mul.w $t1, $t1, $t3
	bstrpick.d $t1, $t1, 31, 0
	add.d $t0, $t0, $t1
	st.d $t0, $fp, -192
# br label %label57
	b .transpose_label57
.transpose_label56:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label57
	b .transpose_label57
.transpose_label57:
# store i32 %op33, i32* %op55
	ld.d $t0, $fp, -192
	ld.w $t1, $fp, -124
	st.w $t1, $t0, 0
# %op58 = add i32 %op19, 1
	ld.w $t0, $fp, -76
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -196
# br label %label29
	ld.w $t1, $fp, -196
	st.w $t1, $fp, -108
	b .transpose_label29
	addi.d $sp, $sp, 208
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -192
.main_label_entry:
# %op0 = call i32 @input()
	bl input
	st.w $a0, $fp, -20
# %op1 = call i32 @input()
	bl input
	st.w $a0, $fp, -24
# store i32 %op1, i32* @len
	la.local $t0, len
	ld.w $t1, $fp, -24
	st.w $t1, $t0, 0
# call void @readarray()
	bl readarray
# br label %label5
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -32
	b .main_label5
.main_label2:
# %op3 = icmp sge i32 %op6, 0
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -25
# br i1 %op3, label %label10, label %label12
	ld.b $t0, $fp, -25
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label10
	b .main_label12
.main_label4:
# br label %label19
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -80
	b .main_label19
.main_label5:
# %op6 = phi i32 [ 0, %label_entry ], [ %op14, %label13 ]
# %op7 = icmp slt i32 %op6, %op0
	ld.w $t0, $fp, -32
	ld.w $t1, $fp, -20
	slt $t2, $t0, $t1
	st.b $t2, $fp, -33
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -33
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -40
# %op9 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -40
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -41
# br i1 %op9, label %label2, label %label4
	ld.b $t0, $fp, -41
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label2
	b .main_label4
.main_label10:
# %op11 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op6
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -32
	lu12i.w $t3, 19531
	ori $t3, $t3, 1024
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -56
# br label %label13
	b .main_label13
.main_label12:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label13
	b .main_label13
.main_label13:
# store i32 %op6, i32* %op11
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -32
	st.w $t1, $t0, 0
# %op14 = add i32 %op6, 1
	ld.w $t0, $fp, -32
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -60
# br label %label5
	ld.w $t1, $fp, -60
	st.w $t1, $fp, -32
	b .main_label5
.main_label15:
# %op16 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 0
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	addi.w $t2, $zero, 0
	lu12i.w $t3, 19531
	ori $t3, $t3, 1024
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -72
# %op17 = icmp sge i32 %op20, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -73
# br i1 %op17, label %label25, label %label28
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label25
	b .main_label28
.main_label18:
# br label %label39
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -136
	addi.w $t1, $zero, 0
	st.w $t1, $fp, -140
	b .main_label39
.main_label19:
# %op20 = phi i32 [ 0, %label4 ], [ %op31, %label29 ]
# %op21 = load i32, i32* @len
	la.local $t0, len
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -84
# %op22 = icmp slt i32 %op20, %op21
	ld.w $t0, $fp, -80
	ld.w $t1, $fp, -84
	slt $t2, $t0, $t1
	st.b $t2, $fp, -85
# %op23 = zext i1 %op22 to i32
	ld.b $t0, $fp, -85
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -92
# %op24 = icmp ne i32 %op23, 0
	ld.w $t0, $fp, -92
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -93
# br i1 %op24, label %label15, label %label18
	ld.b $t0, $fp, -93
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label15
	b .main_label18
.main_label25:
# %op26 = getelementptr [100000 x i32], [100000 x i32]* @ad, i32 0, i32 %op20
	la.local $t0, ad
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -80
	lu12i.w $t3, 97
	ori $t3, $t3, 2688
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -104
# %op27 = load i32, i32* %op26
	ld.d $t0, $fp, -104
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -108
# br label %label29
	b .main_label29
.main_label28:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label29
	b .main_label29
.main_label29:
# %op30 = call i32 @transpose(i32 %op0, i32* %op16, i32 %op27)
	ld.w $a0, $fp, -20
	ld.d $a1, $fp, -72
	ld.w $a2, $fp, -108
	bl transpose
	st.w $a0, $fp, -112
# %op31 = add i32 %op20, 1
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# br label %label19
	ld.w $t1, $fp, -116
	st.w $t1, $fp, -80
	b .main_label19
.main_label32:
# %op33 = mul i32 %op40, %op40
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -136
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -120
# %op34 = icmp sge i32 %op40, 0
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 0
	addi.w $t0, $t0, 1
	slt $t2, $t1, $t0
	st.b $t2, $fp, -121
# br i1 %op34, label %label46, label %label49
	ld.b $t0, $fp, -121
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label46
	b .main_label49
.main_label35:
# %op36 = icmp slt i32 %op41, 0
	ld.w $t0, $fp, -140
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	st.b $t2, $fp, -122
# %op37 = zext i1 %op36 to i32
	ld.b $t0, $fp, -122
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -128
# %op38 = icmp ne i32 %op37, 0
	ld.w $t0, $fp, -128
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -129
# br i1 %op38, label %label54, label %label56
	ld.b $t0, $fp, -129
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label54
	b .main_label56
.main_label39:
# %op40 = phi i32 [ 0, %label18 ], [ %op53, %label50 ]
# %op41 = phi i32 [ 0, %label18 ], [ %op52, %label50 ]
# %op42 = load i32, i32* @len
	la.local $t0, len
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -144
# %op43 = icmp slt i32 %op40, %op42
	ld.w $t0, $fp, -136
	ld.w $t1, $fp, -144
	slt $t2, $t0, $t1
	st.b $t2, $fp, -145
# %op44 = zext i1 %op43 to i32
	ld.b $t0, $fp, -145
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -152
# %op45 = icmp ne i32 %op44, 0
	ld.w $t0, $fp, -152
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -153
# br i1 %op45, label %label32, label %label35
	ld.b $t0, $fp, -153
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label32
	b .main_label35
.main_label46:
# %op47 = getelementptr [20000000 x i32], [20000000 x i32]* @matrix, i32 0, i32 %op40
	la.local $t0, matrix
	addi.w $t1, $zero, 0
	ld.w $t2, $fp, -136
	lu12i.w $t3, 19531
	ori $t3, $t3, 1024
	lu12i.w $t4, 0
	ori $t4, $t4, 4
	mul.w $t1, $t1, $t3
	mul.w $t2, $t2, $t4
	bstrpick.d $t1, $t1, 31, 0
	bstrpick.d $t2, $t2, 31, 0
	add.d $t0, $t0, $t1
	add.d $t0, $t0, $t2
	st.d $t0, $fp, -168
# %op48 = load i32, i32* %op47
	ld.d $t0, $fp, -168
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -172
# br label %label50
	b .main_label50
.main_label49:
# call void @neg_idx_except()
	bl neg_idx_except
# br label %label50
	b .main_label50
.main_label50:
# %op51 = mul i32 %op33, %op48
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -172
	mul.w $t2, $t0, $t1
	st.w $t2, $fp, -176
# %op52 = add i32 %op41, %op51
	ld.w $t0, $fp, -140
	ld.w $t1, $fp, -176
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -180
# %op53 = add i32 %op40, 1
	ld.w $t0, $fp, -136
	addi.w $t1, $zero, 1
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -184
# br label %label39
	ld.w $t1, $fp, -184
	st.w $t1, $fp, -136
	ld.w $t1, $fp, -180
	st.w $t1, $fp, -140
	b .main_label39
.main_label54:
# %op55 = sub i32 0, %op41
	addi.w $t0, $zero, 0
	ld.w $t1, $fp, -140
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -188
# br label %label57
	ld.w $t1, $fp, -188
	st.w $t1, $fp, -192
	b .main_label57
.main_label56:
# br label %label57
	ld.w $t1, $fp, -140
	st.w $t1, $fp, -192
	b .main_label57
.main_label57:
# %op58 = phi i32 [ %op55, %label54 ], [ %op41, %label56 ]
# call void @output(i32 %op58)
	ld.w $a0, $fp, -192
	bl output
# ret i32 0
	addi.w $a0, $zero, 0
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
	addi.d $sp, $sp, 192
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
