using Quokka.Core.Attributes;
using Quokka.RTL;
using System;
using System.Linq;

namespace axi.modules
{
    public class AXI4InSignalArrayBufferModuleInput
    {
        public AXI4InSignalArrayBufferModuleInput() : this(axiSize.B4, 1, 1) { }
        public AXI4InSignalArrayBufferModuleInput(axiSize size, int width, int depth)
        {
            inWDATA = Enumerable.Range(0, depth).Select(_ => new RTLBitArray(false).Resized(width)).ToArray();
        }

        public RTLBitArray[] inWDATA = null;
    }

    public class AXI4InSignalArrayBufferModuleInputs
    {
        public AXI4InSignalArrayBufferModuleInputs() : this(axiSize.B4, 1, 1) { }
        public AXI4InSignalArrayBufferModuleInputs(axiSize size, int width, int depth)
        {
            M2S = new AXI4_M2S(size);
            Sig = new AXI4InSignalArrayBufferModuleInput(size, width, depth);
        }

        public AXI4_M2S M2S;
        public AXI4InSignalArrayBufferModuleInput Sig;
    }

    public class AXI4InSignalArrayBufferModuleState
    {
        public AXI4InSignalArrayBufferModuleState() : this(axiSize.B4, 1, 1) { }
        public AXI4InSignalArrayBufferModuleState(axiSize size, int width, int depth) 
        {
            buffer = Enumerable.Range(0, depth).Select(_ => new RTLBitArray(false).Resized(width)).ToArray();
        }

        public RTLBitArray[] buffer;
    }

    public class AXI4InSignalArrayBufferModule : RTLSynchronousModule<AXI4InSignalArrayBufferModuleInputs, AXI4InSignalArrayBufferModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        private readonly uint width;
        private readonly uint depth;
        private readonly int rAddrBits;
        private readonly int addressLSB;

        public AXI4InSignalArrayBufferModule(axiSize size, int width, int depth)
        {
            this.size = size;
            this.width = (uint)width;
            this.depth = (uint)depth;
            this.addressLSB = AXI4Tools.AddressLSB(size);
            this.rAddrBits = AXITools.log2(depth);

            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4InSignalArrayBufferModuleInputs(size, width, depth));
            InitState(new AXI4InSignalArrayBufferModuleState(size, width, depth));
        }

        public RTLBitArray[] outBuffer => State.buffer;

        public AXI4_S2M S2M => axiSlave.S2M;

        protected override void OnSchedule(Func<AXI4InSignalArrayBufferModuleInputs> inputsFactory)
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
                inRDATA = State.buffer[rAddr],
            });
        }

        RTLBitArray rAddr => new RTLBitArray(Inputs.M2S.R.AR.ARADDR >> addressLSB)[rAddrBits - 1, 0];
        
        protected override void OnStage()
        {
            if (!axiSlave.outARREADYConfirming)
            {
                NextState.buffer = Inputs.Sig.inWDATA;
            }
        }
    }
}
