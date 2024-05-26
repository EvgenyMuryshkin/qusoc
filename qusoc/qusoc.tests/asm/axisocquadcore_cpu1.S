# CPU1 ======================================================
cpu1:
	li x10, 0x80000008 # reg1
	li x11, 0x10000004 # auto decrement
	li x12, 0x80000014 # switch0
	li x13, 0x90000000 #uart
cpu1main:
	li x31, 50000000 # load 50M into decrement register
	lw x30, 0(x12) # scheck switch 1
	beq x30, x0, cpu1setCounter
	li x31, 5000000 # load 10M into decrement register is switch 1 is set

cpu1setCounter:
	sw x31, 0(x11)

cpu1check:
	lw x31, 0(x11) # load from decrement register
	bne x31, x0, cpu1check #keep checking until decrement to 0

	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)

	j cpu1main
