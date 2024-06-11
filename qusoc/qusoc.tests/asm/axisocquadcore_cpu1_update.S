# CPU1 ======================================================
cpu1:
	li x10, 0x80000008 # reg1
	li x11, 0x10000004 # auto decrement
cpu1main:
	li x31, 2500000

cpu1setCounter:
	sw x31, 0(x11)

cpu1check:
	lw x31, 0(x11) # load from decrement register
	bne x31, x0, cpu1check #keep checking until decrement to 0

	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)

	j cpu1main
