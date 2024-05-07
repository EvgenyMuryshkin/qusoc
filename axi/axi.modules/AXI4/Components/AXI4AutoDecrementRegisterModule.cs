using Quokka.Core.Attributes;
using Quokka.RTL;
using System;

namespace axi.modules
{
    public class AXI4AutoDecrementRegisterModuleInput
    {
        public AXI4AutoDecrementRegisterModuleInput() : this(axiSize.B4) { }
        public AXI4AutoDecrementRegisterModuleInput(axiSize size)
        {
            inWDATA = new byte[AXI4Tools.Bytes(size)];
        }

        public bool inWE = false;
        public byte[] inWDATA = null;
    }

    public class AXI4AutoDecrementRegisterModuleInputs
    {
        public AXI4AutoDecrementRegisterModuleInputs() : this(axiSize.B4) { }
        public AXI4AutoDecrementRegisterModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
            Reg = new AXI4AutoDecrementRegisterModuleInput(size);
        }

        public AXI4_M2S M2S;
        [OptionalIdentifier]
        public AXI4AutoDecrementRegisterModuleInput Reg;
    }

    public class AXI4AutoDecrementRegisterModuleState
    {
        public AXI4AutoDecrementRegisterModuleState() : this(axiSize.B4) { }
        public AXI4AutoDecrementRegisterModuleState(axiSize size) 
        {
            bytes = new byte[AXI4Tools.Bytes(size)];
        }

        public byte[] bytes;
        public bool Written;
    }

    public class AXI4AutoDecrementRegisterModule : RTLSynchronousModule<AXI4AutoDecrementRegisterModuleInputs, AXI4AutoDecrementRegisterModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        private readonly int sizeBits;

        public AXI4AutoDecrementRegisterModule(axiSize size)
        {
            this.size = size;
            sizeBits = AXI4Tools.Bits(size);
            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4AutoDecrementRegisterModuleInputs(size));
            InitState(new AXI4AutoDecrementRegisterModuleState(size));
        }

        public byte[] outData => State.bytes;
        public bool outACK => Inputs.Reg.inWE;

        public AXI4_S2M S2M => axiSlave.S2M;
        public bool outWritten => State.Written;

        protected override void OnSchedule(Func<AXI4AutoDecrementRegisterModuleInputs> inputsFactory)
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

        RTLBitArray stateValue => new RTLBitArray(State.bytes);
        RTLBitArray decrement => (stateValue - 1).Unsigned().Resized(sizeBits);

        protected override void OnStage()
        {
            NextState.Written = Inputs.Reg.inWE || axiSlave.outWREADYConfirming;

            if (stateValue != 0)
                NextState.bytes = decrement;

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
