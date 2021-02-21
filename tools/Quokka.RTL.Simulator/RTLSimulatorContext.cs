using Quokka.VCD;

namespace Quokka.RTL.Simulator
{
    public class RTLSimulatorContext
    {
        public int MaxClockCycles { get; set; } = 100000;
        public int MaxDeltaCycles { get; set; } = 1000;

        public int CurrentTime { get; set; }

        public int Clock { get; set; }
        public int DeltaCycle { get; set; }

        public VCDSignalsSnapshot ControlScope { get; set; }
        public VCDVariable ClockSignal { get; set; }
    }
}
