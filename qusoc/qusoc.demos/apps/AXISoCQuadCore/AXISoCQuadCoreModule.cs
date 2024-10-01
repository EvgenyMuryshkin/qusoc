using QRV32.CPU;
using Quokka.RTL;
using axi.modules;
using System;
using System.Collections.Generic;
using System.Linq;
using Quokka.RTL.Tools;

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
        public bool iProgrammerRX { get; set; }
    }

    public class AXISoCQuadCoreModule : RTLCombinationalModule<AXISoCQuadCoreModuleInputs>
    {
        internal AXI4Programmer programmer = new AXI4Programmer();
        internal AXI4GatewayModule programmerIOGateway = new AXI4GatewayModule(axiSize.B4);
        internal AXI4GatewayModule programmerCPU0Gateway = new AXI4GatewayModule(axiSize.B4, 17);
        internal AXI4GatewayModule programmerCPU1Gateway = new AXI4GatewayModule(axiSize.B4, 17);
        internal AXI4GatewayModule programmerCPU2Gateway = new AXI4GatewayModule(axiSize.B4, 17);
        internal AXI4GatewayModule programmerCPU3Gateway = new AXI4GatewayModule(axiSize.B4, 17);

        internal AXI4InteconnectModule programmerInterconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
                new RangeInfo(0xF0000000, 0xF001FFFF),// cpu0 interconnect
                new RangeInfo(0xF1000000, 0xF101FFFF),// cpu1 interconnect
                new RangeInfo(0xF2000000, 0xF201FFFF),// cpu2 interconnect
                new RangeInfo(0xF3000000, 0xF301FFFF),// cpu3 interconnect
            }
        );

        internal AXI4RISCVModule CPU0 = new AXI4RISCVModule(CPURegsType.RAM, 0);
        internal AXI4MemoryModule cpu0Memory = new AXI4MemoryModule(axiSize.B4, 0x8000);
        internal AXI4IncrementOnReadCounterModule cpu0AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu0AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu0IOGateway = new AXI4GatewayModule(axiSize.B4);
        internal AXI4InteconnectModule cpu0Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            2,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00020000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );

        internal AXI4RISCVModule CPU1 = new AXI4RISCVModule(CPURegsType.RAM, 1);
        internal AXI4MemoryModule cpu1Memory = new AXI4MemoryModule(axiSize.B4, 0x8000);
        internal AXI4IncrementOnReadCounterModule cpu1AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu1AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu1IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4InteconnectModule cpu1Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            2,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00020000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );

        internal AXI4RISCVModule CPU2 = new AXI4RISCVModule(CPURegsType.RAM, 2);
        internal AXI4MemoryModule cpu2Memory = new AXI4MemoryModule(axiSize.B4, 0x1000);
        internal AXI4IncrementOnReadCounterModule cpu2AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu2AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu2IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4InteconnectModule cpu2Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            2,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00020000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );

        internal AXI4RISCVModule CPU3 = new AXI4RISCVModule(CPURegsType.RAM, 3);
        internal AXI4MemoryModule cpu3Memory = new AXI4MemoryModule(axiSize.B4, 0x1000);
        internal AXI4IncrementOnReadCounterModule cpu3AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu3AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu3IOGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4InteconnectModule cpu3Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            2,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00020000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000000, 0xA0000000),// io interconnect
            }
        );

        internal AXI4RegisterModule CPUExtReset = new AXI4RegisterModule(axiSize.B4);

        internal AXI4RegisterModule Reg0 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg1 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg2 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg3 = new AXI4RegisterModule(axiSize.B4);

        internal AXI4InSignalArrayBufferModule Switches = new AXI4InSignalArrayBufferModule(axiSize.B4, 1, 2);
        internal AXI4InSignalArrayBufferModule Buttons = new AXI4InSignalArrayBufferModule(axiSize.B4, 1, 4);
        
        internal AXI4UARTModule uart = new AXI4UARTModule(axiSize.B4, 1024, 434);//115200
        internal AXI4PWMModule pwm = new AXI4PWMModule(axiSize.B4, 8, 1_000_000);// 20ms per pwm period, 1M clock on 50MHz
        internal AXI4WS2812Module ws2812 = new AXI4WS2812Module(axiSize.B4, 50000000);

        internal AXI4InteconnectModule ioInterconnect = new AXI4InteconnectModule(
            axiSize.B4,
            5,
            new List<RangeInfo>()
            {
                new RangeInfo(0x80000000, 0x80000000),// ext reset
                new RangeInfo(0x80000004, 0x80000004),// reg0
                new RangeInfo(0x80000008, 0x80000008),// reg1
                new RangeInfo(0x8000000C, 0x8000000C),// reg2
                new RangeInfo(0x80000010, 0x80000010),// reg3
                new RangeInfo(0x80000100, 0x80000104),// switches
                new RangeInfo(0x80000200, 0x8000020C),// buttons
                new RangeInfo(0x90000000, 0x90000003),// uart
                new RangeInfo(0x90000100, 0x900001FC),// pwm,
                new RangeInfo(0x90000200, 0x90000204),// ws2812,
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

        public override IEnumerable<IRTLModuleValidator> Validators(IRTLClassFactory classFactory)
            => [classFactory.Create<AXI4InterconnectScheduleValidator>()];

        protected override void OnSchedule(Func<AXISoCQuadCoreModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            // programmer
            programmer.Schedule(() => new()
            {
                iRX = Inputs.iProgrammerRX,
                S2M = programmerInterconnect.oS2M[0]
            });

            programmerIOGateway.Schedule(() => new()
            {
                iM2S = programmerInterconnect.oM2S[0],
                iS2M = ioInterconnect.oS2M[0]
            });

            programmerCPU0Gateway.Schedule(() => new()
            {
                iM2S = programmerInterconnect.oM2S[1],
                iS2M = cpu0Interconnect.oS2M[0]
            });

            programmerCPU1Gateway.Schedule(() => new()
            {
                iM2S = programmerInterconnect.oM2S[2],
                iS2M = cpu1Interconnect.oS2M[0]
            });

            programmerCPU2Gateway.Schedule(() => new()
            {
                iM2S = programmerInterconnect.oM2S[3],
                iS2M = cpu2Interconnect.oS2M[0]
            });

            programmerCPU3Gateway.Schedule(() => new()
            {
                iM2S = programmerInterconnect.oM2S[4],
                iS2M = cpu3Interconnect.oS2M[0]
            });

            programmerInterconnect.Schedule(() => new()
            {
                iM2S = [
                    programmer.M2S
                ],
                iS2M =
                [
                    programmerIOGateway.oS2M,
                    programmerCPU0Gateway.oS2M,
                    programmerCPU1Gateway.oS2M,
                    programmerCPU2Gateway.oS2M,
                    programmerCPU3Gateway.oS2M,
                ]
            });
            // CPU0
            CPU0.Schedule(() => new ()
            {
                S2M = cpu0Interconnect.oS2M[1],
                ExtReset = extReset[0]
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
                iS2M = ioInterconnect.oS2M[1]
            });

            cpu0Interconnect.Schedule(() => new()
            {
                iM2S = [
                    programmerCPU0Gateway.oM2S,
                    CPU0.M2S
                ],
                iS2M = [
                    cpu0Memory.S2M,
                    cpu0AutoIncrementCounter.S2M,
                    cpu0AutoDecrementRegister.S2M,
                    cpu0IOGateway.oS2M,
                ]
            });

            //CPU1
            CPU1.Schedule(() => new()
            {
                S2M = cpu1Interconnect.oS2M[1],
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
                iS2M = ioInterconnect.oS2M[2]
            });
            cpu1Interconnect.Schedule(() => new()
            {
                iM2S = [
                    programmerCPU1Gateway.oM2S,
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
                S2M = cpu2Interconnect.oS2M[1],
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
                iS2M = ioInterconnect.oS2M[3]
            });
            cpu2Interconnect.Schedule(() => new()
            {
                iM2S = [
                    programmerCPU2Gateway.oM2S,
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
                S2M = cpu3Interconnect.oS2M[1],
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
                iS2M = ioInterconnect.oS2M[4]
            });
            cpu3Interconnect.Schedule(() => new()
            {
                iM2S = [
                    programmerCPU3Gateway.oM2S,
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
            Switches.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[5],
                Sig =
                {
                    inWDATA = new RTLBitArray[]
                    {
                        Inputs.iSwitch0,
                        Inputs.iSwitch1
                    }
                }
            });
            Buttons.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[6],
                Sig =
                {
                    inWDATA = new RTLBitArray[] 
                    { 
                        Inputs.iButton0, 
                        Inputs.iButton1, 
                        Inputs.iButton2, 
                        Inputs.iButton3 
                    }
                }

            });
            uart.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[7],
                iRX = Inputs.iRX
            });
            pwm.Schedule(() => new()
            { 
                M2S = ioInterconnect.oM2S[8]
            });
            ws2812.Schedule(() => new()
            { 
                M2S = ioInterconnect.oM2S[9]
            });

            ioInterconnect.Schedule(() => new ()
            {
                iM2S = [
                    programmerIOGateway.oM2S,
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
                    Switches.S2M,
                    Buttons.S2M,
                    uart.oS2M,
                    pwm.oS2M,
                    ws2812.oS2M
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

        public bool[] oPWM => pwm.oPWM;
        public bool oWS2812 => ws2812.oTX;
        public bool oProgrammerTX => programmer.oTX;
    }
}
