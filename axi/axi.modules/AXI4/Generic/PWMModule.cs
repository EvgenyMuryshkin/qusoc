using Quokka.RTL;
using System;

namespace axi.modules
{
    public class PWMModuleInputs
    {
        public bool iActive;
        public uint iDurationClocks;
        public uint iOnClock;
    }

    public class PWMModuleState
    {
        public uint clocksCounter;
        public bool pwm;
        public bool cycle;
    }

    public class PWMModule : RTLSynchronousModule<PWMModuleInputs, PWMModuleState>
    {
        public PWMModule() { }

        public bool oPWM => State.pwm;
        public bool oCycle => State.cycle;

        uint decrementCounter => State.clocksCounter - 1;

        protected override void OnStage()
        {
            NextState.cycle = false;

            if (Inputs.iActive && Inputs.iOnClock != 0 && Inputs.iDurationClocks != 0)
            {
                if (State.clocksCounter == Inputs.iDurationClocks - 1)
                {
                    NextState.clocksCounter = 0;
                    NextState.cycle = true;
                    NextState.pwm = true;
                }
                else
                {
                    if (State.clocksCounter == Inputs.iOnClock - 1)
                    {
                        NextState.pwm = false;
                    }

                    NextState.clocksCounter = State.clocksCounter + 1;
                }
            }
        }
    }
}

