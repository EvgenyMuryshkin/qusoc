using Quokka.RTL;
using System;
using System.Linq;

namespace rtl.modules
{
    public class FullDuplexMuxModuleInputs<TLeft, TRight>
        where TLeft: class, new()
        where TRight: class, new()
    {
        public FullDuplexMuxModuleInputs() { }

        public FullDuplexMuxModuleInputs(int mCount, int sCount)
        {
            iLeftAddr = new RTLBitArray().Resized(AXITools.log2(mCount));
            iLeft = Enumerable.Range(0, mCount).Select(i => new TLeft()).ToArray();

            iRightAddr = new RTLBitArray().Resized(AXITools.log2(sCount));
            iRight = Enumerable.Range(0, sCount).Select(i => new TRight()).ToArray();
        }

        public TLeft[] iLeft;
        public TRight[] iRight;

        public bool iLeftAddrValid;
        public RTLBitArray iLeftAddr;

        public bool iRightAddrValid;
        public RTLBitArray iRightAddr;
    }

    public class FullDuplexMuxModule<TLeft, TRight> : RTLCombinationalModule<FullDuplexMuxModuleInputs<TLeft, TRight>>
        where TLeft : class, new()
        where TRight : class, new()
    {
        private readonly int leftCount;
        private readonly int rightCount;

        // internal signals
        TLeft[] mInLeftData;
        TLeft[] mOutLeftData;

        TRight[] mInRightData;
        TRight[] mOutRightData;

        TLeft mEmptyLeftData = new TLeft();
        TRight mEmptyRightData = new TRight();

        bool validAddresses => Inputs.iLeftAddrValid && Inputs.iRightAddrValid;

        // outputs
        public TLeft[] oLeft => mOutLeftData;
        public TRight[] oRight => mOutRightData;

        public FullDuplexMuxModule(int leftCount, int rightCount)
        {
            this.leftCount = leftCount;
            this.rightCount = rightCount;

            InitInputs(new FullDuplexMuxModuleInputs<TLeft, TRight>(leftCount, rightCount));

            mInLeftData = range(leftCount).Select(i => new TLeft()).ToArray();
            mOutLeftData = range(rightCount).Select(i => new TLeft()).ToArray();

            mInRightData = range(rightCount).Select(i => new TRight()).ToArray();
            mOutRightData = range(leftCount).Select(i => new TRight()).ToArray();
        }

        void OnScheduleLeftToRight()
        {
            for (var leftIndex = 0; leftIndex < leftCount; leftIndex++)
            {
                mInLeftData[leftIndex] = Inputs.iLeft[leftIndex];
            }

            for (var rightIndex = 0; rightIndex < rightCount; rightIndex++)
            {
                if (validAddresses && Inputs.iRightAddr == rightIndex)
                {
                    mOutLeftData[rightIndex] = mInLeftData[Inputs.iLeftAddr];
                }
                else
                {
                    mOutLeftData[rightIndex] = mEmptyLeftData;
                }
            }
        }

        void OnScheduleRightToLeft()
        {
            for (var rightIndex = 0; rightIndex < rightCount; rightIndex++)
            {
                mInRightData[rightIndex] = Inputs.iRight[rightIndex];
            }

            for (var leftIndex = 0; leftIndex < leftCount; leftIndex++)
            {
                if (validAddresses && Inputs.iLeftAddr == leftIndex)
                {
                    mOutRightData[leftIndex] = mInRightData[Inputs.iRightAddr];
                }
                else
                {
                    mOutRightData[leftIndex] = mEmptyRightData;
                }
            }
        }

        protected override void OnSchedule(Func<FullDuplexMuxModuleInputs<TLeft, TRight>> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            OnScheduleLeftToRight();
            OnScheduleRightToLeft();
        }
    }

}
