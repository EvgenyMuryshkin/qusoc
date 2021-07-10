using Quokka.Extension.Interop;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using RTL.Modules;
using System.IO;

namespace rtl.extension
{
    [ExtensionClass]
    public class VGAModuleExtension_Generic
    {
        [ExtensionMethod]
        public static void VGAStaticQRModule_RunAll()
        {
            VGAModuleExtension_BitStream.VGAStaticQRModule();
            VGAModuleExtension_Program.ProgramDevice();
        }

        [ExtensionMethod]
        public static void VGAAlienArtModule_RunAll()
        {
            VGAModuleExtension_BitStream.VGAAlienArtModule();
            VGAModuleExtension_Program.ProgramDevice();
        }

        [ExtensionMethod]
        public static void RunCurrentTCL()
        {
            var va = new VivadoAdapter(Env.VivadoProjectLocation);
            va.CleanupVivado();
            va.RunScript();
        }
    }
}
