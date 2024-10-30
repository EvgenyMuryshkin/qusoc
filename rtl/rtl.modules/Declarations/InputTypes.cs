using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RTL.Modules
{
    public class NativeInputs
    {
        public bool iBool;
        public byte iByte;
    }
    public class NativeArrayInputs
    {
        public bool[] iBool = new bool[2];
        public byte[] iByte = new byte[3];
    }

    public class RTLBitArrayInputs
    {
        public RTLBitArray iValue = new RTLBitArray().Resized(42);
    }

    public class RTLBitArrayArrayInputs
    {
        public RTLBitArray[] iValue = new[] { new RTLBitArray().Resized(42), new RTLBitArray().Resized(42) };
    }

    public class ClassInputs
    {
        public bool iBool;
        public byte iByte;
        public RTLBitArrayInputs iValue = new RTLBitArrayInputs();
    }

    public class NativeTupleInputs
    {
        public (bool, byte) iValue = (true, 42);
    }

    public class RTLBitArrayTupleInputs
    {
        public (bool, RTLBitArray) iValue = (true, new RTLBitArray().Resized(42));
    }

    public class ClassTupleInputs
    {
        public (bool, ClassInputs) iValue = (true, new ClassInputs());
    }

    public class ClassArrayInputs
    {
        public ClassInputs[] iValues = new [] { new ClassInputs(), new ClassInputs() }; 
    }
}
