using Quokka.TCL.Vivado;
using System.Collections.Generic;

namespace Quokka.RTL.Simulator
{
    public abstract class TestbenchAdapterConfig
    {
        public string ProjectName { get; set; } = "testbench";
        public List<string> SourceTypes { get; set; } = new List<string>() { "*.v", "*.vhdl" };
        public string AssetsLocation { get; set; }
        public bool ResetModule { get; set; } = true;
        public bool TranslateInstance { get; set; } = true;
        public rtlMemoryBlockResetType? DefaultMemoryBlockResetType { get; set; } = rtlMemoryBlockResetType.Reset;
        public synth_design_mode synth_design_mode { get; set; } = synth_design_mode.DEFAULT;
        public launch_simulation_mode launch_simulation_mode { get; set; } = launch_simulation_mode.post_implementation;
        public launch_simulation_type launch_simulation_type { get; set; } = launch_simulation_type.timing;
        public string SynthSet { get; set; } = "synth_1";
        public string ImplSet { get; set; } = "impl_1";
        public int MaxJobs { get; set; } = 4;

        public abstract string Part { get; set; }
    }

    public class ArtyZ7AdapterConfig  : TestbenchAdapterConfig
    {
        public override string Part { get; set; } = "xa7s6cpga196-2I";
    }
}

