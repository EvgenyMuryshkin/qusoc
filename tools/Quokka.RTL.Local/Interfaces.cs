using System;
using System.Collections.Generic;
using System.Text;

namespace Quokka.RTL.Local
{
    /*
    public interface IRTLPipeline
    {
        IRTLPipelineDiagnostics Diag { get; }
    }

    public interface IRTLPipelineHead : IRTLPipeline, IRTLControlFlow
    {
    }

    public interface IRTLPipelineHead<TSource> : IRTLPipelineHead
    {
        void Schedule(Func<TSource> inputsFactory);
        IRTLPipeline<TSource, TResult> Stage<TResult>(Func<TSource, TResult> map);
    }

    public interface IRTLPipeline<TSource> : IRTLPipeline
    {
        void Schedule(Func<TSource> inputsFactory);
    }

    public interface IRTLPipelineControlFlow
    {
        void StageCommit();
        void StageReset();
        bool StageStage(int iteration);
    }

    public interface IRTLPipelineStage : IRTLPipeline, IRTLPipelineControlFlow
    {
    }

    public interface IRTLPipelineStage<TInput> : IRTLPipelineStage
    {
        void StageSchedule(Func<TInput> inputsFactory);
    }

    public interface IRTLPipelineStage<TSource, TOutput> : IRTLPipelineStage
    {
        TOutput Output { get; }
        IRTLPipelineStage<TSource, TMap> Stage<TMap>(Func<TOutput, TMap> map);
    }

    public interface IRTLPipelineStage<TSource, TInput, TOutput> :
        IRTLPipelineStage<TInput>,
        IRTLPipelineStage<TSource, TOutput>
    {
    }


    public interface IRTLPipelineDiagnostics
    {
        IRTLPipelineHead Head { get; }
        IRTLPipelineStage NextStage { get; }
        List<IRTLPipelineStage> Stages { get; }
    }
    */
}
