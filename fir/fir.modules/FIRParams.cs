namespace fir.modules
{
    public class FIRParams
    {
        public readonly int Order;
        public readonly int DOSize;
        public readonly int IQSizeIn;
        public readonly int IQSizeOut;
        public readonly int CoeffSize;
        public readonly int SumSize;
        public readonly int MultSize;
        public readonly int AccumSize;
        public readonly int CoeffRamAddrBits;
        public readonly int DataRamAddrBits;

        public FIRParams(int order, int iIQSizeIn, int iIQSizeOut, int iDOSize, int coeffRamAddrBits, int dataRamAddrBits)
        {
            this.Order = order;
            this.DOSize = iDOSize;
            this.IQSizeIn = iIQSizeIn;
            this.IQSizeOut = iIQSizeOut;

            this.CoeffSize = iIQSizeIn;
            this.SumSize = iIQSizeIn + 1;
            this.AccumSize = iIQSizeIn * 2 + 1;
            this.MultSize = iIQSizeIn * 2 + 1;
            this.CoeffRamAddrBits = coeffRamAddrBits;
            this.DataRamAddrBits = dataRamAddrBits;
        }
    }
}
