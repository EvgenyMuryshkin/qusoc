using Quokka.Public.Tools;
using Quokka.RTL.Simulator;
using Quokka.TCL.Vivado;
using System.IO;

namespace rtl.extension
{
    static class VivadoTCLBuilder
    {
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
