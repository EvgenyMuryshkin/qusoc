using Quokka.RTL;
using rtl.modules.AXI4.Modules;
using RTL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;

namespace rtl.modules
{
    public class AXI4SoC2x2Inputs
    {
        public AXI4SoC2x2Inputs() { }
        public AXI4SoC2x2Inputs(axiSize size, int mCount)
        {
            MasterInputs = Enumerable.Range(0, mCount).Select(_ => new AXI4MasterModuleInput(size)).ToArray();
        }
        public AXI4MasterModuleInput[] MasterInputs;
    }

    public class AXI4SoC2x2 : RTLCombinationalModule<AXI4SoC2x2Inputs>
    {
        private readonly int mCount = 2;
        private readonly int sCount = 2;

        AXI4InteconnectModule interconnect;
        AXI4MasterModule[] masters;
        AXI4RegisterModule[] registers;

        public AXI4SoC2x2()
        {
            InitInputs(new AXI4SoC2x2Inputs(axiSize.B4, mCount));

            masters = range(mCount).Select(_ => new AXI4MasterModule(axiSize.B4)).ToArray();
            registers = range(sCount).Select(_ => new AXI4RegisterModule(axiSize.B4)).ToArray();

            interconnect = new AXI4InteconnectModule(
                axiSize.B4,
                2,
                new List<RangeInfo>
                {
                    new RangeInfo(0x00000000, 0x00000000),
                    new RangeInfo(0x00000004, 0x00000004)
                }
            );
        }

        protected override void OnSchedule(Func<AXI4SoC2x2Inputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            foreach (var masterIndex in range(mCount))
            {
                masters[masterIndex].Schedule(() =>
                    new AXI4MasterModuleInputs()
                    {
                        Master = Inputs.MasterInputs[masterIndex],
                        //S2M = interconnect.
                    }
                );
            }

            interconnect.Schedule(() =>
                new AXI4InteconnectModuleInputs()
                {
                    iM2S = masters.Select(m => m.M2S).ToArray(),
                    iS2M = registers.Select(r => r.S2M).ToArray()
                }
            );
        }
    }
}
