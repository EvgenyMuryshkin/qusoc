[00000000]: LUI x2, 4096 (0x0x1000)          // 0x00001137
[00000004]: JAL x1, 0x000001BC (0x0x1B8)     // 0x1B8000EF
[00000008]: J 0x00000008                     // 0x0000006F
[0000000C]: ADDI x2, x2, -48 (0x0xFFFFFFD0)  // 0xFD010113
[00000010]: SW x8, 44(x2)                    // 0x02812623
[00000014]: ADDI x8, x2, 48 (0x0x30)         // 0x03010413
[00000018]: SW x10, -36(x8)                  // 0xFCA42E23
[0000001C]: LW x15, -49(x8)                  // 0xFDC42783
[00000020]: SRLI_SRAI x15, x15, 1 (0x0x1)    // 0x0017D793
[00000024]: ADDI x15, x15, 3 (0x0x3)         // 0x00378793
[00000028]: SW x15, -24(x8)                  // 0xFEF42423
[0000002C]: SW x0, -20(x8)                   // 0xFE042623
[00000030]: LW x14, -18(x8)                  // 0xFEC42703
[00000034]: LW x15, -49(x8)                  // 0xFDC42783
[00000038]: BGEU x14, x15, 120 (0x0xB0)      // 0x06F77C63
[0000003C]: LW x14, -18(x8)                  // 0xFEC42703
[00000040]: LW x15, -17(x8)                  // 0xFE842783
[00000044]: SUB x15, x14, 15                 // 0x40F707B3
[00000048]: SW x15, -28(x8)                  // 0xFEF42223
[0000004C]: LW x15, -17(x8)                  // 0xFE442783
[00000050]: SLLI x14, x15, 24 (0x0x18)       // 0x01879713
[00000054]: SRLI_SRAI x14, x14, 1048 (0x0x418) // 0x41875713
[00000058]: ADDI x13, x0, 668 (0x0x29C)      // 0x29C00693
[0000005C]: LW x15, -17(x8)                  // 0xFEC42783
[00000060]: ADD x15, x13, 15                 // 0x00F687B3
[00000064]: SB x14, 0(x15)                   // 0x00E78023
[00000068]: LW x15, -17(x8)                  // 0xFE442783
[0000006C]: SLLI x14, x15, 16 (0x0x10)       // 0x01079713
[00000070]: SRLI_SRAI x14, x14, 1040 (0x0x410) // 0x41075713
[00000074]: LW x13, -19(x8)                  // 0xFEC42683
[00000078]: SLLI x13, x13, 1 (0x0x1)         // 0x00169693
[0000007C]: ADDI x15, x0, 684 (0x0x2AC)      // 0x2AC00793
[00000080]: ADD x15, x13, 15                 // 0x00F687B3
[00000084]: SH x14, 0(x15)                   // 0x00E79023
[00000088]: LW x14, -18(x8)                  // 0xFEC42703
[0000008C]: SLLI x14, x14, 2 (0x0x2)         // 0x00271713
[00000090]: ADDI x15, x0, 716 (0x0x2CC)      // 0x2CC00793
[00000094]: ADD x15, x14, 15                 // 0x00F707B3
[00000098]: LW x14, -18(x8)                  // 0xFE442703
[0000009C]: SW x14, 0(x15)                   // 0x00E7A023
[000000A0]: LW x15, -17(x8)                  // 0xFEC42783
[000000A4]: ADDI x15, x15, 1 (0x0x1)         // 0x00178793
[000000A8]: SW x15, -20(x8)                  // 0xFEF42623
[000000AC]: J 0x00000030                     // 0xF85FF06F
[000000B0]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[000000B4]: LW x8, 40(x2)                    // 0x02C12403
[000000B8]: ADDI x2, x2, 48 (0x0x30)         // 0x03010113
[000000BC]: JALR x0, x1, 0 (0x0x0)           // 0x00008067
[000000C0]: ADDI x2, x2, -48 (0x0xFFFFFFD0)  // 0xFD010113
[000000C4]: SW x8, 44(x2)                    // 0x02812623
[000000C8]: ADDI x8, x2, 48 (0x0x30)         // 0x03010413
[000000CC]: SW x10, -36(x8)                  // 0xFCA42E23
[000000D0]: ADDI x15, x0, 42 (0x0x2A)        // 0x02A00793
[000000D4]: SW x15, -20(x8)                  // 0xFEF42623
[000000D8]: SW x0, -24(x8)                   // 0xFE042423
[000000DC]: LW x14, -18(x8)                  // 0xFE842703
[000000E0]: LW x15, -49(x8)                  // 0xFDC42783
[000000E4]: BGEU x14, x15, 120 (0x0x15C)     // 0x06F77C63
[000000E8]: ADDI x14, x0, 668 (0x0x29C)      // 0x29C00713
[000000EC]: LW x15, -17(x8)                  // 0xFE842783
[000000F0]: ADD x15, x14, 15                 // 0x00F707B3
[000000F4]: LB x15, 15(x15)                  // 0x00078783
[000000F8]: ADDI x14, x15, 0 (0x0x0)         // 0x00078713
[000000FC]: LW x15, -17(x8)                  // 0xFEC42783
[00000100]: ADD x15, x15, 14                 // 0x00E787B3
[00000104]: SW x15, -20(x8)                  // 0xFEF42623
[00000108]: LW x14, -18(x8)                  // 0xFE842703
[0000010C]: SLLI x14, x14, 1 (0x0x1)         // 0x00171713
[00000110]: ADDI x15, x0, 684 (0x0x2AC)      // 0x2AC00793
[00000114]: ADD x15, x14, 15                 // 0x00F707B3
[00000118]: LH x15, 15(x15)                  // 0x00079783
[0000011C]: ADDI x14, x15, 0 (0x0x0)         // 0x00078713
[00000120]: LW x15, -17(x8)                  // 0xFEC42783
[00000124]: ADD x15, x15, 14                 // 0x00E787B3
[00000128]: SW x15, -20(x8)                  // 0xFEF42623
[0000012C]: LW x14, -18(x8)                  // 0xFE842703
[00000130]: SLLI x14, x14, 2 (0x0x2)         // 0x00271713
[00000134]: ADDI x15, x0, 716 (0x0x2CC)      // 0x2CC00793
[00000138]: ADD x15, x14, 15                 // 0x00F707B3
[0000013C]: LW x15, 15(x15)                  // 0x0007A783
[00000140]: LW x14, -18(x8)                  // 0xFEC42703
[00000144]: ADD x15, x14, 15                 // 0x00F707B3
[00000148]: SW x15, -20(x8)                  // 0xFEF42623
[0000014C]: LW x15, -17(x8)                  // 0xFE842783
[00000150]: ADDI x15, x15, 1 (0x0x1)         // 0x00178793
[00000154]: SW x15, -24(x8)                  // 0xFEF42423
[00000158]: J 0x000000DC                     // 0xF85FF06F
[0000015C]: LW x15, -17(x8)                  // 0xFEC42783
[00000160]: ADDI x10, x15, 0 (0x0x0)         // 0x00078513
[00000164]: LW x8, 40(x2)                    // 0x02C12403
[00000168]: ADDI x2, x2, 48 (0x0x30)         // 0x03010113
[0000016C]: JALR x0, x1, 0 (0x0x0)           // 0x00008067
[00000170]: ADDI x2, x2, -32 (0x0xFFFFFFE0)  // 0xFE010113
[00000174]: SW x1, 28(x2)                    // 0x00112E23
[00000178]: SW x8, 24(x2)                    // 0x00812C23
[0000017C]: ADDI x8, x2, 32 (0x0x20)         // 0x02010413
[00000180]: ADDI x15, x0, 6 (0x0x6)          // 0x00600793
[00000184]: SW x15, -20(x8)                  // 0xFEF42623
[00000188]: LW x10, -22(x8)                  // 0xFEC42503
[0000018C]: JAL x1, 0x0000000C (0x0xFFFFFE80) // 0xE81FF0EF
[00000190]: LW x10, -22(x8)                  // 0xFEC42503
[00000194]: JAL x1, 0x000000C0 (0x0xFFFFFF2C) // 0xF2DFF0EF
[00000198]: SW x10, -24(x8)                  // 0xFEA42423
[0000019C]: LUI x15, 2147483648 (0x0x80000000) // 0x800007B7
[000001A0]: LW x14, -18(x8)                  // 0xFE842703
[000001A4]: SW x14, 0(x15)                   // 0x00E7A023
[000001A8]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[000001AC]: LW x1, 1(x2)                     // 0x01C12083
[000001B0]: LW x8, 8(x2)                     // 0x01812403
[000001B4]: ADDI x2, x2, 32 (0x0x20)         // 0x02010113
[000001B8]: JALR x0, x1, 0 (0x0x0)           // 0x00008067
[000001BC]: ADDI x2, x2, -16 (0x0xFFFFFFF0)  // 0xFF010113
[000001C0]: SW x1, 12(x2)                    // 0x00112623
[000001C4]: SW x8, 8(x2)                     // 0x00812423
[000001C8]: ADDI x8, x2, 16 (0x0x10)         // 0x01010413
[000001CC]: JAL x1, 0x00000170 (0x0xFFFFFFA4) // 0xFA5FF0EF
[000001D0]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[000001D4]: LW x1, 1(x2)                     // 0x00C12083
[000001D8]: LW x8, 8(x2)                     // 0x00812403
[000001DC]: ADDI x2, x2, 16 (0x0x10)         // 0x01010113
[000001E0]: JALR x0, x1, 0 (0x0x0)           // 0x00008067
[000001E4]: 16                               // 0x00000010
[000001E8]: 0                                // 0x00000000
[000001EC]: 1                                // 0x00527A01
[000001F0]: 1                                // 0x01017C01
[000001F4]: 27                               // 0x00020D1B
[000001F8]: 32                               // 0x00000020
[000001FC]: 24                               // 0x00000018
[00000200]: 12                               // 0xFFFFFE0C
[00000204]: 52                               // 0x000000B4
[00000208]: 0                                // 0x300E4400
[0000020C]: 68                               // 0x44018844
[00000210]: 12                               // 0x0200080C
[00000214]: 32                               // 0x0D44C8A0
[00000218]: 2                                // 0x00000002
[0000021C]: 32                               // 0x00000020
[00000220]: 60                               // 0x0000003C
[00000224]: 28                               // 0xFFFFFE9C
[00000228]: 48                               // 0x000000B0
[0000022C]: 0                                // 0x300E4400
[00000230]: 68                               // 0x44018844
[00000234]: 12                               // 0x0200080C
[00000238]: 28                               // 0x0D44C89C
[0000023C]: 2                                // 0x00000002
[00000240]: 32                               // 0x00000020
[00000244]: 96                               // 0x00000060
[00000248]: 40                               // 0xFFFFFF28
[0000024C]: 76                               // 0x0000004C
[00000250]: 0                                // 0x200E4400
[00000254]: 72                               // 0x88018148
[00000258]: 2                                // 0x080C4402
[0000025C]: 0                                // 0x44C17000
[00000260]: 72                               // 0x020D44C8
[00000264]: 16                               // 0x00000010
[00000268]: 0                                // 0x00000000
[0000026C]: 1                                // 0x00527A01
[00000270]: 1                                // 0x01017C01
[00000274]: 27                               // 0x00020D1B
[00000278]: 32                               // 0x00000020
[0000027C]: 24                               // 0x00000018
[00000280]: 60                               // 0xFFFFFF3C
[00000284]: 40                               // 0x00000028
[00000288]: 0                                // 0x100E4400
[0000028C]: 72                               // 0x88018148
[00000290]: 2                                // 0x080C4402
[00000294]: 0                                // 0x44C14C00
[00000298]: 72                               // 0x020D44C8
