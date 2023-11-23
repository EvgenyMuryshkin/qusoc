using Quokka.RTL;
using RTL.Modules;
using System;
using System.Linq;

namespace rtl.modules
{
    public class AXI4InterconnectS2M
    {
        public AXI4InterconnectS2M(axiSize size)
        {
            S2M = new AXI4_S2M(size);
        }

        public uint ADDR_LOW;
        public uint ADDR_HIGH;
        public AXI4_S2M S2M;
    }

    public class AXI4InterconnectModuleInputs
    {
        public AXI4InterconnectModuleInputs() { }
        public AXI4InterconnectModuleInputs(axiSize size, int mCount, int sCount)
        {
            M2S = Enumerable.Range(0, mCount).Select(i => new AXI4_M2S(size)).ToArray();
            S2M = Enumerable.Range(0, sCount).Select(i => new AXI4InterconnectS2M(size)).ToArray();
        }

        public AXI4_M2S[] M2S = new AXI4_M2S[0];
        public AXI4InterconnectS2M[] S2M = new AXI4InterconnectS2M[0];
    }

    public class AXIInterconnectModuleState
    {

    }

    public class AXI4InterconnectModule : RTLSynchronousModule<AXI4InterconnectModuleInputs, AXIInterconnectModuleState>
    {
        private readonly int mCount;
        private readonly int sCount;

        AXI4EncoderModule masterReadEncoderModule;
        AXI4EncoderModule masterWriteEncoderModule;

        public AXI4InterconnectModule(axiSize size, int mCount, int sCount)
        {
            this.mCount = mCount;
            this.sCount = sCount;

            InitInputs(new AXI4InterconnectModuleInputs(size, mCount, sCount) { });
            masterReadEncoderModule = new AXI4EncoderModule(mCount);
            masterWriteEncoderModule = new AXI4EncoderModule(mCount);
        }

        bool[] mARVALID => Inputs.M2S.Select(m => m.AR.ARVALID).ToArray();
        bool[] mAWVALID => Inputs.M2S.Select(m => m.AW.AWVALID).ToArray();

        protected override void OnSchedule(Func<AXI4InterconnectModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            masterReadEncoderModule.Schedule(
                () => new AXI4EncoderModuleInputs(mCount)
                {
                    iValues = mARVALID
                }
            );

            masterWriteEncoderModule.Schedule(
                () => new AXI4EncoderModuleInputs(mCount)
                {
                    iValues = mAWVALID
                }
            );
        }

        public bool HasActiveRead => masterReadEncoderModule.HasActive;
        public bool HasActiveWrite => masterWriteEncoderModule.HasActive;

        protected override void OnStage()
        {
        }
    }
}
