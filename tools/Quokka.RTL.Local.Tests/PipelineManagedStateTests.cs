using Microsoft.VisualStudio.TestTools.UnitTesting;
using System.Linq;
using System.Reflection;

namespace Quokka.RTL.Local.Tests
{
    public class TestState : IRTLPipelineManagedState
    {
        public bool? Stall { private get; set; }
        public bool? Stalled { get; private set; }

        public bool? NullableMember { get; set; }
    }

    [TestClass]
    public class PipelineManagedStateTests
    {
        [TestMethod]
        public void NullableMemberValue()
        {
            var state = new TestState();
            var member = typeof(TestState).GetMember(nameof(TestState.NullableMember)).SingleOrDefault();
            var field = RTLPipelineStageTools.getBackingField(state, member);
        }

        [TestMethod]
        public void TestSetValue()
        {
            var state = new TestState();
            var member = typeof(IRTLPipelineManagedState).GetMember(nameof(IRTLPipelineManagedState.Stalled)).SingleOrDefault();
            Assert.IsNotNull(member, "member should not be null");
            var field = RTLPipelineStageTools.getBackingField(state, member);
            Assert.IsNotNull(field, "field should not be null");
            field.SetValue(state, true);
            Assert.IsTrue(state.Stalled.HasValue, "Backing field is null");
            Assert.IsTrue(state.Stalled.Value, "Backing field was not set");
        }

        [TestMethod]
        public void TestGetValue()
        {
            var state = new TestState() { Stall = true };
            var member = typeof(IRTLPipelineManagedState).GetMember(nameof(IRTLPipelineManagedState.Stall)).SingleOrDefault();
            Assert.IsNotNull(member, "member should not be null");
            var field = RTLPipelineStageTools.getBackingField(state, member);
            Assert.IsNotNull(field, "field should not be null");
            var value = field.GetValue(state);
            Assert.IsNotNull(value, "Backing field is null");
            Assert.IsTrue((bool)value, "Backing field was not set");
        }
    }
}
