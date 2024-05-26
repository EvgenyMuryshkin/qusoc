# CPU2 ======================================================
cpu2:
	li x10, 0x8000000C # reg2
	li x11, 0x80000018 # switch1
cpu2main:
	lw x31, 0(x11)
	sw x31, 0(x10)
	j cpu2main
