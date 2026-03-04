using Quokka.RTL;
using Quokka.RTL.Tools;

namespace rtl.modules
{
    public class ClassInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArrayWrapper Value
        {
            get
            {
                var result = new RTLBitArrayWrapper(InstanceCreationType.SByte, 10, 3, 4, 5);
                return result;
            }
        }
    }

    public class ClassInstanceArrayCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArrayWrapper[] Value
        {
            get
            {
                var result = new RTLBitArrayWrapper[]
                {
                    new RTLBitArrayWrapper(InstanceCreationType.SByte, 10, 3, 4, 5),
                    new RTLBitArrayWrapper(InstanceCreationType.SByte, 10, 3, 4, 5),
                };
                return result;
            }
        }
    }

    public class ClassInstanceL1InitCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArrayWrapper Value
        {
            get
            {
                var result = new RTLBitArrayWrapper(InstanceCreationType.SByte, 2, 3, 4, 5)
                {
                    Value = new RTLBitArray((sbyte)127),
                    ByteArray = [10,20]
                };
                return result;
            }
        }
    }

    public class ClassInstanceL2InitCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArrayWrapper Value
        {
            get
            {
                var result = new RTLBitArrayWrapper(InstanceCreationType.SByte, 2, 3, 4, 5)
                {
                    L2 =
                    {
                        Value = new RTLBitArray((sbyte)-1),
                        ByteArray = [10,20,30]
                    }
                };

                return result;
            }
        }
    }

    public class ClassInstanceL3InitCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArrayWrapper Value
        {
            get
            {
                var result = new RTLBitArrayWrapper(InstanceCreationType.SByte, 2, 3, 4, 5)
                {
                    L2 =
                    {
                        ClassArray = [
                            new RTLBitArrayWrapperL3(InstanceCreationType.SByte, 5)
                            {
                                Value = (sbyte)42,
                                ByteArray = [10, 20, 30, 40, 50]
                            }
                        ]
                    }
                };

                return result;
            }
        }
    }


}
