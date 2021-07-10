using Quokka.Extension.Interop;

namespace rtl.extension
{
    [ExtensionClass]
    public class VGAModuleExtension_BitStream
    {
        [ExtensionMethod(icon: TopLevelIcon.BitStream)]
        public static void VGAStaticQRModule()
        {
            VGAModuleExtension_Translate.VGAStaticQRModule();
            VivadoTCLBuilder.CreateBitStream(nameof(VGAStaticQRModule));
        }

        [ExtensionMethod(icon: TopLevelIcon.BitStream)]
        public static void VGAAlienArtModule()
        {
            VGAModuleExtension_Translate.VGAAlienArtModule();
            VivadoTCLBuilder.CreateBitStream(nameof(VGAAlienArtModule));
        }
    }
}
