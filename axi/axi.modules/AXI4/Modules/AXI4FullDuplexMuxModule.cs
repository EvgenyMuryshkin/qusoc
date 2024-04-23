namespace axi.modules
{
    public class AXI4FullDuplexMuxModule : FullDuplexMuxModule<AXI4_M2S, AXI4_S2M>
    { 
        public AXI4FullDuplexMuxModule() 
            : base(8, () => new AXI4_M2S(axiSize.B4), 4, () => new AXI4_S2M(axiSize.B4))
        {
        }
    }
}
