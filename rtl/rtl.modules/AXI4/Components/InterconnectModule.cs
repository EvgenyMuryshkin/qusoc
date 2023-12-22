using Quokka.RTL;
using System;
using System.Linq;

namespace rtl.modules
{
    public class InterconnectModuleInputs<TLeft, TRight>
    {
        public InterconnectModuleInputs() { }

        public InterconnectModuleInputs(
            int leftCount,
            Func<TLeft> leftFactory,
            int rightCount,
            Func<TRight> rightFactory
        )
        {
            iLeft = Enumerable.Range(0, leftCount).Select(i => leftFactory()).ToArray();
            iRight = Enumerable.Range(0, rightCount).Select(i => rightFactory()).ToArray();
        }

        public TLeft[] iLeft;
        public TRight[] iRight;
    }

    public class InterconnectModuleState
    {

    }

    public abstract class InterconnectModule<TLeft, TRight> : RTLSynchronousModule<InterconnectModuleInputs<TLeft, TRight>, InterconnectModuleState>
        where TLeft: class
        where TRight: class
    {
        protected readonly int leftCount;
        protected readonly int rightCount;

        public InterconnectModule(
            int leftCount,
            Func<TLeft> leftFactory,
            int rightCount,
            Func<TRight> rightFactory
        )
        {
            this.leftCount = leftCount;
            this.rightCount = rightCount;

            TXBegin = new bool[leftCount];

            InitInputs(new InterconnectModuleInputs<TLeft, TRight>(leftCount, leftFactory, rightCount, rightFactory));
            TransactionDetectors = range(leftCount).Select((_) => new TransactionDetectorModule()).ToArray();
            Encoder = new AXI4EncoderModule(leftCount);
            DuplexMux = new FullDuplexMuxModule<TLeft, TRight>(leftCount, leftFactory, rightCount, rightFactory);

            //rightAddr = new RTLBitArray().Resized(AXITools.log2(rightCount));
        }

        TransactionDetectorModule[] TransactionDetectors;
        AXI4EncoderModule Encoder;
        FullDuplexMuxModule<TLeft, TRight> DuplexMux;

        protected abstract bool TXStart(TLeft source);
        protected abstract bool TXEnd(TLeft source);
        protected abstract RTLBitArray RightAddr();
        protected bool[] ActiveTransactions => TransactionDetectors.Select(t => t.oTransaction).ToArray();
        protected bool[] WaitForRestarts => TransactionDetectors.Select(t => t.oWaitForRestart).ToArray();
        protected bool[] Transactions => TransactionDetectors.Select(t => t.oTransaction).ToArray();
        protected TLeft muxLeftData => DuplexMux.oMuxLeftData;
        protected TRight muxRightData => DuplexMux.oMuxRightData;
        protected TLeft[] muxLeft => DuplexMux.oLeft;
        protected TRight[] muxRight => DuplexMux.oRight;

        protected bool restartTransactions // TODO: use LINQ Any(), All()
        {
            get
            {
                bool hasTransaction = false;

                for (var idx = 0; idx < leftCount; idx++)
                {
                    hasTransaction = hasTransaction | ActiveTransactions[idx];
                }

                return !hasTransaction;
            }
        }
        bool[] TXBegin;

        protected override void OnSchedule(Func<InterconnectModuleInputs<TLeft, TRight>> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            for (var leftIndex = 0; leftIndex < leftCount; leftIndex++)
            {
                TXBegin[leftIndex] = TXStart(Inputs.iLeft[leftIndex]) && !WaitForRestarts[leftIndex];
            }

            for (var leftIndex = 0; leftIndex < leftCount; leftIndex++)
            {
                TransactionDetectors[leftIndex].Schedule(() => 
                    new TransactionDetectorModuleInputs()
                    {
                        iTXBegin = Encoder.MSBValue[leftIndex],//TXBegin[leftIndex],
                        iTXEnd = TXEnd(Inputs.iLeft[leftIndex]),
                        iRestart = !Encoder.HasActive,// restartTransactions
                    }
                );
            }

            Encoder.Schedule(() => 
                new AXI4EncoderModuleInputs()
                {
                    iValues = TXBegin
                }
            );

            DuplexMux.Schedule(() =>
                new FullDuplexMuxModuleInputs<TLeft, TRight>()
                {
                    iLeft = Inputs.iLeft,
                    iLeftAddr = Encoder.MSBIndex,
                    iLeftAddrValid = Encoder.HasActive,
                    iRight = Inputs.iRight,
                    iRightAddr = RightAddr(),//rightAddr,
                    iRightAddrValid = true
                }
            );
        }

        protected override void OnStage()
        {
        }
    }
}
