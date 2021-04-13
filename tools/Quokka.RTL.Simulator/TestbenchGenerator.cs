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
            foreach (var i in _topLevel.InputProps)
            {
                var value = i.GetValue(_topLevel.RawInputs);
                var info = _topLevel.SizeOfValue(value);

                if (info.Size == 1)
                {
                    AppendTestbenchLines($"reg {i.Name};");
                }
                else
                {
                    AppendTestbenchLines($"reg [{info.Size - 1}:0] {i.Name};");
                }
            }

            AppendSeparator();
            foreach (var o in _topLevel.OutputProps)
            {
                var value = o.GetValue(_topLevel);
                var info = _topLevel.SizeOfValue(value);

                if (info.Size == 1)
                {
                    AppendTestbenchLines($"wire {o.Name};");
                }
                else
                {
                    AppendTestbenchLines($"wire [{info.Size - 1}:0] {o.Name};");
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
            foreach (var i in _topLevel.InputProps)
            {
                var value = i.GetValue(inputs);
                switch (value)
                {
                    case bool v:
                        AppendTestbenchLines($"{i.Name} = {(v ? "1'b1" : "1'b0")};");
                        break;
                    default:
                        AppendTestbenchLines($"{i.Name} = {value};");
                        break;
                }
            }
        }

        public void AssertOutputs()
        {
            AppendTestbenchLines($"@(negedge clk);");
            foreach (var o in _topLevel.OutputProps)
            {
                var message = $"{o.Name}: value does not match at clock {_simulatorContext.Clock}";
                var value = o.GetValue(_topLevel);
                switch (value)
                {
                    case bool v:
                        AppendTestbenchLines($"`Assert({(v ? "1'b1" : "1'b0")}, {o.Name}, \"{message}\");");
                        break;
                    default:
                        AppendTestbenchLines($"`Assert({value}, {o.Name}, \"{message}\");");
                        break;
                }
            }
        }

        public string CompleteTestbench()
        {
            indent--;
            AppendTestbenchLines($"end");
            AppendSeparator();

            AppendTestbenchLines($"// DUT instantiation");
            AppendTestbenchLines($"{ModuleName}_TopLevel dut (");
            indent++;

            AppendTestbenchLines(".Clock (clk),");
            AppendTestbenchLines(".Reset (reset),");

            var map = new List<string>();

            foreach (var i in _topLevel.InputProps)
            {
                map.Add($".{i.Name} ({i.Name})");
            }

            foreach (var o in _topLevel.OutputProps)
            {
                map.Add($".{o.Name} ({o.Name})");
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
