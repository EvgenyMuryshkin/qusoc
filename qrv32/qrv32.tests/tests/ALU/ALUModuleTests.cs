using Microsoft.VisualStudio.TestTools.UnitTesting;
using QRV32.CPU;
using Quokka.RTL;
using Quokka.RTL.Simulator;

namespace QRV32.Tests
{
    [TestClass]
    public class ALUModuleTests
    {
        // TODO: write some tests here
        [TestMethod]
        public void BasicTest()
        {
            var op1 = new RTLBitArray(0x81010101);
            var op2 = new RTLBitArray(0xFFFFFFFF);
            var shamt = new RTLBitArray(0x5).Resized(5);


            var sim = new RTLSimulator<ALUModule, ALUModuleInputs>();
            sim.ClockCycle(
                new ALUModuleInputs()
                {
                    Op1 = op1,
                    Op2 = op2,
                    SHAMT = shamt
                }
            );

            var module = sim.TopLevel;

            var res = new
            {
                resXOR = module.resXOR,
                resAND = module.resAND,
                resOR = module.resOR,
                ADD = module.ADD,
                SUB = module.SUB,
                SHLL = module.SHLL,
                SHRL = module.SHRL,
                SHRA = module.SHRA
            };
        }
    }
}
