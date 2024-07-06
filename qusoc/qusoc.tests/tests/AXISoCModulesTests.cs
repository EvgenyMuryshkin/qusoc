using AXISoC;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.CPU;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO.Ports;
using System.Linq;
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

        async Task UpdateCPU1(uint[] instructions)
        {
            using (var mPort = new SerialPort()
            {
                PortName = "COM12",
                BaudRate = 115200,
                Parity = Parity.None,
                DataBits = 8,
                StopBits = StopBits.One,
                Handshake = Handshake.None,
                ReceivedBytesThreshold = 1
            })
            {
                //mPort.DataReceived += DataReceivedHandler;
                //mPort.ErrorReceived += ErrorReceivedHandler;
                mPort.ReceivedBytesThreshold = 1;
                mPort.Open();

                mPort.Write(new[] { '0' }, 0, 1);
                var hello = mPort.ReadLine();

                Action<uint> writeValueWithFeedback = (value) =>
                {
                    var s = value.ToString("X8");
                    var chars = s.ToArray();
                    var feedbackBytes = new byte[8];

                    for (var idx = 0; idx < chars.Length; idx++)
                    {
                        mPort.Write(new[] { chars[idx] }, 0, 1);
                        //while (mPort.BytesToRead == 0) { }
                        //mPort.Read(feedbackBytes, idx, 1);
                    }

                    var feedbackString = mPort.ReadLine().Trim();
                    Assert.AreEqual(s, feedbackString);

                    //var feedbackString = Encoding.ASCII.GetString(feedbackBytes);
                    //Assert.AreEqual(s, feedbackString);
                    //var mewLine = mPort.ReadLine();
                };

                Func<uint, uint, Task> writeData = async (addr, value) =>
                {
                    mPort.Write(new[] { '2' }, 0, 1);
                    var addrPrompt = mPort.ReadLine().Trim();
                    writeValueWithFeedback(addr);

                    var dataPrompt = mPort.ReadLine().Trim();

                    writeValueWithFeedback(value);

                    var doneLine = mPort.ReadLine().Trim();
                };

                // stop CPU1
                await writeData(0x80000000, 0x00000002);

                for (var i = 0; i < instructions.Length; i++)
                {
                    uint addr = 0xF0001000 + (uint)(i * 4);
                    await writeData(addr, instructions[i]);
                }

                // run all CPUs
                await writeData(0x80000000, 0x00000000);

            }
        }


        (bool sign, byte exp, ulong mantissa) Unroll(float f)
        {
            var u = BitConverter.SingleToUInt32Bits(f);

            bool sign = (u >> 31) == 1;
            byte exp = (byte)(u >> mantissaBits);
            ulong mantissa = u & mantissaMask;
            mantissa = mantissa | 0x800000;
            mantissa = mantissa << roundingBits;

            return (sign, exp, mantissa);
        }

        int mantissaBits = 23;
        int roundingBits = 27;
        uint mantissaMask => 0x7FFFFF;
        ulong overflowFlag => (ulong)(0x01000000UL << roundingBits);
        ulong baseFlag => (ulong)(0x800000UL << roundingBits);
        ulong underflowFlags => overflowFlag | baseFlag;

        ulong roundingBit => (ulong)(1UL << roundingBits);
        ulong roundingGBit => (ulong)(1UL << (roundingBits - 1));
        ulong roundingMask => roundingBit - 1;

        ulong Round(ulong mantissa)
        {
            var grs = mantissa & roundingMask;
            if (grs < roundingGBit)
                return mantissa;

            if (grs == roundingGBit)
            {
                if (((mantissa & roundingBit) != 0))
                    return mantissa + roundingGBit;

                return mantissa;
            }

            return mantissa + roundingGBit;
        }

        void ShiftRight(ref ulong mantissa, ref byte exp)
        {
            mantissa = mantissa >> 1;
            exp++;
        }

        void Neg(ref ulong value)
        {
            value = value ^ ulong.MaxValue;
            value += 1;
        }

        float SoftFP_Add(float a, float b)
        {
            var (signA, expA, mantissaA) = Unroll(a);
            var (signB, expB, mantissaB) = Unroll(b);

            if (expA == expB && mantissaA == mantissaB && signA != signB)
                return 0;

            while (expB != expA)
            {
                if (expB < expA)
                {
                    ShiftRight(ref mantissaB, ref expB);
                }
                else
                {
                    ShiftRight(ref mantissaA, ref expA);
                }
            }

            var resExp = expA;
            var resSign = signA;

            if (signA != signB)
            {
                resSign = signA
                    ? mantissaA > mantissaB
                    : mantissaA < mantissaB;

                if (signA)
                {
                    Neg(ref mantissaA);
                }
                else
                {
                    Neg(ref mantissaB);
                }
            }

            var resMantissa = mantissaA + mantissaB;

            if (signA != signB && resSign)
            {
                Neg(ref resMantissa);
            }

            while ((resMantissa & underflowFlags) == 0)
            {
                if (resMantissa == 0)
                {
                    resExp = 0;
                    break;
                }

                resMantissa = resMantissa << 1;
                resExp--;
            }

            if ((resMantissa & overflowFlag) != 0)
            {
                ShiftRight(ref resMantissa, ref resExp);
            }

            resMantissa = Round(resMantissa);

            if ((resMantissa & overflowFlag) != 0)
            {
                ShiftRight(ref resMantissa, ref resExp);
            }

            resMantissa = Round(resMantissa);

            uint resValue = (uint)((resMantissa >> roundingBits)) & mantissaMask;

            resValue |= ((uint)resExp << mantissaBits);

            if (resSign)
                resValue |= 0x80000000;

            var resFloat = BitConverter.UInt32BitsToSingle(resValue);

            return resFloat;
        }

        [TestMethod]
        public void SoftFP_Add()
        {
            bool bulkMode = false;
            int totalBulk = 0;
            int failedBulk = 0;

            Action<float, float> floatOp = (a, b) =>
            {
                if (bulkMode)
                {
                    totalBulk++;

                    var result = SoftFP_Add(a, b);
                    var resultUnsigned = BitConverter.SingleToUInt32Bits(result);
                    var fpuUnsigned = BitConverter.SingleToUInt32Bits(a + b);

                    if (resultUnsigned != fpuUnsigned)
                    {
                        failedBulk++;

                        var delta = Math.Max(resultUnsigned, fpuUnsigned) - Math.Min(resultUnsigned, fpuUnsigned);
                        if (delta > 1)
                        {
                            Assert.AreEqual(a + b, result);
                        }
                    }
                }
                else
                {
                    var expected = a + b;
                    var actual = SoftFP_Add(a, b);

                    if (expected != actual)
                        Assert.AreEqual(expected, actual);
                }
            };

            floatOp(0.556257248f, 0.500910938f);
            floatOp(0.444681585f, 0.299055785f);
            floatOp(0.5499884f, 0.212284908f);
            floatOp(0.931204557f, 0.104905911f);
            floatOp(0.0076710307f, 0.952018857f);
            floatOp(0.123259649f, 0.876740336f);
            floatOp(0.0007939787f, 0.379645854f);
            floatOp(0.362758845f, 0.000253781764f);

            floatOp(-0.00204727077f, 0.59962666f);
            floatOp(0.00204727077f, -0.59962666f);
            floatOp(-0.59962666f, 0.00204727077f);
            floatOp(0.59962666f, -0.00204727077f);

            floatOp(-0.4337583f, 0.0008127541f);

            floatOp(1, -1f);

            floatOp(1000f, 0.5f);
            floatOp(1000f, -0.5f);
            floatOp(1024f, -1f);
            floatOp(12.75f, -12.5f);
            floatOp(12.5f, 77.25f);
            floatOp(-12.5f, -77.25f);

            floatOp(12.5f, -77.25f);
            floatOp(77.25f, -12.5f);
            floatOp(-12.5f, 77.25f);
            floatOp(-77.25f, 12.5f);

            floatOp(-0.184847608f, 0.9391488f); // need rounding
            floatOp(-0.0205731746f, 0.041971f); // does not need rounding

            bulkMode = true;
            var rnd = new Random();

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = (float)rnd.NextDouble();
                var f2 = (float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = -(float)rnd.NextDouble();
                var f2 = -(float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = -(float)rnd.NextDouble();
                var f2 = (float)rnd.NextDouble();
                floatOp(f1, f2);
            }
            Assert.AreEqual(0, failedBulk);

            for (var i = 0; i < 10000000; i++)
            {
                var f1 = (float)rnd.NextDouble();
                var f2 = -(float)rnd.NextDouble();
                floatOp(f1, f2);
            }

            Assert.AreEqual(0, failedBulk);
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

                    await UpdateCPU1(cpu1Instructions);
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
