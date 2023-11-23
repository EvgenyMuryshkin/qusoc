using Quokka.Public.Config;
using Quokka.Public.Logging;
using Quokka.Public.Quartus;
using Quokka.Public.Tools;
using Quokka.Public.Transformation;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace QuSoC.Demos
{
    /// <summary>
    /// PostRun will add all generated files to quartus project
    /// </summary>
    public class PostRun : ILowLevelTransformationPostRun
    {
        private readonly ILogStream _logStream;
        private readonly VirtualFS _virtualFS;
        private readonly QuartusProjectTools _quartusTools;
        private readonly RuntimeConfiguration _runtimeConfiguration;

        public PostRun(
            ILogStream logStream, 
            VirtualFS virtualFS,
            QuartusProjectTools quartusTools,
            RuntimeConfiguration runtimeConfiguration)
        {
            _logStream = logStream;
            _virtualFS = virtualFS;
            _quartusTools = quartusTools;
            _runtimeConfiguration = runtimeConfiguration;
        }

        QuokkaConfig config => _runtimeConfiguration.Config;
        string hdlLocation => Path.Combine(Path.GetDirectoryName(_runtimeConfiguration.SourceLocation), "QuSoC.HDL");
        string qsfPath => Path.Combine(hdlLocation, "Verilog.qsf");
        string generatedFilesLocation => FileTools.ToAbsolutePath(_runtimeConfiguration.SourceLocation, config.ProjectLocation);
        string quokkaPath => Path.Combine(hdlLocation, "Quokka.qsf");

        public void Run()
        {
            _logStream.WriteLine(DirectoryLogging.Summary, $"QuSoC translation completed");
            _logStream.WriteLine(DirectoryLogging.Summary, $"Source location: {_runtimeConfiguration.SourceLocation}");
            _logStream.WriteLine(DirectoryLogging.Summary, $"Config name: {Path.GetFileName(_runtimeConfiguration.ConfigPath)}");
            _logStream.WriteLine(DirectoryLogging.Summary, $"Generated files location: {generatedFilesLocation}");
            _logStream.WriteLine(DirectoryLogging.Summary, $"Updating quartus files: {qsfPath}");

            ModifyVerilogQSF();
            ModifyQuokkaBoardQSF();
            CopyTinyFPGAFiles();
        }

        void ModifyVerilogQSF()
        {
            if (File.Exists(qsfPath))
            {
                var generatedFiles = _virtualFS
                    .RecursiveFileNames
                    .Where(f => Path.GetFileNameWithoutExtension(f) != "Quokka")
                    .Select(f => Path.Combine(generatedFilesLocation, f))
                    .OrderBy(f => f)
                    .ToList();

                foreach (var fileName in generatedFiles)
                {
                    _logStream.WriteLine(DirectoryLogging.Summary, $"Generated file: {fileName}");
                }

                _quartusTools.RemoveGeneratedFiles(qsfPath);
                _quartusTools.AddFiles(qsfPath, generatedFiles);
            }
            else
            {
                _logStream.WriteLine(DirectoryLogging.Summary, $"Project not found");
            }
        }

        void ModifyQuokkaBoardQSF()
        {
            if (_runtimeConfiguration.Config.Project != "Demos")
                return;

            _logStream.WriteLine(DirectoryLogging.Summary, "");
            _logStream.WriteLine(DirectoryLogging.Summary, $"Updating quokka files: {quokkaPath}");

            if (File.Exists(qsfPath))
            {
                var quokkaProjects = new[]
                {
                    "BlinkerInf",
                    "Increment"
                };

                var generatedFiles = _virtualFS
                    .RecursiveFileNames
                    .Where(f => Path.GetFileNameWithoutExtension(f) != "Quokka")
                    .Where(f => quokkaProjects.Any(p => f.StartsWith(p)))
                    .Select(f => Path.Combine(generatedFilesLocation, f))
                    .OrderBy(f => f)
                    .ToList();

                foreach (var fileName in generatedFiles)
                {
                    _logStream.WriteLine(DirectoryLogging.Summary, $"Generated file: {fileName}");
                }

                _quartusTools.RemoveGeneratedFiles(quokkaPath);
                _quartusTools.AddFiles(quokkaPath, generatedFiles);
            }
            else
            {
                _logStream.WriteLine(DirectoryLogging.Summary, $"Project not found");
            }
        }

        void CopyTinyFPGAFiles()
        {
            if (_runtimeConfiguration.Config.Project != "TinyFPGA")
                return;

            var incrementFiles = _virtualFS
                .RecursiveFileNames
                .OrderBy(f => f)
                .ToList();

            foreach (var fileName in incrementFiles)
            {
                var folderName = Path.GetDirectoryName(fileName);
                var name = Path.GetFileName(fileName);

                var dir = _virtualFS.Root.CreateDirectory(folderName);

                var tinyFPGAPath = Path.Combine(PathTools.SolutionPath, "qusoc", "tinyfpga", name);
                var file = dir.GetFile(name);
                if (file.StringStream != null)
                {
                    //var stream = dir.GetStream(name);
                    var stream = file.StringStream;

                    var content = stream.ToString();
                    File.WriteAllText(tinyFPGAPath, content);
                    _logStream.WriteLine(DirectoryLogging.Summary, $"TinyFPGA file: {tinyFPGAPath}");
                }
            }

            _logStream.WriteLine(DirectoryLogging.Summary, $"====================================== {DateTime.Now}");
        }
    }
}
