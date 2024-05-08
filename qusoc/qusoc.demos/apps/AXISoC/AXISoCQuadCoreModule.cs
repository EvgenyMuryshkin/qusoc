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
    }

    public class AXISoCQuadCoreModule : RTLCombinationalModule<AXISoCQuadCoreModuleInputs>
    {
        internal AXI4RISCVModule CPU0 = new AXI4RISCVModule(CPURegsType.RAM, 0);
        internal AXI4RISCVModule CPU1 = new AXI4RISCVModule(CPURegsType.RAM, 1);
        internal AXI4RISCVModule CPU2 = new AXI4RISCVModule(CPURegsType.RAM, 2);
        internal AXI4RISCVModule CPU3 = new AXI4RISCVModule(CPURegsType.RAM, 3);
        internal AXI4MemoryModule Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4IncrementOnReadCounterModule AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule AXI4AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);

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

        internal AXI4GatewayModule ioGateway = new AXI4GatewayModule(axiSize.B4);

        internal AXI4InteconnectModule Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            4,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),// instructions memory
                new RangeInfo(0x10000000, 0x10000000),// auto increment on read
                new RangeInfo(0x10000004, 0x10000004),// auto decrement
                new RangeInfo(0x80000004, 0x80000004),// reg0
                new RangeInfo(0x80000008, 0x80000008),// reg1
                new RangeInfo(0x8000000C, 0x8000000C),// reg2
                new RangeInfo(0x80000010, 0x80000010),// reg3
                new RangeInfo(0x80000014, 0x80000028),// io interconnect
                /*
                new RangeInfo(0x80000014, 0x80000014),// switch 0
                new RangeInfo(0x80000018, 0x80000018),// switch 1
                new RangeInfo(0x8000001C, 0x8000001C),// button0
                new RangeInfo(0x80000020, 0x80000020),// button1
                new RangeInfo(0x80000024, 0x80000024),// button2
                new RangeInfo(0x80000028, 0x80000028),// button3
                */
            }
        );


        internal AXI4InteconnectModule ioInterconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x80000014, 0x80000014),// switch 0
                new RangeInfo(0x80000018, 0x80000018),// switch 1
                new RangeInfo(0x8000001C, 0x8000001C),// button0
                new RangeInfo(0x80000020, 0x80000020),// button1
                new RangeInfo(0x80000024, 0x80000024),// button2
                new RangeInfo(0x80000028, 0x80000028),// button3
            }
        );

        public AXISoCQuadCoreModule(uint[] instructions)
        {
            var bytes = instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();
            Memory.Initialize(bytes);
        }

        protected override void OnSchedule(Func<AXISoCQuadCoreModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            CPU0.Schedule(() => new ()
            {
                S2M = Interconnect.oS2M[0]
            });
            CPU1.Schedule(() => new ()
            {
                S2M = Interconnect.oS2M[1]
            });
            CPU2.Schedule(() => new()
            {
                S2M = Interconnect.oS2M[2]
            });
            CPU3.Schedule(() => new()
            {
                S2M = Interconnect.oS2M[3]
            });

            Memory.Schedule(() => new ()
            { 
                M2S = Interconnect.oM2S[0]
            });
            AutoIncrementCounter.Schedule(() => new ()
            {
                M2S = Interconnect.oM2S[1]
            });
            AXI4AutoDecrementRegister.Schedule(() => new()
            {
                M2S = Interconnect.oM2S[2]
            });

            Reg0.Schedule(() => new ()
            {
                M2S = Interconnect.oM2S[3]
            });
            Reg1.Schedule(() => new ()
            {
                M2S = Interconnect.oM2S[4]
            });
            Reg2.Schedule(() => new()
            {
                M2S = Interconnect.oM2S[5]
            });
            Reg3.Schedule(() => new()
            {
                M2S = Interconnect.oM2S[6]
            });
            ioGateway.Schedule(() => new()
            {
                iM2S = Interconnect.oM2S[7],
                iS2M = ioInterconnect.oS2M[0]
            });

            Switch0.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[0],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iSwitch0)
                }
            });
            Switch1.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[1],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iSwitch1)
                }
            });

            Button0.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[2],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton0)
                }
            });
            Button1.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[3],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton1)
                }
            });
            Button2.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[4],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton2)
                }
            });
            Button3.Schedule(() => new()
            {
                M2S = ioInterconnect.oM2S[5],
                Sig =
                {
                    inWDATA = new RTLBitArray(Inputs.iButton3)
                }
            });

            Interconnect.Schedule(() => new ()
            { 
                iM2S = [
                    CPU0.M2S, 
                    CPU1.M2S, 
                    CPU2.M2S, 
                    CPU3.M2S
                ],
                iS2M = [
                    Memory.S2M,
                    AutoIncrementCounter.S2M,
                    AXI4AutoDecrementRegister.S2M,
                    Reg0.S2M,
                    Reg1.S2M,
                    Reg2.S2M,
                    Reg3.S2M,
                    ioGateway.oS2M
                ]
            });

            ioInterconnect.Schedule(() => new ()
            {
                iM2S = [
                    ioGateway.oM2S
                ],
                iS2M = [
                    Switch0.S2M,
                    Switch1.S2M,
                    Button0.S2M,
                    Button1.S2M,
                    Button2.S2M,
                    Button3.S2M
                ]
            });
        }
        public RTLBitArray oReg0 => new RTLBitArray(Reg0.outData);
        public RTLBitArray oReg1 => new RTLBitArray(Reg1.outData);
        public RTLBitArray oReg2 => new RTLBitArray(Reg2.outData);
        public RTLBitArray oReg3 => new RTLBitArray(Reg3.outData);
    }
}
