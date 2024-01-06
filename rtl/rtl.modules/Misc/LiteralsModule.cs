using Quokka.RTL;

namespace RTL.Modules
{
    public class LiteralsModuleInput
    { }

    public class LiteralsModule : RTLCombinationalModule<LiteralsModuleInput>
    { 
        public byte Byte => 42;
        public sbyte SByte => -1;
        public short Short => -1;
        public ushort UShort => 44;
        public int Int => -1;
        public uint UInt => 46;
        public long Long => -9223372036854775808L;
        public ulong ULong => 48UL;
        public long LongHex => 0x7000_FFFF_FFFF_FFFF;
        public ulong ULongHex => 0x8000_FFFF_FFFF_FFFF;
        public byte BinaryByte => 0b_1001_0110;
        public short BinaryShort => 0b_1001_0110_1010;
        public int BinaryInt => 0b_1001_0110_1010_1111_0000;
    }
}

