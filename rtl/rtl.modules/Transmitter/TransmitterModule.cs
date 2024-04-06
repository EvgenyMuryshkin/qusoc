using Quokka.RTL;

namespace RTL.Modules
{
    public class TransmitterModule : RTLSynchronousModule<TransmitterInputs, TransmitterState>
    {
        // public data points
        public bool oBit => State.Data[0];
        public bool oIsReady => State.FSM  == TransmitterFSM.Idle;
        public bool oIsTransmitting => State.FSM == TransmitterFSM.Transmitting;
        public bool oIsTransmissionStarted => State.FSM == TransmitterFSM.Idle && NextState.FSM == TransmitterFSM.Transmitting;
        protected override void OnStage()
        {
            switch(State.FSM)
            {
                case TransmitterFSM.Idle:
                    if (Inputs.iTrigger)
                    {
                        NextState.Counter = 0;
                        NextState.Data = Inputs.iData;
                        NextState.FSM = TransmitterFSM.Transmitting;
                    }
                    break;
                case TransmitterFSM.Transmitting:
                    if (State.Counter == 7)
                    {
                        NextState.FSM = TransmitterFSM.WaitingForAck;
                    }
                    else
                    {
                        NextState.Counter = (byte)(State.Counter + 1);
                    }
                    NextState.Data = State.Data >> 1;
                    break;
                case TransmitterFSM.WaitingForAck:
                    if (Inputs.iAck)
                        NextState.FSM = TransmitterFSM.Idle;
                    break;
            }
        }
    }
}
