using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using System;
using System.IO;
using System.Linq;

namespace qusoc.extension
{
    [ExtensionClass]
    public class AXISoCBlinker
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void AXISoCBlinker_Translate()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { "AXISoCBlinker" });
        }

        [ExtensionMethod(icon: TopLevelIcon.BitStream)]
        public static void AXISoCBlinker_BitStream()
        {
            AXISoCBlinker_Translate();
            VivadoTCLBuilder.CreateBitStream("AXISoCBlinker");
        }

        [ExtensionMethod(icon: TopLevelIcon.Program)]
        public static void AXISoCBlinker_Program()
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
        public static void AXISoCBlinker_All()
        {
            AXISoCBlinker_BitStream();
            AXISoCBlinker_Program();
        }
    }
}
