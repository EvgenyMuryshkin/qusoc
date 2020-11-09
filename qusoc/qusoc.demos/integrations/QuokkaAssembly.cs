using Quokka.Core.Builders.LowLevel;
using Quokka.HLS.TypeLibrary;
using Quokka.Public.Logging;
using Quokka.Public.Tools;
using Quokka.RISCV.CS2CPP.Tools;
using Quokka.RISCV.CS2CPP.Translator;
using Quokka.RISCV.Integration.Client;
using Quokka.RISCV.Integration.DTO;
using Quokka.RISCV.Integration.Engine;
using Quokka.RISCV.Integration.Generator.SOC;
using Quokka.RTL;
using Quokka.Schema.HLS;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.InteropServices;
using System.Text;

namespace QuSoC.Demos
{
    public class QuokkaAssembly : DefaultQuokkaAssembly
    {
        public QuokkaAssembly(
            ILogStream logStream,
            RuntimeConfiguration runtimeConfiguration, 
            RTLModulesDiscovery rtlModulesDiscovery,
            ComponentsLibrary componentsLibrary) : base(
                logStream, 
                runtimeConfiguration, 
                rtlModulesDiscovery, 
                componentsLibrary)
        {
        }

        public override IEnumerable<RTLModuleConfig> RTLModules
        {
            get
            {
                var modules = new HashSet<string>();

                if (_runtimeConfiguration.Config.Project == "TinyFPGA")
                {
                    modules.AddRange(new[] { nameof(SimpleCounterModule), nameof(Increment) });
                }

                if (modules.Any())
                {
                    foreach (var moduleType in _rtlModulesDiscovery.ModuleTypes.Where(m => modules.Contains(m.Name)))
                    {
                        var instance = Activator.CreateInstance(moduleType) as IRTLCombinationalModule;
                        yield return new RTLModuleConfig() { Instance = instance, Name = instance.ModuleName };
                    }
                }
                else
                {
                    foreach (var m in base.RTLModules)
                        yield return m;
                }
            }
        }
    }
}
