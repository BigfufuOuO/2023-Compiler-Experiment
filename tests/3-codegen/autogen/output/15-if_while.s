	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -128
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# %op2 = alloca i32
	addi.d $t0, $fp, -60
	st.d $t0, $fp, -56
# store i32 0, i32* %op1
	ld.d $t0, $fp, -40
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 0, i32* %op2
	ld.d $t0, $fp, -56
	addi.w $t1, $zero, 0
	st.w $t1, $t0, 0
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label14
	b .main_label14
.main_label3:
# %op4 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -64
# %op5 = sub i32 %op4, 1
	ld.w $t0, $fp, -64
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# store i32 %op5, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -68
	st.w $t1, $t0, 0
# %op6 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op7 = icmp slt i32 %op6, 5
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 5
	slt $t2, $t0, $t1
	st.b $t2, $fp, -73
# %op8 = zext i1 %op7 to i32
	ld.b $t0, $fp, -73
	bstrpick.w $t0, $t0, 0, 0
	st.w $t0, $fp, -80
# %op9 = icmp ne i32 %op8, 0
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -81
# br i1 %op9, label %label17, label %label21
	ld.b $t0, $fp, -81
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label17
	b .main_label21
.main_label10:
# %op11 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -88
# %op12 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -92
# %op13 = add i32 %op11, %op12
	ld.w $t0, $fp, -88
	ld.w $t1, $fp, -92
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -96
# ret i32 %op13
	ld.w $a0, $fp, -96
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label14:
# %op15 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -100
# %op16 = icmp ne i32 %op15, 0
	ld.w $t0, $fp, -100
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -101
# br i1 %op16, label %label3, label %label10
	ld.b $t0, $fp, -101
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label3
	b .main_label10
.main_label17:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -108
# %op19 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -112
# %op20 = add i32 %op18, %op19
	ld.w $t0, $fp, -108
	ld.w $t1, $fp, -112
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -116
# store i32 %op20, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -116
	st.w $t1, $t0, 0
# br label %label25
	b .main_label25
.main_label21:
# %op22 = load i32, i32* %op2
	ld.d $t0, $fp, -56
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -120
# %op23 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -124
# %op24 = add i32 %op22, %op23
	ld.w $t0, $fp, -120
	ld.w $t1, $fp, -124
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -128
# store i32 %op24, i32* %op2
	ld.d $t0, $fp, -56
	ld.w $t1, $fp, -128
	st.w $t1, $t0, 0
# br label %label25
	b .main_label25
.main_label25:
# br label %label14
	b .main_label14
	addi.d $sp, $sp, 128
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
