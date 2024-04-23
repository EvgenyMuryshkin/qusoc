using Quokka.RTL;

namespace axi.modules
{
    public class AXILikeInteconnectModule : InterconnectModule<MData, SData>
    {
        public AXILikeInteconnectModule()
            : base(8, () => new MData(), 4, () => new SData())
        {

        }

        protected override bool TXStart(int sourceIndex, MData source)
        {
            return source.IsActive;
        }
        protected override bool TXEnd(MData source) => source.Payload.DataFlag;
        protected override RTLBitArray RightAddr() => muxLeftData.Addr;
        public bool[] oTransactions => Transactions;
        public bool[] oWaitForRestarts => WaitForRestarts;
        public MData oMuxLeftData => muxLeftData;
        public RTLBitArray oRightAddr => RightAddr();
        public MData[] oLeft => muxLeft;
        public SData[] oRight => muxRight;
    }
}
