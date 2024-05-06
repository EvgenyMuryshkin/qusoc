using Quokka.RTL.Simulator;
using System.Collections.Generic;
using Quokka.RTL;
using AXISoC;
using System.Linq;
using QRV32.CPU;
using System.Diagnostics;
using System;
using FPGA;
using axi.modules;

namespace QuSoC.Tests
{
    public class AXISoCTestModuleSimulator<T> : AXISoCModuleSimulator<T>
        where T : AXISoCTestModule
    {
        public AXISoCTestModuleSimulator(T module, string vcdPath = null)
            : base(module, vcdPath)
        {

        }

        protected override AXI4MemoryModule InstructionsMemory 
            => _topLevel.Memory;

        protected override Dictionary<string, AXI4RISCVModule> CPUs 
            => new Dictionary<string, AXI4RISCVModule>() { { "CPU", _topLevel.CPU }  };
    }

    public class AXISoCDualCoreModuleSimulator<T> : AXISoCModuleSimulator<T>
        where T : AXISoCDualCoreModule
    {
        public AXISoCDualCoreModuleSimulator(T module, string vcdPath = null)
            : base(module, vcdPath)
        {

        }

        protected override AXI4MemoryModule InstructionsMemory 
            => _topLevel.Memory;

        protected override Dictionary<string, AXI4RISCVModule> CPUs 
            => new Dictionary<string, AXI4RISCVModule>() 
            {
                { "CPU0", _topLevel.CPU0 },
                { "CPU1",  _topLevel.CPU1 }
            };
    }

    public class AXISoCQuadCoreModuleSimulator<T> : AXISoCModuleSimulator<T>
     where T : AXISoCQuadCoreModule
    {
        public AXISoCQuadCoreModuleSimulator(T module, string vcdPath = null)
            : base(module, vcdPath)
        {

        }

        protected override AXI4MemoryModule InstructionsMemory
            => _topLevel.Memory;

        protected override Dictionary<string, AXI4RISCVModule> CPUs
            => new Dictionary<string, AXI4RISCVModule>()
            {
                { "CPU0", _topLevel.CPU0 },
                { "CPU1",  _topLevel.CPU1 },
                { "CPU2",  _topLevel.CPU2 },
                { "CPU3",  _topLevel.CPU3 },
            };
    }
}