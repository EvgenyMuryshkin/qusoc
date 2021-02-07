using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL.Local.Tests
{
    public class TestState : IRTLPipelineStageContol
    {
        public bool? StallPipeline { private get; set; }
        public bool? StallSelf { private get; set; }
        public bool? StallPrev { private get; set; }
        public bool StageStalled { get; set; }
        public bool PipelineStalled { get; set; }
        public bool StageWillStall { get; set; }
        public bool? NullableMember { get; set; }
    }

    [TestClass]
    public class PipelineManagedStateTests
    {
        [TestMethod]
        public void TestSetValue()
        {
            var state = new TestState();
            var member = typeof(TestState).GetMember(nameof(TestState.NullableMember)).SingleOrDefault();
            Assert.IsNotNull(member, "member should not be null");
            var field = RTLPipelineStageTools.getBackingField(state, member);
            Assert.IsNotNull(field, "field should not be null");
            field.SetValue(state, true);
            Assert.IsTrue(state.NullableMember.HasValue, "Backing field is null");
            Assert.IsTrue(state.NullableMember.Value, "Backing field was not set");
        }

        [TestMethod]
        public void TestGetValue()
        {
            var state = new TestState() { StallPipeline = true };
            var member = typeof(IRTLPipelineStageContol).GetMember(nameof(IRTLPipelineStageContol.StallPipeline)).SingleOrDefault();
            Assert.IsNotNull(member, "member should not be null");
            var field = RTLPipelineStageTools.getBackingField(state, member);
            Assert.IsNotNull(field, "field should not be null");
            var value = field.GetValue(state);
            Assert.IsNotNull(value, "Backing field is null");
            Assert.IsTrue((bool)value, "Backing field was not set");
        }
    }
}
