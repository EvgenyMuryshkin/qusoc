using Quokka.Core.Attributes;
using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXI4RegisterModuleInput
    {
        public AXI4RegisterModuleInput() : this(axiSize.B4) { }
        public AXI4RegisterModuleInput(axiSize size)
        {
            inWDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public bool inWE = false;
        public byte[] inWDATA = null;
    }

    public class AXI4RegisterModuleInputs
    {
        public AXI4RegisterModuleInputs() : this(axiSize.B4) { }
        public AXI4RegisterModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            Reg = new AXI4RegisterModuleInput(size);
        }

        public AXI4_M2S M2S;
        [OptionalIdentifier]
        public AXI4RegisterModuleInput Reg;
    }

    public class AXI4RegisterModuleState
    {
        public AXI4RegisterModuleState() : this(axiSize.B4) { }
        public AXI4RegisterModuleState(axiSize size) 
        {
            bytes = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[] bytes;
        public bool Written;
    }

    public class AXI4RegisterModule : RTLSynchronousModule<AXI4RegisterModuleInputs, AXI4RegisterModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        public AXI4RegisterModule(axiSize size)
        {
            this.size = size;
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4RegisterModuleInputs(size));
            InitState(new AXI4RegisterModuleState(size));
        }

        public byte[] outData => State.bytes;
        public bool outACK => Inputs.Reg.inWE;

        public AXI4_S2M S2M => axiSlave.S2M;
        public bool outWritten => State.Written;

        protected override void OnSchedule(Func<AXI4RegisterModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inARREADY = true,
                inRVALID = true,
                inAWREADY = true,
                inWREADY = !Inputs.Reg.inWE,
                inBVALID = true,
                inRDATA = State.bytes,
            });
        }
        protected override void OnStage()
        {
            NextState.Written = Inputs.Reg.inWE || axiSlave.outWREADYConfirming;

            if (Inputs.Reg.inWE)
            {
                NextState.bytes = Inputs.Reg.inWDATA;
            }
            else if (axiSlave.outWREADYConfirming)
            {
                foreach (var w in range(AXI4Tools.Bytes(size)))
                {
                    if (axiSlave.outWSTRB[w])
                        NextState.bytes[w] = axiSlave.outWDATA[w];
                }
            } 
        }
    }
}
