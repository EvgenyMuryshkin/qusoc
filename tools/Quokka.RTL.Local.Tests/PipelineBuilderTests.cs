using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Quokka.RTL.Local.Tests
{
    class TestPipelineInput
    {
        public uint Value;
        public bool Ready;
    }

    class TestPipelineOutput
    {
        public uint Result;
        public bool IsValid;
    }

    [TestClass]
    public class PipelineBuilderTests
    {
        IRTLPipelineStage<TestPipelineInput, TestPipelineOutput> TestPipeline()
        {
            var result =  PipelineBuilder
                .Source<TestPipelineInput>()
                .Stage(inputs => new { stage1Value = inputs.Ready ? inputs.Value + 1 : 0, flag = inputs.Ready })
                .Stage(stage1 => new { stage2Value = stage1.flag ? stage1.stage1Value + 1 : 0, flag = stage1.flag })
                .Stage(stage2 => new TestPipelineOutput { Result = stage2.flag ? stage2.stage2Value + 1 : 0, IsValid = stage2.flag })
                ;

            result.Setup();

            return result;
        }

        void Cycle(IRTLPipeline pipeline, int cycles)
        {
            var head = pipeline.Diag.Head;

            while (cycles-- > 0)
            {
                head.Stage(0);
                head.Commit();
            }
        }

        [TestMethod]
        public void ConstructorTest()
        {
            var pipeline = TestPipeline();
            var diag = pipeline as IRTLPipelineDiagnostics;
        }

        [TestMethod]
        public void ScheduleTest_RunAll()
        {
            var pipeline = TestPipeline();
            pipeline.Schedule(() => new TestPipelineInput() { Value = 1, Ready = true });
            Cycle(pipeline, 3);
            Assert.IsTrue(pipeline.State.IsValid);
            Assert.AreEqual(4U, pipeline.State.Result);
        }

        [TestMethod]
        public void ScheduleTest()
        {
            var pipeline = TestPipeline();
            pipeline.Schedule(() => new TestPipelineInput() { Value = 1, Ready = true });

            Cycle(pipeline, 1);
            pipeline.Schedule(() => new TestPipelineInput() { Value = 1 });
            
            Cycle(pipeline, 1);
            Assert.IsFalse(pipeline.State.IsValid);

            Cycle(pipeline, 1);
            Assert.IsTrue(pipeline.State.IsValid);
            Assert.AreEqual(4U, pipeline.State.Result);

            Cycle(pipeline, 1);
            Assert.IsFalse(pipeline.State.IsValid);
        }
    }
}
