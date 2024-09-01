using Quokka.RTL;
using System;
using System.Diagnostics;

namespace axi.modules
{
    public class AXI4UARTModuleInputs
    {
        public AXI4UARTModuleInputs() : this(axiSize.B4) { }
        public AXI4UARTModuleInputs(axiSize size)
        {
            M2S = new AXI4_M2S(size);
        }

        public AXI4_M2S M2S;
        public bool iRX;
        public bool iEN_RX = true;
        public bool iEN_TX = true;
    }

    public class AXI4UARTModule : RTLCombinationalModule<AXI4UARTModuleInputs>
    {
        private readonly int clocksPerBit = 0;
        private readonly int halfClocksPerBit = 0;
        private readonly axiSize size;
        private readonly int sizeBits;
        internal AXI4NonBufferedSlaveModule axiSlave;
        internal UARTTransmitterModule uartTransmitter;
        internal UARTReceiverModule uartReceiver;
        internal FIFOModule transmitterFIFO;
        internal FIFOModule receiverFIFO;
        internal UARTClockControlModule uartClockControl;

        public AXI4UARTModule(axiSize size, int depth, int clocksPerBit)
        {
            this.clocksPerBit = clocksPerBit;
            this.halfClocksPerBit = clocksPerBit / 2;
            this.size = size;
            this.sizeBits = AXI4Tools.Bits(size);

            axiSlave = new AXI4NonBufferedSlaveModule(size);
            uartTransmitter = new UARTTransmitterModule();
            uartReceiver = new UARTReceiverModule();
            receiverFIFO = new FIFOModule(8, depth);
            transmitterFIFO = new FIFOModule(8, depth);
            uartClockControl = new UARTClockControlModule(clocksPerBit);

            InitInputs(new AXI4UARTModuleInputs(size));
        }

        protected override void OnSchedule(Func<AXI4UARTModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            axiSlave.Schedule(() => new AXI4NonBufferedSlaveModuleInputs()
            {
                M2S = Inputs.M2S,
                inARREADY = true,
                inRVALID = true,//receiverFIFO.oRACK,// true,
                inAWREADY = true,
                inWREADY = true,//!transmitterFIFO.oIsFull,
                inBVALID = true,
                inRDATA = rdata,
            });

            uartClockControl.Schedule(() => new()
            {
                iEN_RX = Inputs.iEN_RX,
                iEN_TX = Inputs.iEN_TX,
                iRX = Inputs.iRX,
                iReceiverValid = uartReceiver.oValid,
                iTransmitting = uartTransmitter.oTransmitting
            });

            uartReceiver.Schedule(() => new()
            {
                iCE = uartClockControl.oRXCE,
                iRX = uartClockControl.oRX,
                iACK = !receiverFIFO.oIsFull
            });

            uartTransmitter.Schedule(() => new()
            {
                iCE = uartClockControl.oTXCE,
                iValid = transmitterFIFO.oRACK,
                iValue = transmitterFIFO.oRData
            });

            transmitterFIFO.Schedule(() => new()
            {
                iWE = axiSlave.outWREADYConfirming,
                iWData = axiSlave.outWDATA[0],
                iRE = !uartTransmitter.oTransmitting && !uartTransmitter.oWillStartTransmitting
            });

            receiverFIFO.Schedule(() => new()
            {
                iWE = uartReceiver.oValid,
                iWData = uartReceiver.oValue,
                iRE = !receiverFIFO.oIsEmpty && axiSlave.outARREADYConfirming && byteAddr == 0,//axiReadTransactionCompleting
            });
        }

        RTLBitArray byteAddr => new RTLBitArray(axiSlave.outARADDR)[1, 0];

        RTLBitArray rdata 
            => new RTLBitArray(
                RTLBitArrayInitType.MSB,
                transmitterFIFO.oIsFull ? (byte)1 : (byte)0,
                transmitterFIFO.oIsEmpty ? (byte)1 : (byte)0,
                receiverFIFO.oRValid ? (byte)1 : (byte)0,
                receiverFIFO.oRData//uartReceiver.oValue
            ).Resized(sizeBits);

        //bool axiReadTransactionCompleting => axiSlave.outReadTXCompleting && byteAddr == 0;
        //bool axiReadTransactionCompleting => axiSlave.outARREADYConfirming && byteAddr == 0;
        public bool oTX => uartTransmitter.oTX;
        public bool oTransmitting => uartTransmitter.oTransmitting;
        public bool oCE => uartTransmitter.oCE;

        public AXI4_S2M oS2M => axiSlave.S2M;
        public byte oRXData => uartReceiver.oValue;
        public bool oRXValid => uartReceiver.oValid;

        public int oTXCounter => uartClockControl.oTXCounter;
        public int oRXCounter => uartClockControl.oRXCounter;
    }
}
