using Quokka.RTL;

namespace RTL.Modules
{
    public class CoderInputs
    {
        public ushort dec;
    }
    public class CoderState
    {
        public ushort counter;
    }
    public class CoderModule : RTLSynchronousModule<CoderInputs, CoderState>
    {
        RTLBitArray INNone => new RTLBitArray(0).Resized(2);
        RTLBitArray INx
        {
            get
            {
                byte result = 0;
                if (State.counter >= 1 && State.counter <= 5)
                    result = 2;

                if (State.counter >= 7 && State.counter <= 11)
                    result = 1;

                if (State.counter >= 751 && State.counter <= 2501)
                    result = 3;

                return new RTLBitArray(result)[1, 0];
            }
        }
        public RTLBitArray IN1 => Inputs.dec == 0xFFFE ? INx : INNone;
        public RTLBitArray IN2 => Inputs.dec == 0xFFFD ? INx : INNone;
        // copy-paste more
        protected override void OnStage()
        {
            NextState.counter = (ushort)(State.counter == 25001 ? 0 : State.counter + 1);
        }
    }
}

