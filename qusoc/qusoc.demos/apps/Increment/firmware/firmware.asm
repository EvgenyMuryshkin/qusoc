[00000000]: LUI x2, 4096 (0x0x1000)          // 0x00001137
[00000004]: JAL x1, 0x00000038 (0x0x34)      // 0x034000EF
[00000008]: J 0x00000008                     // 0x0000006F
[0000000C]: ADDI x2, x2, -32 (0x0xFFFFFFE0)  // 0xFE010113
[00000010]: SW x8, 28(x2)                    // 0x00812E23
[00000014]: ADDI x8, x2, 32 (0x0x20)         // 0x02010413
[00000018]: SW x0, -20(x8)                   // 0xFE042623
[0000001C]: LW x15, -17(x8)                  // 0xFEC42783
[00000020]: ADDI x15, x15, 1 (0x0x1)         // 0x00178793
[00000024]: SW x15, -20(x8)                  // 0xFEF42623
[00000028]: LUI x15, 2147483648 (0x0x80000000) // 0x800007B7
[0000002C]: LW x14, -18(x8)                  // 0xFEC42703
[00000030]: SW x14, 0(x15)                   // 0x00E7A023
[00000034]: J 0x0000001C                     // 0xFE9FF06F
[00000038]: ADDI x2, x2, -16 (0x0xFFFFFFF0)  // 0xFF010113
[0000003C]: SW x1, 12(x2)                    // 0x00112623
[00000040]: SW x8, 8(x2)                     // 0x00812423
[00000044]: ADDI x8, x2, 16 (0x0x10)         // 0x01010413
[00000048]: JAL x1, 0x0000000C (0x0xFFFFFFC4) // 0xFC5FF0EF
[0000004C]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[00000050]: LW x1, 1(x2)                     // 0x00C12083
[00000054]: LW x8, 8(x2)                     // 0x00812403
[00000058]: ADDI x2, x2, 16 (0x0x10)         // 0x01010113
[0000005C]: JALR x0, x1, 0 (0x0x0)           // 0x00008067
[00000060]: 16                               // 0x00000010
[00000064]: 0                                // 0x00000000
[00000068]: 1                                // 0x00527A01
[0000006C]: 1                                // 0x01017C01
[00000070]: 27                               // 0x00020D1B
[00000074]: 24                               // 0x00000018
[00000078]: 24                               // 0x00000018
[0000007C]: 16                               // 0xFFFFFF90
[00000080]: 44                               // 0x0000002C
[00000084]: 0                                // 0x200E4400
[00000088]: 68                               // 0x44018844
[0000008C]: 12                               // 0x0000080C
[00000090]: 16                               // 0x00000010
[00000094]: 0                                // 0x00000000
[00000098]: 1                                // 0x00527A01
[0000009C]: 1                                // 0x01017C01
[000000A0]: 27                               // 0x00020D1B
[000000A4]: 32                               // 0x00000020
[000000A8]: 24                               // 0x00000018
[000000AC]: 12                               // 0xFFFFFF8C
[000000B0]: 40                               // 0x00000028
[000000B4]: 0                                // 0x100E4400
[000000B8]: 72                               // 0x88018148
[000000BC]: 2                                // 0x080C4402
[000000C0]: 0                                // 0x44C14C00
[000000C4]: 72                               // 0x020D44C8
