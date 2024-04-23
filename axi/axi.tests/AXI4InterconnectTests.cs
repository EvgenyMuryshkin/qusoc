using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using QuokkaIntegrationTests;
using axi.modules;

namespace axi.tests
{
    [TestClass]
    public class AXI4InterconnectTests : BaseRTLModuleTests
    {
        [TestMethod]
        public void AXILikeInteconnectModule()
        {
            var sim = new RTLSimulator<AXILikeInteconnectModule, InterconnectModuleInputs<MData,SData>>();
        }
    }
}

