using Quokka.Public.Tools;
using System.IO;
using System.Runtime.CompilerServices;

namespace QuSoC.Tests
{
    public class RISCVModuleBaseTest
    {
        protected AsmInstructionsProvider Inst = new AsmInstructionsProvider();

        protected string VCDOutputPath([CallerMemberName] string testName = "")
        {
            return Path.Combine(PathTools.ProjectPath, "SimResults", $"{testName}.vcd");
        }
    }
}
