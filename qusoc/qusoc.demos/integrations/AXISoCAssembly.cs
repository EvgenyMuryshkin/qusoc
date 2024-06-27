
using AXISoC;
using Quokka.Public.Logging;
using Quokka.Public.Tools;
using Quokka.RTL;
using QuSoC;
using System;
using System.Collections.Generic;
using System.IO;

public class AXISoCAssembly : IQuokkaAssembly
{
    private readonly ClassFactory _classFactory;
    private readonly DefaultQuokkaAssemblyDeps _deps;
    protected ILogStream _logStream => _deps._logStream;

    public AXISoCAssembly(ClassFactory classFactory, DefaultQuokkaAssemblyDeps deps)
    {
        _classFactory = classFactory;
        _deps = deps;
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
                    var t = this.GetType().Assembly.Location;
                    _logStream.WriteLine(DirectoryLogging.Summary, t);
                    //throw new Exception(t);

                    Func<string, uint[]> cpuInstructions = (cpu) =>
                    {
                        var path = Path.Combine(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore", cpu);
                        return FirmwareTools.FromFolder(path);
                    };
                    //var tools = new FirmwareTools(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore");
                    //tools.ModifyMakefile();
                    //tools.Make();
                    //tools.Disassemble();
                    //var instructions = tools.Instructions();
                    //
                    //var inst = new AsmInstructionsProvider();
                    //var cpu0Instructions = inst.FromAsmFile("axisocquadcore_cpu0");
                    //var cpu1Instructions = inst.FromAsmFile("axisocquadcore_cpu1");
                    //var cpu2Instructions = inst.FromAsmFile("axisocquadcore_cpu2");
                    //var cpu3Instructions = inst.FromAsmFile("axisocquadcore_cpu3");

                    var cpu0Instructions = cpuInstructions("cpu0");
                    var cpu1Instructions = cpuInstructions("cpu1");
                    var cpu2Instructions = cpuInstructions("cpu2");
                    var cpu3Instructions = cpuInstructions("cpu3");

                    var module = new AXISoCQuadCoreModule(
                        cpu0Instructions, 
                        cpu1Instructions, 
                        cpu2Instructions, 
                        cpu3Instructions
                    );
                    return module;
                }
            };
        }
    }
}