# CPU0 ======================================================
cpu0:
cpu0main:
	li x10, 0x80000004 # reg0
	lw x31, 0(x10)
	addi x31, x31, 1
	sw x31, 0(x10)

uartEcho:
	li x10, 0x80000008 # reg1
	li x11, 0x10000004 # auto decrement
	li x12, 0x80000014 # switch0
	li x13, 0x90000000 #uart
	
uartEchoCheck:	
	lb x31, 0x1(x13)
	beq x31, x0, cpu0main
	lb x31, 0(x13)
	sw x31, 0(x13) # send counter to uart

	j cpu0main
