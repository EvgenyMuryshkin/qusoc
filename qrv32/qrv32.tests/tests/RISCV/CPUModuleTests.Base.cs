using System.IO;

namespace QRV32.Tests
{
    public class CPUModuleTestsBase
    {
        protected InstructionsProvider Inst = new InstructionsProvider();

        protected RISCVModuleSimulator PowerUp()
        {
            var sim = new RISCVModuleSimulator();
            // first cycle handles CPU reset state
            sim.ClockCycle();
            return sim;
        }
    }
}
