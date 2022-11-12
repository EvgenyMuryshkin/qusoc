using Quokka.Public.Tools;
using Quokka.RTL;
using System.IO;
using System.Runtime.CompilerServices;

namespace QuokkaIntegrationTests
{
    public class BaseRTLModuleTests
    {
        protected static string VCDOutputPath([CallerMemberName] string testName = "")
        {
            return Path.Combine(PathTools.ProjectPath, "SimResults", $"{testName}.vcd");
        }

        protected static string PNGOutputPath([CallerMemberName] string testName = "")
        {
            return Path.Combine(PathTools.ProjectPath, "SimResults", $"{testName}.png");
        }

        protected T Module<T>()
            where T : IRTLCombinationalModule, new()
        {
            var module = new T();
            module.Setup();

            return module;
        }
    }
}

