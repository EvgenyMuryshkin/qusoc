using Newtonsoft.Json.Schema;
using QRV32.CPU;
using Quokka.Core.Tools;
using Quokka.Public.Tools;
using Quokka.RISCV.CS2CPP.Tools;
using Quokka.RISCV.CS2CPP.Translator;
using Quokka.RISCV.Integration.Client;
using Quokka.RISCV.Integration.DTO;
using Quokka.RISCV.Integration.Engine;
using Quokka.RISCV.Integration.Generator.SOC;
using Quokka.RTL.VHDL;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace QuSoC
{
    public class FirmwareTools
    {
        private readonly string appPath;
        public FirmwareTools(string path)
        {
            appPath = path;
        }

        public string AppName => Path.GetFileName(appPath);
        public string SourceFolder => Path.Combine(appPath, "source");
        public string FirmwareFolder => Path.Combine(appPath, "firmware");
        public string FirmwareFile => Path.Combine(FirmwareFolder, "firmware.bin");
        public string FirmwareAsmFile => Path.Combine(FirmwareFolder, "firmware.asm");
        public string MakefileFile => Path.Combine(FirmwareFolder, "Makefile");
        public bool SourceExists => Directory.Exists(SourceFolder);
        public string MainFile => Path.Combine(SourceFolder, "main.S");

        public static string ProjectLocation(string currentLocation = null)
        {
            if (currentLocation == "")
                return "";

            currentLocation = currentLocation ?? Directory.GetCurrentDirectory();
            if (Directory.Exists(currentLocation) && Directory.EnumerateFiles(currentLocation, "*.csproj").Any())
                return currentLocation;

            return ProjectLocation(Path.GetDirectoryName(currentLocation));
        }

        public static uint[] FromApp(string path)
        {
            if (!Path.IsPathRooted(path))
            {
                path = Path.Combine(PathTools.ProjectPath, "apps", path);
            }

            var tools = new FirmwareTools(path);
            if (!tools.FirmwareFromAppFolder())
                throw new Exception($"Failed to get instructions for app {path}");

            return tools.Instructions();
        }

        public uint[] FromAsmSource(string asmSource)
        {
            // making a API call to integration server.
            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                // on Windows, integration server is required to run in Docker or WSL.
                // Installation steps are same for WSL and for docker.
                // https://github.com/EvgenyMuryshkin/Quokka.RISCV.Docker

                var instructions = RISCVIntegrationClient.Asm(new RISCVIntegrationEndpoint(), asmSource);
                return instructions.Result;
            }
            else
            {
                // on Linux, just make local call to RISCV toolchain
                return RISCVIntegrationClient.ToInstructions(Toolchain.Asm(asmSource)).ToArray();
            }
        }

        void FirmwareFromMainFile()
        {
            var mainSource = File.ReadAllText(MainFile);
            var instructions = FromAsmSource(mainSource);
            var bytes = instructions.SelectMany(i => BitConverter.GetBytes(i));
            FileTools.CreateDirectoryRecursive(FirmwareFolder);
            File.WriteAllBytes(FirmwareFile, bytes.ToArray());
        }

        void FirmwareFromCS()
        {
            var csFiles = Enumerable.Empty<string>();
            
            if (Directory.Exists(SourceFolder))
            {
                csFiles = Directory
                    .EnumerateFiles(SourceFolder)
                    .Where(f => Path.GetExtension(f).ToLower() == ".cs")
                    ;
            }

            var csFilesContent = csFiles
                .Select(path => new FSTextFile() { Name = path, Content = File.ReadAllText(path) })
                .ToList();

            if (csFilesContent.Any())
            {
                foreach (var cs in csFilesContent)
                {
                    Console.WriteLine($"Found CS source: {cs.Name}");
                }

                // translate source files
                var tx = new CSharp2CPPTranslator();
                var source = new FSSnapshot();
                source.Files.AddRange(csFilesContent);
                tx.Run(source);
                var firmwareSource = tx.Result;

                // create soc resource records
                var socGenerator = new SOCGenerator();
                var socRecordsBuilder = new SOCRecordsBuilder();
                var socRecords = socRecordsBuilder.ToSOCRecords(0x800, tx.SOCResources);
                firmwareSource.Add(socGenerator.SOCImport(socRecords));

                FileTools.CreateDirectoryRecursive(FirmwareFolder);
                var m = new FSManager(FirmwareFolder);
                m.SaveSnapshot(firmwareSource);
            }

            ModifyMakefile();
            Make();
        }

        void WriteLine(string line)
        {
            Trace.WriteLine(line);
            Console.WriteLine(line);
        }

        internal static double ToMilliseconds(TimeSpan? timeout, TimeSpan defaultTimeout)
        {
            var t = timeout.HasValue ? timeout.Value : defaultTimeout;

            return (ulong)t.TotalMilliseconds;
        }

        public void TryDelete(string path, TimeSpan? timeout = null)
        {
            var totalMilliseconds = ToMilliseconds(timeout, TimeSpan.FromSeconds(10));

            var sw = new Stopwatch();
            sw.Start();

            Exception lastException = new InvalidOperationException("Cannot delete file");

            while (File.Exists(path) && sw.ElapsedMilliseconds < totalMilliseconds)
            {
                try
                {
                    File.Delete(path);
                    return;
                }
                catch (Exception ex)
                {
                    lastException = ex;
                    Task.Delay(100).Wait();
                }
            }

            if (File.Exists(path))
                throw lastException;
        }

        public string RunHiddenShell(
            string app,
            string args,
            out int exitCode,
            string outputPath = null,
            bool throwOnException = true,
            string workingDirectory = null
            )
        {
            exitCode = -1;
            var deleteOutputPath = outputPath == null;
            outputPath = outputPath ?? Path.GetTempFileName();
            workingDirectory = workingDirectory ?? Directory.GetCurrentDirectory();

            var batchFile = $"{Path.GetTempFileName()}.cmd";
            var batchBuilder = new StringBuilder();
            batchBuilder.AppendLine("@echo off");

            var runCommandLine = $"{(app.Contains(' ') ? app.Quote() : app)} {args ?? ""}";
            batchBuilder.AppendLine(runCommandLine);
            File.WriteAllText(batchFile, batchBuilder.ToString());

            try
            {
                WriteLine($"Running at {workingDirectory} ({batchFile})");
                WriteLine($"Command: {runCommandLine}");
                WriteLine($"Output: {outputPath}");
                var psi = new ProcessStartInfo()
                {
                    FileName = "cmd.exe",
                    WorkingDirectory = workingDirectory,
                    Arguments = $"/C {batchFile}",// >> {outputPath}",
                    UseShellExecute = false,//true,
                    WindowStyle = ProcessWindowStyle.Hidden,
                    RedirectStandardError = true,
                    RedirectStandardOutput = true
                };

                var pi = Process.Start(psi);
                WriteLine($"PID: {pi.Id}");

                pi.WaitForExit();

                //var output = File.Exists(outputPath) ? File.ReadAllText(outputPath) : "";
                var output = pi.StandardOutput.ReadToEnd();
                var error = pi.StandardError.ReadToEnd();

                WriteLine(output);
                WriteLine(error);

                WriteLine($"PID: {pi.Id} exited with code {pi.ExitCode}");

                exitCode = pi.ExitCode;

                if (exitCode != 0 && throwOnException)
                    throw new Exception($"{app} {args} failed: {pi.ExitCode}");

                if (error != "")
                    return error;

                return output;
            }
            finally
            {
                TryDelete(batchFile);

                if (deleteOutputPath)
                {
                    try
                    {
                        TryDelete(outputPath);
                    }
                    catch (Exception ex)
                    {
                        WriteLine($"Cannot delete temporary output file '{outputPath}': {ex.Message}");
                    }
                }
            }
        }

        public void Make()
        {
            if (File.Exists(MakefileFile))
            {
                if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
                {
                    var makeFileContent = File.ReadAllText(MakefileFile);
                    if (makeFileContent.Contains("xpacks"))
                    {
                        // run WSL for xpack riscv toolchain

                        var root = Path.GetPathRoot(FirmwareFolder);
                        var relativePath = Path.GetRelativePath(root, FirmwareFolder);
                        root = root.Replace(":", "").Replace("\\", "/").ToLower();
                        var linuxPath = relativePath.Replace("\\", "/").Replace(":", "");
                        var mntPath = $"/mnt/{root}{linuxPath}";

                        var wslArgs = $"-e bash -c \"cd \\\"{mntPath}\\\" && echo ev | sudo -S make bin\"";
                        var wslOutput = RunHiddenShell("wsl", wslArgs, out var exitCode, throwOnException: false);

                        if (exitCode == 0)
                            return;

                        if (wslOutput != "")
                            throw new Exception(wslOutput);
                    }

                    // fallback to run docker
                    var context = RISCVIntegration
                        .DefaultContext(FirmwareFolder)
                        .WithMakeTarget("bin");

                    RISCVIntegrationClient.Make(context).Wait();
                }
                else
                {
                    using (new CurrentDirectory(FirmwareFolder))
                    {
                        Toolchain.Make("bin");
                    }
                }
            }
            else
            {
                Console.WriteLine($"Makefile was not found: {MakefileFile}");
                // TODO: throw exception?
            }
        }

        public bool FirmwareFromAppFolder()
        {
            if (!SourceExists)
                return false;

            // delete old firmware before making new one
            if (File.Exists(FirmwareFile))
                File.Delete(FirmwareFile);

            if (File.Exists(MainFile))
            {
                FirmwareFromMainFile();
            }
            else
            {
                FirmwareFromCS();
            }

            Disassemble();

            return File.Exists(FirmwareFile);
        }

        public void Disassemble()
        {
            if (File.Exists(FirmwareFile))
            {
                var disassembler = new Disassembler();
                FileTools.WriteAllText(FirmwareAsmFile, disassembler.Disassemble(Instructions()));
            }
            else
            {
                Console.WriteLine($"Firmware file was not found: {FirmwareFile}");
            }
        }

        public uint[] Instructions()
        {
            if (!File.Exists(FirmwareFile))
                return new uint[0];

            var instructions = RISCVIntegrationClient
                .ToInstructions(File.ReadAllBytes(FirmwareFile))
                .ToArray();

            return instructions;

        }

        public void ModifyMakefile()
        {
            if (!File.Exists(MakefileFile))
                return;

            var sourceFiles = FirmwareSourceFiles();
            var names = string.Join(" ", sourceFiles);
            var makefileLines = File.ReadAllLines(MakefileFile);
            var modifiedLines =
                makefileLines
                .Select(l =>
                {
                    if (l.StartsWith("files"))
                        return $"files = {names}";

                    return l;
                })
                .ToArray();

            FileTools.WriteAllLines(MakefileFile, modifiedLines);
        }

        List<string> FirmwareSourceFiles()
        {
            var sourceFiles = new List<string>()
            {
                ".s",
                ".c",
                ".cpp"
            };

            return Directory
                .EnumerateFiles(FirmwareFolder, "*.*", SearchOption.AllDirectories)
                .Where(f => sourceFiles.Contains(Path.GetExtension(f).ToLower()))
                .OrderBy(f => sourceFiles.IndexOf(Path.GetExtension(f).ToLower()))
                //.Select(f => Path.GetFileName(f))
                .Select(f => f.Substring(FirmwareFolder.Length + 1))
                .Select(f => f.Replace("\\", "/"))
                .ToList();
        }

        public static uint[] FromFolder(string path)
        {
            if (!Directory.Exists(path))
                throw new DirectoryNotFoundException(path);

            var tools = new FirmwareTools(path);

            // delete old firmware before making new one
            if (File.Exists(tools.FirmwareFile))
                File.Delete(tools.FirmwareFile);

            if (File.Exists(tools.MainFile))
            {
                tools.FirmwareFromMainFile();
            }
            else
            {
                tools.FirmwareFromCS();
            }

            if (!File.Exists(tools.FirmwareFile))
                throw new Exception($"Failed to create firmware from folder {path}");

            tools.Disassemble();

            return tools.Instructions();
        }
    }
}
