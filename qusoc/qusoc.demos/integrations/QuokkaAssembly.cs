using Quokka.Public.Tools;
using Quokka.RTL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace QuSoC.Demos
{
    public class QuokkaAssembly : DefaultQuokkaAssembly
    {
        public QuokkaAssembly(DefaultQuokkaAssemblyDeps deps) : base(deps)
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
                        yield return new RTLModuleConfig()
                        {
                            InstanceFactory = (classFactory) => classFactory.Create<IRTLCombinationalModule>(moduleType),
                            Name = moduleType.Name
                        };
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
