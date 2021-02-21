using Microsoft.VisualStudio.TestTools.UnitTesting;
using Quokka.RTL;
using Quokka.RTL.Simulator;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;

namespace RTL.Modules
{
    [TestClass]
    public class StallControlTests : BaseRTLModuleTests
    {
        class SignalValue
        {
            public bool value;
            public float duration;
        }

        class SignalAssert
        {
            public RTLBitArray value;
            public float at;
        }

        class IntegrationTestDataLogger
        {
            Dictionary<string, List<SignalValue>> signalsValues = new Dictionary<string, List<SignalValue>>();
            Dictionary<string, List<SignalAssert>> signalAsserts = new Dictionary<string, List<SignalAssert>>();

            public int currentClock = 0;
            public float offset = 32000;
            public float clockDuration = 20000;

            public void setInputs(StallControlTestPipelineModuleInputs inputs)
            {
                var members = RTLReflectionTools.RecursiveMembers(inputs.GetType());
                foreach (var m in members)
                {
                    var signalValue = (bool)m.GetValue(inputs);

                    if (!signalsValues.ContainsKey(m.Name))
                    {
                        signalsValues[m.Name] = new List<SignalValue>() { new SignalValue() { value = signalValue, duration = offset } };
                    }
                    else
                    {
                        var list = signalsValues[m.Name];
                        var lastValue = list.Last();
                        if (lastValue.value != signalValue)
                        {
                            list.Add(new SignalValue() { value = signalValue, duration = clockDuration });
                        }
                        else
                        {
                            lastValue.duration += clockDuration;
                        }
                    }
                }
            }

            public void SetOutputs(StallControlTestOutput expected)
            {
                var members = RTLReflectionTools.RecursiveMembers(expected.GetType());
                foreach (var m in members)
                {
                    var signalValue = m.GetValue(expected);

                    if (!signalAsserts.ContainsKey(m.Name))
                        signalAsserts[m.Name] = new List<SignalAssert>();

                    var at = offset + (currentClock) * clockDuration + 1000;

                    switch (signalValue)
                    {
                        case bool v:
                            signalAsserts[m.Name].Add(new SignalAssert() { value = new RTLBitArray(v), at = at });
                            break;
                        case byte b:
                            signalAsserts[m.Name].Add(new SignalAssert() { value = new RTLBitArray(b), at = at });
                            break;
                    }
                }
            }

            public void Generate()
            {
                // TODO: maybe update hardware simulation test?
                var inputsTransition = new StringBuilder();
                foreach (var sig in signalsValues)
                {
                    inputsTransition.AppendLine($"TRANSITION_LIST(\"{sig.Key}\")");
                    inputsTransition.AppendLine("{");
                    inputsTransition.AppendLine("\tNODE");
                    inputsTransition.AppendLine("\t{");
                    inputsTransition.AppendLine("\t\tREPEAT = 1;");
                    foreach (var v in sig.Value)
                    {
                        inputsTransition.AppendLine($"\t\tLEVEL {(v.value ? "1" : "0")} FOR {v.duration};");
                    }
                    inputsTransition.AppendLine("\t}");
                    inputsTransition.AppendLine("}");
                }
                var inputsValue = inputsTransition.ToString();

                var outputsTransition = new StringBuilder();

                foreach (var sig in signalAsserts.Where(p => !p.Key.Contains("Will")))
                {
                    outputsTransition.AppendLine($"\t\t\t\tnew WaveformSignalAssert(\"outResult_{sig.Key}\",");
                    foreach (var v in sig.Value)
                    {
                        outputsTransition.Append($"\t\t\t\t\tnew WaveformTimeValueAssert({v.at}, \"{v.value.AsBinaryString()}\")");
                        if (v == sig.Value.Last())
                            outputsTransition.AppendLine();
                        else
                            outputsTransition.AppendLine(",");
                    }
                    if (sig.Key == signalAsserts.Last().Key)
                        outputsTransition.AppendLine($"\t\t\t\t)");
                    else
                        outputsTransition.AppendLine($"\t\t\t\t),");
                }
                var outputsValue = outputsTransition.ToString();
            }
        }

        [TestMethod]
        public void StallControlTestPipelineModuleTest()
        {
            var sim = new RTLSimulator<StallControlTestPipelineModule, StallControlTestPipelineModuleInputs>();
            sim.TraceToVCD(VCDOutputPath());

            var dataLog = new IntegrationTestDataLogger();

            // initial values
            dataLog.setInputs(new StallControlTestPipelineModuleInputs());

            Action<StallControlTestPipelineModuleInputs> clockCycle = (inputs) =>
            {
                dataLog.currentClock++;
                dataLog.setInputs(inputs);
                sim.ClockCycle(inputs);
            };

            Action<byte[]> assertStateCounters = (values) =>
            {
                var pl = sim.TopLevel.PipelineProps.Single().GetValue(sim.TopLevel) as IRTLPipeline;
                var head = pl.Diag.Head;
                var s0 = head.Peek<StallControlTestPipelineStage0>();
                var s1 = head.Peek<StallControlTestPipelineStage1>();
                var s2 = head.Peek<StallControlTestPipelineStage2>();
                var s3 = head.Peek<StallControlTestPipelineStage3>();

                Assert.AreEqual(values[0], s0.State.stage0Counter);
                Assert.AreEqual(values[1], s1.State.stage1Counter);
                Assert.AreEqual(values[2], s2.State.stage2Counter);
                Assert.AreEqual(values[3], s3.State.stage3Counter);
            };

            Action<StallControlTestOutput> assert = (expected) =>
            {
                var compare = RTLModuleHelper.DeepCompare(expected, sim.TopLevel.outResult);
                if (compare != null)
                {
                    Assert.Fail($"{string.Join(".", compare.Path.Select(p => p.Name))}: Expecting {compare.lhs}, Actual {compare.rhs}. {compare.Messages.ToCSV()}");
                }

                dataLog.SetOutputs(expected);
            };

            var idle = new StallControlTestPipelineModuleInputs();
            clockCycle(idle);
            assert(new StallControlTestOutput() { stage3Counter = 1 });

            clockCycle(idle);
            assert(new StallControlTestOutput() { stage2Counter = 1, stage3Counter = 2 });

            clockCycle(idle);
            assert(new StallControlTestOutput() { stage1Counter = 1, stage2Counter = 2, stage3Counter = 3 });

            clockCycle(idle);
            assert(new StallControlTestOutput() { stage0Counter = 1, stage1Counter = 2, stage2Counter = 3, stage3Counter = 4 });

            // all counters should be at 4
            assertStateCounters(new byte[] { 4, 4, 4, 4 });

            #region stage3 stall control
            // stall stage3
            clockCycle(new StallControlTestPipelineModuleInputs() { stallStage3 = true });

            assertStateCounters(new byte[] { 4, 4, 4, 4 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 1,
                stage1Counter = 2,
                stage2Counter = 3,
                stage3Counter = 4,
                pipelineStalled = true,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = true
            });

            // stall pipeline from stage 3
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage3 = true });
            assertStateCounters(new byte[] { 4, 4, 4, 4 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 1,
                stage1Counter = 2,
                stage2Counter = 3,
                stage3Counter = 4,
                pipelineStalled = true,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = true
            });

            // stall stage2 from stage 3
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage3 = true });
            assertStateCounters(new byte[] { 4, 4, 4, 5 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 2,
                stage1Counter = 3,
                stage2Counter = 4,
                stage3Counter = 5,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = false
            });

            // stall stage 2 from stage 3 again
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage3 = true });
            assertStateCounters(new byte[] { 4, 4, 4, 6 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 2,
                stage1Counter = 3,
                stage2Counter = 4,
                stage3Counter = 6,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = false
            });
            #endregion

            #region stage2 stall control
            // stall stage2
            clockCycle(new StallControlTestPipelineModuleInputs() { stallStage2 = true });

            assertStateCounters(new byte[] { 4, 4, 4, 7 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 2,
                stage1Counter = 3,
                stage2Counter = 4,
                stage3Counter = 7,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = false
            });

            // stall pipeline from stage 2
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage2 = true });
            assertStateCounters(new byte[] { 4, 4, 4, 7 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 2,
                stage1Counter = 3,
                stage2Counter = 4,
                stage3Counter = 7,
                pipelineStalled = true,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = true
            });

            // stall stage1 from stage 2
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage2 = true });
            assertStateCounters(new byte[] { 4, 4, 5, 8 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 2,
                stage1Counter = 3,
                stage2Counter = 4,
                stage3Counter = 8,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = false,
                stage3Stalled = false
            });

            // stall stage1 from stage 2 again
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage2 = true });
            assertStateCounters(new byte[] { 4, 4, 6, 9 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 3,
                stage1Counter = 4,
                stage2Counter = 5,
                stage3Counter = 9,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = false,
                stage3Stalled = false
            });

            // stall stage1 from stage 2 one more time
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage2 = true });
            assertStateCounters(new byte[] { 4, 4, 7, 10 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 3,
                stage1Counter = 4,
                stage2Counter = 6,
                stage3Counter = 10,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = false,
                stage3Stalled = false
            });
            #endregion stage2 stall control

            #region stage1 stall control
            clockCycle(new StallControlTestPipelineModuleInputs() { stallStage1 = true });
            assertStateCounters(new byte[] { 4, 4, 8, 11 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 3,
                stage1Counter = 4,
                stage2Counter = 7,
                stage3Counter = 11,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage1 = true });
            assertStateCounters(new byte[] { 4, 4, 8, 11 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 3,
                stage1Counter = 4,
                stage2Counter = 7,
                stage3Counter = 11,
                pipelineStalled = true,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = true
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage1 = true });
            assertStateCounters(new byte[] { 4, 5, 9, 12 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 3,
                stage1Counter = 4,
                stage2Counter = 8,
                stage3Counter = 12,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage1 = true });
            assertStateCounters(new byte[] { 4, 6, 10, 13 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 3,
                stage1Counter = 4,
                stage2Counter = 9,
                stage3Counter = 13,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage1 = true });
            assertStateCounters(new byte[] { 4, 7, 11, 14 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 4,
                stage1Counter = 5,
                stage2Counter = 10,
                stage3Counter = 14,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            #endregion stage1 stall control

            #region stage2 stall control
            clockCycle(new StallControlTestPipelineModuleInputs() { stallStage0 = true });
            assertStateCounters(new byte[] { 4, 8, 12, 15 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 4,
                stage1Counter = 6,
                stage2Counter = 11,
                stage3Counter = 15,
                pipelineStalled = false,
                stage0Stalled = true,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage0 = true });
            assertStateCounters(new byte[] { 4, 8, 12, 15 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 4,
                stage1Counter = 6,
                stage2Counter = 11,
                stage3Counter = 15,
                pipelineStalled = true,
                stage0Stalled = true,
                stage1Stalled = true,
                stage2Stalled = true,
                stage3Stalled = true
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage0 = true });
            assertStateCounters(new byte[] { 5, 9, 13, 16 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 4,
                stage1Counter = 7,
                stage2Counter = 12,
                stage3Counter = 16,
                pipelineStalled = false,
                stage0Stalled = false,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage0 = true });
            assertStateCounters(new byte[] { 6, 10, 14, 17 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 4,
                stage1Counter = 8,
                stage2Counter = 13,
                stage3Counter = 17,
                pipelineStalled = false,
                stage0Stalled = false,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage0 = true });
            assertStateCounters(new byte[] { 7, 11, 15, 18 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 4,
                stage1Counter = 9,
                stage2Counter = 14,
                stage3Counter = 18,
                pipelineStalled = false,
                stage0Stalled = false,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            clockCycle(new StallControlTestPipelineModuleInputs() { stallPrev = true, stallStage0 = true });
            assertStateCounters(new byte[] { 8, 12, 16, 19 });
            assert(new StallControlTestOutput()
            {
                stage0Counter = 5,
                stage1Counter = 10,
                stage2Counter = 15,
                stage3Counter = 19,
                pipelineStalled = false,
                stage0Stalled = false,
                stage1Stalled = false,
                stage2Stalled = false,
                stage3Stalled = false
            });

            #endregion stage2 stall control

            // filler in VCD
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage3 = true });
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage3 = true });
            clockCycle(new StallControlTestPipelineModuleInputs() { stallPipeline = true, stallStage3 = true });

            dataLog.Generate();
        }
    }
}

