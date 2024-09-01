using axi.modules;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using System;

namespace axi.tests
{
    [TestClass]
    public class AXI4ProgrammerTests : BaseRTLModuleTests
    {
        [TestMethod]
        public void SyncTest()
        {
            var sim = new RTLSimulator<AXIProgrammerTestModule, AXIProgrammerTestModuleInputs>(VCDOutputPath("axiprogrammer_sync"));
            var topLevel = sim.TopLevel;
            var programmer = topLevel.programmer;
            sim.ClockCycle();

            Action<byte> pushToReceiverFIFO = (data) =>
            {
                programmer.receiverFIFO.State.buffer[programmer.receiverFIFO.State.wAddr] = data;
                programmer.receiverFIFO.State.wAddr = (programmer.receiverFIFO.State.wAddr + 1)[programmer.receiverFIFO.addrBits - 1, 0];
            };

            pushToReceiverFIFO(0);// invalid instruction
            pushToReceiverFIFO(0x55);// Sync

            for (var i = 0; i < 100; i++)
            {
                sim.ClockCycle();
            }

            Assert.AreEqual<byte>(programmer.transmitterFIFO.State.buffer[0], 0x55);
        }

        [TestMethod]
        public void ReadTest()
        {
            var sim = new RTLSimulator<AXIProgrammerTestModule, AXIProgrammerTestModuleInputs>(VCDOutputPath("axiprogrammer_read"));
            var topLevel = sim.TopLevel;
            var programmer = topLevel.programmer;
            var memoryModule = topLevel.memoryModule;

            sim.ClockCycle();

            Action<byte> pushToReceiverFIFO = (data) =>
            {
                programmer.receiverFIFO.State.buffer[programmer.receiverFIFO.State.wAddr] = data;
                programmer.receiverFIFO.State.wAddr = (programmer.receiverFIFO.State.wAddr + 1)[programmer.receiverFIFO.addrBits - 1, 0];
            };

            pushToReceiverFIFO(0);// invalid instruction
            pushToReceiverFIFO(1);// read
            pushToReceiverFIFO(0);// MSB address
            pushToReceiverFIFO(0);
            pushToReceiverFIFO(0x03);
            pushToReceiverFIFO(0xFC);

            memoryModule.State.buff[255] = [0xFF, 0x81, 0x55, 0xAA];

            for (var i = 0; i < 100; i++)
            {
                sim.ClockCycle();
            }

            Assert.AreEqual<byte>(programmer.transmitterFIFO.State.buffer[0], 0xAA);
            Assert.AreEqual<byte>(programmer.transmitterFIFO.State.buffer[1], 0x55);
            Assert.AreEqual<byte>(programmer.transmitterFIFO.State.buffer[2], 0x81);
            Assert.AreEqual<byte>(programmer.transmitterFIFO.State.buffer[3], 0xFF);
        }

        [TestMethod]
        public void WriteTest()
        {
            var sim = new RTLSimulator<AXIProgrammerTestModule, AXIProgrammerTestModuleInputs>(VCDOutputPath("axiprogrammer_write"));
            var topLevel = sim.TopLevel;
            var programmer = topLevel.programmer;
            var memoryModule = topLevel.memoryModule;

            sim.ClockCycle();

            Action<byte> pushToReceiverFIFO = (data) =>
            {
                programmer.receiverFIFO.State.buffer[programmer.receiverFIFO.State.wAddr] = data;
                programmer.receiverFIFO.State.wAddr = (programmer.receiverFIFO.State.wAddr + 1)[programmer.receiverFIFO.addrBits - 1, 0];
            };

            pushToReceiverFIFO(0);// invalid instruction
            pushToReceiverFIFO(2);// write
            pushToReceiverFIFO(0);// MSB address
            pushToReceiverFIFO(0);
            pushToReceiverFIFO(0x03);
            pushToReceiverFIFO(0xFC);
            pushToReceiverFIFO(0xAA);// MSB data
            pushToReceiverFIFO(0x55);
            pushToReceiverFIFO(0x81);
            pushToReceiverFIFO(0xFF);

            for (var i = 0; i < 100; i++)
            {
                sim.ClockCycle();
            }

            Assert.AreEqual<byte>(memoryModule.State.buff[255][0], 0xFF);
            Assert.AreEqual<byte>(memoryModule.State.buff[255][1], 0x81);
            Assert.AreEqual<byte>(memoryModule.State.buff[255][2], 0x55);
            Assert.AreEqual<byte>(memoryModule.State.buff[255][3], 0xAA);
        }
    }
}

