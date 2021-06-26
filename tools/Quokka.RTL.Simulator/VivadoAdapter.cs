using Quokka.TCL.Tools;
using System;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace Quokka.RTL.Simulator
{
    public class VivadoAdapter
    {
        private readonly string _vivadoProjectLocation;
        protected string pidFile => Path.Combine(_vivadoProjectLocation, "pid.txt");
        protected string LogFile => Path.Combine(_vivadoProjectLocation, "vivado.log");
        protected string VCDFile => Path.Combine(_vivadoProjectLocation, "sim.vcd");

        public VivadoAdapter(string vivadoProjectLocation)
        {
            _vivadoProjectLocation = vivadoProjectLocation;
        }

        public void SaveTCL(TCLFile tcl, string scriptName = "script.tcl")
        {
            if (tcl == null)
                throw new NullReferenceException(nameof(tcl));

            File.WriteAllText(Path.Combine(_vivadoProjectLocation, scriptName), tcl.ToString());
        }

        public void KillRunnnigInstance()
        {
            if (File.Exists(pidFile))
            {
                var pid = int.Parse(File.ReadAllText(pidFile));
                // previous run was not completed, vivado may hang in there and lock files. Kill it
                var running = Process.GetProcesses().FirstOrDefault(p => p.Id == pid);
                if (running != null)
                {
                    // override for process kill for the whole process tree
                    running.Kill();
                }

                File.Delete(pidFile);
            }
        }

        public void CleanupVivado()
        {
            KillRunnnigInstance();

            if (Directory.Exists(_vivadoProjectLocation))
                Directory.Delete(_vivadoProjectLocation, true);

            Directory.CreateDirectory(_vivadoProjectLocation);
        }

        public bool WaitForLogFile(int timeoutMs = 5000)
        {
            if (!File.Exists(LogFile))
                return false;

            int retryEveryMs = 100;
            while (timeoutMs >= 0)
            {
                try
                {
                    FileStream fs = File.Open(LogFile, FileMode.OpenOrCreate, FileAccess.ReadWrite, FileShare.None);
                    fs.Close();
                    return true;
                }
                catch
                {
                    timeoutMs -= retryEveryMs;
                    Task.Delay(TimeSpan.FromMilliseconds(retryEveryMs)).Wait();
                }
            }

            return false;
        }

        public void RunScript(string scriptName = "script.tcl")
        {
            var path = Environment.GetEnvironmentVariable("PATH");
            var locations = path.Split(new[] { ';' });
            var vivadoLocation = locations
                .Where(l => File.Exists(Path.Combine(l, "vivado.bat")))
                .FirstOrDefault();

            if (!vivadoLocation.HasValue())
            {
                throw new Exception($"vivado.bat was not found. Please add Vivado bin folder to path.");
            }

            var process = Process.Start(new ProcessStartInfo()
            {
                FileName = "cmd.exe",
                WorkingDirectory = _vivadoProjectLocation,
                Arguments = $"/c vivado.bat -mode batch -source {scriptName}"
            });

            File.WriteAllText(pidFile, $"{process.Id}");

            process.WaitForExit();

            KillRunnnigInstance();

            // fix line endings in log file
            if (File.Exists(LogFile))
            {
                if (WaitForLogFile())
                {
                    var lines = File.ReadAllLines(LogFile);
                    File.WriteAllLines(LogFile, lines);
                }
            }

            if (process.ExitCode != 0)
            {
                if (WaitForLogFile())
                {
                    var log = File.ReadAllLines(LogFile);
                    foreach (var line in log)
                        Trace.WriteLine(line);
                }

                throw new Exception($"Vivado exit code: {process.ExitCode}. See {LogFile} for details");
            }
        }
    }
}

