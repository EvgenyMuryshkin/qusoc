using Quokka.Core.Bootstrap;
using Quokka.Public.Tools;
using Quokka.TCL.Vivado;
using System;
using System.Collections.Generic;
using System.IO;

namespace Quokka.RTL.Simulator
{
    public class TestbenchAdapterConfig
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
    }

    public class TestbenchAdapter<TModule>
        where TModule : IRTLCombinationalModule
    {
        private readonly RTLInstanceSimulator<TModule> _simulator;
        private readonly RuntimeConfiguration _config;
        private readonly string _configPath;

        public string moduleType => typeof(TModule).Name;
        string hdlPath => Path.Combine(_config.Config.ProjectLocation, moduleType);
        string topLevelModule => $"{moduleType}_TopLevel_TopLevel";
        string testbenchName => $"{moduleType}_testbench";
        string testbenchPath => Path.Combine(hdlPath, $"{testbenchName}.v");
        string VivadoProjectLocation => Path.Combine(_config.Config.ProjectLocation, "VivadoTestbench");
        protected string pidFile => Path.Combine(VivadoProjectLocation, "pid.txt");
        protected string LogFile => Path.Combine(VivadoProjectLocation, "vivado.log");
        protected string VCDFile => Path.Combine(VivadoProjectLocation, "sim.vcd");

        public TestbenchAdapter(string configPath, RTLInstanceSimulator<TModule> simulator)
        {
            if (!File.Exists(configPath))
                throw new FileNotFoundException(configPath);

            _configPath = configPath;
            _simulator = simulator;
            _config = RuntimeConfigurationLoader.FromCommandLineArguments(new[] { _configPath });
        }

        void TranslateInstance(TestbenchAdapterConfig config)
        {
            if (!config.TranslateInstance)
                return;

            if (config.ResetModule)
            {
                var resetOptions = new RTLModuleResetOptions();
                if (config.DefaultMemoryBlockResetType != null)
                    resetOptions.MemoryBlockResetType = new MemoryBlockResetTypeAttribute(config.DefaultMemoryBlockResetType.Value);

                _simulator.TopLevel.Reset(resetOptions);
            }

            QuokkaRunner.FromInstances(
                _configPath, 
                new[] 
                { 
                    new RTLModuleConfig() 
                    { 
                        Instance = _simulator.TopLevel, 
                        Name = moduleType 
                    } 
                }
            );
        }

        public void SaveTestbench(TestbenchAdapterConfig config)
        {
            var tb = _simulator.CompleteTestbench();
            File.WriteAllText(testbenchPath, tb);
        }

        protected void RunVivadoSimulator(TestbenchAdapterConfig config)
        {
            var snapshot = _simulator.Snapshot;
            var duration = 500 * 2 * (snapshot.Clock + 1);

            var tcl = new VivadoTCL();

            tcl
                .create_project(
                    config.ProjectName, 
                    part: "xa7s6cpga196-2I", 
                    verbose: true
                )
                .SetProperty("target_language", "Verilog", tcl.CurrentProject)
                .AddSources(hdlPath, config.SourceTypes.ToArray());

            if (Directory.Exists(config.AssetsLocation))
                tcl.AddSources(config.AssetsLocation);

            tcl.update_compile_order(fileset: "sources_1")
                .SetProperty("top", topLevelModule, tcl.Sources1)
                .SetProperty("top", testbenchName, tcl.Sim1)
                .SetProperty("SOURCE_SET", "sources_1", tcl.Sim1)
                .SetProperty("RUNTIME", "0ns", tcl.Sim1);

            switch (config.launch_simulation_mode)
            {
                case launch_simulation_mode.post_synthesis:
                    tcl
                        .reset_runs(config.SynthSet)
                        .synth_design(config.SynthSet, mode: config.synth_design_mode);
                    break;
                case launch_simulation_mode.post_implementation:
                    tcl.launch_runs(config.ImplSet, jobs: config.MaxJobs)
                        .wait_on_run(config.ImplSet);
                    break;
                case launch_simulation_mode.behavioral:
                    break;
            }
                
            tcl.launch_simulation(
                    mode: config.launch_simulation_mode, 
                    type: config.launch_simulation_type)
                .restart()
                .open_vcd(file_name: VCDFile)
                .log_vcd(hdl_objects: "*")
                .run(
                    time: $"{duration}", 
                    unit: "ns")
                .flush_vcd()
                .close_vcd()
                .close_sim()
                ;

            var va = new VivadoAdapter(VivadoProjectLocation);
            va.CleanupVivado();
            va.SaveTCL(tcl);
            va.RunScript();
        }

        public void Run(TestbenchAdapterConfig config)
        {
            if (!_simulator.HasTestbench)
                throw new Exception($"Testbench was not generated during test run");

            TranslateInstance(config);
            SaveTestbench(config);
            RunVivadoSimulator(config);
        }
    }
}

