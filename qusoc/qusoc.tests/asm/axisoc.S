li x1, 0x800
li x2, 0x01020304;
sb x2, 0x0(x1)
sb x2, 0x1(x1)
sb x2, 0x2(x1)
sb x2, 0x3(x1)
li x1, 0x804
sw x2, 0(x1)
lb x10, 0x0(x1)
lb x11, 0x1(x1)
lb x12, 0x2(x1)
lb x13, 0x3(x1)
li x1, 0x808

#addi x13, x0, 4
#addi x12, x0, 3
#addi x11, x0, 2
#addi x10, x0, 1

sb x13, 0x0(x1)
sb x12, 0x1(x1)
sb x11, 0x2(x1)
sb x10, 0x3(x1)

x:
	j x

li x1, 0x80000000 # reg blink storage
li x20, 3 # number of iterations
li x21, 5 # number of blinks per iteration

li x3, 0 # loop iterator
loopIteration:

li x4, 0 # blink counter
blinkIterationLoop:

lw x31, 0(x1)
addi x31, x31, 1
sw x31, 0(x1)
addi x4, x4, 1
bne x4, x20, blinkIterationLoop

addi x3, x3, 1
bne x3, x21, loopIteration;

# infinite loop is the end of simulation
end:
	j end
