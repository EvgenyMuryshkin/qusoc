using AXISoC;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.CPU;
using Quokka.RISCV.CS2CPP.CodeModels.CPP;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO.Ports;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace QuSoC.Tests
{
    [TestClass]
    public class AXISoCModulesTests : AXISoCModuleBaseTest
    {
        [TestMethod]
        public void AXISoCTestModule()
        {
            var instructions = Inst.FromAsmFile("axisoc");
            var topLevel = new AXISoCTestModule();
            var bytes = instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();
            topLevel.Memory.Initialize(bytes);
            var dump1 = topLevel.Memory.State.buff.Select(s => new RTLBitArray(s)).ToList();

            var sim = new AXISoCTestModuleSimulator<AXISoCTestModule>(topLevel);
            sim.RunToCompletion();
            var dump2 = topLevel.Memory.State.buff.Select(s => new RTLBitArray(s)).ToList();

            var diff = dump1.Zip(dump2, (l, r) => new { l, r, s = l == r }).ToList();
            var t = diff.FindIndex(c => c.s == false);

            var v0 = new RTLBitArray(topLevel.Memory.State.buff[0x200]);
            var v1 = new RTLBitArray(topLevel.Memory.State.buff[0x201]);
            var v2 = new RTLBitArray(topLevel.Memory.State.buff[0x202]);


            Assert.AreEqual(15, (int)(new RTLBitArray(topLevel.Reg.outData)));
        }

        [TestMethod]
        public void AXISoCDualCoreModule()
        {
            var instructions = Inst.FromAsmFile("axisocdualcore");
            var bytes = instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();

            var topLevel = new AXISoCDualCoreModule(instructions);

            var sim = new AXISoCDualCoreModuleSimulator<AXISoCDualCoreModule>(topLevel);
            sim.RunToCompletion(() =>
            {
                var reg0 = (int)(new RTLBitArray(topLevel.Reg0.outData));
                var reg1 = (int)(new RTLBitArray(topLevel.Reg1.outData));

                return reg0 != 10 || reg1 != 20;
            });
            Assert.AreEqual(10, (int)(new RTLBitArray(topLevel.Reg0.outData)));
            Assert.AreEqual(20, (int)(new RTLBitArray(topLevel.Reg1.outData)));
        }

        [TestMethod]
        public void T()
        {
            int result = 0;
            var addr = "80000010";

            for (int i = 0; i < 8; i++)
            {
                var b = addr[i];
                var hexPart = 0;
                switch (b)
                {
                    case '0': hexPart = 0; break;
                    case '1': hexPart = 1; break;
                    case '2': hexPart = 2; break;
                    case '3': hexPart = 3; break;
                    case '4': hexPart = 4; break;
                    case '5': hexPart = 5; break;
                    case '6': hexPart = 6; break;
                    case '7': hexPart = 7; break;
                    case '8': hexPart = 8; break;
                    case '9': hexPart = 9; break;
                    case 'a': hexPart = 10; break;
                    case 'b': hexPart = 11; break;
                    case 'c': hexPart = 12; break;
                    case 'd': hexPart = 13; break;
                    case 'e': hexPart = 14; break;
                    case 'f': hexPart = 15; break;
                }
                result = (result << 4) | hexPart;
            }
        }

        [TestMethod]
        public void AXISoCQuadCoreCPU0()
        {
            if (!Debugger.IsAttached)
                return;

            while (true)
            {
                try
                {
                    var disasm = new Disassembler();
                    var tools = new FirmwareTools(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore");
                    tools.ModifyMakefile();
                    tools.Make();
                    tools.Disassemble();
                    var instructions = tools.Instructions();
                    var code = disasm.Disassemble(instructions);
                }
                catch (Exception ex)
                {

                }
            }
        }

        [TestMethod]
        public async Task AXIProgrammer_ToggleReg4()
        {
            if (!Debugger.IsAttached)
                return;

            using (var u = new AXIProgrammerClient())
            {
                for (var i = 0; i < 10; i++)
                {
                    await u.Sync();
                    var reg0 = await u.readData(0x80000004);
                    var reg1 = await u.readData(0x80000008);
                    var reg2 = await u.readData(0x8000000C);
                    var reg3 = await u.readData(0x80000010);
                    reg1 = reg1 ^ 0x1;
                    await u.writeData(0x80000008, reg1);
                    await Task.Delay(TimeSpan.FromMilliseconds(500));
                }
            }
        }

        [TestMethod]
        public async Task AXIProgrammer_Update_CPU0_With_CPU1()
        {
            while (true)
            {
                try
                {
                    var cpu1Instructions = FirmwareTools.FromFolder(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu1");

                    using (var u = new AXIProgrammerClient())
                    {
                        await u.Update(0, cpu1Instructions);
                    }
                }
                catch (Exception ex)
                {

                }
            }

        }

        [TestMethod]
        public async Task ToggleReg4()
        {
            using (var u = new AXISocCPUUpdater())
            {
                for (var i = 0; i < 10; i++)
                {
                    var reg4 = await u.readData(0x80000010);
                    reg4 = reg4 ^ 0x1;
                    await u.writeData(0x80000010, reg4);
                    await Task.Delay(TimeSpan.FromSeconds(1));
                }
            }
        }
         
        [TestMethod]
        public async Task FloatTest()
        {
            using (var u = new AXISocCPUUpdater())
            {
                var cpu1Instructions = FirmwareTools.FromFolder(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu1");
                await u.Update(1, cpu1Instructions);

                Func<float, float, Task> genericFloatOp = async (float1, float2) =>
                {
                    var op1 = BitConverter.SingleToUInt32Bits(float1);
                    var op2 = BitConverter.SingleToUInt32Bits(float2);
                    await u.writeData(0x90000104, op1);
                    await u.writeData(0x90000108, op2);

                    float[] values = new float[7];
                    for (uint i = 1; i <= 6; i++)
                    {
                        await u.writeData(0x90000100, i);
                        while (true)
                        {
                            var status = await u.readData(0x90000100);
                            if (status == 0)
                                break;

                            await Task.Delay(50);
                        }

                        var result = await u.readData(0x9000010C);
                        var floatResult = BitConverter.UInt32BitsToSingle(result);
                        values[i] = floatResult;
                    }

                    float[] expValues = new float[7]
                    {
                        0,
                        float1 + float2,
                        float1 - float2,
                        float1 * float2,
                        float1 / float2,
                        (float)Math.Sin(float1),
                        (float)Math.Cos(float1),
                    };

                    var checks = values.Zip(expValues, (a, e) => new { a, e }).ToList();

                    Func<float, float, bool> compareFloats = (f1, f2) =>
                    {
                        if (f1 == f2)
                            return true;

                        if (float.IsNaN(f1) && float.IsNaN(f2))
                            return true;

                        var u1 = BitConverter.SingleToUInt32Bits(f1);
                        var u2 = BitConverter.SingleToUInt32Bits(f2);

                        var delta = Math.Abs((int)(u1 - u2));
                        if (delta <= 1)
                            return true;

                        return false;
                    };

                    if (checks.Any(c => !compareFloats(c.a, c.e)))
                    {
                        Debugger.Break();
                    }
                };

                Func<float, float, Task> floatOp = async (op1, op2) =>
                {
                    await genericFloatOp(op1, op2);
                    await genericFloatOp(op1, -op2);
                    await genericFloatOp(-op1, op2);
                    await genericFloatOp(-op1, -op2);

                    await genericFloatOp(op2, op1);
                    await genericFloatOp(op2, -op1);
                    await genericFloatOp(-op2, op1);
                    await genericFloatOp(-op2, -op1);
                };

                await floatOp(0f, 0f);
                await floatOp(0f, 0.5f);
                await floatOp(0f, 1f);

                await floatOp(float.MaxValue, float.MaxValue);
                await floatOp(float.MinValue, float.MinValue);
                await floatOp(float.MinValue, float.MaxValue);
                await floatOp(float.Epsilon, float.Epsilon);
                await floatOp(5.877472e-39f, 5.877472e-39f);
                await floatOp(1.1754942e-38f, 1e-45f);
                await floatOp(1.1754941e-38f, -1.1754942e-38f);
                await floatOp(1.1754944e-38f, -float.Epsilon);

                await floatOp(0.556257248f, 0.500910938f);
                await floatOp(0.444681585f, 0.299055785f);
                await floatOp(0.5499884f, 0.212284908f);
                await floatOp(0.931204557f, 0.104905911f);
                await floatOp(0.0076710307f, 0.952018857f);
                await floatOp(0.123259649f, 0.876740336f);
                await floatOp(0.0007939787f, 0.379645854f);
                await floatOp(0.362758845f, 0.000253781764f);

                await floatOp(-0.00204727077f, 0.59962666f);
                await floatOp(0.00204727077f, -0.59962666f);
                await floatOp(-0.59962666f, 0.00204727077f);
                await floatOp(0.59962666f, -0.00204727077f);

                await floatOp(-0.4337583f, 0.0008127541f);
                await floatOp(1, -1f);

                await floatOp(1000f, 0.5f);
                await floatOp(1000f, -0.5f);
                await floatOp(1024f, -1f);
                await floatOp(12.75f, -12.5f);
                await floatOp(12.5f, 77.25f);
                await floatOp(-12.5f, -77.25f);

                await floatOp(12.5f, -77.25f);
                await floatOp(77.25f, -12.5f);
                await floatOp(-12.5f, 77.25f);
                await floatOp(-77.25f, 12.5f);

                await floatOp(-0.184847608f, 0.9391488f); // need rounding
                await floatOp(-0.0205731746f, 0.041971f); // does not need rounding

                var rnd = new Random();
                for (var t = 0; t < 10000; t++)
                {
                    if (t % 10 == 0)
                    {
                        Trace.WriteLine($"Iteration: {t}");
                    }
                    var scale = rnd.Next();

                    var float1 = rnd.NextSingle();
                    var float2 = scale * rnd.NextSingle();
                    await floatOp(float1, float2);
                }
            }
        }

        [TestMethod]
        public async Task AXISoCQuadCoreModule_UpdateCPU1()
        {
            if (!Debugger.IsAttached)
                return;

            while (true)
            {
                try
                {
                    //var cpu1Instructions = Inst.FromAsmFile("axisocquadcore_cpu1_update");
                    var cpu1Instructions = FirmwareTools.FromFolder(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu1");

                    await AXISocCPUUpdater.UpdateCPU(1, cpu1Instructions);
                }
                catch (Exception ex)
                {

                }
            }
        }
        [TestMethod]
        public async Task AXISoCQuadCoreModule_CPU1_Disasm()
        {
            if (!Debugger.IsAttached)
                return;

            var tools = new FirmwareTools(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu1");
            tools.Disassemble();
        }
         
        [TestMethod]
        public async Task AXISoCQuadCoreModule_CPU1_Sim()
        {
            if (!Debugger.IsAttached)
                return;

            while (true)
            {
                try
                {
                    //var cpu1Instructions = Inst.FromAsmFile("axisocquadcore_cpu1_update");
                    var cpu0Instructions = FirmwareTools.FromFolder(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu0");
                    var cpu1Instructions = FirmwareTools.FromFolder(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu1");
                    //var tools = new FirmwareTools(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore\cpu1");
                    //var cpu1Instructions = tools.Instructions();
                    var looped = new[] { 0x0000006FU };
                    var topLevel = new AXISoCQuadCoreModule(
                        cpu0Instructions,//cpu1Instructions,
                        looped,
                        looped,
                        looped
                    );

                    var programmer = topLevel.programmer;
                    programmer.receiverFIFO.PushByteToFIFO(0x55);
                    programmer.receiverFIFO.PushByteToFIFO(2);// Write
                    programmer.receiverFIFO.PushUint32ToFIFO(0x80000004); // Write Address - PWM0
                    programmer.receiverFIFO.PushUint32ToFIFO(0xAA5581FF); // Write Data
                    programmer.receiverFIFO.PushByteToFIFO(0x55);
                    programmer.receiverFIFO.PushByteToFIFO(1);// Read
                    programmer.receiverFIFO.PushUint32ToFIFO(0x80000004); // Write Address - Reg0

                    //var uart = topLevel.uart;
                    //uart.receiverFIFO.PushByteToFIFO((byte)('5')); // write
                    //uart.receiverFIFO.PushUint32AsStringToFIFO(0x90000100);
                    //uart.receiverFIFO.PushUint32AsStringToFIFO(0x12345678);
                    //var s = uart.receiverFIFO.oIsEmpty;

                    var sim = new AXISoCQuadCoreModuleSimulator<AXISoCQuadCoreModule>(topLevel);
                    sim.BreakOnInfiniteLoops = false;


                    //var reg1Values = new List<int>();
                    //topLevel.Reg0.State.bytes[3] = 255;
                    //topLevel.pwm.State.pwm[0] = 2;
                    //topLevel.pwm.State.pwm[1] = BitConverter.SingleToUInt32Bits(0.3f);
                    //topLevel.pwm.State.pwm[2] = BitConverter.SingleToUInt32Bits(0.1f);
                    
                    //topLevel.Reg0.State.bytes[3] = 255;
                    //topLevel.Reg0.State.bytes[2] = 1;
                    //topLevel.Reg0.State.bytes[1] = 2;
                    //topLevel.Reg0.State.bytes[0] = 3;

                    sim.RunToCompletion(() =>
                    {
                        int reg0 = new RTLBitArray(topLevel.Reg0.outData);
                        int reg1 = new RTLBitArray(topLevel.Reg1.outData);
                        int reg2 = new RTLBitArray(topLevel.Reg2.outData);
                        int reg3 = new RTLBitArray(topLevel.Reg3.outData);

                        //if (!reg1Values.Contains(reg1))
                        //    reg1Values.Add(reg1);

                        //if (topLevel.Reg0.State.bytes[3] != 255)
                        //{
                        //    reg1Values.Add(reg0);
                        //    topLevel.Reg0.State.bytes[3] = 255;
                        //}


                        if (topLevel.CPU0.CPU.State.State == CPUState.IF && topLevel.CPU0.CPU.NextState.State != CPUState.IF)
                        {
                            //Debugger.Break();
                        }

                        //if (topLevel.pwm.State.pwm[3] != 0)
                        //    return false;

                        var pwm0 = topLevel.pwm.State.pwm[0];
                        var pwm1 = topLevel.pwm.State.pwm[1];

                        //if (reg1 == 7)
                        //    return false;

                        //if (pwm0 != 0 && pwm1 != 0)
                        //    return false;

                        if (programmer.State.fsm == axi.modules.AXI4ProgrammerFSM.AXIReadEnd &&
                            programmer.NextState.fsm == axi.modules.AXI4ProgrammerFSM.DispatchIdle)
                        {
                            var writeSync = programmer.transmitterFIFO.State.buffer[0];
                            var readSync = programmer.transmitterFIFO.State.buffer[1];
                            var readData = new RTLBitArray(RTLBitArrayInitType.MSB, programmer.transmitterFIFO.State.buffer.Skip(2).Take(4).ToArray());

                            Assert.AreEqual<uint>(0xAA5581FF, readData);
                            return false;
                        }

                        return true;// reg0 < 10;
                    });

                    //uint reg0Value = new RTLBitArray(topLevel.pwm.State.pwm[3]/*topLevel.Reg0.outData*/);
                    //var reg0FloatValue = BitConverter.UInt32BitsToSingle(reg0Value);
                    //
                    //var reg0Floats = reg1Values.Select(v => BitConverter.UInt32BitsToSingle(new RTLBitArray(v))).ToList();
                    //var pwmFloats = topLevel.pwm.State.pwm.Select(v => BitConverter.UInt32BitsToSingle(new RTLBitArray(v))).ToList();
                }
                catch (Exception ex)
                {

                }
            }
        }

        [TestMethod]
        public void AXISoCQuadCoreModule()
        {
            var disasm = new Disassembler();
            var tools = new FirmwareTools(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore");
            tools.ModifyMakefile();
            tools.Make();
            tools.Disassemble();
            var instructions = tools.Instructions();
            var code = disasm.Disassemble(instructions);


            var cpu0Instructions = Inst.FromAsmFile("axisocquadcore_cpu0");
            var cpu1Instructions = Inst.FromAsmFile("axisocquadcore_cpu1");
            var cpu2Instructions = Inst.FromAsmFile("axisocquadcore_cpu2");
            var cpu3Instructions = Inst.FromAsmFile("axisocquadcore_cpu3");

            var topLevel = new AXISoCQuadCoreModule(
                cpu0Instructions,//instructions,//cpu0Instructions,
                cpu1Instructions,
                cpu2Instructions,
                cpu3Instructions
            );

            var sim = new AXISoCQuadCoreModuleSimulator<AXISoCQuadCoreModule>(topLevel);

            // all pressed
            topLevel.Schedule(() => new AXISoCQuadCoreModuleInputs()
            {
                iButton0 = true,
                iButton1 = true,
                iButton2 = true,
                iButton3 = true,
                iSwitch0 = true,
                iSwitch1 = true
            });

            sim.RunToCompletion(() =>
            {
                int reg0 = new RTLBitArray(topLevel.Reg0.outData);
                int reg1 = new RTLBitArray(topLevel.Reg1.outData);
                int reg2 = new RTLBitArray(topLevel.Reg2.outData);
                int reg3 = new RTLBitArray(topLevel.Reg3.outData);

                return reg0 < 10;
            });
        }

        /*
        [TestMethod]
        public void AXISoCQuadCoreModule_UART()
        {
            var instructions = Inst.FromAsmFile("axisocquadcore");
            var bytes = instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();

            var topLevel = new AXISoCQuadCoreModule(instructions);
            var sim = new AXISoCQuadCoreModuleSimulator<AXISoCQuadCoreModule>(topLevel);

            sim.RunToCompletion(() =>
            {
                int reg0 = new RTLBitArray(topLevel.Reg0.outData);
                int reg1 = new RTLBitArray(topLevel.Reg1.outData);
                int reg2 = new RTLBitArray(topLevel.Reg2.outData);
                int reg3 = new RTLBitArray(topLevel.Reg3.outData);

                return reg1 < 10;
            });
        }
        */
    }
}
