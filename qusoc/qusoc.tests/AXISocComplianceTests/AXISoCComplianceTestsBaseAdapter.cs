using QRV32.Compliance;
using QuokkaIntegrationTests;
using System.IO;
using QRV32.ComplianceTools;
using QuSoC.Tests;
using System.Linq;
using Quokka.RTL;
using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Collections.Generic;
using System.Runtime.InteropServices.Marshalling;

namespace AXISoC.ComplianceTests
{
    public class AXISoCComplianceTestStats
    {
        public int Asserts { get; set; }
    }

    
    public class AXISoCComplianceSimulator : AXISoCTestModuleSimulator<AXISoCTestModule>
    {
        private readonly int _dataMarkerAddress;
        public AXISoCComplianceSimulator(AXISoCTestModule topLevel, int dataMarkerAddress) : base(topLevel)
        {
            _dataMarkerAddress = dataMarkerAddress;
        }
    }

    public class AXISoCComplianceTestsBaseAdapter : ComplianceTestsBaseAdapter<AXISoCComplianceSimulator>
    {
        public AXISoCComplianceTestsBaseAdapter(string isa, string arch) : base(isa, arch)
        {

        }

        public override string ComplianceTestsPath => Path.Combine(
            TestPathTools.SolutionLocation(),
            "QRV32",
            "QRV32.Tests", 
            "compliance"
        );

        protected override uint[] SimulatorMemory(AXISoCComplianceSimulator sim) 
            => sim.TopLevel.Memory.State.buff.Select(s => (uint)new RTLBitArray(s)).ToArray();

        protected override AXISoCComplianceSimulator Run()
        {
            var Asserts = 0;
            var HasNonZeroValues = false;
            var AssertedValues = new List<uint>();

            var dataMarkerAddress = DataMarkerAddress();
            var topLevel = new AXISoCTestModule();
            topLevel.Memory.Initialize(Instructions().Select(i => (byte[])new RTLBitArray(i)).ToArray());

            var sim = new AXISoCComplianceSimulator(topLevel, dataMarkerAddress);

            sim.onECall = (cpu) =>
            {
                var MemoryBlock = topLevel.Memory.State.buff.Select(i => (uint)new RTLBitArray(i)).ToArray();
                var _dataMarkerAddress = dataMarkerAddress;

                var actual = MemoryBlock[_dataMarkerAddress];
                var expected = MemoryBlock[_dataMarkerAddress + 1];

                if (actual == 0x87654321)
                    Assert.Fail($"Asserting data marker value, should not be 0x87654321");

                Assert.AreEqual(expected, actual, "Value does not match");

                Asserts++;
                HasNonZeroValues |= (expected != 0);
                AssertedValues.Add(actual);
            };

            sim.RunToCompletion();

            var statsPath = TestStatsPath(_testName);
            var stats = new AXISoCComplianceTestStats() { Asserts = Asserts };
            File.WriteAllText(statsPath, DeepJSONCopy.Serialize(stats, DeepJSONCopy.indentedTypeSettings));

            //sim.ClockCycle();
            //sim.RunAll(Instructions());

            return sim;
        }

    }
}
