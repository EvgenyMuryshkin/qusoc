[00000000]: LUI x1, 2147483648 (0x0x80000000) // 0x800000B7
[00000004]: ADDI x3, x0, 0 (0x0x0)           // 0x00000193
[00000008]: ADDI x4, x0, 0 (0x0x0)           // 0x00000213
[0000000C]: ADDI x20, x0, 10 (0x0xA)         // 0x00A00A13
[00000010]: ADDI x21, x0, 20 (0x0x14)        // 0x01400A93
[00000014]: LW x31, 31(x1)                   // 0x0000AF83
[00000018]: ADDI x31, x31, 1 (0x0x1)         // 0x001F8F93
[0000001C]: SW x31, 0(x1)                    // 0x01F0A023
[00000020]: ADDI x4, x4, 1 (0x0x1)           // 0x00120213
[00000024]: BEQ x4, x21, 20 (0x0x38)         // 0x01520A63
[00000028]: ADDI x5, x0, 0 (0x0x0)           // 0x00000293
[0000002C]: ADDI x5, x5, 1 (0x0x1)           // 0x00128293
[00000030]: BEQ x5, x20, 4294967268 (0x0x14) // 0xFF4282E3
[00000034]: J 0x0000002C                     // 0xFF9FF06F
[00000038]: J 0x00000038                     // 0x0000006F
