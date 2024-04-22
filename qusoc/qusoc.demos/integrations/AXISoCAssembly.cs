
using AXISoC;
using Quokka.Public.Tools;
using Quokka.RTL;
using System.Collections.Generic;

public class AXISoCAssembly : IQuokkaAssembly
{
    private readonly ClassFactory _classFactory;

    public AXISoCAssembly(ClassFactory classFactory)
    {
        _classFactory = classFactory;
    }

    public bool CanTranslate() => true;

    public IEnumerable<RTLModuleConfig> RTLModules
    {
        get
        {
            yield return new RTLModuleConfig()
            {
                Name = nameof(AXI4RISCVModule),
                InstanceFactory = () => _classFactory.Create<IRTLCombinationalModule>(typeof(AXI4RISCVModule))
            };
            yield return new RTLModuleConfig()
            {
                Name = nameof(AXISoCTestModule),
                InstanceFactory = () => _classFactory.Create<IRTLCombinationalModule>(typeof(AXISoCTestModule))
            };
        }
    }
}