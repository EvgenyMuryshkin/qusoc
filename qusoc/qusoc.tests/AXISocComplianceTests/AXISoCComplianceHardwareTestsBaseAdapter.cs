using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.ComplianceTools;
using Quokka.RTL;
using QuokkaIntegrationTests;
using QuSoC.Tests;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace AXISoC.ComplianceTests
{
    public class AXISoCComplianceHardwareTestsBaseAdapter : ComplianceTestsBaseAdapter<AXISoCComplianceSimulator>
    {
        public AXISoCComplianceHardwareTestsBaseAdapter(string isa, string arch) : base(isa, arch)
        {

        }

        public override string ComplianceTestsPath => Path.Combine(
            TestPathTools.SolutionLocation(),
            "QRV32",
            "QRV32.Tests",
            "compliance"
        );

        protected void CompareUARTOutput(AXISocCPUUpdater cpuUpdater)
        {
            var statsPath = TestStatsPath(_testName);
            var stats = DeepJSONCopy.Deserialize<AXISoCComplianceTestStats>(File.ReadAllText(statsPath));
            var expectedPayloadSize = stats.Asserts * 2 * 4;

            do
            {
                var receivedSize = cpuUpdater.BytesToRead;
                if (receivedSize == expectedPayloadSize)
                    break;

                Trace.WriteLine($"Received {receivedSize} out of {expectedPayloadSize} bytes");
                Task.Delay(100).Wait();
            }
            while (true);

            var exp = cpuUpdater.ReadAll();
            if ((exp.Length) % 4 != 0)
                Assert.Fail($"Received UART data is misaligned. Length: {exp.Length}");

            var values = new List<uint>();
            var size = exp.Length / 4;

            while (exp.Any())
            {
                var bytes = exp.Take(4).Reversed().ToArray();
                exp = exp.Skip(4).ToArray();
                values.Add(new RTLBitArray(bytes));
            }

            if ((values.Count % 2) != 0)
                Assert.Fail($"Received values are misaligned. Lengh: {values.Count}");

            for (var i = 0; i < values.Count; i += 2)
            {
                Assert.AreEqual(values[i], values[i + 1], $"Failed at position {i / 2}");
            }
        }

        protected override uint[] Run()
        {
            var dataMarkerAddress = DataMarkerAddress();
            var instructions = Instructions();

            using (var cpuUpdater = new AXISocCPUUpdater())
            {
                cpuUpdater.Update(1, instructions).Wait();

                CompareUARTOutput(cpuUpdater);

                var memoryBlock = cpuUpdater.ReadRemoteMemoryBlock(1, 0, instructions.Length).Result;

                return memoryBlock;
            }
        }
    }
}
