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

        [TestMethod]
        public async Task AXISoCQuadCoreModule_UpdateCPU1()
        {
            if (!Debugger.IsAttached)
                return;

            while (true)
            {
                try
                {
                    var cpu1Instructions = Inst.FromAsmFile("axisocquadcore_cpu1_update");

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
