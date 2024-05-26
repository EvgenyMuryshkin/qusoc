# CPU3 ======================================================
cpu3:
	li x10, 0x80000010 # reg3
	li x11, 0x80000028 # button3
cpu3main:
	lw x31, 0(x11)
	sw x31, 0(x10)
	j cpu3main
