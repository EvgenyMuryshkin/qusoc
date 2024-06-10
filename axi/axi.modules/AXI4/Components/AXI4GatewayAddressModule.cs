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
        private readonly int originalLowerBits;
        private readonly int axiSize;
        public AXI4GatewayAddressModule(axiSize size, int originalLowerBits)
        {
            InitInputs(new AXI4GatewayAddressModuleInputs(size));
            this.originalLowerBits = originalLowerBits;
            this.axiSize = AXI4Tools.Bits(size);
        }

        public RTLBitArray oAddress =>
            originalLowerBits == 0 
            ?   Inputs.iOriginalAddress
            :   new RTLBitArray(
                    RTLBitArrayInitType.MSB, 
                    Inputs.iMapAddress[axiSize - 1, originalLowerBits], 
                    Inputs.iOriginalAddress[originalLowerBits - 1, 0]
                );
    }
}
