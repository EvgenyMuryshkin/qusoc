using Quokka.RTL;

namespace axi.modules
{
    public class UARTReceiverModuleInputs
    {
        public bool iCE;
        public bool iRX;
        public bool iACK;
    }

    public class UARTReceiverModuleState
    {
        public RTLBitArray rxValue = new RTLBitArray(RTLBitArrayInitType.MSB, true, byte.MaxValue);
    }

    public class UARTReceiverModule : RTLSynchronousModule<UARTReceiverModuleInputs, UARTReceiverModuleState>
    {
        bool iValid => !State.rxValue[0];
        public byte oValue => State.rxValue[8, 1];
        public bool oValid => iValid;

        protected override void OnStage()
        {
            if (Inputs.iACK)
            {
                NextState.rxValue = new RTLBitArray(RTLBitArrayInitType.MSB, true, byte.MaxValue);
            }
            else if (Inputs.iCE)
            {
                if (!iValid)
                {
                    NextState.rxValue = new RTLBitArray(RTLBitArrayInitType.MSB, Inputs.iRX, State.rxValue[8, 1]);
                }
                else if (!Inputs.iRX)
                {
                    NextState.rxValue = new RTLBitArray(RTLBitArrayInitType.MSB, Inputs.iRX, byte.MaxValue);
                }
            }
        }
    }
}
