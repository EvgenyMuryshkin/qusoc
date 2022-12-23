using fir.modules;
using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using Quokka.RTL.Simulator;
using Quokka.TCL.Vivado;
using System;
using System.IO;

namespace fir.extension
{
    [ExtensionClass]
    public class FIRModulesExtension
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void FIRModule4x16Translate()
        {
            QuokkaRunner.FromConfig(Env.VHDL.RTLConfig, new[] { nameof(FIRModule4x16) });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void FIRRAMDSPModuleTranslate()
        {
            QuokkaRunner.FromConfig(Env.VHDL.RTLConfig, new[] { nameof(FIRRAMDSPModule) });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void CreateVivadoProject()
        {
            var env = Env.VHDL;

            if (Directory.Exists(env.VivadoProjectLocation))
                Directory.Delete(env.VivadoProjectLocation, true);

            var modules = new[]
            {
                nameof(FIRModule4x16),
                nameof(FIRRAMDSPModule)
            };

            var config = env.RC;

            var tcl = new VivadoTCL();
            tcl
                .set_msg_config(id: "filemgmt 20-742", new_severity: "ERROR")
                .create_project("test", part: "xc7z020clg400-1", verbose: true)
                .SetProperty("target_language", "Verilog", tcl.CurrentProject)
                .SetProperty("board_part", "digilentinc.com:arty-z7-20:part0:1.0", tcl.CurrentProject)
                .SetProperty("platform.board_id", "arty-z7-20", tcl.CurrentProject)
                ;

            foreach (var m in modules)
            {
                var hdlPath = Path.Combine(config.Config.ProjectLocation, m);
                var manualAssetsPath = Path.Combine(Env.AssetsLocation, m);

                if (Directory.Exists(hdlPath))
                    tcl.AddSources(hdlPath, "*.v", "*.vhdl");
                
                if (Directory.Exists(manualAssetsPath))
                    tcl.AddSources(manualAssetsPath);
            }

            tcl.update_compile_order(fileset: "sources_1")
                .SetProperty("top", "top", tcl.CurrentFileSet)
                .SetProperty("SOURCE_SET", "sources_1", tcl.Sim1)
                //.launch_runs("impl_1", to_step: "write_bitstream", jobs: 4)
                //.wait_on_run("impl_1")
                ;

            var va = new VivadoAdapter(env.VivadoProjectLocation);
            va.CleanupVivado();
            va.SaveTCL(tcl);
            va.RunScript();
            Console.WriteLine($"Project: {env.VivadoProjectLocation}");
        }
    }
}
