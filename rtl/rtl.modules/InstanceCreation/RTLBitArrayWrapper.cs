using Quokka.RTL;
using System.Linq;

namespace rtl.modules
{
    public enum InstanceCreationType
    {
        Byte,
        SByte,
        Int,
        UInt
    }

    public class RTLBitArrayWrapperL3
    {
        public RTLBitArrayWrapperL3(InstanceCreationType type, int byteArraySize)
        {
            switch (type)
            {
                case InstanceCreationType.Byte: Value = new RTLBitArray(byte.MaxValue); break;
                case InstanceCreationType.SByte: Value = new RTLBitArray(sbyte.MinValue); break;
                case InstanceCreationType.Int: Value = new RTLBitArray(int.MinValue); break;
                case InstanceCreationType.UInt: Value = new RTLBitArray(uint.MaxValue); break;
            }

            ByteArray = Enumerable.Range(0, byteArraySize).Select(i => (byte)i).ToArray();
        }

        [RTLOptionalInitializer]
        public RTLBitArray Value;

        [RTLOptionalInitializer]
        public byte[] ByteArray;
    }

    public class RTLBitArrayWrapperL2
    {
        public RTLBitArrayWrapperL2(
            InstanceCreationType type, 
            int l2ByteArraySize, 
            int l2ClassArraySize,
            int l3ByteArraySize
        )
        {
            switch (type)
            {
                case InstanceCreationType.Byte: Value = new RTLBitArray(byte.MaxValue); break;
                case InstanceCreationType.SByte: Value = new RTLBitArray(sbyte.MinValue); break;
                case InstanceCreationType.Int: Value = new RTLBitArray(int.MinValue); break;
                case InstanceCreationType.UInt: Value = new RTLBitArray(uint.MaxValue); break;
            }

            ByteArray = Enumerable.Range(0, l2ByteArraySize).Select(i => (byte)i).ToArray();
            ClassArray = Enumerable.Range(0, l2ClassArraySize).Select(i => new RTLBitArrayWrapperL3(type, l3ByteArraySize)).ToArray();
        }

        [RTLOptionalInitializer]
        public RTLBitArray Value;

        [RTLOptionalInitializer]
        public byte[] ByteArray;

        [RTLOptionalInitializer]
        public RTLBitArrayWrapperL3[] ClassArray;
    }

    public class RTLBitArrayWrapper
    {
        public RTLBitArrayWrapper(
            InstanceCreationType type, 
            int l1ByteArraySize, 
            int l2ByteArraySize,
            int l2ClassArraySize,
            int l3ByteArraySize
        ) 
        {
            switch (type)
            {
                case InstanceCreationType.Byte: Value = new RTLBitArray(byte.MaxValue); break;
                case InstanceCreationType.SByte: Value = new RTLBitArray(sbyte.MinValue); break;
                case InstanceCreationType.Int: Value = new RTLBitArray(int.MinValue); break;
                case InstanceCreationType.UInt: Value = new RTLBitArray(uint.MaxValue); break;
            }

            ByteArray = Enumerable.Range(0, l1ByteArraySize).Select(i => (byte)i).ToArray();

            L2 = new RTLBitArrayWrapperL2(type, l2ByteArraySize, l2ClassArraySize, l3ByteArraySize);
        }

        [RTLOptionalInitializer]
        public RTLBitArray Value;

        [RTLOptionalInitializer]
        public byte[] ByteArray;

        [RTLOptionalInitializer]
        public RTLBitArrayWrapperL2 L2;
    }
}
