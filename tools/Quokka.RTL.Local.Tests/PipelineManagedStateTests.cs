using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL.Local.Tests
{
    [TestClass]
    public class PipelineManagedStateTests
    {
        [TestMethod]
        public void StageControlSetValue()
        {
            var state = new RTLPipelineStageControlSignals();
            var member = typeof(RTLPipelineStageControlSignals).GetMember(nameof(RTLPipelineStageControlSignals.StallPipeline)).SingleOrDefault();
            Assert.IsNotNull(member, "member should not be null");
            var field = RTLPipelineStageTools.getBackingField(state, member);
            Assert.IsNotNull(field, "field should not be null");
            field.SetValue(state, true);
            Assert.IsTrue(state.StallPipeline.HasValue, "Backing field is null");
            Assert.IsTrue(state.StallPipeline.Value, "Backing field was not set");
        }

        [TestMethod]
        public void StageControlGetValue()
        {
            var state = new RTLPipelineStageControlSignals() { StallPipeline = true };
            var member = typeof(IRTLPipelineStageControlSignals).GetMember(nameof(IRTLPipelineStageControlSignals.StallPipeline)).SingleOrDefault();
            Assert.IsNotNull(member, "member should not be null");
            var field = RTLPipelineStageTools.getBackingField(state, member);
            Assert.IsNotNull(field, "field should not be null");
            var value = field.GetValue(state);
            Assert.IsNotNull(value, "Backing field is null");
            Assert.IsTrue((bool)value, "Backing field was not set");
        }
    }
}
