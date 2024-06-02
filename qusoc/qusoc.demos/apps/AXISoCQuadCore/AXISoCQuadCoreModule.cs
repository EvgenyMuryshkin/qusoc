using QRV32.CPU;
using Quokka.RTL;
using axi.modules;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AXISoC
{
    public class AXISoCQuadCoreModuleInputs
    {
        public bool iSwitch0 { get; set; }
        public bool iSwitch1 { get; set; }

        public bool iButton0 { get; set; }
        public bool iButton1 { get; set; }
        public bool iButton2 { get; set; }
        public bool iButton3 { get; set; }
        public bool iRX { get; set; }
    }

    public class AXISoCQuadCoreModule : RTLCombinationalModule<AXISoCQuadCoreModuleInputs>
    {
        internal AXI4RISCVModule CPU0 = new AXI4RISCVModule(CPURegsType.RAM, 0);
        internal AXI4MemoryModule cpu0Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4IncrementOnReadCounterModule cpu0AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu0AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu0IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4RISCVModule CPU1 = new AXI4RISCVModule(CPURegsType.RAM, 1);
        internal AXI4MemoryModule cpu1Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4IncrementOnReadCounterModule cpu1AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu1AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu1IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4RISCVModule CPU2 = new AXI4RISCVModule(CPURegsType.RAM, 2);
        internal AXI4MemoryModule cpu2Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4IncrementOnReadCounterModule cpu2AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu2AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu2IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4RISCVModule CPU3 = new AXI4RISCVModule(CPURegsType.RAM, 3);
        internal AXI4MemoryModule cpu3Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4IncrementOnReadCounterModule cpu3AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu3AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu3IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4RegisterModule CPUExtReset = new AXI4RegisterModule(axiSize.B4);

        internal AXI4RegisterModule Reg0 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg1 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg2 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg3 = new AXI4RegisterModule(axiSize.B4);

        internal AXI4SignalBufferModule Switch0 = new AXI4SignalBufferModule(axiSize.B4);
        internal AXI4SignalBufferModule Switch1 = new AXI4SignalBufferModule(axiSize.B4);

        internal AXI4SignalBufferModule Button0 = new AXI4SignalBufferModule(axiSize.B4);
        internal AXI4SignalBufferModule Button1 = new AXI4SignalBufferModule(axiSize.B4);
        internal AXI4SignalBufferModule Button2 = new AXI4SignalBufferModule(axiSize.B4);
        internal AXI4SignalBufferModule Button3 = new AXI4SignalBufferModule(axiSize.B4);

        internal AXI4UARTModule uart = new AXI4UARTModule(axiSize.B4, 434);//115200

        internal AXI4InteconnectModule cpu0Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );
        internal AXI4InteconnectModule cpu1Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );
        internal AXI4InteconnectModule cpu2Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );
        internal AXI4InteconnectModule cpu3Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );

        internal AXI4InteconnectModule ioInterconnect = new AXI4InteconnectModule(
            axiSize.B4,
            4,
            new List<RangeInfo>()
            {
                new RangeInfo(0x80000000, 0x80000000),// ext reset
                new RangeInfo(0x80000004, 0x80000004),// reg0
                new RangeInfo(0x80000008, 0x80000008),// reg1
                new RangeInfo(0x8000000C, 0x8000000C),// reg2
                new RangeInfo(0x80000010, 0x80000010),// reg3
                new RangeInfo(0x80000014, 0x80000014),// switch 0
                new RangeInfo(0x80000018, 0x80000018),// switch 1
                new RangeInfo(0x8000001C, 0x8000001C),// button0
                new RangeInfo(0x80000020, 0x80000020),// button1
                new RangeInfo(0x80000024, 0x80000024),// button2
                new RangeInfo(0x80000028, 0x80000028),// button3
                new RangeInfo(0x90000000, 0x90000003),// uart
            }
        );

        internal RTLBitArray extReset => new RTLBitArray(CPUExtReset.outData);

        public AXISoCQuadCoreModule(
            uint[] cpu0Instructions,
            uint[] cpu1Instructions,
            uint[] cpu2Instructions,
            uint[] cpu3Instructions
            )
        {
            Func<uint[], byte[][]> toBytes = 
                (instructions) => instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();

            cpu0Memory.Initialize(toBytes(cpu0Instructions));
            cpu1Memory.Initialize(toBytes(cpu1Instructions));
            cpu2Memory.Initialize(toBytes(cpu2Instructions));
            cpu3Memory.Initialize(toBytes(cpu3Instructions));
        }

        protected override void OnSchedule(Func<AXISoCQuadCoreModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            // CPU0
            CPU0.Schedule(() => new ()
            {
                S2M = cpu0Interconnect.oS2M[0]
            });
            cpu0Memory.Schedule(() => new()
            {
                M2S = cpu0Interconnect.oM2S[0]
            });
            cpu0AutoIncrementCounter.Schedule(() => new()
            {
                M2S = cpu0Interconnect.oM2S[1]
            });
            cpu0AutoDecrementRegister.Schedule(() => new()
            {
                M2S = cpu0Interconnect.oM2S[2]
            });
            cpu0IOGateway.Schedule(() => new()
            {
                iM2S = cpu0Interconnect.oM2S[3],
                iS2M = ioInterconnect.oS2M[0]
            });
            cpu0Interconnect.Schedule(() => new()
            {
                iM2S = [
                    CPU0.M2S
                ],
                iS2M = [
                    cpu0Memory.S2M,
                    cpu0AutoIncrementCounter.S2M,
                    cpu0AutoDecrementRegister.S2M,
                    cpu0IOGateway.oS2M
                ]
            });

            //CPU1
            CPU1.Schedule(() => new()
            {
                S2M = cpu1Interconnect.oS2M[0],
                ExtReset = extReset[1]
            });
            cpu1Memory.Schedule(() => new()
            {
                M2S = cpu1Interconnect.oM2S[0]
            });
            cpu1AutoIncrementCounter.Schedule(() => new()
            {
                M2S = cpu1Interconnect.oM2S[1]
            });
            cpu1AutoDecrementRegister.Schedule(() => new()
            {
                M2S = cpu1Interconnect.oM2S[2]
            });
            cpu1IOGateway.Schedule(() => new()
            {
                iM2S = cpu1Interconnect.oM2S[3],
                iS2M = ioInterconnect.oS2M[1]
            });
            cpu1Interconnect.Schedule(() => new()
            {
                iM2S = [
                    CPU1.M2S
                ],
                iS2M = [
                    cpu1Memory.S2M,
                    cpu1AutoIncrementCounter.S2M,
                    cpu1AutoDecrementRegister.S2M,
                    cpu1IOGateway.oS2M
                ]
            });

            //CPU2
            CPU2.Schedule(() => new()
            {
                S2M = cpu2Interconnect.oS2M[0],
                ExtReset = extReset[2]
            });
            cpu2Memory.Schedule(() => new()
            {
                M2S = cpu2Interconnect.oM2S[0]
            });
            cpu2AutoIncrementCounter.Schedule(() => new()
            {
                M2S = cpu2Interconnect.oM2S[1]
            });
            cpu2AutoDecrementRegister.Schedule(() => new()
            {
                M2S = cpu2Interconnect.oM2S[2]
            });
            cpu2IOGateway.Schedule(() => new()
            {
                iM2S = cpu2Interconnect.oM2S[3],
                iS2M = ioInterconnect.oS2M[2]
            });
            cpu2Interconnect.Schedule(() => new()
            {
                iM2S = [
                    CPU2.M2S
                ],
                iS2M = [
                    cpu2Memory.S2M,
                    cpu2AutoIncrementCounter.S2M,
                    cpu2AutoDecrementRegister.S2M,
                    cpu2IOGateway.oS2M
                ]
            });

            //CPU3
            CPU3.Schedule(() => new()
            {
                S2M = cpu3Interconnect.oS2M[0],
                ExtReset = extReset[3]
            });
            cpu3Memory.Schedule(() => new()
            {
                M2S = cpu3Interconnect.oM2S[0]
            });
            cpu3AutoIncrementCounter.Schedule(() => new()
            {
                M2S = cpu3Interconnect.oM2S[1]
            });
            cpu3AutoDecrementRegister.Schedule(() => new()
            {
                M2S = cpu3Interconnect.oM2S[2]
            });
            cpu3IOGateway.Schedule(() => new()
            {
                iM2S = cpu3Interconnect.oM2S[3],
                iS2M = ioInterconnect.oS2M[3]
            });
            cpu3Interconnect.Schedule(() => new()
            {
                iM2S = [
                    CPU3.M2S
                ],
                iS2M = [
                    cpu3Memory.S2M,
                    cpu3AutoIncrementCounter.S2M,
                    cpu3AutoDecrementRegister.S2M,
                    cpu3IOGateway.oS2M
                ]
            });

            // IO interconnect
            CPUExtReset.Schedule(() => new()
            { 
                M2S = ioInterconnect.oM2S[0],
            });
            Reg0.Schedule(() => new ()
            {
                M2S = ioInterconnect.oM2S[1]
            });
            Reg1.Schedule(() => new ()
            {
                M2S = ioInterconnect.oM2S[2]
            });
            Reg2.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[3]
            });
            Reg3.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[4]
            });
            Switch0.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[5],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iSwitch0)
                }
            });
            Switch1.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[6],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iSwitch1)
                }
            });

            Button0.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[7],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton0)
                }
            });
            Button1.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[8],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton1)
                }
            });
            Button2.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[9],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton2)
                }
            });
            Button3.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[10],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton3)
                }
            });
            uart.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[11],
                iRX = Inputs.iRX
            });

            ioInterconnect.Schedule(() => new ()
            {
                iM2S = [
                    cpu0IOGateway.oM2S,
                    cpu1IOGateway.oM2S,
                    cpu2IOGateway.oM2S,
                    cpu3IOGateway.oM2S
                ],
                iS2M = [
                    CPUExtReset.S2M,
                    Reg0.S2M,
                    Reg1.S2M,
                    Reg2.S2M,
                    Reg3.S2M,
                    Switch0.S2M,
                    Switch1.S2M,
                    Button0.S2M,
                    Button1.S2M,
                    Button2.S2M,
                    Button3.S2M,
                    uart.oS2M
                ]
            });
        }

        public RTLBitArray oReg0 => new RTLBitArray(Reg0.outData);
        public RTLBitArray oReg1 => new RTLBitArray(Reg1.outData);
        public RTLBitArray oReg2 => new RTLBitArray(Reg2.outData);
        public RTLBitArray oReg3 => new RTLBitArray(Reg3.outData);
        public bool oTX => uart.oTX;
        public bool oTransmitting => uart.oTransmitting;
        public bool oCE => uart.oCE;
        public bool oRXValid => uart.oRXValid;
    }
}
