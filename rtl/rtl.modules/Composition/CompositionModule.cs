using Quokka.RTL;
using System;

namespace RTL.Modules
{
    public class CompositionInputs
    {
        public bool iIsEnabled = true;
    }

    public class CompositionModule : RTLCombinationalModule<CompositionInputs>
    {
        public EmitterModule Emitter = new EmitterModule();
        public TransmitterModule Transmitter = new TransmitterModule();
        public ReceiverModule Receiver = new ReceiverModule();

        public bool oHasData => Receiver.oHasData;
        public byte oData => Receiver.oData;
        //public bool oIsTransmissionStarted => Transmitter.oIsTransmissionStarted;

        protected override void OnSchedule(Func<CompositionInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            Emitter.Schedule(() => new EmitterInputs()
                {
                    iIsEnabled = Inputs.iIsEnabled,
                    iAck = Transmitter.oIsReady
                });

            Transmitter.Schedule(() => new TransmitterInputs()
                {
                    iTrigger = Emitter.oHasData,
                    iData = Emitter.oData,
                    iAck = Receiver.oHasData
               });

            Receiver.Schedule(() => new ReceiverInputs()
                {
                    iIsValid = Transmitter.oIsTransmitting,
                    iBit = Transmitter.oBit,
                    iAck = true
                });
        }
    }
}
