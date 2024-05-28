using AXISoC;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.CPU;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using System.Linq;

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
        public void AXISoCQuadCoreModule()
        {
            var disasm = new Disassembler();
            var tools = new FirmwareTools(@"C:\code\qusoc\qusoc\qusoc.demos\apps\AXISoCQuadCore");
            tools.ModifyMakefile();
            tools.Make();
            var instructions = tools.Instructions();
            var code = disasm.Disassemble(instructions);

            var cpu0Instructions = Inst.FromAsmFile("axisocquadcore_cpu0");
            var cpu1Instructions = Inst.FromAsmFile("axisocquadcore_cpu1");
            var cpu2Instructions = Inst.FromAsmFile("axisocquadcore_cpu2");
            var cpu3Instructions = Inst.FromAsmFile("axisocquadcore_cpu3");

            var topLevel = new AXISoCQuadCoreModule(
                cpu0Instructions,
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
