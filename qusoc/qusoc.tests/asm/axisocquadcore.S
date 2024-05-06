	li x1, 0x80000000 # auto increment

	lw x31, 0(x1)
	li x20, 0
	beq x31, x20, cpu0
	li x20, 1
	beq x31, x20, cpu1
	li x20, 2
	beq x31, x20, cpu2
	li x20, 3
	beq x31, x20, cpu3

unknown:
	j unknown

cpu0:
	li x10, 0x80000004 # reg0
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)
	j cpu0

cpu1:
	li x10, 0x80000008 # reg1
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)
	j cpu1

cpu2:
	li x10, 0x8000000C # reg2
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)
	j cpu2

cpu3:
	li x10, 0x80000010 # reg3
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)
	j cpu3
