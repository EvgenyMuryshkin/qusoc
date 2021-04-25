using Quokka.Public.Tools;
using Quokka.RTL;
using Quokka.RTL.Tools;

namespace RTL.Modules
{
    public class TimerInputs
    {
        public bool Restart;
    }

    public class TimerState
    {
        public RTLBitArray counter;
    }

    public class TimerModule : RTLSynchronousModule<TimerInputs, TimerState>
    {
        private readonly RTLBitArray countTo;
        private readonly uint CapacityBits;

        public delegate TimerModule Factory(ulong clocks);

        public TimerModule(ulong clocks)
        {
            var maxCount = clocks - 1;
            CapacityBits = RTLCalculators.CalcBitsForValue(maxCount);
            countTo = new RTLBitArray(maxCount).Resized(CapacityBits).Unsigned();
        }

        public override bool OnRelatedObjectCreating(object data)
        {
            switch (data)
            {
                case TimerState state:
                {
                    state.counter = new RTLBitArray().Resized(CapacityBits).Unsigned();
                    return true;
                }
                default:
                {
                    return base.OnRelatedObjectCreating(data);
                }
            }
        }

        bool active => State.counter == countTo;
        public bool OutActive => active;

        protected override void OnStage()
        {
            NextState.counter = ((Inputs.Restart || active) ? new RTLBitArray(0) : State.counter + 1).Resized(CapacityBits).Unsigned();
        }
    }
}
