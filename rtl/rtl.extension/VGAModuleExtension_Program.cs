using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using Quokka.RTL.Simulator;
using Quokka.TCL.Tools;
using Quokka.TCL.Vivado;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace rtl.extension
{
    [ExtensionClass]
    public class VGAModuleExtension_Program
    {
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
    }
}
