	li x1, 0x10000000 # auto increment on read

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
cpu0main:
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)
	j cpu0main

cpu1:
	li x10, 0x80000008 # reg1
	li x11, 0x10000004 # auto decrement
	li x12, 0x80000014 # switch0
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

cpu2:
	li x10, 0x8000000C # reg2
	li x11, 0x80000018 # switch1
cpu2main:
	lw x31, 0(x11)
	sw x31, 0(x10)
	j cpu2main

cpu3:
	li x10, 0x80000010 # reg3
	li x11, 0x80000028 # button3
cpu3main:
	lw x31, 0(x11)
	sw x31, 0(x10)
	j cpu3main
