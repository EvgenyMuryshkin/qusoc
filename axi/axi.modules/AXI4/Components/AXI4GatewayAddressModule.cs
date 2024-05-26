using Quokka.RTL;

namespace axi.modules
{
    public class AXI4GatewayAddressModuleInputs
    {
        public AXI4GatewayAddressModuleInputs() : this(axiSize.B4) { }
        public AXI4GatewayAddressModuleInputs(axiSize size) 
        {
            iOriginalAddress = new RTLBitArray(false).Resized(AXI4Tools.Bits(size));
            iMapAddress = new RTLBitArray(false).Resized(AXI4Tools.Bits(size));
        }

        public RTLBitArray iOriginalAddress { get; set; }
        public RTLBitArray iMapAddress { get; set; }

    }

    public class AXI4GatewayAddressModule : RTLCombinationalModule<AXI4GatewayAddressModuleInputs>
    {
        private readonly int upperBits;
        private readonly int axiSize;
        public AXI4GatewayAddressModule(axiSize size, int upperBits)
        {
            InitInputs(new AXI4GatewayAddressModuleInputs(size));
            this.upperBits = upperBits;
            this.axiSize = AXI4Tools.Bits(size);
        }

        public RTLBitArray oAddress => 
            new RTLBitArray(
                RTLBitArrayInitType.MSB, 
                Inputs.iMapAddress[axiSize - 1, upperBits], 
                Inputs.iOriginalAddress[upperBits - 1, 0]
            );
    }
}
