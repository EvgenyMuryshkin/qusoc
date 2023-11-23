using Quokka.RTL;
using RTL.Modules;
using System;
using System.Linq;

namespace rtl.modules
{
    public class AXI4Interconnect2x4TestModuleInputs
    {
        public AXI4Interconnect2x4TestModuleInputs()
        {

        }

        public AXI4Interconnect2x4TestModuleInputs(int mCount, int sCount)
        {
            MWE = new bool[mCount];
            MRE = new bool[mCount];
            SWE = new bool[sCount];
        }

        public RTLBitArray InData = new RTLBitArray().Resized(32);
        public bool[] MWE;
        public RTLBitArray WSTRB = new RTLBitArray().Resized(4);
        public bool[] MRE;
        public bool[] SWE;
    }

    public class AXI4Interconnect2x4TestModuleState
    {

    }

    public class AXI4Interconnect2x4TestModule : RTLSynchronousModule<AXI4Interconnect2x4TestModuleInputs, AXI4Interconnect2x4TestModuleState>
    {
        readonly int mCount = 2;
        readonly int sCount = 4;
        readonly axiSize axiSize = axiSize.B4;
        //AXI4InterconnectModule interconnect;
        AXI4MasterModule[] masters;
        AXI4RegisterModule[] registers;
        AXI4_S2M notActiveS2M;
        AXI4_M2S notActiveM2S;

        AXI4InterconnectS2M[] interconnectS2M;
        AXI4_M2S[] interconnectM2S => masters.Select(m => m.M2S).ToArray();

        public AXI4Interconnect2x4TestModule()
        {
            InitInputs(new AXI4Interconnect2x4TestModuleInputs(mCount, sCount));
            notActiveS2M = new AXI4_S2M(axiSize);
            notActiveM2S = new AXI4_M2S(axiSize);
            //interconnect = new AXI4InterconnectModule(axiSize, mCount, sCount);
            masters = range(mCount).Select(_ => new AXI4MasterModule(axiSize)).ToArray();
            registers = range(sCount).Select(_ => new AXI4RegisterModule(axiSize)).ToArray();

            interconnectS2M = range(sCount).Select(_ => new AXI4InterconnectS2M(axiSize)).ToArray();
        }

        protected override void OnSchedule(Func<AXI4Interconnect2x4TestModuleInputs> inputsFactory)
        {
            for (var i = 0; i < mCount; i++)
            {
                masters[i].Schedule(() => new AXI4MasterModuleInputs()
                {
                    S2M = notActiveS2M,
                    WE = Inputs.MWE[i],
                    RE = Inputs.MRE[i],
                    ARADDR = 0,
                    AWADDR = 0,
                    WDATA = Inputs.InData,
                    WSTRB = Inputs.WSTRB
                });
            }

            for (var i = 0; i < sCount; i++)
            {
                registers[i].Schedule(() => new AXI4RegisterModuleInputs()
                {
                    inWDATA = Inputs.InData,
                    inWE = Inputs.SWE[i],
                    M2S = notActiveM2S
                });
            }
            /*
            interconnect.Schedule(() => new AXI4InterconnectModuleInputs()
            {
                M2S = masters.Select(m => m.M2S).ToArray(),
                S2M = interconnectS2M
            });
            */
        }

        protected override void OnStage()
        {
        }
    }
}
