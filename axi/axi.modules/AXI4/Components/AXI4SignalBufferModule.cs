using Quokka.Core.Attributes;
using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXI4SignalBufferModuleInput
    {
        public AXI4SignalBufferModuleInput() : this(axiSize.B4) { }
        public AXI4SignalBufferModuleInput(axiSize size)
        {
            inWDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[] inWDATA = null;
    }

    public class AXI4SignalBufferModuleInputs
    {
        public AXI4SignalBufferModuleInputs() : this(axiSize.B4) { }
        public AXI4SignalBufferModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            Sig = new AXI4SignalBufferModuleInput(size);
        }

        public AXI4_M2S M2S;
        public AXI4SignalBufferModuleInput Sig;
    }

    public class AXI4SignalBufferModuleState
    {
        public AXI4SignalBufferModuleState() : this(axiSize.B4) { }
        public AXI4SignalBufferModuleState(axiSize size) 
        {
            bytes = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[] bytes;
    }

    public class AXI4SignalBufferModule : RTLSynchronousModule<AXI4SignalBufferModuleInputs, AXI4SignalBufferModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        public AXI4SignalBufferModule(axiSize size)
        {
            this.size = size;
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4SignalBufferModuleInputs(size));
            InitState(new AXI4SignalBufferModuleState(size));
        }

        public byte[] outData => State.bytes;

        public AXI4_S2M S2M => axiSlave.S2M;

        protected override void OnSchedule(Func<AXI4SignalBufferModuleInputs> inputsFactory)
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
                inRDATA = State.bytes,
            });
        }

        protected override void OnStage()
        {
            if (!axiSlave.outARREADYConfirming)
            {
                NextState.bytes = Inputs.Sig.inWDATA;
            }
        }
    }
}
