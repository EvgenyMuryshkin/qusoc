using Quokka.Public.Tools;
using QuokkaIntegrationTests;
using System.IO;

namespace fir.extension
{
    public abstract class HDLEnv
    {
        private readonly string _modulesLocation;
        public HDLEnv(string modulesLocation)
        {
            _modulesLocation = modulesLocation;
        }

        protected abstract string HDLConfig { get; }
        public string RTLConfig => Path.Combine(_modulesLocation, HDLConfig);

        public RuntimeConfiguration RC => RuntimeConfigurationLoader.FromConfigFile(RTLConfig);
        public string VivadoProjectLocation => Path.Combine(RC.Config.ProjectLocation, "Vivado");
    }

    public class VerilogEnv : HDLEnv
    {
        public VerilogEnv(string modulesLocation) : base(modulesLocation) { }

        protected override string HDLConfig => "rtl.verilog.json";
    }


    public class VHDLEnv : HDLEnv
    {
        public VHDLEnv(string modulesLocation) : base(modulesLocation) { }
        protected override string HDLConfig => "rtl.vhdl.json";
    }

    public static class Env
    {
        public static string ModulesLocation = @"C:\code\qusoc\fir\fir.modules";
        public static HDLEnv Verilog = new VerilogEnv(ModulesLocation);
        public static HDLEnv VHDL = new VHDLEnv(ModulesLocation);

        public static string AssetsLocation => Path.Combine(ModulesLocation, "assets");
        public static string ScriptsLocation => Path.Combine(TestPathTools.ProjectLocation(), "scripts");
    }
}
