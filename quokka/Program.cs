using System;
using System.IO;
using System.Runtime.InteropServices;
using Quokka.Core.Bootstrap;
using Quokka.Core.Tools;
using Quokka.Public.Tools;
using Quokka.RISCV.CS2CPP.Translator;
using Quokka.RISCV.Integration.Client;
using Quokka.RTL;

namespace QuokkaCLI
{
    class Program
    {
        static void RunInCurrentLocation(string[] args)
        {
            Console.WriteLine($"Environment: {RuntimeInformation.OSDescription}, {RuntimeInformation.OSArchitecture}, {RuntimeInformation.FrameworkDescription}, {RuntimeInformation.ProcessArchitecture}");
            Console.WriteLine($"Current location: {Directory.GetCurrentDirectory()}");
            Console.WriteLine($"Quokka.FPGA version: {typeof(QuokkaRunner).Assembly.GetName().Version}");
            Console.WriteLine($"Quokka.RTL version: {typeof(RTLBitArray).Assembly.GetName().Version}");
            Console.WriteLine($"Quokka.RISCV.Integration version: {typeof(RISCVIntegrationClient).Assembly.GetName().Version}");
            Console.WriteLine($"Quokka.RISCV.CS2CPP version: {typeof(CSharp2CPPTranslator).Assembly.GetName().Version}");

            Console.WriteLine("Cleaning up ...");

            var tempFolder = Path.Combine(Path.GetTempPath(), "quokka");
            if (Directory.Exists(tempFolder))
                Directory.Delete(tempFolder, true);

            QuokkaRunner.Default(args);
        }

        static void Main(string[] args)
        {
            if (args.Length > 0 && File.Exists(args[0]))
            {
                RunInCurrentLocation(args);
            }
            else
            {
                using (new CurrentDirectory(PathTools.SolutionPath))
                {
                    RunInCurrentLocation(args);
                }
            }
        }
    }
}
