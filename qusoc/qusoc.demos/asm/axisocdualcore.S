	li x1, 0x80000000 # auto increment
	li x10, 0x80000004 # reg0
	li x11, 0x80000008 # reg1

	lw x31, 0(x1)
	li x20, 0
	beq x31, x20, cpu0
	li x20, 1
	beq x31, x20, cpu1

unknown:
	j unknown

cpu0:
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)
	j cpu0

cpu1:
	lw x31, 0(x11)
	addi x31, x31, 1
	sw x31, 0(x11)
	j cpu1


