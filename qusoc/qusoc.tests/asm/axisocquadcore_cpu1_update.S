# CPU1 ======================================================
cpu1:
	li x10, 0x80000008 # reg1
	li x11, 0x10000004 # auto decrement
	li x12, 0x90000100 # pwm

	li x30, 50000 # pwm counter
	li x29, 100000 # max pwm

cpu1main:
	li x31, 4000000

cpu1setCounter:
	sw x31, 0(x11)

cpu1check:

	lw x31, 0(x11) # load from decrement register
	bne x31, x0, cpu1check #keep checking until decrement to 0

	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)

	bne x30, x29, pwm_inc
	li x30, 50000

pwm_inc:
	#li x30, 75000 # pwm counter
	addi x30, x30, 2000
	sw x30, 0(x12)

	j cpu1main
