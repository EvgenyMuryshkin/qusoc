using Quokka.Core.Attributes;
using Quokka.RTL;

namespace axi.modules
{

    public class AXI4GatewayModuleInputs
    {
        public AXI4GatewayModuleInputs() : this(axiSize.B4) { }
        public AXI4GatewayModuleInputs(axiSize size)
        {
            iM2S = new AXI4_M2S(size);
            iS2M = new AXI4_S2M(size);
        }

        public AXI4_M2S iM2S;
        public AXI4_S2M iS2M;
    }

    public class AXI4GatewayModule : RTLCombinationalModule<AXI4GatewayModuleInputs>
    {
        public AXI4GatewayModule(axiSize size)
        {
            InitInputs(new AXI4GatewayModuleInputs(size));
        }

        public AXI4_M2S oM2S => Inputs.iM2S;
        public AXI4_S2M oS2M => Inputs.iS2M;
    }
}
