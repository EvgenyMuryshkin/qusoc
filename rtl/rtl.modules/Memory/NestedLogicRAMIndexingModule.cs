using Quokka.RTL;

namespace RTL.Modules
{
    public class NestedLogicRAMIndexingModuleInputs
    {
        public bool WE;
        public RTLBitArray WriteAddr = new RTLBitArray().Resized(2);
        public byte WriteData;

        public RTLBitArray ReadAddr = new RTLBitArray().Resized(2);
    }

    public class NestedLogicRAMIndexingModuleStateBuff
    {
        public byte[] Buff = new byte[4];
    }

    public class NestedLogicRAMIndexingModuleState
    {
        public byte Counter;
        public NestedLogicRAMIndexingModuleStateBuff Nested = new NestedLogicRAMIndexingModuleStateBuff();
    }

    public class NestedLogicRAMIndexingModule : RTLSynchronousModule<NestedLogicRAMIndexingModuleInputs, NestedLogicRAMIndexingModuleState>
    {
        public byte oValue => State.Nested.Buff[Inputs.ReadAddr];

        protected override void OnStage()
        {
            if (Inputs.WE)
            {
                NextState.Counter = (byte)(State.Counter + 1);
                NextState.Nested.Buff[Inputs.WriteAddr] = Inputs.WriteData;
            }
        }
    }
}
