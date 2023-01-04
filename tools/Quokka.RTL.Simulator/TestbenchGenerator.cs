using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace Quokka.RTL.Simulator
{
    public class TestbenchGenerator
    {
        private readonly RTLSimulatorContext _simulatorContext;
        private readonly IRTLCombinationalModule _topLevel;
        StringBuilder Testbench = new StringBuilder();
        int indent = 0;

        string ModuleName => _topLevel.GetType().Name;

        public TestbenchGenerator(RTLSimulatorContext simulatorContext, IRTLCombinationalModule topLevel)
        {
            _simulatorContext = simulatorContext;
            _topLevel = topLevel;
        }

        void AppendSeparator()
        {
            AppendTestbenchLines("");
        }

        void AppendTestbenchLines(string content)
        {
            var indentLine = string.Join("", Enumerable.Range(0, indent).Select(i => "\t"));
            var lines = content.Split(new[] { '\n' }).Select(l => l.Trim()).ToList();

            foreach (var line in lines)
            {
                if (string.IsNullOrWhiteSpace(line))
                {
                    Testbench.AppendLine();
                    continue;
                }

                Testbench.AppendLine($"{indentLine}{line}");
            }
        }

        public void SetupTestbench()
        {
            AppendTestbenchLines($"`timescale 1ns/1ps");
            AppendTestbenchLines($"`default_nettype none");
            AppendTestbenchLines(@"
`define Assert(expected, actual, message) \
        if (expected !== actual) begin \
            $display(""Assert failed""); \
            $display(message); \
            $display(""Expected: 0x%H, Actual: 0x%H"", expected, actual); \
            /*$finish;*/ \
        end
");

            AppendTestbenchLines($"module {ModuleName}_testbench;");
            indent++;
            AppendTestbenchLines($"reg clk;");
            AppendTestbenchLines($"reg reset;");

            AppendSeparator();


            Action<string, RTLSignalInfo> declareInput = (name, size) =>
            {
                if (size.Size == 1)
                {
                    AppendTestbenchLines($"reg {name};");
                }
                else
                {
                    AppendTestbenchLines($"reg [{size.Size - 1}:0] {name};");
                }
            };

            foreach (var i in _topLevel.InputProps)
            {
                var memberType = i.GetMemberType();
                var value = i.GetValue(_topLevel.RawInputs);
                var info = _topLevel.SizeOfValue(value);

                if (RTLTypeCheck.IsSynthesizableObject(memberType))
                {
                    var props = RTLReflectionTools.SynthesizableMembers(memberType);
                    foreach (var m in props)
                    {
                        var memberName = $"{i.Name}_{m.Name}";
                        var memberValue = m.GetValue(value) ?? RTLModuleHelper.Activate(m.GetMemberType());
                        var memberSize = _topLevel.SizeOfValue(value);

                        declareInput(memberName, memberSize);
                    }
                }
                else
                {
                    declareInput(i.Name, info);
                }
            }

            AppendSeparator();

            Action<string, RTLSignalInfo> declareOutput = (name, size) =>
            {
                if (size.Size == 1)
                {
                    AppendTestbenchLines($"wire {name};");
                }
                else
                {
                    AppendTestbenchLines($"wire [{size.Size - 1}:0] {name};");
                }
            };

            foreach (var o in _topLevel.OutputProps)
            {
                var memberType = o.GetMemberType();
                var value = o.GetValue(_topLevel);
                var info = _topLevel.SizeOfValue(value);

                if (RTLTypeCheck.IsSynthesizableObject(memberType))
                {
                    var props = RTLReflectionTools.SynthesizableMembers(memberType);
                    foreach (var m in props)
                    {
                        var memberName = $"{o.Name}_{m.Name}";
                        var memberValue = m.GetValue(value) ?? RTLModuleHelper.Activate(m.GetMemberType());
                        var memberSize = _topLevel.SizeOfValue(value);

                        declareOutput(memberName, memberSize);
                    }
                }
                else
                {
                    declareOutput(o.Name, info);
                }
            }

            AppendSeparator();
            AppendTestbenchLines($"initial begin");
            indent++;
            AppendTestbenchLines($"clk = 1'b0;");
            AppendTestbenchLines($"forever clk = #500 ~clk;");
            indent--;
            AppendTestbenchLines($"end");
            AppendSeparator();

            AppendTestbenchLines($"initial begin");
            indent++;
            AppendTestbenchLines($"reset = 1'b1;");
            AppendTestbenchLines($"@(negedge clk);");
            AppendTestbenchLines($"reset = 1'b0;");
            AppendSeparator();
            indent--;
            AppendTestbenchLines($"end");
            AppendSeparator();

            AppendTestbenchLines($"initial begin");
            indent++;
            SetTestbenchInputs(_topLevel.RawInputs);
            AppendTestbenchLines($"@(negedge clk); // reset");
        }

        public void SetTestbenchInputs<TInputs>(TInputs inputs)
        {
            AppendSeparator();

            Action<MemberInfo, string, object> addValue = null;
            addValue = (i, name, value) =>
            {
                var memberType = i.GetMemberType();

                switch (value)
                {
                    case bool v:
                        AppendTestbenchLines($"{name} = {(v ? "1'b1" : "1'b0")};");
                        break;
                    case RTLBitArray b:
                        AppendTestbenchLines($"{name} = {b.Size}'b{b.AsBinaryString()};");
                        break;
                    default:
                        if (RTLTypeCheck.IsSynthesizableObject(memberType))
                        {
                            var props = RTLReflectionTools.SynthesizableMembers(memberType);
                            foreach (var m in props)
                            {
                                var memberName = $"{name}_{m.Name}";
                                var memberValue = m.GetValue(value) ?? RTLModuleHelper.Activate(m.GetMemberType());
                                var memberSize = _topLevel.SizeOfValue(value);

                                addValue(m, memberName, memberValue);
                            }
                        }
                        else
                        {
                            AppendTestbenchLines($"{name} = {value};");
                        }
                        break;
                }
            };

            foreach (var i in _topLevel.InputProps)
            {
                var value = i.GetValue(inputs);
                addValue(i, i.Name, value);
            }
        }

        public void AssertOutputs()
        {
            AppendTestbenchLines($"@(negedge clk);");

            Action<MemberInfo, string, object> assertValue = null;
            assertValue = (i, name, value) =>
            {
                var memberType = i.GetMemberType();
                var message = $"{name}: value does not match at clock {_simulatorContext.Clock}";
                switch (value)
                {
                    case bool v:
                        AppendTestbenchLines($"`Assert({(v ? "1'b1" : "1'b0")}, {name}, \"{message}\");");
                        break;
                    case RTLBitArray b:
                        AppendTestbenchLines($"`Assert({b.Size}'b{b.AsBinaryString()}, {name}, \"{message}\");");
                        break;
                    default:
                        if (RTLTypeCheck.IsSynthesizableObject(memberType))
                        {
                            var props = RTLReflectionTools.SynthesizableMembers(memberType);
                            foreach (var m in props)
                            {
                                var memberName = $"{name}_{m.Name}";
                                var memberValue = m.GetValue(value) ?? RTLModuleHelper.Activate(m.GetMemberType());
                                var memberSize = _topLevel.SizeOfValue(value);

                                assertValue(m, memberName, memberValue);
                            }
                        }
                        else
                        {
                            AppendTestbenchLines($"`Assert({value}, {name}, \"{message}\");");
                        }
                        break;
                }
            };

            foreach (var o in _topLevel.OutputProps)
            {
                var value = o.GetValue(_topLevel);
                assertValue(o, o.Name, value);
            }
        }

        public string CompleteTestbench()
        {
            indent--;
            AppendTestbenchLines($"end");
            AppendSeparator();

            AppendTestbenchLines($"// DUT instantiation");
            AppendTestbenchLines($"{ModuleName}_TopLevel_TopLevel dut (");
            indent++;

            AppendTestbenchLines(".Clock (clk),");
            AppendTestbenchLines(".Reset (reset),");

            var map = new List<string>();

            Action<MemberInfo, string> addMapping = null;
            addMapping = (i, name) =>
            {
                var memberType = i.GetMemberType();

                if (RTLTypeCheck.IsSynthesizableObject(memberType))
                {
                    var props = RTLReflectionTools.SynthesizableMembers(memberType);
                    foreach (var m in props)
                    {
                        var memberName = $"{name}_{m.Name}";
                        addMapping(m, memberName);
                    }
                }
                else
                {
                    map.Add($".{name} ({name})");
                }
            };

            foreach (var i in _topLevel.InputProps)
            {
                addMapping(i, i.Name);
            }

            foreach (var o in _topLevel.OutputProps)
            {
                addMapping(o, o.Name);
            }

            AppendTestbenchLines(string.Join($",{Environment.NewLine}", map.Select(t => $"{t}")));

            indent--;
            AppendTestbenchLines($");");
            indent--;
            AppendTestbenchLines("endmodule");
            return Testbench.ToString();
        }
    }
}
