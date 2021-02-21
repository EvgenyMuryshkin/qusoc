namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public static class PipelineBuilder
    {
        public static IRTLPipelineHead<TSource> Source<TSource>()
        {
            return new PipelineHead<TSource>();
        }
    }
}
