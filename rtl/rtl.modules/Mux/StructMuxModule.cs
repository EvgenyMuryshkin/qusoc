using Quokka.RTL;

namespace RTL.Modules
{
    public struct StructMuxData
    {
        public byte i1;
        public byte i2;
    }

    public class StructMuxModuleInputs
    {
        public bool selector;
        public StructMuxData s1;
        public StructMuxData s2;
    }

    public class StructMuxModule : RTLCombinationalModule<StructMuxModuleInputs>
    {
        // direct ternary output
        public StructMuxData os1 => Inputs.selector ? Inputs.s1 : Inputs.s2;
        // direct output of internal ternary
        StructMuxData ii1 => Inputs.s1;
        StructMuxData is2 => Inputs.selector ? ii1 : Inputs.s2;
        public StructMuxData os2 => is2;
        StructMuxData is3 => Inputs.selector
            ? new StructMuxData()
            {
                i1 = ii1.i1,
                i2 = Inputs.s1.i2
            }
            : new StructMuxData()
            {
                i1 = is2.i1,
                i2 = Inputs.s2.i2
            };
        public StructMuxData os3 => is3;
        public StructMuxData os4 => Inputs.selector
            ? new StructMuxData()
            {
                i1 = ii1.i1,
                i2 = Inputs.s1.i2
            }
            : new StructMuxData()
            {
                i1 = is2.i1,
                i2 = Inputs.s2.i2
            };
    }
}
