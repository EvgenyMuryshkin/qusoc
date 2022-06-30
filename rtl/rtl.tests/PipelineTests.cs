using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using System;
using System.Collections.Generic;
using System.Linq;

namespace RTL.Modules
{
    [TestClass]
    public class PipelineTests : BaseRTLModuleTests
    {
        byte[] emptyPipelineArray = new byte[8];
        byte[] maxPipelineArray = new byte[8] { byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue, byte.MaxValue };
        byte[] edgePipelineArray = new byte[] { 1, 0, 0, 0, 0, 0, 0, 1 };

        [TestMethod]
        public void AnonymousPipelineModuleTest()
        {
            var t = Module<AnonymousPipelineModule>();
            Action<byte[], bool, ushort, bool> iteration = (inputs, inReady, outResult, outReady) =>
            {
                t.Cycle(new AnonymousPipelineModuleInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(new byte[] { 0, 1, 2, 3, 4, 5, 6, 7 }, true, 0, false);
            iteration(new byte[] { 0, 1, 2, 3, 4, 5, 6, 8 }, true, 0, false);
            iteration(emptyPipelineArray, false, 28, true);
            iteration(emptyPipelineArray, false, 29, true);
            iteration(emptyPipelineArray, false, 0, false);
        }

        [TestMethod]
        public void FromConfigurationPipelineModuleTest()
        {
            var t = Module<FromConfigurationPipelineModule>();
            Action<byte[], bool, ushort, bool> iteration = (inputs, inReady, outResult, outReady) =>
            {
                t.Cycle(new AnonymousPipelineModuleInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(maxPipelineArray, true, 0, false);
            iteration(edgePipelineArray, true, 0, false);
            iteration(emptyPipelineArray, false, 0xFCFC, true);
            iteration(emptyPipelineArray, false, 0x0101, true);
            iteration(emptyPipelineArray, false, 0, false);
        }

        [TestMethod]
        public void TypedPipelineModuleTest()
        {
            var t = Module<TypedPipelineModule>();
            Action<byte[], bool, ushort, bool> iteration = (inputs, inReady, outResult, outReady) =>
            {
                t.Cycle(new PipelineTestInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(emptyPipelineArray, false, 0, false);
            iteration(maxPipelineArray, true, 0, false);
            iteration(edgePipelineArray, true, 42, false);
            iteration(emptyPipelineArray, false, 2082, true);
            iteration(emptyPipelineArray, false, 44, true);
            iteration(emptyPipelineArray, false, 42, false);
        }


        [TestMethod]
        public void AutoPropagatePipelineModule()
        {
            var t = Module<AutoPropagatePipelineModule>();
            Action<byte[], bool, ushort, bool> iteration = (inputs, inReady, outResult, outReady) =>
            {
                t.Cycle(new PipelineTestInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(emptyPipelineArray, false, 0, false);
            iteration(maxPipelineArray, true, 0, false);
            iteration(edgePipelineArray, true, 42, false);
            iteration(emptyPipelineArray, false, 2082, true);
            iteration(emptyPipelineArray, false, 44, true);
            iteration(emptyPipelineArray, false, 42, false);
        }

        [TestMethod]
        public void StageArraysPipelineModule()
        {
            var t = Module<StageArraysPipelineModule>();
            Action<byte[], bool, ushort, bool> iteration = (inputs, inReady, outResult, outReady) =>
            {
                t.Cycle(new AnonymousPipelineModuleInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(emptyPipelineArray, false, 0, false);
            iteration(maxPipelineArray, true, 0, false);
            iteration(edgePipelineArray, true, 42, false);
            iteration(emptyPipelineArray, false, 2082, true);
            iteration(emptyPipelineArray, false, 44, true);
            iteration(emptyPipelineArray, false, 42, false);
        }

        [TestMethod]
        public void CustomSchedulePipelineModuleTest()
        {
            var t = Module<CustomSchedulePipelineModule>();
            Action<byte[], bool, ushort, bool, ushort, bool> iteration = (inputs, inReady, outResult1, outReady1, outResult2, outReady2) =>
            {
                t.Cycle(new PipelineTestInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult1, t.outResult1, $"Result1 failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady1, t.outReady1, $"Ready1 failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outResult2, t.outResult2, $"Result2 failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady2, t.outReady2, $"Ready2 failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(emptyPipelineArray, false, 0, false, 0, false);
            iteration(maxPipelineArray, true, 0, false, 0, false);
            iteration(edgePipelineArray, true, 0, false, 65024, false);
            iteration(emptyPipelineArray, false, 0xFCFC, true, 63612, true);
            iteration(emptyPipelineArray, false, 0x0101, true, 65281, true);
            iteration(emptyPipelineArray, false, 0, false, 65024, false);
        }

        [TestMethod]
        public void StagePeekPipelineModuleTest()
        {
            var t = Module<StagePeekPipelineModule>();
            Action<byte[], bool, ushort, bool, ushort, ushort, bool> iteration = (
                inputs, inReady,
                outResult, outReady,
                stage1Sum0, stage1Sum1, stage1Ready) =>
            {
                t.Cycle(
                    new PipelineTestInputs()
                    {
                        inData = inputs,
                        inReady = inReady
                    }, 
                    new RTLModuleCycleParams()
                    {
                        OnBeforeStage = () =>
                        {
                            Assert.AreEqual(stage1Sum0, t.stage1NextSum0, $"Stage1NextSum0 failed for {inputs.ToCSV()}, {inReady}");
                        }
                    });

                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}");

                Assert.AreEqual(stage1Sum0, t.stage1Sum0, $"Stage1Sum0 failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(stage1Sum1, t.stage1Sum1, $"Stage1Sum1 failed for {inputs.ToCSV()}, {inReady}");
                Assert.AreEqual(stage1Ready, t.stage1Ready, $"Stage1Ready failed for {inputs.ToCSV()}, {inReady}");
            };

            iteration(emptyPipelineArray,   false, 0,       false, 0, 0, false);
            iteration(maxPipelineArray,     true, 0,        false, 0, 0, false);
            iteration(edgePipelineArray,    true, 42,       false, 1020, 1020, true);
            iteration(emptyPipelineArray,   false, 2082,    true, 1, 1, true);
            iteration(emptyPipelineArray,   false, 44,      true, 0, 0, false);
            iteration(emptyPipelineArray,   false, 42,      false, 0, 0, false);
        }

        [TestMethod]
        public void StageStatePipelineModuleTest()
        {
            var t = Module<StageStatePipelineModule>();
            Action<byte[], bool, ushort, bool, ushort, ushort, ushort> iteration = (inputs, inReady, outResult, outReady, outS0Counter, outS1Counter, outS2Counter) =>
            {
                t.Cycle(new PipelineTestInputs()
                {
                    inData = inputs,
                    inReady = inReady
                });
                Assert.AreEqual(outResult, t.outResult, $"Result failed for {inputs.ToCSV()}, {inReady}, {outS0Counter}, {outS1Counter}, {outS2Counter}");
                Assert.AreEqual(outReady, t.outReady, $"Ready failed for {inputs.ToCSV()}, {inReady}, {outS0Counter}, {outS1Counter}, {outS2Counter}");
                Assert.AreEqual(outS0Counter, t.outS0Counter, $"S0 Counter failed for {inputs.ToCSV()}, {inReady}, {outS0Counter}, {outS1Counter}, {outS2Counter}");
                Assert.AreEqual(outS1Counter, t.outS1Counter, $"S1 Counter failed for {inputs.ToCSV()}, {inReady}, {outS0Counter}, {outS1Counter}, {outS2Counter}");
                Assert.AreEqual(outS2Counter, t.outS2Counter, $"S2 Counter failed for {inputs.ToCSV()}, {inReady}, {outS0Counter}, {outS1Counter}, {outS2Counter}");
            };

            iteration(emptyPipelineArray, false, 0, false,  0, 0, 1);
            iteration(maxPipelineArray, true, 0, false,     0, 1, 2);
            iteration(edgePipelineArray, true, 0, false,    1, 2, 3);
            iteration(emptyPipelineArray, false, 2040, true,2, 3, 4);
            iteration(emptyPipelineArray, false, 2, true,   3, 4, 5);
            iteration(emptyPipelineArray, false, 0, false,  4, 5, 6);
        }

        [TestMethod]
        public void StallControlPipelineModuleTest_StallPipeline()
        {
            var t = Module<StallControlPipelineModule>();
            t.Cycle(new StallControlInputs(), new RTLModuleCycleParams()
            {
                OnBeforeStage = () =>
                {
                    Assert.IsTrue(t.outResult.pipelineWillStall);
                    Assert.IsTrue(t.outResult.stage0WillStall);
                    Assert.IsTrue(t.outResult.stage1WillStall);
                    Assert.IsTrue(t.outResult.stage2WillStall);
                }
            });
            Assert.IsTrue(t.outResult.pipelineStalled);
            Assert.IsTrue(t.outResult.stage0Stalled);
            Assert.IsTrue(t.outResult.stage1Stalled);
            Assert.IsTrue(t.outResult.stage2Stalled);
        }

        [TestMethod]
        public void StallControlPipelineModuleTest_StallSelf()
        {
            var t = Module<StallControlPipelineModule>();
            t.Cycle(new StallControlInputs()
            {
                inProcessed = true
            });

            Assert.IsTrue(t.outResult.stage0Stalled);
            Assert.IsFalse(t.outResult.stage1Stalled);
            Assert.IsFalse(t.outResult.stage2Stalled);
            Assert.IsFalse(t.outResult.pipelineStalled);
        }

        [TestMethod]
        public void StallControlPipelineModuleTest_IdleRun()
        {
            var t = Module<StallControlPipelineModule>();
            Action<StallControlOutput> assert = (expected) => Assert.IsTrue(DeepDiff.DeepEquals(expected, t.outResult));
            var idle = new StallControlInputs() { inProcessed = true, inReady = true };
            t.Cycle(idle);
            assert(new StallControlOutput() { result = 0 });

            t.Cycle(idle);
            assert(new StallControlOutput() { result = 1 });

            t.Cycle(idle);
            assert(new StallControlOutput() { result = 2, ready = true });

            t.Cycle(idle);
            assert(new StallControlOutput() { result = 3, ready = true });
        }

        [TestMethod]
        public void StallControlPipelineModuleTest_StallPrev()
        {
            var t = new RTLSimulator<StallControlPipelineModule, StallControlInputs>(VCDOutputPath());

            Action<StallControlOutput> assert = (expected) =>
            {
                var compare = DeepDiff.DeepCompare(expected, t.TopLevel.outResult);
                if (compare != null)
                {
                    Assert.Fail($"{string.Join(".", compare.Path.Select(p => p.Name))}: Expecting {compare.lhs}, Actual {compare.rhs}. {compare.Messages.ToCSV()}");
                }
            };

            t.ClockCycle(new StallControlInputs() { inProcessed = true, inData = 3, inReady = true });
            assert(new StallControlOutput());

            t.ClockCycle(new StallControlInputs { inProcessed = true });
            assert(new StallControlOutput() { result = 1, stage0Stalled = true });

            t.ClockCycle(new StallControlInputs { inProcessed = true });
            assert(new StallControlOutput() { result = 5, stage0Stalled = true });

            t.ClockCycle(new StallControlInputs { inProcessed = true });
            assert(new StallControlOutput() { result = 9, stage0Stalled = true });

            t.ClockCycle(new StallControlInputs { inProcessed = true, inReady = true });
            assert(new StallControlOutput() { result = 13 });

            t.ClockCycle(new StallControlInputs { inProcessed = true, inReady = true });
            assert(new StallControlOutput() { result = 17, ready = true });

            t.ClockCycle(new StallControlInputs { inProcessed = true });
        }

        class IntDividerPipelineModuleTestRecord
        {
            public int Numerator;
            public int Denominator;
            public int Result => Numerator / Denominator;
            public int Remainder => Numerator % Denominator;

            public IntDividerPipelineModuleTestRecord(int num, int den)
            {
                Numerator = num;
                Denominator = den;
            }
        }

        class IntDividerPipelineModuleTestResult
        {
            public int Result;
            public int Remainder;

            public IntDividerPipelineModuleTestResult(int res, int rem)
            {
                Result = res;
                Remainder = rem;
            }
        }

        [TestMethod]
        public void IntDividerPipelineModuleTest()
        {
            var t = new RTLSimulator<IntDividerPipelineModule, IntDividerPipelineModuleInputs>();
            var tl = t.TopLevel;
            var rnd = new Random(Environment.TickCount);

            var testCases = new List<IntDividerPipelineModuleTestRecord>();
            var testResults = new List<IntDividerPipelineModuleTestResult>();

            int max = 1000;

            foreach (var i in Enumerable.Range(0, max))
            {
                var testCase = new IntDividerPipelineModuleTestRecord(rnd.Next(), rnd.Next());
                testCases.Add(testCase);

                t.ClockCycle(new IntDividerPipelineModuleInputs() { inReady = true, inNumerator = testCase.Numerator, inDenominator = testCase.Denominator });

                if (tl.OutReady)
                {
                    testResults.Add(new IntDividerPipelineModuleTestResult(tl.OutRes, tl.OutRem));
                }
            }

            while(tl.OutReady)
            {
                t.ClockCycle(new IntDividerPipelineModuleInputs());

                if (tl.OutReady)
                {
                    testResults.Add(new IntDividerPipelineModuleTestResult(tl.OutRes, tl.OutRem));
                }
            }

            Assert.AreEqual(max, testResults.Count);

            foreach (var i in Enumerable.Range(0, max))
            {
                var testCase = testCases[i];
                var testResult = testResults[i];

                Assert.AreEqual(testCase.Result, testResult.Result, $"res failed for {testCase.Numerator} / {testCase.Denominator}");
                Assert.AreEqual(testCase.Remainder, testResult.Remainder, $"rem failed for {testCase.Numerator} / {testCase.Denominator}");
            }
        }

        [TestMethod]
        public void DividerSim()
        {
            var rnd = new Random(Environment.TickCount);
            foreach (var _ in Enumerable.Range(0, 1000000))
            {
                int result = 0;
                long numerator = rnd.Next();
                long denominator = rnd.Next();

                var expectedResult = numerator / denominator;
                var expectedRemainder = numerator % denominator;

                long currentDenominator = denominator << 32;
                for (int i = 0; i < 32; i++)
                {
                    result = result << 1;
                    currentDenominator = currentDenominator >> 1;

                    if (numerator >= currentDenominator)
                    {
                        result |= 1;
                        numerator = numerator - currentDenominator;
                    }
                }

                Assert.AreEqual(expectedResult, result);
                Assert.AreEqual(expectedRemainder, numerator);
            }
        }
    }
}

