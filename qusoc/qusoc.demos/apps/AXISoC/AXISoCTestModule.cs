using QRV32.CPU;
using Quokka.RTL;
using rtl.modules;
using rtl.modules.AXI4.Modules;
using RTL.Modules;
using System;
using System.Collections.Generic;

namespace AXISoC
{
    public class AXISoCTestModuleInputs
    {

    }

    public class AXISoCTestModule : RTLCombinationalModule<AXISoCTestModuleInputs>
    {
        internal AXI4RISCVModule CPU = new AXI4RISCVModule(CPURegsType.RAM);
        internal AXI4MemoryModule Memory = new AXI4MemoryModule(axiSize.B4, 4096);
        internal AXI4RegisterModule Reg = new AXI4RegisterModule(axiSize.B4);
        internal AXI4InteconnectModule Interconnect = new AXI4InteconnectModule(
            axiSize.B4,
            1,
            new List<RangeInfo>()
            {
                new RangeInfo(0x00000000, 0x00001000),
                new RangeInfo(0x80000000, 0x80000000)
            }
        );

        public AXISoCTestModule()
        {
        }

        protected override void OnSchedule(Func<AXISoCTestModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            CPU.Schedule(() => new AXI4RISCVModuleInputs()
            {
                S2M = Interconnect.oS2M[0]
            });

            Memory.Schedule(() => new AXI4MemoryModuleInputs()
            { 
                M2S = Interconnect.oM2S[0]
            });

            Reg.Schedule(() => new AXI4RegisterModuleInputs()
            {
                M2S = Interconnect.oM2S[1],
                Reg = new AXI4RegisterModuleInput()
                { 
                    inWDATA = new byte[4] { 0, 0, 0, 0 },// TODO: no initializer support
                    inWE = false
                }
            });

            Interconnect.Schedule(() => new AXI4InteconnectModuleInputs()
            { 
                iM2S = new[]
                { 
                    CPU.M2S 
                },
                iS2M = new[] 
                {
                    Memory.S2M,
                    Reg.S2M
                } 
            });
        }
        public RTLBitArray oData => new RTLBitArray(Reg.outData);
    }
}
