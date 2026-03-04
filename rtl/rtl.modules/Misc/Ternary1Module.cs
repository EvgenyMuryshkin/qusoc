using Quokka.RTL;

namespace RTL.Modules
{
    public class TernaryModuleInputs
    {
        public bool Bit;
    }
    /*
    // buffer for inputs






    */
    public class Ternary1Module : RTLCombinationalModule<TernaryModuleInputs>
    {
        public byte Output1 => (byte)(Inputs.Bit ? 0x80 : 0);
        public byte Output2 => (byte)(Inputs.Bit ? 0 : 0x80);
    }

    public class Ternary2Module : RTLCombinationalModule<TernaryModuleInputs>
    {
        public byte Output1 => (byte)(Inputs.Bit ? 0x80 : sbyte.MaxValue);
        public byte Output2 => (byte)(Inputs.Bit ? sbyte.MaxValue : 0x80);
    }

    public class Ternary3Module : RTLCombinationalModule<TernaryModuleInputs>
    {
        public sbyte Output1 => (sbyte)(Inputs.Bit ? 0x80 : byte.MaxValue);
        public sbyte Output2 => (sbyte)(Inputs.Bit ? sbyte.MaxValue : 0x80);
    }

    public class Ternary4Module : RTLCombinationalModule<TernaryModuleInputs>
    {
        public short Output1 => (short)(Inputs.Bit ? 0x80 : sbyte.MinValue);
        public short Output2 => (short)(Inputs.Bit ? byte.MaxValue : sbyte.MaxValue);
    }

    public class Ternary5Module : RTLCombinationalModule<TernaryModuleInputs>
    {
        public RTLBitArray Output1 => (sbyte)(Inputs.Bit ? new RTLBitArray(true) : new RTLBitArray(byte.MaxValue));
        public RTLBitArray Output2 => (sbyte)(Inputs.Bit ? new RTLBitArray(RTLBitArrayInitType.MSB, "11000110") : new RTLBitArray(RTLBitArrayInitType.LSB, true, false, true, false));
    }
}

