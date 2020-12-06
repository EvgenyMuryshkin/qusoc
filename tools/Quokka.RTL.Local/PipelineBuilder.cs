namespace Quokka.RTL.Local
{
    [RTLToolkitType]
    public static class PipelineBuilder
    {
        public static PipelineHead<TSource> Source<TSource>()
        {
            return new PipelineHead<TSource>();
        }
    }
}
