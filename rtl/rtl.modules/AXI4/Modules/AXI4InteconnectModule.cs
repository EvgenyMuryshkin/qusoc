using Quokka.RTL;
using RTL.Modules;
using System;
using System.Collections.Generic;
using System.Linq;

namespace rtl.modules.AXI4.Modules
{
    public class AXI4InteconnectModuleInputs
    {
        public AXI4InteconnectModuleInputs() { }
        public AXI4InteconnectModuleInputs(int mCount, int sCount)
        {
            M2S = Enumerable.Range(0, mCount).Select(_ => new AXI4_M2S()).ToArray();
            S2M = Enumerable.Range(0, sCount).Select(_ => new AXI4_S2M()).ToArray();
        }

        public AXI4_M2S[] M2S;
        public AXI4_S2M[] S2M;
    }

    public class AXI4InteconnectModule : RTLCombinationalModule<AXI4InteconnectModuleInputs>
    {
        AXI4ReadInteconnectModule readInterconnect;
        AXI4WriteInteconnectModule writeInterconnect;

        public AXI4InteconnectModule(int mCount, List<RangeInfo> slaveRange)
        {
            InitInputs(new AXI4InteconnectModuleInputs(mCount, slaveRange.Count));

            readInterconnect = new AXI4ReadInteconnectModule(mCount, slaveRange);
            writeInterconnect = new AXI4WriteInteconnectModule(mCount, slaveRange);
        }

        protected override void OnSchedule(Func<AXI4InteconnectModuleInputs> inputsFactory)
        {
            readInterconnect.Schedule(() =>
                new InterconnectModuleInputs<AXI4_M2S_R, AXI4_S2M_R>()
                {
                    iLeft = Inputs.M2S.Select(i => i.R).ToArray(),
                    iRight = Inputs.S2M.Select(i => i.R).ToArray()
                }
            );

            writeInterconnect.Schedule(() =>
                new InterconnectModuleInputs<AXI4_M2S_W, AXI4_S2M_W>()
                {
                    iLeft = Inputs.M2S.Select(i => i.W).ToArray(),
                    iRight = Inputs.S2M.Select(i => i.W).ToArray()
                }
            );
        }
    }
}
