using Quokka.RTL;
using Quokka.RTL.Tools;

namespace rtl.modules
{
    public class ConstantTupleInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public (bool, sbyte, RTLBitArray, RTLBitArrayWrapper, (InstanceCreationType, RTLBitArrayWrapper)) Value
        {
            get
            {
                var result = (
                    false,
                    sbyte.MinValue,
                    new RTLBitArray(RTLBitArrayInitType.MSB, true, false, false),
                    new RTLBitArrayWrapper(InstanceCreationType.Byte, 2, 3, 4, 5),
                    (
                        InstanceCreationType.UInt,
                        new RTLBitArrayWrapper(InstanceCreationType.SByte, 3, 4, 5, 6)
                    )
                );

                return result;
            }
        }
    }

    public class RuntimeTupleInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public (bool, sbyte, RTLBitArray, RTLBitArrayWrapper, (InstanceCreationType, RTLBitArrayWrapper)) Value
        {
            get
            {
                var value = sbyte.MinValue;

                var result = (
                    false,
                    value,
                    new RTLBitArray(RTLBitArrayInitType.MSB, true, false, false),
                    new RTLBitArrayWrapper(InstanceCreationType.Byte, 3, 4, 5, 6)
                    {
                        Value = (byte)42,
                        ByteArray = [3, 4, 5]
                    },
                    (
                        InstanceCreationType.UInt,
                        new RTLBitArrayWrapper(InstanceCreationType.SByte, 4, 5, 6, 7)
                        {
                            L2 =
                            {
                                Value = (sbyte)-120
                            }
                        }
                    )
                );

                return result;
            }
        }
    }
}
