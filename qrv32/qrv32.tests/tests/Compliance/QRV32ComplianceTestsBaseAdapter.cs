using QRV32.ComplianceTools;
using QuokkaIntegrationTests;
using System.IO;

namespace QRV32.Compliance
{
    public class QRV32ComplianceTestsBaseAdapter : ComplianceTestsBaseAdapter<ComplianceCPUSimilator>
    {
        public QRV32ComplianceTestsBaseAdapter(string isa, string arch) : base(isa, arch)
        {

        }

        public override string ComplianceTestsPath => Path.Combine(TestPathTools.ProjectLocation(), "compliance");

        protected override uint[] Run()
        {
            var dataMarkerAddress = DataMarkerAddress();
            var sim = new ComplianceCPUSimilator(dataMarkerAddress);
            sim.ClockCycle();
            sim.RunAll(Instructions());

            return sim.MemoryBlock;
        }
    }
}
