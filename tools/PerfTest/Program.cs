using Quokka.Core.Bootstrap;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using RTL.Modules;
using System;
using System.Diagnostics;

namespace PerfTest
{
    class C
    {
        public bool v;
        public bool VSync => v;
    }

    class Program
    {
        static void Ctor()
        {
            var sw = new Stopwatch();
            sw.Start();

            for (int i = 0; i < 80000; i++)
            {
                var b = new RTLBitArray(i).Unsigned();
            }
            var lapsed = sw.ElapsedMilliseconds;
        }

        static void Main(string[] args)
        {
            Console.WriteLine($"Quokka.FPGA version: {typeof(QuokkaRunner).Assembly.GetName().Version}");
            Console.WriteLine($"Quokka.RTL version: {typeof(RTLBitArray).Assembly.GetName().Version}");

            Ctor();

            var c = new C() { v = true };
            var sw = new Stopwatch();
            sw.Start();

            var sim = new RTLSimulator<VGAModule, VGAModuleInputs>();
            var tl = sim.TopLevel;
            //sim.TraceToVCD(VCDOutputPath());

            var b = new RTLBitArray(100000).Unsigned();
            for (int i = 0; i < 80000; i++)
                if (b < i)
                    throw new Exception();
            var lapsed = sw.ElapsedMilliseconds;

            sw.Restart();

            int vSyncCounter = 0, hSyncCounter = 0;
            for (int row = 0; row < 100/*525*/; row++)
            {
                for (int col = 0; col < 800; col++)
                {
                    sim.ClockCycle(new VGAModuleInputs());
                    
                    if (!tl.VSync)
                        vSyncCounter++;
                    if (!tl.HSync)
                        hSyncCounter++;
                    
                }
            }

            Console.WriteLine($"Done in {sw.ElapsedMilliseconds} ms");
        }
    }
}
