
using AXISoC;
using Quokka.Public.Tools;
using Quokka.RTL;
using QuSoC;
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
                InstanceFactory = (classFactory) => classFactory.Create<IRTLCombinationalModule>(typeof(AXI4RISCVModule))
            };
            yield return new RTLModuleConfig()
            {
                Name = nameof(AXISoCTestModule),
                InstanceFactory = (classFactory) => classFactory.Create<IRTLCombinationalModule>(typeof(AXISoCTestModule))
            };
            yield return new RTLModuleConfig()
            {
                Name = "AXISoCBlinker",
                InstanceFactory = (classFactory) =>
                {
                    var inst = new AsmInstructionsProvider();
                    var instructions = inst.FromAsmFile("axisocblinker");

                    var module = new AXISoCGenericModule(instructions);
                    return module;
                }
            };
            yield return new RTLModuleConfig()
            {
                Name = "AXISoCDualCoreModule",
                InstanceFactory = (classFactory) =>
                {
                    var inst = new AsmInstructionsProvider();
                    var instructions = inst.FromAsmFile("axisocdualcore");

                    var module = new AXISoCDualCoreModule(instructions);
                    return module;
                }
            };
            yield return new RTLModuleConfig()
            {
                Name = "AXISoCQuadCoreModule",
                InstanceFactory = (classFactory) =>
                {
                    var inst = new AsmInstructionsProvider();
                    var cpu0Instructions = inst.FromAsmFile("axisocquadcore_cpu0");
                    var cpu1Instructions = inst.FromAsmFile("axisocquadcore_cpu1");
                    var cpu2Instructions = inst.FromAsmFile("axisocquadcore_cpu2");
                    var cpu3Instructions = inst.FromAsmFile("axisocquadcore_cpu3");

                    var module = new AXISoCQuadCoreModule(cpu0Instructions, cpu1Instructions, cpu2Instructions, cpu3Instructions);
                    return module;
                }
            };
        }
    }
}