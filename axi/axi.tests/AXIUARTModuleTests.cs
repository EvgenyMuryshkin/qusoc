using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Newtonsoft.Json.Linq;

namespace axi.tests
{
    [TestClass]
    public class AXIUARTModuleTests : BaseRTLModuleTests
    {
        [TestMethod]
        public void UARTReceiverModule()
        {
            var sim = new RTLSimulator<UARTReceiverModule, UARTReceiverModuleInputs>();
            var topLevel = sim.TopLevel;
            sim.ClockCycle();

            for (var data = 0; data < 256; data++)
            {
                var bits = new RTLBitArray(RTLBitArrayInitType.MSB, true, (byte)data, false);

                foreach (var b in bits.LSB)
                {
                    sim.ClockCycle(new UARTReceiverModuleInputs() { iCE = true, iRX = b });
                    sim.ClockCycle(new UARTReceiverModuleInputs() { iCE = false });
                }

                Assert.IsTrue(topLevel.oValid);
                Assert.AreEqual((byte)data, topLevel.oValue);
            }
        }

        [TestMethod]
        public void UARTTransmitterModule()
        {
            var sim = new RTLSimulator<UARTTransmitterModule, UARTTransmitterModuleInputs>();
            var topLevel = sim.TopLevel;
            sim.ClockCycle();

            for (var data = 0; data < 256; data++)
            {
                Assert.IsTrue(topLevel.oTX);
                Assert.IsFalse(topLevel.oTransmitting);

                sim.ClockCycle(new UARTTransmitterModuleInputs() { iCE = true, iValid = true, iValue = (byte)data });
                Assert.IsTrue(topLevel.oTransmitting);

                var bits = new List<bool>();

                while (topLevel.oTransmitting)
                {
                    bits.Add(topLevel.oTX);

                    sim.ClockCycle(new UARTTransmitterModuleInputs() { iCE = true });
                    sim.ClockCycle(new UARTTransmitterModuleInputs() { iCE = false });
                    sim.ClockCycle(new UARTTransmitterModuleInputs() { iCE = false });
                }

                Assert.AreEqual(10, bits.Count);
                var txValue = (byte)(new RTLBitArray(RTLBitArrayInitType.LSB, bits)[8, 1]);
                Assert.AreEqual((byte)data, txValue);
            }
        }
        
        [TestMethod]
        public void AXIUARTModuleTest_LoopBack()
        {
            var sim = new RTLSimulator<AXIUARTModuleClocksTestModule, AXIUARTModuleTestModuleInputs>();
            //var sim = new RTLSimulator<AXIUARTModuleTest, AXIUARTModuleTestInputs>();
            var topLevel = sim.TopLevel;

            for (var data = 0; data < 256; data++)
            {
                //while (topLevel.uart.State.rxUARTState != uartState.Idle && topLevel.uart.State.txUARTState != uartState.Idle)
                //    sim.ClockCycle();

                while (!topLevel.oWACK)
                {
                    sim.ClockCycle(
                        new AXIUARTModuleTestModuleInputs()
                        {
                            Master =
                            {
                                WE = true,
                                WSTRB = new RTLBitArray(byte.MaxValue)[3,0],
                                WDATA = [(byte)data, 0, 0, 0],
                                BREADY = true
                            },
                            iRX = topLevel.oTX
                        }
                    );
                }
                
                var v = new List<bool>();

                for (var t = 0; t < 200; t++)
                {
                    v.Add(topLevel.oTX);
                    sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = true });
                }

                for (var t = 0; t < v.Count; t++)
                {
                    sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = v[t] });
                }

                //Assert.AreEqual((byte)data, topLevel.uart.State.rxData);

                continue;
                /*
                while (topLevel.uart.State.txUARTState == uartState.Idle)
                    sim.ClockCycle(new AXIUARTModuleTestInputs() { iRX = topLevel.oTX });

                while (topLevel.uart.State.rxUARTState != uartState.Idle || topLevel.uart.State.txUARTState != uartState.Idle)
                    sim.ClockCycle(new AXIUARTModuleTestInputs() { iRX = topLevel.oTX });

                Assert.AreEqual((byte)data, topLevel.uart.State.rxData);
                */
            }
        }
        
        
        [TestMethod]
        public void AXIUARTModuleTest_RX()
        {
            var sim = new RTLSimulator<AXIUARTTestModule, AXIUARTModuleTestModuleInputs>();
            var topLevel = sim.TopLevel;
            sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = true });

            //while (topLevel.uart.State.rxUARTState != uartState.Idle)
            //    sim.ClockCycle();

            for (var i = 0; i < 256; i++)
            {
                sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = true });

                //while (topLevel.uart.State.rxUARTState != uartState.Idle)
                //    sim.ClockCycle(new AXIUARTModuleTestInputs());

                // start bit
                sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = false });
                //Assert.AreEqual(topLevel.uart.State.rxUARTState, uartState.Data);

                var data = new RTLBitArray((byte)i);

                // data bits
                for (var b = 0; b < 8; b++)
                {
                    //Assert.AreEqual(topLevel.uart.State.rxUARTState, uartState.Data);
                    sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = data[0] });

                    data = data >> 1;
                }

                // stop bit
                //Assert.AreEqual(topLevel.uart.State.rxUARTState, uartState.StopBit);
                sim.ClockCycle(new AXIUARTModuleTestModuleInputs() { iRX = true });

                Assert.AreEqual((byte)i, topLevel.oRXData);
            }
        }
        
         
        [TestMethod]
        public void AXIUARTModuleTest_TX()
        {
            var sim = new RTLSimulator<AXIUARTTestModule, AXIUARTModuleTestModuleInputs>();
            var topLevel = sim.TopLevel;

            //while (topLevel.uart.State.txUARTState != uartState.Idle)
            //    sim.ClockCycle();

            for (var data = 0; data < 256; data++)
            {
                while (!topLevel.oWACK)
                {
                    sim.ClockCycle(
                        new AXIUARTModuleTestModuleInputs()
                        {
                            Master =
                            {
                                WE = true,
                                WSTRB = new RTLBitArray(byte.MaxValue)[3,0],
                                WDATA = [(byte)data, 0, 0, 0],
                                BREADY = true
                            }
                        }
                    );
                }

                //Assert.AreEqual(topLevel.uart.State.txUARTState, uartState.Idle);

                // start bit
                while (topLevel.oTX)
                    sim.ClockCycle(new AXIUARTModuleTestModuleInputs());

                //Assert.AreEqual(topLevel.uart.State.txUARTState, uartState.StartBit);

                var invertedResult = new RTLBitArray(byte.MinValue);
                for (var i = 0; i < 8; i++)
                {
                    sim.ClockCycle(new AXIUARTModuleTestModuleInputs());
                    //Assert.AreEqual(topLevel.uart.State.txUARTState, uartState.Data);
                    invertedResult = (invertedResult << 1) | topLevel.oTX;
                }

                // stop bit
                sim.ClockCycle(new AXIUARTModuleTestModuleInputs());
                //Assert.AreEqual(topLevel.uart.State.txUARTState, uartState.StopBit);
                Assert.IsTrue(topLevel.oTX);

                var result = invertedResult[7, 0].Reversed();
                Assert.AreEqual((byte)data, (byte)result);
            }
        }
    }
}

