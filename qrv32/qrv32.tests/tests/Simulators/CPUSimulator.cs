using QRV32.CPU;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using System;
using System.Collections.Generic;
using System.Diagnostics;

namespace QRV32.Tests
{
    public interface ICPUSimulator
    { 
    }
    
    public abstract class CPUSimulator<TModule, TInputs> : RTLSimulator<TModule, TInputs>, ICPUSimulator
        where TModule : IRTLCombinationalModule<TInputs>, new ()
        where TInputs : new ()

    {
        public int DebuggerCalls = 0;
        public List<uint> ECalls = new List<uint>();

        public uint[] MemoryBlock = new uint[32768];
        protected int instructionsCount = 0;

        public Action<RISCVModuleInputs, RTLSimulatorCallback<RISCVModule>> inputsModifier = null;

        public CPUSimulator()
        {

        }

        protected abstract RISCVModule CPU { get; }

        public void SetInstructions(uint[] instructions)
        {
            for (instructionsCount = 0; instructionsCount < instructions.Length; instructionsCount++)
            {
                MemoryBlock[instructionsCount] = instructions[instructionsCount];
            }
        }

        public void RunAll(params uint[] instructions)
        {
            SetInstructions(instructions);
            RunAllInstructions();
        }

        public void RunAllInstructions(uint maxInstructions = 1000)
        {
            while (--maxInstructions != 0)
            {
                if (!Step())
                    return;
            }

            throw new Exception("CPU seems to hang");
        }

        public abstract bool Step();

        protected RTLBitArray wordAddress => CPU.MemAddress >> 2;
        protected byte byteAddress => (byte)((CPU.MemAddress & 0x3) << 3);

        protected virtual void TraceLine(string value)
        {
            if (Debugger.IsAttached)
            {
                Trace.WriteLine(value);
            }
        }

        protected virtual void ECall()
        {
            // ecall, do something with ecall
            ECalls.Add(CPU.Regs.State.x[17]);
        }
    }
}
