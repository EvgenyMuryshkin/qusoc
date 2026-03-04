using Quokka.RTL;
using Quokka.RTL.Tools;

namespace rtl.modules
{
    //"Void .ctor()"
    public class ConstantRTLBitArray_EmptyCtor_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray();
                return result;
            }
        }
    }

    //"Void .ctor(Quokka.RTL.RTLBitArray)"
    public class ConstantRTLBitArray_RTLBitArrayCtor_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(short.MinValue);
                return result;
            }
        }
    }

    //"Void .ctor(Quokka.RTL.RTLBitArrayInitType, Quokka.RTL.RTLBitArray[])"
    public class ConstantRTLBitArray_Ordered_Array_Of_RTLBitArrays_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(RTLBitArrayInitType.MSB, short.MinValue, byte.MaxValue);
                return result;
            }
        }
    }

    //"Void .ctor(Byte[])"
    public class ConstantRTLBitArray_ByteArray_ACESInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(new byte[] { 0, 1, 2, 3 });
                return result;
            }
        }
    }

    public class ConstantRTLBitArray_ByteArray_IACESInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(new[] { (byte)0, (byte)1, (byte)2, (byte)3 });
                return result;
            }
        }
    }

    public class ConstantRTLBitArray_ByteArray_CESInstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray([0, 1, 2, 3]);
                return result;
            }
        }
    }

    //"Void .ctor(System.Collections.Generic.IEnumerable`1[System.Boolean])"
    public class ConstantRTLBitArray_Enumerable_Boolean_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray([true, true, false, true]);
                return result;
            }
        }
    }

    //"Void .ctor(Quokka.RTL.RTLBitArrayInitType, System.Collections.Generic.IEnumerable`1[System.Boolean])"
    public class ConstantRTLBitArray_Ordered_Enumerable_Boolean_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(RTLBitArrayInitType.MSB, new bool[] { true, true, false, true });
                return result;
            }
        }
    }
    //"Void .ctor(Quokka.RTL.RTLBitArrayInitType, Quokka.RTL.Tools.RTLDataType, System.String, Int32)"
    public class ConstantRTLBitArray_Typed_Ordered_String_Size_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(RTLBitArrayInitType.MSB, RTLDataType.Signed, "11000", 10);
                return result;
            }
        }
    }

    //"Void .ctor(Quokka.RTL.RTLBitArrayInitType, Quokka.RTL.Tools.RTLDataType, System.String)"
    public class ConstantRTLBitArray_Typed_Ordered_String_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(RTLBitArrayInitType.MSB, RTLDataType.Signed, "11000");
                return result;
            }
        }
    }

    //"Void .ctor(Quokka.RTL.RTLBitArrayInitType, System.String)"
    public class ConstantRTLBitArray_Ordered_String_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var result = new RTLBitArray(RTLBitArrayInitType.MSB, "11000");
                return result;
            }
        }
    }

    public class RuntimeRTLBitArray_Ordered_Array_Of_RTLBitArrays_InstanceCreationModule : RTLCombinationalModule<InstanceCreationInputs>
    {
        public RTLBitArray Value
        {
            get
            {
                var value = false;

                var result = new RTLBitArray(RTLBitArrayInitType.LSB, true, value, true, byte.MaxValue);

                return result;
            }
        }
    }
}
