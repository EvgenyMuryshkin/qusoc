using QRV32.CPU;
using Quokka.RTL;
using System;
using System.Diagnostics;

namespace QRV32.Tests
{
    public class RISCVModuleSimulator : CPUSimulator<RISCVModule, RISCVModuleInputs>
    {
        protected override RISCVModule CPU => TopLevel;

        public override void ClockCycle(RISCVModuleInputs inputs)
        {
            inputsModifier?.Invoke(inputs, CallbackData);
            base.ClockCycle(inputs);
        }

        public override bool Step()
        {
            if (!RunTillInstructionFetch())
                return false;

            if (!FeedNextInstruction())
                return false;

            //if (!RunTillInstructionFetch())
            //    return false;

            return true;
        }

        bool FeedNextInstruction()
        {
            if (wordAddress >= MemoryBlock.Length)
                throw new IndexOutOfRangeException($"Requested address in IF was outside of memory block: {wordAddress}");

            // end state condition
            if (wordAddress >= instructionsCount)
            {
                TraceLine($"Simulation finished, instruction read outside of program memory [{CPU.MemAddress.ToString("X6")}]");
                return false;
            }

            var instruction = MemoryBlock[wordAddress];
            var disasm = new Disassembler();
            var code = disasm.Single(CPU.State.PC, instruction);
            TraceLine(code);

            if (instruction == 111)
            {
                TraceLine($"Simulation finished, detected infinite loop at address [{CPU.MemAddress.ToString("X6")}]");
                return false;
            }

            ClockCycle(new RISCVModuleInputs() { MemReady = true, MemReadData = MemoryBlock[wordAddress] });

            return true;
        }

        public bool RunTillInstructionFetch()
        {
            int counter = 0;

            while (counter++ < 1000)
            {
                switch (CPU.State.State)
                {
                    case CPUState.Halt:
                        throw new Exception($"CPU Halted{Environment.NewLine}{TopLevel}");
                    case CPUState.E:
                        switch (CPU.ID.SysTypeCode)
                        {
                            case SysTypeCodes.CALL:
                                {
                                    ECall();
                                }
                                break;
                            case SysTypeCodes.BREAK:
                                {
                                    // ebreak
                                    Debugger.Break();
                                    DebuggerCalls++;
                                }
                                break;
                        }
                        ClockCycle();
                        break;
                    case CPUState.MEM:
                        if (wordAddress == 0x24000000)
                        {
                            if (CPU.MemRead)
                            {
                                ClockCycle(new RISCVModuleInputs() { MemReady = true });
                            }
                            else
                            {
                                ClockCycle(new RISCVModuleInputs() { MemReady = true });
                            }
                            break;
                        }
                        if (wordAddress >= MemoryBlock.Length)
                            throw new IndexOutOfRangeException($"Requested address in IF was outside of memory block: {wordAddress}");

                        if (CPU.MemRead)
                        {
                            var word = new RTLBitArray(MemoryBlock[wordAddress]);
                            var data = word >> byteAddress;
                            ClockCycle(new RISCVModuleInputs() { MemReady = true, MemReadData = data });
                        }
                        else if (CPU.MemWrite)
                        {
                            var word = new RTLBitArray(MemoryBlock[wordAddress]);
                            var mask = new RTLBitArray(uint.MinValue);
                            var value = (CPU.MemWriteData << byteAddress).Resized(32);

                            switch ((byte)CPU.MemAccessMode)
                            {
                                case 0:
                                    mask = (new RTLBitArray(byte.MaxValue) << byteAddress).Resized(32);
                                    break;
                                case 1:
                                    mask = (new RTLBitArray(ushort.MaxValue) << byteAddress).Resized(32);
                                    break;
                                case 2:
                                    mask = new RTLBitArray(uint.MaxValue);
                                    break;
                                default:
                                    throw new Exception($"Unsupported mem write mode: {CPU.MemAccessMode}");
                            }

                            word &= !mask;
                            var part = value & mask;
                            word |= part;

                            // write data back to mem
                            MemoryBlock[wordAddress] = word;

                            ClockCycle(new RISCVModuleInputs() { MemReady = true });
                        }
                        else
                        {
                            throw new Exception($"No operation in mem stage");
                        }
                        break;
                    case CPUState.IF:
                        return true;
                    default:
                        ClockCycle();
                        break;
                }
            }

            throw new Exception("CPU seems to hang");
        }
    }
}
