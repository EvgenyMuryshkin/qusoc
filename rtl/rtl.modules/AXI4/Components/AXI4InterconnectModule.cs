using Quokka.RTL;
using RTL.Modules;

namespace rtl.modules
{
    public class AXI4InterconnectS2M
    {
        public uint ADDR_LOW;
        public uint ADDR_HIGH;
        public AXI4_S2M S2M;
    }

    public class AXI4InterconnectModuleInputs
    {
        public AXI4InterconnectModuleInputs() { }
        public AXI4InterconnectModuleInputs(int mCount, int sCount)
        {
            M2S = new AXI4_M2S[mCount];
            S2M = new AXI4InterconnectS2M[sCount];
        }

        public AXI4_M2S[] M2S = new AXI4_M2S[0];
        public AXI4InterconnectS2M[] S2M = new AXI4InterconnectS2M[0];
    }

    public class AXIInterconnectModuleState
    {

    }

    public class AXI4InterconnectModule : RTLSynchronousModule<AXI4InterconnectModuleInputs, AXIInterconnectModuleState>
    {
        public AXI4InterconnectModule(int mCount, int sCount)
        {
            InitInputs(new AXI4InterconnectModuleInputs(mCount, sCount) { });
        }

        protected override void OnStage()
        {
        }
    }
}
