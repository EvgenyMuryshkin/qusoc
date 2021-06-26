using Quokka.Public.Tools;

namespace rtl.extension
{
    static class Env
    {
        public static string RTLVerilogConfig = @"C:\code\qusoc\RTL\RTL.Modules\rtl.verilog.json";
        public static RuntimeConfiguration RC => RuntimeConfigurationLoader.FromConfigFile(RTLVerilogConfig);
    }
}
