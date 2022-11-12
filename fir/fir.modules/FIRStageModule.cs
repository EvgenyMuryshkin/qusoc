using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace fir.modules
{
    public class FIRStageInputs
    {
        public FIRStageInputs() { }
        public FIRStageInputs(FIRParams firParams)
        {
            iDO = new RTLBitArray().Resized(firParams.DOSize);
            iIQ = new RTLBitArray().Resized(firParams.IQSizeIn);

            iFILO = new RTLBitArray().Resized(firParams.IQSizeIn);
            iAccum = new RTLBitArray().Resized(firParams.AccumSize);

            iCoeffReadAddr = new RTLBitArray().Resized(firParams.CoeffRamAddrBits);
            iCoeffWriteAddr = new RTLBitArray().Resized(firParams.CoeffRamAddrBits);
            iCoeffData = new RTLBitArray().Resized(firParams.CoeffSize);

            iData = new RTLBitArray().Resized(firParams.IQSizeIn);
            iDataReadAddr = new RTLBitArray().Resized(firParams.DataRamAddrBits);
            iDataWriteAddr = new RTLBitArray().Resized(firParams.DataRamAddrBits);
        }

        public RTLBitArray iIQ;
        public RTLBitArray iDO;

        public RTLBitArray iFILO;
        public RTLBitArray iAccum;
        public bool iInternalFeedbackSelector;

        public RTLBitArray iCoeffReadAddr;
        public bool iCoeffWE;
        public RTLBitArray iCoeffWriteAddr;
        public RTLBitArray iCoeffData;

        public RTLBitArray iDataReadAddr;
        public bool iDataWE;
        public RTLBitArray iData;
        public RTLBitArray iDataWriteAddr;
    }

    public class FIRStageState
    {
        public FIRStageState() { }
        public FIRStageState(FIRParams firParams)
        {
            coeffRAM = Enumerable.Range(0, 1 << firParams.CoeffRamAddrBits - 1).Select(i => new RTLBitArray().Resized(firParams.CoeffSize)).ToArray();
            coeff = new RTLBitArray().Resized(firParams.CoeffSize);

            dataRAM = Enumerable.Range(0, 1 << firParams.DataRamAddrBits - 1).Select(i => new RTLBitArray().Resized(firParams.IQSizeIn)).ToArray();
            data = new RTLBitArray().Resized(firParams.IQSizeIn);

            IQ1 = new RTLBitArray().Resized(firParams.IQSizeIn);
            IQ2 = new RTLBitArray().Resized(firParams.IQSizeIn);
        }

        public RTLBitArray IQ1;
        public RTLBitArray IQ2;

        public RTLBitArray coeff;
        public RTLBitArray[] coeffRAM;

        public RTLBitArray data;
        public RTLBitArray[] dataRAM;
    }


    public class FIRStageModule : RTLSynchronousModule<FIRStageInputs, FIRStageState>
    {
        readonly FIRParams firParams;
        FIRStageDSPModule dsp;

        public FIRStageModule() { }

        public FIRStageModule(FIRParams firParams)
        {
            this.firParams = firParams;

            dsp = new FIRStageDSPModule(firParams);

            InitInputs(new FIRStageInputs(firParams));
            InitState(new FIRStageState(firParams));
        }

        protected override void OnSchedule(Func<FIRStageInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);
            dsp.Schedule(() => new FIRStageDSPInputs(firParams)
            { 
                iIQ = internalIQ,
                iFILO = Inputs.iFILO,
                iCoeff = State.coeff,
                iAccum = Inputs.iAccum,
                iInternalFeedbackSelector = Inputs.iInternalFeedbackSelector
            });
        }

        public RTLBitArray oIQ => State.IQ2;
        RTLBitArray internalIQ => Inputs.iDO == 0
            ? Inputs.iIQ
            : Inputs.iData;

        public RTLBitArray oData => State.data;
        public RTLBitArray oAccum => dsp.oAccum;

        protected override void OnStage()
        {
            NextState.IQ1 = Inputs.iIQ;
            NextState.IQ2 = State.IQ1;

            if (Inputs.iCoeffWE)
                NextState.coeffRAM[Inputs.iCoeffWriteAddr] = Inputs.iCoeffData;

            NextState.coeff = State.coeffRAM[Inputs.iCoeffReadAddr];

            if (Inputs.iDataWE)
                NextState.dataRAM[Inputs.iDataWriteAddr] = Inputs.iData;

            NextState.data = State.dataRAM[Inputs.iDataReadAddr];
        }
    }
}
