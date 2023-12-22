using Quokka.RTL;
using System;
using System.Linq;

namespace rtl.modules
{
    public class FullDuplexMuxModuleInputs<TLeft, TRight>
        where TLeft: class
        where TRight: class
    {
        public FullDuplexMuxModuleInputs() { }

        public FullDuplexMuxModuleInputs(
            int leftCount,
            Func<TLeft> leftFactory,
            int rightCount,
            Func<TRight> rightFactory
        )
        {
            iLeftAddr = new RTLBitArray().Resized(AXITools.log2(leftCount));
            iLeft = Enumerable.Range(0, leftCount).Select(i => leftFactory()).ToArray();

            iRightAddr = new RTLBitArray().Resized(AXITools.log2(rightCount));
            iRight = Enumerable.Range(0, rightCount).Select(i => rightFactory()).ToArray();
        }

        public TLeft[] iLeft;
        public TRight[] iRight;

        public bool iLeftAddrValid;
        public RTLBitArray iLeftAddr;

        public bool iRightAddrValid;
        public RTLBitArray iRightAddr;
    }

    public class FullDuplexMuxModule<TLeft, TRight> : RTLCombinationalModule<FullDuplexMuxModuleInputs<TLeft, TRight>>
        where TLeft : class
        where TRight : class
    {
        private readonly int leftCount;
        private readonly int rightCount;

        // internal signals
        TLeft[] mOutLeftData;
        TRight[] mOutRightData;

        TLeft mEmptyLeftData;
        TLeft mMuxLeftData;

        TRight mEmptyRightData;
        TRight mMuxRightData;

        // outputs
        public TLeft[] oLeft => mOutLeftData;
        public TRight[] oRight => mOutRightData;

        public TLeft oMuxLeftData => mMuxLeftData;
        public TRight oMuxRightData => mMuxRightData;

        public FullDuplexMuxModule(
            int leftCount, 
            Func<TLeft> leftFactory,
            int rightCount,
            Func<TRight> rightFactory
        )
        {
            this.leftCount = leftCount;
            this.rightCount = rightCount;

            mEmptyLeftData = leftFactory();
            mMuxLeftData = leftFactory();

            mEmptyRightData = rightFactory();
            mMuxRightData = rightFactory();

            InitInputs(new FullDuplexMuxModuleInputs<TLeft, TRight>(leftCount, leftFactory, rightCount, rightFactory));

            mOutLeftData = range(rightCount).Select(i => leftFactory()).ToArray();
            mOutRightData = range(leftCount).Select(i => rightFactory()).ToArray();
        }

        void OnScheduleLeftToRight()
        {
            if (Inputs.iLeftAddrValid)
            {
                mMuxLeftData = Inputs.iLeft[Inputs.iLeftAddr];
            }
            else
            {
                mMuxLeftData = mEmptyLeftData;
            }

            for (var rightIndex = 0; rightIndex < rightCount; rightIndex++)
            {
                if (Inputs.iRightAddrValid && Inputs.iRightAddr == rightIndex)
                {
                    mOutLeftData[rightIndex] = mMuxLeftData;
                }
                else
                {
                    mOutLeftData[rightIndex] = mEmptyLeftData;
                }
            }
        }

        void OnScheduleRightToLeft()
        {
            if (Inputs.iRightAddrValid)
            {
                mMuxRightData = Inputs.iRight[Inputs.iRightAddr];
            }
            else
            {
                mMuxRightData = mEmptyRightData;
            }

            for (var leftIndex = 0; leftIndex < leftCount; leftIndex++)
            {
                if (Inputs.iLeftAddrValid && Inputs.iLeftAddr == leftIndex)
                {
                    mOutRightData[leftIndex] = mMuxRightData;
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
