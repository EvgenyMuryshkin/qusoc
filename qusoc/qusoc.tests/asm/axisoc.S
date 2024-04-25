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
