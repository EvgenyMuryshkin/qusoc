using Quokka.RTL;
using System;

namespace RTL.Modules
{
    public class IOTestModuleInputs
    {
        public IOTestModuleInputs() { }
        public IOTestModuleInputs(uint size) { InArray = new byte[size]; }

        public bool InFlag { get; set; }
        public byte[] InArray { get; set; } = null;
    }

    public class IOTestModuleState
    {
        public IOTestModuleState() { }
        public IOTestModuleState(uint size)
        {
            Array = new byte[size];
            IteratorArray = new byte[size];
        }

        public bool Flag { get; set; }
        public byte[] Array { get; set; } = null;
        public byte[] IteratorArray { get; set; } = null;
    }

    public class IOTestModuleNestedClassOutput
    {
        public bool Flag { get; set; }
        public byte[] Array { get; set; } = null;
    }

    public class IOTestModuleClassOutput
    {
        public bool Flag { get; set; }
        public byte[] Array { get; set; } = null;
        public IOTestModuleNestedClassOutput Nested { get; set; } = null;
    }

    public class IOTestModule : RTLSynchronousModule<IOTestModuleInputs, IOTestModuleState>
    {
        readonly uint size;
        public IOTestModule()
        {
            size = 2;
            InitInputs(new IOTestModuleInputs(size));
            InitState(new IOTestModuleState(size));
        }

        public IOTestModuleClassOutput ClassOut => new IOTestModuleClassOutput()
        {
            Flag = State.Flag,
            Array = State.Array,
            Nested = new IOTestModuleNestedClassOutput()
            {
                Flag = State.Flag,
                Array = State.IteratorArray
            }
        };
        public IOTestModuleNestedClassOutput NestedClassOut => new IOTestModuleNestedClassOutput()
        {
            Flag = State.Flag,
            Array = State.Array
        };
        public byte[] OutIteratorArray => State.IteratorArray;
        public byte[] OutStateArray => State.Array;
        public byte[] OutDirectArray => Inputs.InArray;
        public bool OutFlag => State.Flag;

        protected override void OnStage()
        {
            NextState.Flag = Inputs.InFlag;

            if (Inputs.InFlag)
                NextState.Array = Inputs.InArray;

            foreach (var idx in range(size))
                NextState.IteratorArray[idx] = Inputs.InArray[idx];
        }
    }
}

