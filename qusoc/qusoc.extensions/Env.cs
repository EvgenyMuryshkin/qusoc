using Quokka.Public.Tools;
using QuokkaIntegrationTests;
using System.IO;

namespace qusoc.extension
{
    static class Env
    {
        public static string RTLVerilogConfig = @"C:\code\qusoc\qusoc\qusoc.demos\rtl.verilog.json";
        public static RuntimeConfiguration RC => RuntimeConfigurationLoader.FromConfigFile(RTLVerilogConfig);

        public static string AssetsLocation => Path.Combine(TestPathTools.ProjectLocation(), "assets");
        public static string VivadoProjectLocation => Path.Combine(RC.Config.ProjectLocation, "Vivado");
        public static string ScriptsLocation => Path.Combine(TestPathTools.ProjectLocation(), "scripts");
    }
}
