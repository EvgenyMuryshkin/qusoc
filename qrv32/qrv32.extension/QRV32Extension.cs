using QRV32.CPU;
using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;

namespace qrv32.extension
{
    [ExtensionClass]
    public class QRV32Extension
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void Translate()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(RISCVModule) });
        }
    }
}
