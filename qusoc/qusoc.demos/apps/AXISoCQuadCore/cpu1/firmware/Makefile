files = start.S CPU1.cpp main.cpp
libFiles = ../../lib/src/utils/*.cpp

INC=-Igcc/libgcc/config/riscv -Igcc/include -I../../lib/include

elf: $(files)
	#riscv32-unknown-elf-gcc -march=rv32i -nostartfiles -Wl,-Bstatic,-T,sections.lds,--strip-debug,-Map=firmware.map,--cref  -ffreestanding --static -o firmware.elf $(INC) $(files)
	/home/ev/xpt/xpacks/.bin/riscv-none-elf-gcc  -march=rv32i -nostartfiles -Wl,-Bstatic,-T,sections.lds,--strip-debug,-Map=firmware.map,--cref -fno-rtti --static -o firmware.elf $(INC) $(files) $(libFiles) -lm

bin: elf
	#riscv32-unknown-elf-objcopy -O binary firmware.elf /dev/stdout > firmware.bin
	/home/ev/xpt/xpacks/.bin/riscv-none-elf-objcopy -O binary firmware.elf /dev/stdout > firmware.bin




