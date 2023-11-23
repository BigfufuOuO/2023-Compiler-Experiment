	.text
	.globl main
	.type main, @function
main:
	st.d $ra, $sp, -8
	st.d $fp, $sp, -16
	addi.d $fp, $sp, 0
	addi.d $sp, $sp, -96
.main_label_entry:
# %op0 = alloca i32
	addi.d $t0, $fp, -28
	st.d $t0, $fp, -24
# %op1 = alloca i32
	addi.d $t0, $fp, -44
	st.d $t0, $fp, -40
# store i32 10, i32* %op0
	ld.d $t0, $fp, -24
	addi.w $t1, $zero, 10
	st.w $t1, $t0, 0
# br label %label10
	b .main_label10
.main_label2:
# %op3 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -48
# %op4 = sub i32 %op3, 1
	ld.w $t0, $fp, -48
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -52
# store i32 %op4, i32* %op0
	ld.d $t0, $fp, -24
	ld.w $t1, $fp, -52
	st.w $t1, $t0, 0
# %op5 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -56
# store i32 %op5, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -56
	st.w $t1, $t0, 0
# br label %label17
	b .main_label17
.main_label6:
# %op7 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -60
# %op8 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -64
# %op9 = add i32 %op7, %op8
	ld.w $t0, $fp, -60
	ld.w $t1, $fp, -64
	add.w $t2, $t0, $t1
	st.w $t2, $fp, -68
# ret i32 %op9
	ld.w $a0, $fp, -68
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
.main_label10:
# %op11 = load i32, i32* %op0
	ld.d $t0, $fp, -24
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -72
# %op12 = icmp ne i32 %op11, 0
	ld.w $t0, $fp, -72
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -73
# br i1 %op12, label %label2, label %label6
	ld.b $t0, $fp, -73
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label2
	b .main_label6
.main_label13:
# %op14 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -80
# %op15 = sub i32 %op14, 1
	ld.w $t0, $fp, -80
	addi.w $t1, $zero, 1
	sub.w $t2, $t0, $t1
	st.w $t2, $fp, -84
# store i32 %op15, i32* %op1
	ld.d $t0, $fp, -40
	ld.w $t1, $fp, -84
	st.w $t1, $t0, 0
# br label %label17
	b .main_label17
.main_label16:
# br label %label10
	b .main_label10
.main_label17:
# %op18 = load i32, i32* %op1
	ld.d $t0, $fp, -40
	ld.d $t0, $t0, 0
	st.w $t0, $fp, -88
# %op19 = icmp ne i32 %op18, 0
	ld.w $t0, $fp, -88
	addi.w $t1, $zero, 0
	slt $t2, $t0, $t1
	slt $t3, $t1, $t0
	xor $t2, $t3, $t2
	st.b $t2, $fp, -89
# br i1 %op19, label %label13, label %label16
	ld.b $t0, $fp, -89
	bstrpick.w $t1, $t0, 0, 0
	bnez $t1, .main_label13
	b .main_label16
	addi.d $sp, $sp, 96
	ld.d $ra, $sp, -8
	ld.d $fp, $sp, -16
	jr $ra
