using Quokka.RTL;
using System.Linq;

namespace AXISoC
{
    public class AXISoCGenericModule : AXISoCTestModule
    {
        public AXISoCGenericModule(uint[] instructions)
        {
            //var inst = new AsmInstructionsProvider();
            //var instructions = inst.FromAsmFile("axisoc");
            //var topLevel = new AXISoCTestModule();
            var bytes = instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();
            Memory.Initialize(bytes);
        }
    }
}
