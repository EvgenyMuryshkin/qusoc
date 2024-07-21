files = start.S CPU0.cpp HardwareUART.cpp main.cpp
elf: $(files)
	#riscv32-unknown-elf-gcc -march=rv32i -nostartfiles -Wl,-Bstatic,-T,sections.lds,--strip-debug,-Map=firmware.map,--cref  -ffreestanding -nostdlib -o firmware.elf $(files)
	/home/ev/xpt/xpacks/.bin/riscv-none-elf-gcc -march=rv32i -nostartfiles -Wl,-Bstatic,-T,sections.lds,--strip-debug,-Map=firmware.map,--cref  -ffreestanding -nostdlib -o firmware.elf $(files)

bin: elf
	#riscv32-unknown-elf-objcopy -O binary firmware.elf /dev/stdout > firmware.bin
	/home/ev/xpt/xpacks/.bin/riscv-none-elf-objcopy -O binary firmware.elf /dev/stdout > firmware.bin




