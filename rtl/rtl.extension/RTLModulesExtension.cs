using Quokka.Core.Bootstrap;
using Quokka.Extension.Interop;
using RTL.Modules;

namespace rtl.extension
{
    [ExtensionClass]
    public class RTLModulesExtension
    {
        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void IntDividerPipelineModule()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(IntDividerPipelineModule) });
        }

        [ExtensionMethod(icon: TopLevelIcon.Translate)]
        public static void FunctionsPipelineModule()
        {
            QuokkaRunner.FromConfig(Env.RTLVerilogConfig, new[] { nameof(FunctionsPipelineModule) });
        }
    }
}
