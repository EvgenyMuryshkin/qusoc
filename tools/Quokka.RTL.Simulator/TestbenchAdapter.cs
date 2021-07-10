using Quokka.Core.Bootstrap;
using Quokka.Public.Tools;
using Quokka.TCL.Vivado;
using System;
using System.IO;

namespace Quokka.RTL.Simulator
{
    public class TestbenchAdapter<TModule>
        where TModule : IRTLCombinationalModule
    {
        private readonly RTLInstanceSimulator<TModule> _simulator;
        private readonly RuntimeConfiguration _config;
        private readonly string _configPath;

        string moduleType => typeof(TModule).Name;
        string hdlPath => Path.Combine(_config.Config.ProjectLocation, moduleType);
        string topLevelModule => $"{moduleType}_TopLevel";
        string testbenchName => $"{moduleType}_testbench";
        string testbenchPath => Path.Combine(hdlPath, $"{testbenchName}.v");
        string VivadoProjectLocation => Path.Combine(_config.Config.ProjectLocation, "Vivado");
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

            if (_config.Config.HDL != "Verilog")
                throw new NotImplementedException($"Project creation for VHDL is not there yet");
        }

        public void TranslateInstance()
        {
            QuokkaRunner.FromInstances(
                _configPath, 
                new[] 
                { 
                    new RTLModuleConfig() 
                    { 
                        Instance = _simulator.TopLevel, 
                        Name = moduleType 
                    } 
                });
        }

        public void TranslateModule()
        {
            QuokkaRunner.FromConfig(_configPath, new[] { moduleType });
        }

        public void SaveTestbench()
        {
            var tb = _simulator.CompleteTestbench();
            File.WriteAllText(testbenchPath, tb);
        }

        protected void RunVivadoSimulator()
        {
            var snapshot = _simulator.Snapshot;
            var duration = 500 * 2 * (snapshot.Clock + 1);

            var tcl = new VivadoTCL();

            tcl
                .create_project("test", part: "xa7s6cpga196-2I", verbose: true)
                .SetProperty("target_language", "Verilog", tcl.CurrentProject)
                .AddSources(hdlPath, "*.v")
                .update_compile_order(fileset: "sources_1")
                .SetProperty("top", topLevelModule, tcl.CurrentFileSet)
                .SetProperty("top", testbenchName, tcl.Sim1)
                .SetProperty("SOURCE_SET", "sources_1", tcl.Sim1)
                .SetProperty("RUNTIME", "0ns", tcl.Sim1)
                .launch_runs("impl_1", jobs: 4)
                .wait_on_run("impl_1")
                .launch_simulation(
                    mode: launch_simulation_mode.post_implementation, 
                    type: launch_simulation_type.timing)
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

        public void PostSynthTimingSimulation()
        {
            if (!_simulator.HasTestbench)
                throw new Exception($"Testbench was not generated during test run");

            TranslateInstance();
            //TranslateModule();

            SaveTestbench();
            RunVivadoSimulator();
        }
    }
}

