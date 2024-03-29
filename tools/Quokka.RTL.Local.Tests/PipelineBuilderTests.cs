using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL.Simulator;
using System;

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

    class PipelineTestModule : RTLCombinationalModule<TestPipelineInput>
    {

    }

    [TestClass]
    public class PipelineBuilderTests
    {
        IRTLPipelineStage<TestPipelineInput, TestPipelineOutput> TestPipeline()
        {
            var module = new PipelineTestModule();

            var result =  PipelineBuilder
                .Source<TestPipelineInput>()
                .Stage(inputs => new { stage1Value = inputs.Ready ? inputs.Value + 1 : 0, flag = inputs.Ready })
                .Stage(stage1 => new { stage2Value = stage1.flag ? stage1.stage1Value + 1 : 0, flag = stage1.flag })
                .Stage(stage2 => new TestPipelineOutput { Result = stage2.flag ? stage2.stage2Value + 1 : 0, IsValid = stage2.flag })
                ;

            result.Setup(module);

            return result;
        }

        void Cycle(IRTLPipeline pipeline, int clockCycles, int maxDeltaCycles = 1000)
        {
            var head = pipeline.Diag.Head;
            while(clockCycles-- > 0)
            {
                var idx = 0;
                while (idx < maxDeltaCycles)
                {
                    if (head.DeltaCycle(idx) == RTLModuleStageResult.Stable)
                        break;

                    idx++;
                }
                if (idx >= maxDeltaCycles)
                    throw new MaxStageIterationReachedException();

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
