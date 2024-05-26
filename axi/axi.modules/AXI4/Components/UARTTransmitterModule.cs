﻿using Quokka.RTL;

namespace axi.modules
{
    public class UARTTransmitterModuleInputs
    {
        public bool iCE;
        public byte iValue;
        public bool iValid;
    }

    public class UARTTransmitterModuleState
    {
        public RTLBitArray txValue = new RTLBitArray(RTLBitArrayInitType.MSB, true, true, byte.MaxValue).Resized(11);
        public byte txCounter;
        public bool transmitting;
    }

    public class UARTTransmitterModule : RTLSynchronousModule<UARTTransmitterModuleInputs, UARTTransmitterModuleState>
    {
        public UARTTransmitterModule()
        {

        }

        public bool oTX => State.txValue[0];
        public bool oTransmitting => State.transmitting;
        public bool oCE => Inputs.iCE;

        protected override void OnStage()
        {
            if (State.transmitting)
            {
                if (Inputs.iCE)
                {
                    if (State.txCounter == 10)
                    {
                        NextState.transmitting = false;
                    }
                    else
                    {
                        NextState.txCounter = (byte)(State.txCounter + 1);
                        NextState.txValue = new RTLBitArray(RTLBitArrayInitType.MSB, true, State.txValue[10, 1]);
                    }
                }
            }
            else if (Inputs.iValid)
            {
                NextState.txValue = new RTLBitArray(
                    RTLBitArrayInitType.MSB,
                    true, // stop bit
                    Inputs.iValue, //MSB value
                    false, // start bit,
                    true
                );
                NextState.transmitting = true;
                NextState.txCounter = 0;
            }
        }
    }
}