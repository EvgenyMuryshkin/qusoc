﻿using Quokka.RTL.Simulator;
using System;
using System.Collections.Generic;
using System.Linq;
using QRV32.CPU;
using System.Diagnostics;
using QuSoC.Demos;

namespace QuSoC.Tests
{
    public class QuSoCModuleSimulator : QuSoCModuleSimulator<IntegrationTestModule>
    {
        public QuSoCModuleSimulator(uint[] instructions)
        {
            Initialize(new IntegrationTestModule(instructions));

            InfiniteLoopAddresses.AddRange(
                instructions
                .Select((i, idx) => new { i, idx })
                .Where(p => p.i == 0x6F) // j loop code
                .Select(p => (uint)(p.idx * 4))
            );
        }
    }

    public class QuSoCModuleSimulator<T> : RTLInstanceSimulator<T>
        where T : QuSoCModule
    {
        protected HashSet<uint> InfiniteLoopAddresses = new HashSet<uint>();
        public uint ClockCycles = 0;

        protected QuSoCModuleSimulator() { }

        public QuSoCModuleSimulator(T module)
        {
            Initialize(module);
            InfiniteLoopAddresses.AddRange(
                module.InstructionsRAM.State.BlockRAM
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
            ClockCycles = 0;
            uint? lastIF = 0;

            while (true)
            {
                if (TopLevel.CPU.State.State == CPUState.IF)
                {
                    var addr = TopLevel.CPU.MemAddress >> 2;
                    if (Debugger.IsAttached && (lastIF == null || lastIF != addr))
                    {
                        lastIF = addr;
                        var instruction = TopLevel.InstructionsRAM.State.BlockRAM[addr];
                        var disasm = new Disassembler();
                        var code = disasm.Single(TopLevel.CPU.MemAddress, instruction);
                        if (Debugger.IsAttached)
                        {
                            Trace.WriteLine(code);
                        }
                    }
                }

                if (TopLevel.CPU.State.State == CPUState.IF && InfiniteLoopAddresses.Contains(TopLevel.CPU.MemAddress))
                {
                    break;
                }

                if (keepRunningCheck != null && !keepRunningCheck())
                {
                    break;
                }

                if (ClockCycles++ == maxClockCycles)
                    throw new Exception($"Exceeded max allowed clock cycles: {maxClockCycles}");

                if (TopLevel.CPU.State.State == CPUState.Halt)
                    throw new Exception($"CPU halted: {TopLevel.CPU.State.HaltCode}");

                //ClockCycle(new QuSoCModuleInputs());
                ClockCycle();
            }
        }

        public List<string> MemoryDump()
        {
            var memDump = TopLevel.InstructionsRAM.State.BlockRAM
                .Select((data, idx) => new { data, idx = idx * 4 })
                .Where(d => d.data != 0)
                .Select(d => $"[{d.idx:X6}]: {d.data:X8}")
                .ToList();

            return memDump;
        }
    }
}