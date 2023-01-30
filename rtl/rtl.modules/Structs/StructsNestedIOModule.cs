using Quokka.RTL;
using System.Linq;

namespace RTL.Modules
{
    public class NestedClassL2
    {
        public NestedClassL2(int bitArraySize)
        {
            boolValue = new bool[bitArraySize];
            bitArray = new RTLBitArray().Resized(bitArraySize);
        }

        public bool[] boolValue;
        public RTLBitArray bitArray;
    }

    public class NestedClassL1
    {
        public NestedClassL1(int l2Size, int bitArray)
        {
            l2 = new NestedClassL2(bitArray);
            l2Array = Enumerable.Range(0, l2Size).Select(i => new NestedClassL2(bitArray)).ToArray();
        }

        public NestedClassL2 l2;

        public NestedClassL2[] l2Array;
        public byte byteValue;
    }

    public class TopLevelClass
    {
        public TopLevelClass(int l1Size, int l2Size, int bitArray)
        {
            l1 = new NestedClassL1(l2Size, bitArray);
            l1Array = Enumerable.Range(0, l1Size).Select(i => new NestedClassL1(l2Size, bitArray)).ToArray();
        }

        public NestedClassL1 l1;

        public NestedClassL1[] l1Array;
        public ushort intValue;
    }

    public class StructsNestedIOModuleInputs
    {
        public TopLevelClass Value = new TopLevelClass(2, 2, 2);
    }

    public class StructsNestedIOModuleState
    {
    }

    public class StructsNestedIOModule : RTLSynchronousModule<StructsNestedIOModuleInputs, StructsNestedIOModuleState>
    {
        public TopLevelClass oDirect => Inputs.Value;

        protected override void OnStage()
        {
        }
    }
}
