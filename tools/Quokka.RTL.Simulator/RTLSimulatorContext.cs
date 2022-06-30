using Quokka.VCD;

namespace Quokka.RTL.Simulator
{
    public class RTLSimulatorSnapshot
    {
        public int Clock { get; set; }
    }

    public class RTLSimulatorContext
    {
        public int MaxClockCycles { get; set; } = 100000;
        public int MaxDeltaCycles { get; set; } = 1000;

        public int MilestoneTime { get; set; }
        public int MilestoneOffset { get; set; }
        public int CurrentTime => MilestoneTime + MilestoneOffset;

        public int Clock { get; set; }
        public int DeltaCycle { get; set; }
        public int TotalDeltaCycles { get; set; }

        public VCDSignalsSnapshot ControlScope { get; set; }
        public VCDVariable ClockSignal { get; set; }

        public void NextMilestone()
        {
            MilestoneTime += MaxDeltaCycles;
        }
    }
}
