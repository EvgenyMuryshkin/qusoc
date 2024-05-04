using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using System;
using System.IO;
using System.Linq;

namespace qusoc.extension
{
    [ExtensionClass]
    public class AXISoCDualCoreModule
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void AXISoCDualCoreModule_Translate()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { "AXISoCDualCoreModule" });
        }

        [ExtensionMethod(icon: TopLevelIcon.BitStream)]
        public static void AXISoCDualCoreModule_BitStream()
        {
            AXISoCDualCoreModule_Translate();
            VivadoTCLBuilder.CreateBitStream("AXISoCDualCoreModule");
        }

        [ExtensionMethod(icon: TopLevelIcon.Program)]
        public static void AXISoCDualCoreModule_Program()
        {
            string VivadoProjectLocation = Path.Combine(Env.RC.Config.ProjectLocation, "Vivado");

            var bitStreamPath = Directory.EnumerateFiles(VivadoProjectLocation, "*.bit", SearchOption.AllDirectories).ToList();
            if (bitStreamPath.Count == 0)
                throw new Exception($"No bitstream found in project: {VivadoProjectLocation}");

            if (bitStreamPath.Count > 1)
                throw new Exception($"Multiple bitstreams found in project: {VivadoProjectLocation}");

            VivadoTCLBuilder.ProgramBitStream(bitStreamPath[0]);
        }

        [ExtensionMethod(icon: TopLevelIcon.Generic)]
        public static void AXISoCDualCoreModule_All()
        {
            AXISoCDualCoreModule_BitStream();
            AXISoCDualCoreModule_Program();
        }
    }
}
