using Quokka.RTL;

namespace RTL.Modules
{
    public class OrGateModule : RTLCombinationalModule<GateInputs>, ILogicGate
    {
        public bool O => Inputs.I1 || Inputs.I2;
    }
}
