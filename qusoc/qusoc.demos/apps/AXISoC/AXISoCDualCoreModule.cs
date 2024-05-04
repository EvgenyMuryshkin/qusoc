using QRV32.CPU;
using Quokka.RTL;
using axi.modules;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AXISoC
{
    public class AXISoCDualCoreModuleInputs
    {

    }

    public class AXISoCDualCoreModule : RTLCombinationalModule<AXISoCDualCoreModuleInputs>
    {
        internal AXI4RISCVModule CPU0 = new AXI4RISCVModule(CPURegsType.RAM);
        internal AXI4RISCVModule CPU1 = new AXI4RISCVModule(CPURegsType.RAM);
        internal AXI4MemoryModule Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4AutoIncrementCounterModule AutoIncrementCounter = new AXI4AutoIncrementCounterModule(axiSize.B4);
        internal AXI4RegisterModule Reg0 = new AXI4RegisterModule(axiSize.B4);
        internal AXI4RegisterModule Reg1 = new AXI4RegisterModule(axiSize.B4);

        internal AXI4InteconnectModule Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            2,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),
                new RangeInfo(0x80000000, 0x80000000),//auto increment
                new RangeInfo(0x80000004, 0x80000004),// reg0
                new RangeInfo(0x80000008, 0x80000008),// reg1
            }
        );

        public AXISoCDualCoreModule(uint[] instructions)
        {
            var bytes = instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();
            Memory.Initialize(bytes);
        }

        protected override void OnSchedule(Func<AXISoCDualCoreModuleInputs> inputsFactory)
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

            Memory.Schedule(() => new ()
            { 
                M2S = Interconnect.oM2S[0]
            });
            AutoIncrementCounter.Schedule(() => new ()
            {
                M2S = Interconnect.oM2S[1]
            });
            Reg0.Schedule(() => new ()
            {
                M2S = Interconnect.oM2S[2]
            });
            Reg1.Schedule(() => new ()
            {
                M2S = Interconnect.oM2S[3]
            });

            Interconnect.Schedule(() => new ()
            { 
                iM2S = [CPU0.M2S, CPU1.M2S],
                iS2M = [
                    Memory.S2M,
                    AutoIncrementCounter.S2M,
                    Reg0.S2M,
                    Reg1.S2M
                ]
            });
        }
        public RTLBitArray oReg0 => new RTLBitArray(Reg0.outData);
        public RTLBitArray oReg1 => new RTLBitArray(Reg1.outData);
    }
}
