using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using Quokka.RTL.Simulator;
using Quokka.TCL.Tools;
using Quokka.TCL.Vivado;
using RTL.Modules;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace rtl.extension
{
    [ExtensionClass]
    public class VGAModuleExtension
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void Translate()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(VGAStaticQRModule) });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void TranslateTest()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(VGAModule) });
        }

        [ExtensionMethod(icon: TopLevelIcon.BitStream)]
        public static void CreateBitStream()
        {
            Translate();

            var config = Env.RC;
            var hdlPath = Path.Combine(config.Config.ProjectLocation, nameof(VGAStaticQRModule));
            var tcl = new VivadoTCL();

            tcl
                .create_project("test", part: "xc7z020clg400-1", verbose: true)
                .SetProperty("target_language", "Verilog", tcl.CurrentProject)
                .SetProperty("board_part", "digilentinc.com:arty-z7-20:part0:1.0", tcl.CurrentProject)
                .SetProperty("platform.board_id", "arty-z7-20", tcl.CurrentProject)
                .AddSources(hdlPath, "*.v")
                .add_files(files: new List<string>() 
                { 
                    @"C:/Users/evmur/xilinx/vga/vga.srcs/sources_1/imports/new/top.v",
                    @"C:/Users/evmur/xilinx/vga/vga.srcs/constrs_1/imports/blinky.ip_user_files/Arty-Z7-20-Master.xdc"
                })
                .update_compile_order(fileset: "sources_1")
                .SetProperty("top", "top", tcl.CurrentFileSet)
                .SetProperty("SOURCE_SET", "sources_1", tcl.Sim1)
                .launch_runs("impl_1", to_step: "write_bitstream", jobs: 4)
                .wait_on_run("impl_1")
                ;

            string VivadoProjectLocation = Path.Combine(config.Config.ProjectLocation, "Vivado");

            var va = new VivadoAdapter(VivadoProjectLocation);
            va.CleanupVivado();
            va.SaveTCL(tcl);
            va.RunScript();
        }

        [ExtensionMethod(icon: TopLevelIcon.Program)]
        public static void ProgramTest()
        {
            VivadoTCLBuilder.ProgramBitStream(@"C:\code\fpga\Bitstreams\Arty\vga_test.bit");
        }

        [ExtensionMethod(icon: TopLevelIcon.Program)]
        public static void ProgramDevice()
        {
            string VivadoProjectLocation = Path.Combine(Env.RC.Config.ProjectLocation, "Vivado");

            var bitStreamPath = Directory.EnumerateFiles(VivadoProjectLocation, "*.bit", SearchOption.AllDirectories).ToList();
            if (bitStreamPath.Count == 0)
                throw new Exception($"No bitstream found in project: {VivadoProjectLocation}");

            if (bitStreamPath.Count > 1)
                throw new Exception($"Multiple bitstreams found in project: {VivadoProjectLocation}");

            VivadoTCLBuilder.ProgramBitStream(bitStreamPath[0]);
        }

        [ExtensionMethod]
        public static void RunAll()
        {
            Translate();
            CreateBitStream();
            ProgramDevice();
        }
    }
}
