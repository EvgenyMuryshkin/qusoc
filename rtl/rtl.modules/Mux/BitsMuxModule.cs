using Quokka.RTL;

namespace RTL.Modules
{
    public class BitsMuxModuleInputs
    {
        public RTLBitArray Addr { get; set; } = new RTLBitArray(byte.MinValue);
        public byte Value { get; set; }
    }

    public class BitsMuxModule : RTLCombinationalModule<BitsMuxModuleInputs>
    {
        RTLBitArray pixelAddress => Inputs.Addr[1, 0];
        public RTLBitArray pixelBits => (new RTLBitArray(Inputs.Value) >> (2 * pixelAddress))[1, 0];
    }
}
