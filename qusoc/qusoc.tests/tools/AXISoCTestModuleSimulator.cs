using Quokka.RTL.Simulator;
using System.Collections.Generic;
using Quokka.RTL;
using AXISoC;
using System.Linq;
using QRV32.CPU;
using System.Diagnostics;
using System;
using FPGA;

namespace QuSoC.Tests
{
    public class AXISoCTestModuleSimulator<T> : RTLInstanceSimulator<T>
        where T : AXISoCTestModule
    {
        protected HashSet<uint> InfiniteLoopAddresses = new HashSet<uint>();
        public uint ClockCycles = 0;
        Stopwatch runtime = new Stopwatch();
        public TimeSpan Duration => runtime.Elapsed;
        public double CPS => ClockCycles / Duration.TotalSeconds;

        protected AXISoCTestModuleSimulator() { }

        public AXISoCTestModuleSimulator(T module, string vcdPath = null)
        {
            Initialize(module, vcdPath);
            InfiniteLoopAddresses.AddRange(
                module.Memory.State.buff
                .Select(bytes => (int)(new RTLBitArray(bytes)) )
                .Select((i, idx) => new { i, idx })
                .Where(p => p.i == 0x6F) // j loop code
                .Select(p => (uint)(p.idx * 4))
            );
        }

        public void RunToCompletion(uint maxClockCycles = 10000)
        {
            RunToCompletion(null, maxClockCycles);
        }

        public void RunToCompletion(Func<bool> keepRunningCheck, uint maxClockCycles = 10000)
        {
            runtime.Restart();
            ClockCycles = 0;
            //uint? lastIF = 0;

            while (true)
            {
                if (TopLevel.CPU.CPU.State.State == CPUState.IF)
                {
                    var addr = TopLevel.CPU.CPU.MemAddress >> 2;
                    if (addr >= TopLevel.Memory.State.buff.Length)
                        Debugger.Break();

                    if (TopLevel.CPU.CPU.Inputs.MemReady)
                    {
                        var instruction = (uint)(new RTLBitArray(TopLevel.Memory.State.buff[addr]));
                        var disasm = new Disassembler();
                        var code = disasm.Single(TopLevel.CPU.CPU.MemAddress, instruction);
                        if (Debugger.IsAttached)
                        {
                            Trace.WriteLine(code);
                        }
                    }
                }

                if (TopLevel.CPU.CPU.State.State == CPUState.IF && InfiniteLoopAddresses.Contains(TopLevel.CPU.CPU.MemAddress))
                {
                    break;
                }

                if (keepRunningCheck != null && !keepRunningCheck())
                {
                    break;
                }

                if (ClockCycles++ == maxClockCycles)
                    throw new Exception($"Exceeded max allowed clock cycles: {maxClockCycles}");

                if (TopLevel.CPU.CPU.State.State == CPUState.Halt)
                    throw new Exception($"CPU halted: {TopLevel.CPU.CPU.State.HaltCode}");

                //ClockCycle(new QuSoCModuleInputs());
                ClockCycle();
            }

            runtime.Stop();
        }

        public List<string> MemoryDump()
        {
            var memDump = TopLevel.Memory.State.buff
                .Select(bytes => (int)(new RTLBitArray(bytes)))
                .Select((data, idx) => new { data, idx = idx * 4 })
                .Where(d => d.data != 0)
                .Select(d => $"[{d.idx:X6}]: {d.data:X8}")
                .ToList();

            return memDump;
        }
    }
}