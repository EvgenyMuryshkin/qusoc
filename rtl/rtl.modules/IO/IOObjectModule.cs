using Quokka.RTL;

namespace RTL.Modules
{
    public class IOObjectModule3
    {
        public bool L3Boolean;
        public (bool, RTLBitArray) L3Tuple = (true, new RTLBitArray().Resized(2));
        public (bool, RTLBitArray)[] L3TupleArray = new[] { (true, new RTLBitArray().Resized(2)), (true, new RTLBitArray().Resized(2)) };
        public RTLBitArray[] L3RTLBitArray = new[] { new RTLBitArray().Resized(2), new RTLBitArray().Resized(2) };
    }

    public class IOObjectModuleL2
    {
        public bool[] L2BooleanArray = new[] { false, false };
        public IOObjectModule3[] L2ObjectArray = new IOObjectModule3[2] { new IOObjectModule3(), new IOObjectModule3() };
    }

    public class IOObjectModuleL1
    {
        public byte L1Byte;
        public (bool, RTLBitArray) L1Tuple = (true, new RTLBitArray().Resized(3));
        public IOObjectModuleL2 L1Object = new IOObjectModuleL2();
    }

    public class IOObjectModuleInputs
    {
        public IOObjectModuleL1 Object = new IOObjectModuleL1();
        public IOObjectModuleL1[] Objects = new[] { new IOObjectModuleL1(), new IOObjectModuleL1() };
    }

    public class IOObjectModuleState
    {
        public IOObjectModuleL1 Object = new IOObjectModuleL1();
        public IOObjectModuleL1[] Objects = new[] { new IOObjectModuleL1(), new IOObjectModuleL1() };
    }

    public class IOObjectModule : RTLSynchronousModule<IOObjectModuleInputs, IOObjectModuleState>
    {
        public IOObjectModuleL1 oInput => Inputs.Object;
        IOObjectModuleL1 iInput => Inputs.Object;

        protected override void OnStage()
        {
        }
    }
}
