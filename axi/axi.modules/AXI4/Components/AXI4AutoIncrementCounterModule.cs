using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXI4AutoIncrementCounterModuleInputs
    {
        public AXI4AutoIncrementCounterModuleInputs() : this(axiSize.B4) { }

        public AXI4AutoIncrementCounterModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
        }

        public AXI4_M2S M2S;
    }

    public class AXI4AutoIncrementCounterModuleState
    {
        public AXI4AutoIncrementCounterModuleState() : this(axiSize.B4) { }
        public AXI4AutoIncrementCounterModuleState(axiSize size)
        {
            counter = new RTLBitArray().Unsigned().Resized(AXI4Tools.Bits(size));
        }

        public RTLBitArray counter;
        public bool Written;
    }

    public class AXI4AutoIncrementCounterModule : RTLSynchronousModule<AXI4AutoIncrementCounterModuleInputs, AXI4AutoIncrementCounterModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        private readonly int axiBits;
        public AXI4AutoIncrementCounterModule(axiSize size)
        {
            this.size = size;
            axiBits = AXI4Tools.Bits(size);
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4AutoIncrementCounterModuleInputs(size));
            InitState(new AXI4AutoIncrementCounterModuleState(size));
        }

        public RTLBitArray oCounter => State.counter;
        public AXI4_S2M S2M => axiSlave.S2M;
        public bool outWritten => State.Written;

        protected override void OnSchedule(Func<AXI4AutoIncrementCounterModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inARREADY = true,
                inRVALID = true,
                inAWREADY = false,
                inWREADY = false,
                inBVALID = false,
                inRDATA = State.counter,
            });
        }
        protected override void OnStage()
        {
            NextState.Written = axiSlave.outReadTXCompleting;

            if (axiSlave.outReadTXCompleting)
            {
                NextState.counter = (State.counter + 1).Unsigned().Resized(axiBits);// TODO: type change with resize para,eter
            }
        }
    }
}
