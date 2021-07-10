using Quokka.Public.Tools;
using Quokka.RTL.Simulator;
using Quokka.TCL.Vivado;
using QuokkaIntegrationTests;
using System.IO;
using System.Linq;

namespace rtl.extension
{
    static class VivadoTCLBuilder
    {
        public static void CreateBitStream(string moduleName)
        {
            var config = Env.RC;
            var hdlPath = Path.Combine(config.Config.ProjectLocation, moduleName);
            var manualAssetsPath = Path.Combine(Env.AssetsLocation, moduleName);
            
            var tcl = new VivadoTCL();
            tcl
                .TCLContent(Path.Combine(Env.ScriptsLocation, "errors.tcl"))
                .set_msg_config(id: "filemgmt 20-742", new_severity: "ERROR")
                .create_project("test", part: "xc7z020clg400-1", verbose: true)
                .SetProperty("target_language", "Verilog", tcl.CurrentProject)
                .SetProperty("board_part", "digilentinc.com:arty-z7-20:part0:1.0", tcl.CurrentProject)
                .SetProperty("platform.board_id", "arty-z7-20", tcl.CurrentProject)
                .AddSources(hdlPath, "*.v")
                .AddSources(manualAssetsPath)
                .update_compile_order(fileset: "sources_1")
                .SetProperty("top", "top", tcl.CurrentFileSet)
                .SetProperty("SOURCE_SET", "sources_1", tcl.Sim1)
                .launch_runs("impl_1", to_step: "write_bitstream", jobs: 4)
                .wait_on_run("impl_1")
                .Text("exitIfFailed")
                ;

            var va = new VivadoAdapter(Env.VivadoProjectLocation);
            va.CleanupVivado();
            va.SaveTCL(tcl);
            va.RunScript();
        }

        public static void ProgramBitStream(string bitStreamPath)
        {
            string VivadoProjectLocation = Path.Combine(Env.RC.Config.ProjectLocation, "Vivado");

            var tcl = new VivadoTCL();
            var getHW = tcl.Builder.get_hw_devices(patterns: "xc7z020_1");

            tcl
                .open_hw_manager()
                .connect_hw_server()
                .open_hw_target()
                .current_hw_device(hw_device: getHW)
                .SetProperty(
                    "PROGRAM.FILE",
                    FileTools.ToUniversalPath(bitStreamPath),
                    getHW
                    )
                .program_hw_devices(hw_device: getHW)
                ;

            var va = new VivadoAdapter(VivadoProjectLocation);
            va.SaveTCL(tcl, "program.tcl");
            va.RunScript("program.tcl");
        }
    }
}
