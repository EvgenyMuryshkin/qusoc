[00000000]: CSRRSI x0, mstatus, 0x00000008   // 0x30046073
[00000004]: AUIPC x31, 4096 (0x0x1000)       // 0x00001F97
[00000008]: ADDI x31, x31, -2048 (0x0xFFFFF800) // 0x800F8F93
[0000000C]: SW x0, 0(x31)                    // 0x000FA023
[00000010]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[00000014]: SW x0, 4(x31)                    // 0x000FA223
[00000018]: ECALL                            // 0x00000073
[0000001C]: ADDI x5, x0, 1536 (0x0x600)      // 0x60000293
[00000020]: ADDI x31, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00F93
[00000024]: ADDI x16, x0, 0 (0x0x0)          // 0x00000813
[00000028]: ADD x0, x31, 16                  // 0x010F8033
[0000002C]: SW x0, 0(x5)                     // 0x0002A023
[00000030]: AUIPC x6, 0 (0x0x0)              // 0x00000317
[00000034]: ADDI x6, x6, 2004 (0x0x7D4)      // 0x7D430313
[00000038]: SW x0, 0(x6)                     // 0x00032023
[0000003C]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[00000040]: SW x0, 4(x6)                     // 0x00032223
[00000044]: ECALL                            // 0x00000073
[00000048]: ADDI x30, x0, 1 (0x0x1)          // 0x00100F13
[0000004C]: ADDI x15, x0, -2047 (0x0xFFFFF801) // 0x80100793
[00000050]: ADD x1, x30, 15                  // 0x00FF00B3
[00000054]: SW x1, 4(x5)                     // 0x0012A223
[00000058]: AUIPC x6, 0 (0x0x0)              // 0x00000317
[0000005C]: ADDI x6, x6, 1964 (0x0x7AC)      // 0x7AC30313
[00000060]: SW x1, 0(x6)                     // 0x00132023
[00000064]: ADDI x1, x0, -2046 (0x0xFFFFF802) // 0x80200093
[00000068]: SW x1, 4(x6)                     // 0x00132223
[0000006C]: ECALL                            // 0x00000073
[00000070]: ADDI x29, x0, 0 (0x0x0)          // 0x00000E93
[00000074]: ADDI x14, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00713
[00000078]: ADD x2, x29, 14                  // 0x00EE8133
[0000007C]: SW x2, 8(x5)                     // 0x0022A423
[00000080]: AUIPC x6, 0 (0x0x0)              // 0x00000317
[00000084]: ADDI x6, x6, 1924 (0x0x784)      // 0x78430313
[00000088]: SW x2, 0(x6)                     // 0x00232023
[0000008C]: ADDI x2, x0, -1 (0x0xFFFFFFFF)   // 0xFFF00113
[00000090]: SW x2, 4(x6)                     // 0x00232223
[00000094]: ECALL                            // 0x00000073
[00000098]: ADDI x28, x0, 2047 (0x0x7FF)     // 0x7FF00E13
[0000009C]: LUI x13, 4294963200 (0x0xFFFFF000) // 0xFFFFF6B7
[000000A0]: ADDI x13, x13, -564 (0x0xFFFFFDCC) // 0xDCC68693
[000000A4]: ADD x3, x28, 13                  // 0x00DE01B3
[000000A8]: SW x3, 12(x5)                    // 0x0032A623
[000000AC]: AUIPC x6, 0 (0x0x0)              // 0x00000317
[000000B0]: ADDI x6, x6, 1880 (0x0x758)      // 0x75830313
[000000B4]: SW x3, 0(x6)                     // 0x00332023
[000000B8]: LUI x3, 4294963200 (0x0xFFFFF000) // 0xFFFFF1B7
[000000BC]: ADDI x3, x3, 1483 (0x0x5CB)      // 0x5CB18193
[000000C0]: SW x3, 4(x6)                     // 0x00332223
[000000C4]: ECALL                            // 0x00000073
[000000C8]: ADDI x27, x0, 0 (0x0x0)          // 0x00000D93
[000000CC]: LUI x12, 2147483648 (0x0x80000000) // 0x80000637
[000000D0]: ADD x4, x27, 12                  // 0x00CD8233
[000000D4]: SW x4, 16(x5)                    // 0x0042A823
[000000D8]: AUIPC x6, 0 (0x0x0)              // 0x00000317
[000000DC]: ADDI x6, x6, 1836 (0x0x72C)      // 0x72C30313
[000000E0]: SW x4, 0(x6)                     // 0x00432023
[000000E4]: LUI x4, 2147483648 (0x0x80000000) // 0x80000237
[000000E8]: SW x4, 4(x6)                     // 0x00432223
[000000EC]: ECALL                            // 0x00000073
[000000F0]: ADDI x1, x0, 1556 (0x0x614)      // 0x61400093
[000000F4]: LUI x26, 4096 (0x0x1000)         // 0x00001D37
[000000F8]: ADDI x26, x26, -2048 (0x0xFFFFF800) // 0x800D0D13
[000000FC]: LUI x11, 4096 (0x0x1000)         // 0x000015B7
[00000100]: ADDI x11, x11, 564 (0x0x234)     // 0x23458593
[00000104]: ADD x5, x26, 11                  // 0x00BD02B3
[00000108]: SW x5, 0(x1)                     // 0x0050A023
[0000010C]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[00000110]: ADDI x2, x2, 1784 (0x0x6F8)      // 0x6F810113
[00000114]: SW x5, 0(x2)                     // 0x00512023
[00000118]: LUI x5, 8192 (0x0x2000)          // 0x000022B7
[0000011C]: ADDI x5, x5, -1484 (0x0xFFFFFA34) // 0xA3428293
[00000120]: SW x5, 4(x2)                     // 0x00512223
[00000124]: ECALL                            // 0x00000073
[00000128]: LUI x25, 124076032 (0x0x7654000) // 0x07654CB7
[0000012C]: ADDI x25, x25, 801 (0x0x321)     // 0x321C8C93
[00000130]: ADDI x10, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00513
[00000134]: ADD x6, x25, 10                  // 0x00AC8333
[00000138]: SW x6, 4(x1)                     // 0x0060A223
[0000013C]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[00000140]: ADDI x2, x2, 1736 (0x0x6C8)      // 0x6C810113
[00000144]: SW x6, 0(x2)                     // 0x00612023
[00000148]: LUI x6, 124076032 (0x0x7654000)  // 0x07654337
[0000014C]: ADDI x6, x6, 800 (0x0x320)       // 0x32030313
[00000150]: SW x6, 4(x2)                     // 0x00612223
[00000154]: ECALL                            // 0x00000073
[00000158]: LUI x24, 2147483648 (0x0x80000000) // 0x80000C37
[0000015C]: ADDI x24, x24, -1 (0x0xFFFFFFFF) // 0xFFFC0C13
[00000160]: ADDI x9, x0, 1 (0x0x1)           // 0x00100493
[00000164]: ADD x7, x24, 9                   // 0x009C03B3
[00000168]: SW x7, 8(x1)                     // 0x0070A423
[0000016C]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[00000170]: ADDI x2, x2, 1688 (0x0x698)      // 0x69810113
[00000174]: SW x7, 0(x2)                     // 0x00712023
[00000178]: LUI x7, 2147483648 (0x0x80000000) // 0x800003B7
[0000017C]: SW x7, 4(x2)                     // 0x00712223
[00000180]: ECALL                            // 0x00000073
[00000184]: ADDI x23, x0, 1 (0x0x1)          // 0x00100B93
[00000188]: LUI x8, 2147483648 (0x0x80000000) // 0x80000437
[0000018C]: ADDI x8, x8, -1 (0x0xFFFFFFFF)   // 0xFFF40413
[00000190]: ADD x8, x23, 8                   // 0x008B8433
[00000194]: SW x8, 12(x1)                    // 0x0080A623
[00000198]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[0000019C]: ADDI x2, x2, 1644 (0x0x66C)      // 0x66C10113
[000001A0]: SW x8, 0(x2)                     // 0x00812023
[000001A4]: LUI x8, 2147483648 (0x0x80000000) // 0x80000437
[000001A8]: SW x8, 4(x2)                     // 0x00812223
[000001AC]: ECALL                            // 0x00000073
[000001B0]: ADDI x22, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00B13
[000001B4]: LUI x7, 124076032 (0x0x7654000)  // 0x076543B7
[000001B8]: ADDI x7, x7, 801 (0x0x321)       // 0x32138393
[000001BC]: ADD x9, x22, 7                   // 0x007B04B3
[000001C0]: SW x9, 16(x1)                    // 0x0090A823
[000001C4]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[000001C8]: ADDI x2, x2, 1600 (0x0x640)      // 0x64010113
[000001CC]: SW x9, 0(x2)                     // 0x00912023
[000001D0]: LUI x9, 124076032 (0x0x7654000)  // 0x076544B7
[000001D4]: ADDI x9, x9, 800 (0x0x320)       // 0x32048493
[000001D8]: SW x9, 4(x2)                     // 0x00912223
[000001DC]: ECALL                            // 0x00000073
[000001E0]: ADDI x1, x0, 1576 (0x0x628)      // 0x62800093
[000001E4]: LUI x21, 4096 (0x0x1000)         // 0x00001AB7
[000001E8]: ADDI x21, x21, 564 (0x0x234)     // 0x234A8A93
[000001EC]: LUI x6, 4096 (0x0x1000)          // 0x00001337
[000001F0]: ADDI x6, x6, -2048 (0x0xFFFFF800) // 0x80030313
[000001F4]: ADD x10, x21, 6                  // 0x006A8533
[000001F8]: SW x10, 0(x1)                    // 0x00A0A023
[000001FC]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[00000200]: ADDI x7, x7, 1544 (0x0x608)      // 0x60838393
[00000204]: SW x10, 0(x7)                    // 0x00A3A023
[00000208]: LUI x10, 8192 (0x0x2000)         // 0x00002537
[0000020C]: ADDI x10, x10, -1484 (0x0xFFFFFA34) // 0xA3450513
[00000210]: SW x10, 4(x7)                    // 0x00A3A223
[00000214]: ECALL                            // 0x00000073
[00000218]: LUI x20, 2147483648 (0x0x80000000) // 0x80000A37
[0000021C]: ADDI x5, x0, 0 (0x0x0)           // 0x00000293
[00000220]: ADD x11, x20, 5                  // 0x005A05B3
[00000224]: SW x11, 4(x1)                    // 0x00B0A223
[00000228]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[0000022C]: ADDI x7, x7, 1500 (0x0x5DC)      // 0x5DC38393
[00000230]: SW x11, 0(x7)                    // 0x00B3A023
[00000234]: LUI x11, 2147483648 (0x0x80000000) // 0x800005B7
[00000238]: SW x11, 4(x7)                    // 0x00B3A223
[0000023C]: ECALL                            // 0x00000073
[00000240]: LUI x19, 4294963200 (0x0xFFFFF000) // 0xFFFFF9B7
[00000244]: ADDI x19, x19, -564 (0x0xFFFFFDCC) // 0xDCC98993
[00000248]: ADDI x4, x0, 2047 (0x0x7FF)      // 0x7FF00213
[0000024C]: ADD x12, x19, 4                  // 0x00498633
[00000250]: SW x12, 8(x1)                    // 0x00C0A423
[00000254]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[00000258]: ADDI x7, x7, 1456 (0x0x5B0)      // 0x5B038393
[0000025C]: SW x12, 0(x7)                    // 0x00C3A023
[00000260]: LUI x12, 4294963200 (0x0xFFFFF000) // 0xFFFFF637
[00000264]: ADDI x12, x12, 1483 (0x0x5CB)    // 0x5CB60613
[00000268]: SW x12, 4(x7)                    // 0x00C3A223
[0000026C]: ECALL                            // 0x00000073
[00000270]: ADDI x18, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00913
[00000274]: ADDI x3, x0, -1 (0x0xFFFFFFFF)   // 0xFFF00193
[00000278]: ADD x13, x18, 3                  // 0x003906B3
[0000027C]: SW x13, 12(x1)                   // 0x00D0A623
[00000280]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[00000284]: ADDI x7, x7, 1412 (0x0x584)      // 0x58438393
[00000288]: SW x13, 0(x7)                    // 0x00D3A023
[0000028C]: ADDI x13, x0, -2 (0x0xFFFFFFFE)  // 0xFFE00693
[00000290]: SW x13, 4(x7)                    // 0x00D3A223
[00000294]: ECALL                            // 0x00000073
[00000298]: ADDI x17, x0, -2047 (0x0xFFFFF801) // 0x80100893
[0000029C]: ADDI x2, x0, 1 (0x0x1)           // 0x00100113
[000002A0]: ADD x14, x17, 2                  // 0x00288733
[000002A4]: SW x14, 16(x1)                   // 0x00E0A823
[000002A8]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[000002AC]: ADDI x7, x7, 1372 (0x0x55C)      // 0x55C38393
[000002B0]: SW x14, 0(x7)                    // 0x00E3A023
[000002B4]: ADDI x14, x0, -2046 (0x0xFFFFF802) // 0x80200713
[000002B8]: SW x14, 4(x7)                    // 0x00E3A223
[000002BC]: ECALL                            // 0x00000073
[000002C0]: ADDI x2, x0, 1596 (0x0x63C)      // 0x63C00113
[000002C4]: ADDI x16, x0, 0 (0x0x0)          // 0x00000813
[000002C8]: ADDI x1, x0, 0 (0x0x0)           // 0x00000093
[000002CC]: ADD x15, x16, 1                  // 0x001807B3
[000002D0]: SW x15, 0(x2)                    // 0x00F12023
[000002D4]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[000002D8]: ADDI x3, x3, 1328 (0x0x530)      // 0x53018193
[000002DC]: SW x15, 0(x3)                    // 0x00F1A023
[000002E0]: ADDI x15, x0, 0 (0x0x0)          // 0x00000793
[000002E4]: SW x15, 4(x3)                    // 0x00F1A223
[000002E8]: ECALL                            // 0x00000073
[000002EC]: ADDI x15, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00793
[000002F0]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[000002F4]: ADD x16, x15, 0                  // 0x00078833
[000002F8]: SW x16, 4(x2)                    // 0x01012223
[000002FC]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[00000300]: ADDI x3, x3, 1288 (0x0x508)      // 0x50818193
[00000304]: SW x16, 0(x3)                    // 0x0101A023
[00000308]: ADDI x16, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00813
[0000030C]: SW x16, 4(x3)                    // 0x0101A223
[00000310]: ECALL                            // 0x00000073
[00000314]: ADDI x14, x0, 1 (0x0x1)          // 0x00100713
[00000318]: ADDI x31, x0, -2047 (0x0xFFFFF801) // 0x80100F93
[0000031C]: ADD x17, x14, 31                 // 0x01F708B3
[00000320]: SW x17, 8(x2)                    // 0x01112423
[00000324]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[00000328]: ADDI x3, x3, 1248 (0x0x4E0)      // 0x4E018193
[0000032C]: SW x17, 0(x3)                    // 0x0111A023
[00000330]: ADDI x17, x0, -2046 (0x0xFFFFF802) // 0x80200893
[00000334]: SW x17, 4(x3)                    // 0x0111A223
[00000338]: ECALL                            // 0x00000073
[0000033C]: ADDI x13, x0, 0 (0x0x0)          // 0x00000693
[00000340]: ADDI x30, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00F13
[00000344]: ADD x18, x13, 30                 // 0x01E68933
[00000348]: SW x18, 12(x2)                   // 0x01212623
[0000034C]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[00000350]: ADDI x3, x3, 1208 (0x0x4B8)      // 0x4B818193
[00000354]: SW x18, 0(x3)                    // 0x0121A023
[00000358]: ADDI x18, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00913
[0000035C]: SW x18, 4(x3)                    // 0x0121A223
[00000360]: ECALL                            // 0x00000073
[00000364]: ADDI x12, x0, 2047 (0x0x7FF)     // 0x7FF00613
[00000368]: LUI x29, 4294963200 (0x0xFFFFF000) // 0xFFFFFEB7
[0000036C]: ADDI x29, x29, -564 (0x0xFFFFFDCC) // 0xDCCE8E93
[00000370]: ADD x19, x12, 29                 // 0x01D609B3
[00000374]: SW x19, 16(x2)                   // 0x01312823
[00000378]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[0000037C]: ADDI x3, x3, 1164 (0x0x48C)      // 0x48C18193
[00000380]: SW x19, 0(x3)                    // 0x0131A023
[00000384]: LUI x19, 4294963200 (0x0xFFFFF000) // 0xFFFFF9B7
[00000388]: ADDI x19, x19, 1483 (0x0x5CB)    // 0x5CB98993
[0000038C]: SW x19, 4(x3)                    // 0x0131A223
[00000390]: ECALL                            // 0x00000073
[00000394]: ADDI x1, x0, 1616 (0x0x650)      // 0x65000093
[00000398]: ADDI x11, x0, 0 (0x0x0)          // 0x00000593
[0000039C]: LUI x28, 2147483648 (0x0x80000000) // 0x80000E37
[000003A0]: ADD x20, x11, 28                 // 0x01C58A33
[000003A4]: SW x20, 0(x1)                    // 0x0140A023
[000003A8]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[000003AC]: ADDI x2, x2, 1116 (0x0x45C)      // 0x45C10113
[000003B0]: SW x20, 0(x2)                    // 0x01412023
[000003B4]: LUI x20, 2147483648 (0x0x80000000) // 0x80000A37
[000003B8]: SW x20, 4(x2)                    // 0x01412223
[000003BC]: ECALL                            // 0x00000073
[000003C0]: LUI x10, 4096 (0x0x1000)         // 0x00001537
[000003C4]: ADDI x10, x10, -2048 (0x0xFFFFF800) // 0x80050513
[000003C8]: LUI x27, 4096 (0x0x1000)         // 0x00001DB7
[000003CC]: ADDI x27, x27, 564 (0x0x234)     // 0x234D8D93
[000003D0]: ADD x21, x10, 27                 // 0x01B50AB3
[000003D4]: SW x21, 4(x1)                    // 0x0150A223
[000003D8]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[000003DC]: ADDI x2, x2, 1068 (0x0x42C)      // 0x42C10113
[000003E0]: SW x21, 0(x2)                    // 0x01512023
[000003E4]: LUI x21, 8192 (0x0x2000)         // 0x00002AB7
[000003E8]: ADDI x21, x21, -1484 (0x0xFFFFFA34) // 0xA34A8A93
[000003EC]: SW x21, 4(x2)                    // 0x01512223
[000003F0]: ECALL                            // 0x00000073
[000003F4]: LUI x9, 124076032 (0x0x7654000)  // 0x076544B7
[000003F8]: ADDI x9, x9, 801 (0x0x321)       // 0x32148493
[000003FC]: ADDI x26, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00D13
[00000400]: ADD x22, x9, 26                  // 0x01A48B33
[00000404]: SW x22, 8(x1)                    // 0x0160A423
[00000408]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[0000040C]: ADDI x2, x2, 1020 (0x0x3FC)      // 0x3FC10113
[00000410]: SW x22, 0(x2)                    // 0x01612023
[00000414]: LUI x22, 124076032 (0x0x7654000) // 0x07654B37
[00000418]: ADDI x22, x22, 800 (0x0x320)     // 0x320B0B13
[0000041C]: SW x22, 4(x2)                    // 0x01612223
[00000420]: ECALL                            // 0x00000073
[00000424]: LUI x8, 2147483648 (0x0x80000000) // 0x80000437
[00000428]: ADDI x8, x8, -1 (0x0xFFFFFFFF)   // 0xFFF40413
[0000042C]: ADDI x25, x0, 1 (0x0x1)          // 0x00100C93
[00000430]: ADD x23, x8, 25                  // 0x01940BB3
[00000434]: SW x23, 12(x1)                   // 0x0170A623
[00000438]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[0000043C]: ADDI x2, x2, 972 (0x0x3CC)       // 0x3CC10113
[00000440]: SW x23, 0(x2)                    // 0x01712023
[00000444]: LUI x23, 2147483648 (0x0x80000000) // 0x80000BB7
[00000448]: SW x23, 4(x2)                    // 0x01712223
[0000044C]: ECALL                            // 0x00000073
[00000450]: ADDI x7, x0, 1 (0x0x1)           // 0x00100393
[00000454]: LUI x24, 2147483648 (0x0x80000000) // 0x80000C37
[00000458]: ADDI x24, x24, -1 (0x0xFFFFFFFF) // 0xFFFC0C13
[0000045C]: ADD x24, x7, 24                  // 0x01838C33
[00000460]: SW x24, 16(x1)                   // 0x0180A823
[00000464]: AUIPC x2, 0 (0x0x0)              // 0x00000117
[00000468]: ADDI x2, x2, 928 (0x0x3A0)       // 0x3A010113
[0000046C]: SW x24, 0(x2)                    // 0x01812023
[00000470]: LUI x24, 2147483648 (0x0x80000000) // 0x80000C37
[00000474]: SW x24, 4(x2)                    // 0x01812223
[00000478]: ECALL                            // 0x00000073
[0000047C]: ADDI x1, x0, 1636 (0x0x664)      // 0x66400093
[00000480]: ADDI x6, x0, -1 (0x0xFFFFFFFF)   // 0xFFF00313
[00000484]: LUI x23, 124076032 (0x0x7654000) // 0x07654BB7
[00000488]: ADDI x23, x23, 801 (0x0x321)     // 0x321B8B93
[0000048C]: ADD x25, x6, 23                  // 0x01730CB3
[00000490]: SW x25, 0(x1)                    // 0x0190A023
[00000494]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[00000498]: ADDI x7, x7, 880 (0x0x370)       // 0x37038393
[0000049C]: SW x25, 0(x7)                    // 0x0193A023
[000004A0]: LUI x25, 124076032 (0x0x7654000) // 0x07654CB7
[000004A4]: ADDI x25, x25, 800 (0x0x320)     // 0x320C8C93
[000004A8]: SW x25, 4(x7)                    // 0x0193A223
[000004AC]: ECALL                            // 0x00000073
[000004B0]: LUI x5, 4096 (0x0x1000)          // 0x000012B7
[000004B4]: ADDI x5, x5, 564 (0x0x234)       // 0x23428293
[000004B8]: LUI x22, 4096 (0x0x1000)         // 0x00001B37
[000004BC]: ADDI x22, x22, -2048 (0x0xFFFFF800) // 0x800B0B13
[000004C0]: ADD x26, x5, 22                  // 0x01628D33
[000004C4]: SW x26, 4(x1)                    // 0x01A0A223
[000004C8]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[000004CC]: ADDI x7, x7, 828 (0x0x33C)       // 0x33C38393
[000004D0]: SW x26, 0(x7)                    // 0x01A3A023
[000004D4]: LUI x26, 8192 (0x0x2000)         // 0x00002D37
[000004D8]: ADDI x26, x26, -1484 (0x0xFFFFFA34) // 0xA34D0D13
[000004DC]: SW x26, 4(x7)                    // 0x01A3A223
[000004E0]: ECALL                            // 0x00000073
[000004E4]: LUI x4, 2147483648 (0x0x80000000) // 0x80000237
[000004E8]: ADDI x21, x0, 0 (0x0x0)          // 0x00000A93
[000004EC]: ADD x27, x4, 21                  // 0x01520DB3
[000004F0]: SW x27, 8(x1)                    // 0x01B0A423
[000004F4]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[000004F8]: ADDI x7, x7, 784 (0x0x310)       // 0x31038393
[000004FC]: SW x27, 0(x7)                    // 0x01B3A023
[00000500]: LUI x27, 2147483648 (0x0x80000000) // 0x80000DB7
[00000504]: SW x27, 4(x7)                    // 0x01B3A223
[00000508]: ECALL                            // 0x00000073
[0000050C]: LUI x3, 4294963200 (0x0xFFFFF000) // 0xFFFFF1B7
[00000510]: ADDI x3, x3, -564 (0x0xFFFFFDCC) // 0xDCC18193
[00000514]: ADDI x20, x0, 2047 (0x0x7FF)     // 0x7FF00A13
[00000518]: ADD x28, x3, 20                  // 0x01418E33
[0000051C]: SW x28, 12(x1)                   // 0x01C0A623
[00000520]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[00000524]: ADDI x7, x7, 740 (0x0x2E4)       // 0x2E438393
[00000528]: SW x28, 0(x7)                    // 0x01C3A023
[0000052C]: LUI x28, 4294963200 (0x0xFFFFF000) // 0xFFFFFE37
[00000530]: ADDI x28, x28, 1483 (0x0x5CB)    // 0x5CBE0E13
[00000534]: SW x28, 4(x7)                    // 0x01C3A223
[00000538]: ECALL                            // 0x00000073
[0000053C]: ADDI x2, x0, -1 (0x0xFFFFFFFF)   // 0xFFF00113
[00000540]: ADDI x19, x0, -1 (0x0xFFFFFFFF)  // 0xFFF00993
[00000544]: ADD x29, x2, 19                  // 0x01310EB3
[00000548]: SW x29, 16(x1)                   // 0x01D0A823
[0000054C]: AUIPC x7, 0 (0x0x0)              // 0x00000397
[00000550]: ADDI x7, x7, 696 (0x0x2B8)       // 0x2B838393
[00000554]: SW x29, 0(x7)                    // 0x01D3A023
[00000558]: ADDI x29, x0, -2 (0x0xFFFFFFFE)  // 0xFFE00E93
[0000055C]: SW x29, 4(x7)                    // 0x01D3A223
[00000560]: ECALL                            // 0x00000073
[00000564]: ADDI x2, x0, 1656 (0x0x678)      // 0x67800113
[00000568]: ADDI x1, x0, -2047 (0x0xFFFFF801) // 0x80100093
[0000056C]: ADDI x18, x0, 1 (0x0x1)          // 0x00100913
[00000570]: ADD x30, x1, 18                  // 0x01208F33
[00000574]: SW x30, 0(x2)                    // 0x01E12023
[00000578]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[0000057C]: ADDI x3, x3, 652 (0x0x28C)       // 0x28C18193
[00000580]: SW x30, 0(x3)                    // 0x01E1A023
[00000584]: ADDI x30, x0, -2046 (0x0xFFFFF802) // 0x80200F13
[00000588]: SW x30, 4(x3)                    // 0x01E1A223
[0000058C]: ECALL                            // 0x00000073
[00000590]: ADDI x0, x0, 0 (0x0x0)           // 0x00000013
[00000594]: ADDI x17, x0, 0 (0x0x0)          // 0x00000893
[00000598]: ADD x31, x0, 17                  // 0x01100FB3
[0000059C]: SW x31, 4(x2)                    // 0x01F12223
[000005A0]: AUIPC x3, 0 (0x0x0)              // 0x00000197
[000005A4]: ADDI x3, x3, 612 (0x0x264)       // 0x26418193
[000005A8]: SW x31, 0(x3)                    // 0x01F1A023
[000005AC]: ADDI x31, x0, 0 (0x0x0)          // 0x00000F93
[000005B0]: SW x31, 4(x3)                    // 0x01F1A223
[000005B4]: ECALL                            // 0x00000073
[000005B8]: J 0x000005B8                     // 0x0000006F
[000005BC]: 0                                // 0x00000000
[000005C0]: 0                                // 0x00000000
[000005C4]: 0                                // 0x00000000
[000005C8]: 0                                // 0x00000000
[000005CC]: 0                                // 0x00000000
[000005D0]: 0                                // 0x00000000
[000005D4]: 0                                // 0x00000000
[000005D8]: 0                                // 0x00000000
[000005DC]: 0                                // 0x00000000
[000005E0]: 0                                // 0x00000000
[000005E4]: 0                                // 0x00000000
[000005E8]: 0                                // 0x00000000
[000005EC]: 0                                // 0x00000000
[000005F0]: 0                                // 0x00000000
[000005F4]: 0                                // 0x00000000
[000005F8]: 0                                // 0x00000000
[000005FC]: 0                                // 0x00000000
[00000600]: 127                              // 0xFFFFFFFF
[00000604]: 127                              // 0xFFFFFFFF
[00000608]: 127                              // 0xFFFFFFFF
[0000060C]: 127                              // 0xFFFFFFFF
[00000610]: 127                              // 0xFFFFFFFF
[00000614]: 127                              // 0xFFFFFFFF
[00000618]: 127                              // 0xFFFFFFFF
[0000061C]: 127                              // 0xFFFFFFFF
[00000620]: 127                              // 0xFFFFFFFF
[00000624]: 127                              // 0xFFFFFFFF
[00000628]: 127                              // 0xFFFFFFFF
[0000062C]: 127                              // 0xFFFFFFFF
[00000630]: 127                              // 0xFFFFFFFF
[00000634]: 127                              // 0xFFFFFFFF
[00000638]: 127                              // 0xFFFFFFFF
[0000063C]: 127                              // 0xFFFFFFFF
[00000640]: 127                              // 0xFFFFFFFF
[00000644]: 127                              // 0xFFFFFFFF
[00000648]: 127                              // 0xFFFFFFFF
[0000064C]: 127                              // 0xFFFFFFFF
[00000650]: 127                              // 0xFFFFFFFF
[00000654]: 127                              // 0xFFFFFFFF
[00000658]: 127                              // 0xFFFFFFFF
[0000065C]: 127                              // 0xFFFFFFFF
[00000660]: 127                              // 0xFFFFFFFF
[00000664]: 127                              // 0xFFFFFFFF
[00000668]: 127                              // 0xFFFFFFFF
[0000066C]: 127                              // 0xFFFFFFFF
[00000670]: 127                              // 0xFFFFFFFF
[00000674]: 127                              // 0xFFFFFFFF
[00000678]: 127                              // 0xFFFFFFFF
[0000067C]: 127                              // 0xFFFFFFFF
[00000680]: 127                              // 0xFFFFFFFF
[00000684]: 127                              // 0xFFFFFFFF
[00000688]: 127                              // 0xFFFFFFFF
[0000068C]: 0                                // 0x00000000
[00000690]: 0                                // 0x00000000
[00000694]: 0                                // 0x00000000
[00000698]: 0                                // 0x00000000
[0000069C]: 0                                // 0x00000000
[000006A0]: 0                                // 0x00000000
[000006A4]: 0                                // 0x00000000
[000006A8]: 0                                // 0x00000000
[000006AC]: 0                                // 0x00000000
[000006B0]: 0                                // 0x00000000
[000006B4]: 0                                // 0x00000000
[000006B8]: 0                                // 0x00000000
[000006BC]: 0                                // 0x00000000
[000006C0]: 0                                // 0x00000000
[000006C4]: 0                                // 0x00000000
[000006C8]: 0                                // 0x00000000
[000006CC]: 0                                // 0x00000000
[000006D0]: 0                                // 0x00000000
[000006D4]: 0                                // 0x00000000
[000006D8]: 0                                // 0x00000000
[000006DC]: 0                                // 0x00000000
[000006E0]: 0                                // 0x00000000
[000006E4]: 0                                // 0x00000000
[000006E8]: 0                                // 0x00000000
[000006EC]: 0                                // 0x00000000
[000006F0]: 0                                // 0x00000000
[000006F4]: 0                                // 0x00000000
[000006F8]: 0                                // 0x00000000
[000006FC]: 0                                // 0x00000000
[00000700]: 0                                // 0x00000080
[00000704]: 0                                // 0x00000000
[00000708]: 0                                // 0x00000000
[0000070C]: 0                                // 0x00000000
[00000710]: 0                                // 0x00000000
[00000714]: 0                                // 0x00000000
[00000718]: 0                                // 0x00000000
[0000071C]: 0                                // 0x00000000
[00000720]: 0                                // 0x00000000
[00000724]: 0                                // 0x00000000
[00000728]: 0                                // 0x00000000
[0000072C]: 0                                // 0x00000000
[00000730]: 0                                // 0x00000000
[00000734]: 0                                // 0x00000000
[00000738]: 0                                // 0x00000000
[0000073C]: 0                                // 0x00000000
[00000740]: 0                                // 0x00000000
[00000744]: 0                                // 0x00000000
[00000748]: 0                                // 0x00000000
[0000074C]: 0                                // 0x00000000
[00000750]: 0                                // 0x00000000
[00000754]: 0                                // 0x00000000
[00000758]: 0                                // 0x00000000
[0000075C]: 0                                // 0x00000000
[00000760]: 0                                // 0x00000000
[00000764]: 0                                // 0x00000000
[00000768]: 0                                // 0x00000000
[0000076C]: 0                                // 0x00000000
[00000770]: 0                                // 0x00000000
[00000774]: 0                                // 0x00000000
[00000778]: 0                                // 0x00000000
[0000077C]: 0                                // 0x00000000
[00000780]: 0                                // 0x00000000
[00000784]: 0                                // 0x00000000
[00000788]: 0                                // 0x00000000
[0000078C]: 0                                // 0x00000000
[00000790]: 0                                // 0x00000000
[00000794]: 0                                // 0x00000000
[00000798]: 0                                // 0x00000000
[0000079C]: 0                                // 0x00000000
[000007A0]: 0                                // 0x00000000
[000007A4]: 0                                // 0x00000000
[000007A8]: 0                                // 0x00000000
[000007AC]: 0                                // 0x00000000
[000007B0]: 0                                // 0x00000000
[000007B4]: 0                                // 0x00000000
[000007B8]: 0                                // 0x00000000
[000007BC]: 0                                // 0x00000000
[000007C0]: 0                                // 0x00000000
[000007C4]: 0                                // 0x00000000
[000007C8]: 0                                // 0x00000000
[000007CC]: 0                                // 0x00000000
[000007D0]: 0                                // 0x00000000
[000007D4]: 0                                // 0x00000000
[000007D8]: 0                                // 0x00000000
[000007DC]: 0                                // 0x00000000
[000007E0]: 0                                // 0x00000000
[000007E4]: 0                                // 0x00000000
[000007E8]: 0                                // 0x00000000
[000007EC]: 0                                // 0x00000000
[000007F0]: 0                                // 0x00000000
[000007F4]: 0                                // 0x00000000
[000007F8]: 0                                // 0x00000000
[000007FC]: 0                                // 0x00000000
[00000800]: 4                                // 0x00000004
[00000804]: 33                               // 0x87654321
[00000808]: 33                               // 0x87654321
[0000080C]: 0                                // 0x00000000
[00000810]: 0                                // 0x00000000
[00000814]: 0                                // 0x00000000
[00000818]: 0                                // 0x00000000
[0000081C]: 0                                // 0x00000000
[00000820]: 0                                // 0x00000000
[00000824]: 0                                // 0x00000000
[00000828]: 0                                // 0x00000000
[0000082C]: 0                                // 0x00000000
[00000830]: 0                                // 0x00000000
[00000834]: 0                                // 0x00000000
[00000838]: 0                                // 0x00000000
[0000083C]: 0                                // 0x00000000
[00000840]: 0                                // 0x00000000
[00000844]: 0                                // 0x00000000
[00000848]: 0                                // 0x00000000
[0000084C]: 0                                // 0x00000000
[00000850]: 0                                // 0x00000000
[00000854]: 0                                // 0x00000000
[00000858]: 0                                // 0x00000000
[0000085C]: 0                                // 0x00000000
[00000860]: 0                                // 0x00000000
[00000864]: 0                                // 0x00000000
[00000868]: 0                                // 0x00000000
[0000086C]: 0                                // 0x00000000
[00000870]: 0                                // 0x00000000
[00000874]: 0                                // 0x00000000
[00000878]: 0                                // 0x00000000
[0000087C]: 0                                // 0x00000000
[00000880]: 0                                // 0x00000000
[00000884]: 0                                // 0x00000000
[00000888]: 0                                // 0x00000000
[0000088C]: 0                                // 0x00000000
[00000890]: 0                                // 0x00000000
[00000894]: 0                                // 0x00000000
[00000898]: 0                                // 0x00000000
[0000089C]: 0                                // 0x00000000
[000008A0]: 0                                // 0x00000000
[000008A4]: 0                                // 0x00000000
[000008A8]: 0                                // 0x00000000
[000008AC]: 0                                // 0x00000000
[000008B0]: 0                                // 0x00000000
[000008B4]: 0                                // 0x00000000
[000008B8]: 0                                // 0x00000000
[000008BC]: 0                                // 0x00000000
[000008C0]: 0                                // 0x00000000
[000008C4]: 0                                // 0x00000000
[000008C8]: 0                                // 0x00000000
[000008CC]: 0                                // 0x00000000
[000008D0]: 0                                // 0x00000000
[000008D4]: 0                                // 0x00000000
[000008D8]: 0                                // 0x00000000
[000008DC]: 0                                // 0x00000000
[000008E0]: 0                                // 0x00000000
[000008E4]: 0                                // 0x00000000
[000008E8]: 0                                // 0x00000000
[000008EC]: 0                                // 0x00000000
[000008F0]: 0                                // 0x00000000
[000008F4]: 0                                // 0x00000000
[000008F8]: 0                                // 0x00000000
[000008FC]: 0                                // 0x00000000
[00000900]: 0                                // 0x00000000
[00000904]: 0                                // 0x00000000
[00000908]: 0                                // 0x00000000
[0000090C]: 0                                // 0x00000000
[00000910]: 0                                // 0x00000000
[00000914]: 0                                // 0x00000000
[00000918]: 0                                // 0x00000000
[0000091C]: 0                                // 0x00000000
[00000920]: 0                                // 0x00000000
[00000924]: 0                                // 0x00000000
[00000928]: 0                                // 0x00000000
[0000092C]: 0                                // 0x00000000
[00000930]: 0                                // 0x00000000
[00000934]: 0                                // 0x00000000
[00000938]: 0                                // 0x00000000
[0000093C]: 0                                // 0x00000000
[00000940]: 0                                // 0x00000000
[00000944]: 0                                // 0x00000000
[00000948]: 0                                // 0x00000000
[0000094C]: 0                                // 0x00000000
[00000950]: 0                                // 0x00000000
[00000954]: 0                                // 0x00000000
[00000958]: 0                                // 0x00000000
[0000095C]: 0                                // 0x00000000
[00000960]: 0                                // 0x00000000
[00000964]: 0                                // 0x00000000
[00000968]: 0                                // 0x00000000
[0000096C]: 0                                // 0x00000000
[00000970]: 0                                // 0x00000000
[00000974]: 0                                // 0x00000000
[00000978]: 0                                // 0x00000000
[0000097C]: 0                                // 0x00000000
[00000980]: 0                                // 0x00000000
[00000984]: 0                                // 0x00000000
[00000988]: 0                                // 0x00000000
[0000098C]: 0                                // 0x00000000
[00000990]: 0                                // 0x00000000
[00000994]: 0                                // 0x00000000
[00000998]: 0                                // 0x00000000
[0000099C]: 0                                // 0x00000000
[000009A0]: 0                                // 0x00000000
[000009A4]: 0                                // 0x00000000
[000009A8]: 0                                // 0x00000000
[000009AC]: 0                                // 0x00000000
[000009B0]: 0                                // 0x00000000
[000009B4]: 0                                // 0x00000000
[000009B8]: 0                                // 0x00000000
[000009BC]: 0                                // 0x00000000
[000009C0]: 0                                // 0x00000000
[000009C4]: 0                                // 0x00000000
[000009C8]: 0                                // 0x00000000
[000009CC]: 0                                // 0x00000000
[000009D0]: 0                                // 0x00000000
[000009D4]: 0                                // 0x00000000
[000009D8]: 0                                // 0x00000000
[000009DC]: 0                                // 0x00000000
[000009E0]: 0                                // 0x00000000
[000009E4]: 0                                // 0x00000000
[000009E8]: 0                                // 0x00000000
[000009EC]: 0                                // 0x00000000
[000009F0]: 0                                // 0x00000000
[000009F4]: 0                                // 0x00000000
[000009F8]: 0                                // 0x00000000
[000009FC]: 0                                // 0x00000000
[00000A00]: 0                                // 0x00000000
[00000A04]: 0                                // 0x00000000
