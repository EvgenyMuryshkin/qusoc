using Quokka.RTL;

namespace RTL.Modules
{
    public class EmitterInputs
    {
        public bool iIsEnabled = false;
        public bool iAck = false;
    }

    public class EmitterState
    {
        public byte Data = byte.MinValue;
    }

    public class EmitterModule : RTLSynchronousModule<EmitterInputs, EmitterState>
    {
        public byte oData => State.Data;
        public bool oHasData => Inputs.iIsEnabled;
        
        protected override void OnStage()
        {
            if (Inputs.iIsEnabled && Inputs.iAck)
                NextState.Data = (byte)(State.Data + 1);
        }
    }
}
