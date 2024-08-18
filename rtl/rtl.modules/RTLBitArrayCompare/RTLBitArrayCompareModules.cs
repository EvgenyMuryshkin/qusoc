using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RTL.Modules
{
    public class RTLBitArrayCompareUnsignedInput
    {
        public RTLBitArray LHS = new RTLBitArray().Resized(32);
        public RTLBitArray RHS = new RTLBitArray().Resized(32);
    }

    public class RTLBitArrayCompareSignedInput
    {
        public RTLBitArray LHS = new RTLBitArray().Resized(32).Signed();
        public RTLBitArray RHS = new RTLBitArray().Resized(32).Signed();
    }

    public class RTLBitArrayCompareMixedInput
    {
        public RTLBitArray LHS = new RTLBitArray().Resized(32).Signed();
        public RTLBitArray RHS = new RTLBitArray().Resized(32).Unsigned();
    }

    public class RTLBitArrayCompareUnsignedEqModule : RTLCombinationalModule<RTLBitArrayCompareUnsignedInput>
    {
        public bool Value => Inputs.LHS == Inputs.RHS;
    }

    public class RTLBitArrayCompareUnsignedAsSignedEqModule : RTLCombinationalModule<RTLBitArrayCompareUnsignedInput>
    {
        public bool Value => Inputs.LHS.Signed() == Inputs.RHS.Signed();
    }

    public class RTLBitArrayCompareSignedEqModule : RTLCombinationalModule<RTLBitArrayCompareSignedInput>
    {
        public bool Value => Inputs.LHS == Inputs.RHS;
    }

    public class RTLBitArrayCompareMixedEqModule : RTLCombinationalModule<RTLBitArrayCompareMixedInput>
    {
        public bool Value => Inputs.LHS == Inputs.RHS;
    }
}
