using Quokka.RTL;

namespace RTL.Modules
{
    public class ReceiverModule : RTLSynchronousModule<ReceiverInputs, ReceiverState>
    {
        // public data points
        public bool oHasData => State.FSM  == ReceiverFSM.WaitingForAck;
        public byte oData => State.Data;
        byte PartialData => (byte)(Inputs.iBit ? 0x80 : 0);

        protected override void OnStage()
        {
            switch(State.FSM)
            {
                case ReceiverFSM.Idle:
                    if (Inputs.iIsValid)
                    {
                        NextState.Data = PartialData;
                        NextState.FSM = ReceiverFSM.Receiving;
                    }
                    break;
                case ReceiverFSM.Receiving:
                    if (Inputs.iIsValid)
                    {
                        NextState.Data = (byte)((State.Data >> 1) | PartialData);
                    }
                    else
                    {
                        NextState.FSM = ReceiverFSM.WaitingForAck;
                    }
                    break;
                case ReceiverFSM.WaitingForAck:
                    if (Inputs.iAck)
                    {
                        NextState.FSM = ReceiverFSM.Idle;
                        NextState.Data = 0;
                    }
                    break;
            }
        }
    }
}
