using FPGA.Attributes;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.Public.Config;
using Quokka.Public.Tools;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Linq;

namespace RTL.Modules
{
    [TestClass]
    public class VivadoIntegrationTests : BaseRTLModuleTests
    {
        string RTLVerilogConfig => @"C:\code\qusoc\RTL\RTL.Modules\rtl.verilog.json";

        [TestMethod]
        public void LogicRAMIndexingModuleTest()
        {
            var sim = new RTLSimulator<LogicRAMIndexingModule, LogicRAMIndexingModuleInputs>(true);
            sim.TraceToVCD(VCDOutputPath());
            var tl = sim.TopLevel;
            sim.ClockCycle(new LogicRAMIndexingModuleInputs() { WE = true, WriteAddr = 0, WriteData = 0x66 });
            sim.ClockCycle(new LogicRAMIndexingModuleInputs() { WE = true, WriteAddr = 1, WriteData = 0xAA });
            sim.ClockCycle(new LogicRAMIndexingModuleInputs() { WE = true, WriteAddr = 2, WriteData = 0x55 });
            sim.ClockCycle(new LogicRAMIndexingModuleInputs() { WE = true, WriteAddr = 3, WriteData = 0xFF });

            sim.ClockCycle(new LogicRAMIndexingModuleInputs() { ReadAddr = 2, OpData = 0xF0 });
            Assert.AreEqual(false, tl.CmpMemLhs);
            Assert.AreEqual(true, tl.CmpMemRhs);
            Assert.AreEqual(0xF5, tl.LogicMemLhs);
            Assert.AreEqual(0x50, tl.LogicMemRhs);
            Assert.AreEqual(0x65, tl.MathMemLhs);
            Assert.AreEqual(0x45, tl.MathMemRhs);
            Assert.AreEqual(0xFF, tl.MemLhsRhs);

            sim.ClockCycle(new LogicRAMIndexingModuleInputs() { ReadAddr = 0, OpData = 0x50 });
            Assert.AreEqual(true, tl.CmpMemLhs);
            Assert.AreEqual(false, tl.CmpMemRhs);
            Assert.AreEqual(0x76, tl.LogicMemLhs);
            Assert.AreEqual(0x40, tl.LogicMemRhs);
            Assert.AreEqual(0x16, tl.MathMemLhs);
            Assert.AreEqual(0xB6, tl.MathMemRhs);
            Assert.AreEqual(0x10, tl.MemLhsRhs);

            var tb = sim.TBAdapter(RTLVerilogConfig);
            tb.PostSynthTimingSimulation();
        }

        [TestMethod]
        public void BoardTimerModuleTest()
        {
            var container = new QuokkaContainer();
            var runtimeConfig = container.Resolve<RuntimeConfiguration>();
            uint testClock = 10;

            runtimeConfig.Initialize(new QuokkaConfig()
            {
                Configurations = new List<BoardConfigAttribute>() {
                new BoardConfigAttribute() { Name = "Test", ClockFrequency = testClock }}
            });

            var moduleInstance = container.Resolve<BoardTimerModule>();
            var sim = new RTLInstanceSimulator<BoardTimerModule, BoardTimerModuleInputs>(moduleInstance, true);
            sim.TraceToVCD(VCDOutputPath());

            var topLevel = sim.TopLevel;

            for (var i = 1; i <= testClock * 10; i++)
            {
                Assert.AreEqual(i % testClock == 0, topLevel.OutActive10);
                Assert.AreEqual(i % (testClock * 2) == 0, topLevel.OutActive20);

                sim.ClockCycle(new BoardTimerModuleInputs());
            }

            var tb = sim.TBAdapter(RTLVerilogConfig);
            tb.TranslateInstance();
            //tb.PostSynthTimingSimulation();
        }

        [TestMethod]
        public void VGAStaticQRModuleTest()
        {
            var config = RuntimeConfigurationLoader.FromConfigFile(RTLVerilogConfig);
            var container = new QuokkaContainer()
                .WithRuntimeConfiguration(config);
            var module = container.Resolve<VGAStaticQRModule>();

            var sim = new RTLInstanceSimulator<VGAStaticQRModule, VGAStaticQRModuleInputs>(module, true);
            var tb = sim.TBAdapter(RTLVerilogConfig);
            tb.TranslateInstance();


            var tl = sim.TopLevel;
            int pixelCounter = 0;

            uint[] pixels = new uint[800 * 600];

            for (int row = 0; row < 628; row++)
            {
                for (int col = 0; col < 1056; col++)
                {
                    if (tl.OutVisible)
                    {
                        pixels[pixelCounter] = (uint)(((tl.R ? 255 : 0) << 16) | ((tl.G ? 255 : 0) << 8) | (tl.B ? 255 : 0));
                        pixelCounter++;
                    }

                    sim.ClockCycle(new VGAStaticQRModuleInputs());
                }
            }

            Assert.AreEqual(800 * 600, pixelCounter);

            var resized = new Bitmap(800, 600);
            for (var row = 0; row < 600; row++)
            {
                for (var col = 0; col < 800; col++)
                {
                    resized.SetPixel(col, row, Color.FromArgb((int)(0xFF000000 | pixels[row * 800 + col])));
                }
            }
            resized.Save(PNGOutputPath(), ImageFormat.Png);
        }

        [TestMethod]
        public void VGASyncModuleTest()
        {
            var sim = new RTLInstanceSimulator<VGASyncModule, VGASyncModuleInputs>(new VGASyncModule(480, 10, 2, 33), true);

            for (var i = 0; i <= 525; i++)
            {
                sim.ClockCycle(new VGASyncModuleInputs() { Enabled = true });
            }

            var tb = sim.TBAdapter(RTLVerilogConfig);
            tb.PostSynthTimingSimulation();
        }

        [TestMethod]
        public void VGAModule_FrameTest()
        {
            var sim = new RTLSimulator<VGAModule, VGAModuleInputs>(true);
            
            /*
            // VCD output takes about 15 minutes to write
            sim.TraceToVCD(
                VCDOutputPath(), 
                new RTLModuleSnapshotConfig() 
                { 
                    Include = RTLModuleSnapshotConfigInclude.Inputs | RTLModuleSnapshotConfigInclude.Outputs,
                    MaxNestingLevel = 0 
                });            
            */

            var tl = sim.TopLevel;
            int pixelCounter = 0;
            for (int row = 0; row < 628; row++)
            {
                for (int col = 0; col < 1/*056*/; col++)
                {
                    if (tl.IsVisible)
                        pixelCounter++;

                    sim.ClockCycle(new VGAModuleInputs());
                }
            }

            //Assert.AreEqual(800 * 600, pixelCounter);
            var tb = sim.TBAdapter(RTLVerilogConfig);
            //tb.TranslateModule();
            //tb.SaveTestbench();
            tb.PostSynthTimingSimulation();

            //Assert.AreEqual(480, hSyncCounter, "HSync is wrong");
            //Assert.AreEqual(640, hSyncCounter, "VSync is wrong");
        }

        [TestMethod]
        public void VGAAlienArtModuleTest()
        {
            var module = new VGAAlienArtModule((clocks) => new TimerModule(clocks));
            module.InitVGA(VGAControllerMode.Test);
            var sim = new RTLInstanceSimulator<VGAAlienArtModule, VGAAlienArtModuleInputs>(module);
            var tl = sim.TopLevel;

            var result = new List<bool>();
            while (result.Count != 4800)
            {
                if (tl.OutVisible)
                {
                    result.Add(tl.R);
                }
                sim.ClockCycle();
            }

            var resized = new Bitmap(80, 60);
            for (var row = 0; row < 60; row++)
            {
                for (var col = 0; col < 80; col++)
                {
                    if (result.Count <= (row * 80 + col))
                        continue;

                    resized.SetPixel(col, row, result[row * 80 + col] ? Color.Green : Color.White);
                }
            }
            resized.Save(PNGOutputPath(), ImageFormat.Png);
        }
    }
 }

