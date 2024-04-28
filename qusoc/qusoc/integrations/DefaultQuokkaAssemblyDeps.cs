using Quokka.Core.Builders.LowLevel;
using Quokka.HLS.TypeLibrary;
using Quokka.Public.Logging;
using Quokka.Public.Tools;

namespace QuSoC
{
    public class DefaultQuokkaAssemblyDeps
    {
        public readonly ILogStream _logStream;
        public readonly RuntimeConfiguration _runtimeConfiguration;
        public readonly RTLModulesDiscovery _rtlModulesDiscovery;
        public readonly ComponentsLibrary _componentsLibrary;
        public readonly ClassFactory _classFactory;

        public DefaultQuokkaAssemblyDeps(
            ILogStream logStream,
            RuntimeConfiguration runtimeConfiguration,
            RTLModulesDiscovery rtlModulesDiscovery,
            ComponentsLibrary componentsLibrary,
            ClassFactory classFactory)
        {
            _logStream = logStream;
            _runtimeConfiguration = runtimeConfiguration;
            _rtlModulesDiscovery = rtlModulesDiscovery;
            _componentsLibrary = componentsLibrary;
            _classFactory = classFactory;
        }
    }
}
