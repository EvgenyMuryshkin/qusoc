using Quokka.Core.Attributes;
using Quokka.RTL;
using System;
using System.Linq;

namespace axi.modules
{
    public class AXI4OutSignalArrayBufferModuleInputs
    {
        public AXI4OutSignalArrayBufferModuleInputs() : this(axiSize.B4) { }
        public AXI4OutSignalArrayBufferModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
        }

        public AXI4_M2S M2S;
    }

    public class AXI4OutSignalArrayBufferModuleState
    {
        public AXI4OutSignalArrayBufferModuleState() : this(axiSize.B4, 1, 1) { }
        public AXI4OutSignalArrayBufferModuleState(axiSize size, int width, int depth) 
        {
            buffer = Enumerable.Range(0, depth).Select(_ => new RTLBitArray(false).Resized(width)).ToArray();
        }

        public RTLBitArray[] buffer;
    }

    public class AXI4OutSignalArrayBufferModule : RTLSynchronousModule<AXI4OutSignalArrayBufferModuleInputs, AXI4OutSignalArrayBufferModuleState>
    {
        internal AXI4NonBufferedSlaveModule axiSlave;
        private readonly axiSize size;
        private readonly int width;
        private readonly int depth;
        private readonly int wAddrBits;
        private readonly int addressLSB;

        public AXI4OutSignalArrayBufferModule(axiSize size, int width, int depth)
        {
            this.size = size;
            this.width = width;
            this.depth = depth;
            this.addressLSB = AXI4Tools.AddressLSB(size);
            this.wAddrBits = AXITools.log2(depth);

            axiSlave = new AXI4NonBufferedSlaveModule(size);
            InitInputs(new AXI4OutSignalArrayBufferModuleInputs(size));
            InitState(new AXI4OutSignalArrayBufferModuleState(size, width, depth));
        }

        RTLBitArray wAddr => new RTLBitArray(Inputs.M2S.W.AW.AWADDR >> addressLSB)[wAddrBits - 1, 0];
        RTLBitArray wData => new RTLBitArray(Inputs.M2S.W.W.WDATA)[width - 1, 0];

        public AXI4_S2M S2M => axiSlave.S2M;
        public RTLBitArray[] oBuffer => State.buffer;

        protected override void OnSchedule(Func<AXI4OutSignalArrayBufferModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inARREADY = false,
                inRVALID = false,
                inAWREADY = true,
                inWREADY = true,
                inBVALID = true,
                inRDATA = new RTLBitArray(0),
            });
        }

        protected override void OnStage()
        {
            if (!axiSlave.outWriteTXCompleting)
            {
                NextState.buffer[wAddr] = wData;
            }
        }
    }
}
