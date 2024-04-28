using Quokka.Public.Tools;
using Quokka.RISCV.Integration.Client;
using Quokka.RISCV.Integration.Engine;
using System;
using System.IO;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;

namespace QuSoC
{
    public class AsmInstructionsProvider
    {
        protected virtual string ProjectLocation([CallerFilePath] string callerFilePath = "")
            => PathTools.ProjectPath;// PathTools.GetProjectPath(callerFilePath);

        protected virtual string AsmFilesLocation([CallerFilePath] string callerFilePath = "") 
            => Path.Combine(ProjectLocation(callerFilePath), "asm");

        public virtual uint[] FromAsmFile(string fileName, [CallerFilePath] string callerFilePath = "")
        {
            if (File.Exists(fileName))
                return FromAsmSource(File.ReadAllText(fileName));

            var sourceDirectory = Path.IsPathRooted(fileName)
                ? Path.GetDirectoryName(fileName)
                : AsmFilesLocation(callerFilePath);

            var absolutePath = Path.Combine(sourceDirectory, fileName);
            if (File.Exists(absolutePath))
                return FromAsmSource(File.ReadAllText(absolutePath));

            var files = Directory.EnumerateFiles(sourceDirectory, $"{fileName}.*", SearchOption.AllDirectories).ToList();

            if (files.Count == 0)
                throw new Exception($"No files found for '{fileName}' in {sourceDirectory}");

            if (files.Count > 1)
                throw new Exception($"Multiple files found for '{fileName}' in '{sourceDirectory}'");

            return FromAsmSource(File.ReadAllText(files[0]));
        }

        public virtual uint[] FromAsmSource(string asmSource)
        {
            // making a API call to integration server.

            if (RuntimeInformation.IsOSPlatform(OSPlatform.Windows))
            {
                // on Windows, integration server is required to run in Docker or WSL.
                // Installation steps are same for WSL and for docker.
                // https://github.com/EvgenyMuryshkin/Quokka.RISCV.Docker/blob/master/Dockerfile

                var instructions = RISCVIntegrationClient.Asm(new RISCVIntegrationEndpoint(), asmSource);
                return instructions.Result;
            }
            else
            {
                // on Linux, just make local call to RISCV toolchain
                return RISCVIntegrationClient.ToInstructions(Toolchain.Asm(asmSource)).ToArray();
            }
        }
    }
}
