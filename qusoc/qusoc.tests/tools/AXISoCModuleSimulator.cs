using Quokka.RTL.Simulator;
using System.Collections.Generic;
using Quokka.RTL;
using AXISoC;
using System.Linq;
using QRV32.CPU;
using System.Diagnostics;
using System;
using axi.modules;

namespace QuSoC.Tests
{
    public abstract class AXISoCModuleSimulator<TModule> : RTLInstanceSimulator<TModule>
        where TModule : IRTLCombinationalModule
    {
        protected HashSet<uint> InfiniteLoopAddresses = new HashSet<uint>();
        public uint ClockCycles = 0;
        Stopwatch runtime = new Stopwatch();
        public TimeSpan Duration => runtime.Elapsed;
        public double CPS => ClockCycles / Duration.TotalSeconds;

        protected AXISoCModuleSimulator() { }

        protected abstract AXI4MemoryModule InstructionsMemory { get; }
        protected abstract Dictionary<string, AXI4RISCVModule> CPUs { get; }

        public AXISoCModuleSimulator(TModule module, string vcdPath = null)
        {
            Initialize(module, vcdPath);
            var instructionsMemory = InstructionsMemory;

            InfiniteLoopAddresses.AddRange(
                instructionsMemory
                .State
                .buff
                .Select(bytes => (int)(new RTLBitArray(bytes)))
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

            var cpusMap = CPUs;
            var cpus = cpusMap.Select(c => c.Value).ToList();
            var cpuNames = cpusMap.ToDictionary(c => c.Value, c => c.Key);

            var inInfiniteLoop = cpus.ToDictionary(c => c, c => false);

            while (true)
            {
                var instructionFetch = cpus.Where(c => c.CPU.State.State == CPUState.IF).ToList();

                foreach (var cpu in instructionFetch)
                {
                    var addr = cpu.CPU.MemAddress >> 2;
                    if (addr >= InstructionsMemory.State.buff.Length)
                        Debugger.Break();

                    if (cpu.CPU.Inputs.MemReady)
                    {
                        var instruction = (uint)(new RTLBitArray(InstructionsMemory.State.buff[addr]));
                        var disasm = new Disassembler();
                        var code = disasm.Single(cpu.CPU.MemAddress, instruction);
                        if (Debugger.IsAttached)
                        {
                            Trace.WriteLine($"{cpuNames[cpu]}: {code}");
                        }
                    }

                    if (InfiniteLoopAddresses.Contains(cpu.CPU.MemAddress))
                    {
                        Trace.WriteLine($"{cpuNames[cpu]} is in infinite loop");
                        inInfiniteLoop[cpu] = true;
                    }
                }

                if (inInfiniteLoop.All(p => p.Value))
                    break;

                if (keepRunningCheck != null && !keepRunningCheck())
                {
                    break;
                }

                if (ClockCycles++ == maxClockCycles)
                    throw new Exception($"Exceeded max allowed clock cycles: {maxClockCycles}");

                var halted = cpus.Where(c => c.CPU.State.State == CPUState.Halt);
                var haltedExceptions = halted.Select(c => new Exception($"CPU halted: {c.CPU.State.HaltCode}")).ToList();
                if (haltedExceptions.Any())
                    throw new AggregateException(haltedExceptions);

                ClockCycle();
            }

            runtime.Stop();
        }

        public List<string> MemoryDump()
        {
            var memDump = InstructionsMemory.State.buff
                .Select(bytes => (int)(new RTLBitArray(bytes)))
                .Select((data, idx) => new { data, idx = idx * 4 })
                .Where(d => d.data != 0)
                .Select(d => $"[{d.idx:X6}]: {d.data:X8}")
                .ToList();

            return memDump;
        }
    }
}