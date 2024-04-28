using Increment;
using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using System;
using System.IO;
using System.Linq;

namespace qusoc.extension
{
    [ExtensionClass]
    public class QuSoCExtension
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void AXISoCBlinker_Translate()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { "AXISoCBlinker" });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void IncrementModule_Translate()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(Increment.Increment) });
        }

        [ExtensionMethod(icon: TopLevelIcon.BitStream)]
        public static void IncrementModule_BitStream()
        {
            IncrementModule_Translate();
            VivadoTCLBuilder.CreateBitStream(nameof(Increment.Increment));
        }

        [ExtensionMethod(icon: TopLevelIcon.Program)]
        public static void IncrementModule_Program()
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
        public static void IncrementModule_All()
        {
            IncrementModule_BitStream();
            IncrementModule_Program();
        }

    }
}
