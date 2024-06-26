using Quokka.RTL;
using System;

namespace RTL.Modules
{
    public class BitArrayInputs
    {
        public byte Value;
        public RTLBitArray Bit = new RTLBitArray().Resized(3);
    }

    public class BitArrayModule : RTLCombinationalModule<BitArrayInputs>
    {
        RTLBitArray Bits => Inputs.Value;
        public bool ValueBit => Bits[Inputs.Bit];
        public RTLBitArray Direct => Bits;
        public RTLBitArray ReversedByCall => Bits.Reversed();
        public RTLBitArray High => Bits[7, 4];
        public RTLBitArray Low => Bits[3, 0];
        public RTLBitArray Reversed => Bits[0, 7];
        public RTLBitArray ReversedHigh => Bits[4, 7];
        public RTLBitArray ReversedLow => Bits[0, 3];
        public RTLBitArray Picks => new RTLBitArray(RTLBitArrayInitType.MSB, Bits[6,5], Bits[0,1]);//dbg
        public RTLBitArray FromBits1 => new RTLBitArray(RTLBitArrayInitType.MSB, true, true, false, true);
        public RTLBitArray FromBits2 => new RTLBitArray(RTLBitArrayInitType.MSB, false, true, true, true);
        public RTLBitArray ZeroString => new RTLBitArray(RTLBitArrayInitType.MSB, "00000000");
        public RTLBitArray ValueString => new RTLBitArray(RTLBitArrayInitType.MSB, "01000000");
        //public bool CtorMuxCondition => Inputs.Bit == 0;
        public RTLBitArray CtorMux => Inputs.Bit == 0 ? new RTLBitArray(RTLBitArrayInitType.MSB, "00000000") : new RTLBitArray(RTLBitArrayInitType.MSB, "01000000");
    }
}
