using Quokka.Public.Tools;
using QuokkaIntegrationTests;
using System.IO;

namespace qrv32.extension
{
    static class Env
    {
        public static string RTLVerilogConfig = Path.Combine(TestPathTools.SolutionLocation(), @"qrv32/qrv32.cpu/rtl.verilog.json");
        public static RuntimeConfiguration RC => RuntimeConfigurationLoader.FromConfigFile(RTLVerilogConfig);
    }
}
