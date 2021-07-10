using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;

namespace rtl.extension
{
    [ExtensionClass]
    public class VGAModuleExtension_Translate
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void VGAAlienArtModule()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(VGAAlienArtModule) });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void VGAStaticQRModule()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(VGAStaticQRModule) });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void VGAModule()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(VGAModule) });
        }
    }
}
