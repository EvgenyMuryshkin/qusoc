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
        public AXI4InteconnectModuleInputs(axiSize size, int mCount, int sCount)
        {
            iM2S = Enumerable.Range(0, mCount).Select(_ => new AXI4_M2S(size)).ToArray();
            iS2M = Enumerable.Range(0, sCount).Select(_ => new AXI4_S2M(size)).ToArray();
        }

        public AXI4_M2S[] iM2S;
        public AXI4_S2M[] iS2M;
    }

    public class AXI4InteconnectModule : RTLCombinationalModule<AXI4InteconnectModuleInputs>
    {
        private readonly int mCount;
        private readonly int sCount;
        internal AXI4ReadInteconnectModule readInterconnect;
        internal AXI4WriteInteconnectModule writeInterconnect;

        public AXI4InteconnectModule(axiSize size, int mCount, List<RangeInfo> slaveRange)
        {
            this.mCount = mCount;
            sCount = slaveRange.Count;

            InitInputs(new AXI4InteconnectModuleInputs(size, mCount, slaveRange.Count));

            readInterconnect = new AXI4ReadInteconnectModule(mCount, slaveRange);
            writeInterconnect = new AXI4WriteInteconnectModule(mCount, slaveRange);
        }

        protected override void OnSchedule(Func<AXI4InteconnectModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            readInterconnect.Schedule(() =>
                new InterconnectModuleInputs<AXI4_M2S_R, AXI4_S2M_R>()
                {
                    iLeft = Inputs.iM2S.Select(i => i.R).ToArray(),
                    iRight = Inputs.iS2M.Select(i => i.R).ToArray()
                }
            );

            writeInterconnect.Schedule(() =>
                new InterconnectModuleInputs<AXI4_M2S_W, AXI4_S2M_W>()
                {
                    iLeft = Inputs.iM2S.Select(i => i.W).ToArray(),
                    iRight = Inputs.iS2M.Select(i => i.W).ToArray()
                }
            );
        }

        public AXI4_S2M[] oS2M => range(mCount)
            .Select(slaveIndex =>
                new AXI4_S2M()
                {
                    R = readInterconnect.S2M[slaveIndex],
                    W = writeInterconnect.S2M[slaveIndex]
                }
            ).ToArray();

        public AXI4_M2S[] oM2S => range(sCount)
            .Select(masterIndex =>
                new AXI4_M2S()
                {
                    R = readInterconnect.M2S[masterIndex],
                    W = writeInterconnect.M2S[masterIndex]
                }
            ).ToArray();
    }
}
