li x1, 0x80000000 # reg blink storage

blinkIterationLoop:
lw x31, 0(x1)
addi x31, x31, 1
sw x31, 0(x1)
j blinkIterationLoop

