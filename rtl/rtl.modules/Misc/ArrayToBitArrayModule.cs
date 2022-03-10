using Quokka.RTL;

namespace RTL.Modules
{
    public class ArrayToBitArrayModuleInputs
    {
        public byte[] InArray = new byte[4];
    }

    public class ArrayToBitArrayModuleState
    {
        public byte[] ReadData = new byte[4];
    }

    public class ArrayToBitArrayModule : RTLSynchronousModule<ArrayToBitArrayModuleInputs, ArrayToBitArrayModuleState>
    {
        public byte[] OutInputsArray => Inputs.InArray;
        public byte[] OutDataArray => State.ReadData;

        public RTLBitArray OutInputsBitArray => new RTLBitArray(Inputs.InArray);
        public RTLBitArray OutDataBitArray => new RTLBitArray(State.ReadData);

        protected override void OnStage()
        {
            NextState.ReadData = Inputs.InArray;
        }
    }
}

