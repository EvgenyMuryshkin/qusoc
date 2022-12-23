using Quokka.RTL;
using Quokka.RTL.Verilog;
using Quokka.RTL.VHDL;
using System.Collections.Generic;

namespace fir.modules
{
    public class FIRStageDSPInputs
    {
        public FIRStageDSPInputs() { }

        public FIRStageDSPInputs(FIRParams firParams)
        {
            iIQ = new RTLBitArray().Resized(firParams.IQSizeIn);
            iFILO = new RTLBitArray().Resized(firParams.IQSizeIn);
            iCoeff = new RTLBitArray().Resized(firParams.CoeffSize);
            iAccum = new RTLBitArray().Resized(firParams.AccumSize);
        }

        public RTLBitArray iIQ;
        public RTLBitArray iFILO;
        public RTLBitArray iCoeff;
        public RTLBitArray iAccum;
        public bool iInternalFeedbackSelector;
    }

    public class FIRStageDSPState
    {
        public FIRStageDSPState() { }

        public FIRStageDSPState(FIRParams firParams)
        {
            IQ1 = new RTLBitArray().Resized(firParams.IQSizeIn);
            IQ2 = new RTLBitArray().Resized(firParams.IQSizeIn);
            coeff = new RTLBitArray().Resized(firParams.CoeffSize);
            sum = new RTLBitArray().Resized(firParams.SumSize);
            mult = new RTLBitArray().Resized(firParams.MultSize);
            accum = new RTLBitArray().Resized(firParams.AccumSize);
        }

        public RTLBitArray IQ1;
        public RTLBitArray IQ2;
        public RTLBitArray coeff;
        public RTLBitArray sum;
        public RTLBitArray mult;
        public RTLBitArray accum;
    }

    public class FIRStageDSPModule : RTLSynchronousModule<FIRStageDSPInputs, FIRStageDSPState>, IRTLModuleTranslator
    {
        private readonly FIRParams firParams;

        public FIRStageDSPModule(FIRParams firParams)
        {
            this.firParams = firParams;

            InitInputs(new FIRStageDSPInputs(firParams));
            InitState(new FIRStageDSPState(firParams));
        }

        RTLBitArray internalAccumInputData =>
            Inputs.iInternalFeedbackSelector
                ? Inputs.iAccum
                : State.accum;

        public RTLBitArray oAccum => State.accum;

        protected override void OnStage()
        {
            NextState.IQ1 = Inputs.iIQ;
            NextState.IQ2 = State.IQ1;

            NextState.coeff = Inputs.iCoeff;

            NextState.sum = (State.IQ2 + Inputs.iFILO)[firParams.SumSize - 1, 0];
            NextState.mult = (State.sum * State.coeff)[firParams.MultSize - 1, 0];

            NextState.accum = (State.mult + internalAccumInputData)[firParams.AccumSize - 1, 0];
        }

        public override IRTLModuleTranslator InstanceTranslator(IRTLModuleTranslatorDeps deps) => this;
        public ModuleTranslatorResult ToRTL(IRTLModuleTranslatorDeps deps)
        {
            var result = new ModuleTranslatorResult();
            var implementation = new vhdArchitectureImplementation()
            {
                Block = new vhdArchitectureImplementationBlock()
                .WithEntityInstance(
                    new vhdEntityInstance("u_dsp48e1", "DSP48E1")
                    {
                        GenericMappings = new vhdEntityInstanceGenericMappings()
                            .WithEntityInstanceNamedGenericMapping("B_INPUT", "\"DIRECT\"")
                            .WithEntityInstanceNamedGenericMapping("USE_DPORT", "TRUE")
                            .WithEntityInstanceNamedGenericMapping("USE_MULT", "\"MULTIPLY\"")
                            .WithEntityInstanceNamedGenericMapping("AUTORESET_PATDET", "\"NO_RESET\"")
                            .WithEntityInstanceNamedGenericMapping("MASK", "X\"3fffffffffff\"")
                            .WithEntityInstanceNamedGenericMapping("PATTERN", "X\"000000000000\"")
                            .WithEntityInstanceNamedGenericMapping("SEL_MASK", "\"MASK\"")
                            .WithEntityInstanceNamedGenericMapping("SEL_PATTERN", "\"PATTERN\"")
                            .WithEntityInstanceNamedGenericMapping("USE_PATTERN_DETECT", "\"NO_PATDET\"")
                            .WithEntityInstanceNamedGenericMapping("ACASCREG", "2")
                            .WithEntityInstanceNamedGenericMapping("ADREG", "1")
                            .WithEntityInstanceNamedGenericMapping("ALUMODEREG", "0")
                            .WithEntityInstanceNamedGenericMapping("AREG", "2")
                            .WithEntityInstanceNamedGenericMapping("BCASCREG", "1")
                            .WithEntityInstanceNamedGenericMapping("BREG", "1")
                            .WithEntityInstanceNamedGenericMapping("CARRYINREG", "0")
                            .WithEntityInstanceNamedGenericMapping("CARRYINSELREG", "0")
                            .WithEntityInstanceNamedGenericMapping("CREG", "0")
                            .WithEntityInstanceNamedGenericMapping("DREG", "0")
                            .WithEntityInstanceNamedGenericMapping("INMODEREG", "0")
                            .WithEntityInstanceNamedGenericMapping("MREG", "1")
                            .WithEntityInstanceNamedGenericMapping("OPMODEREG", "1")
                            .WithEntityInstanceNamedGenericMapping("PREG", "1")
                            .WithEntityInstanceNamedGenericMapping("USE_SIMD", "\"ONE48\""),
                        PortMappings = new vhdEntityInstancePortMappings()
                            .WithEntityInstanceNamedPortMapping("BCOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("CARRYCASCOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("MULTSIGNOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("PCOUT", "PCOUT", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("OVERFLOW", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("PATTERNBDETECT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("PATTERNDETECT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("UNDERFLOW", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("CARRYOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("P", "P", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("ACIN", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("BCIN", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CARRYCASCIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("MULTSIGNIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("PCIN", "PCIN", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("ALUMODE", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CARRYINSEL", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEINMODE", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CLK", "CLK", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("INMODE", "\"10100\"", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping(
                                new vhdIdentifier("OPMODE", new vhdRange("3", "0")), "\"0101\"", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping(
                                new vhdIdentifier("OPMODE", new vhdRange("6", "4")), "OPMODE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTINMODE", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("A", "A", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("B", "B", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("C", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CARRYIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("D", "D", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEA1", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEA2", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEAD", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEALUMODE", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEB1", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEB2", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEC", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CECARRYIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CECTRL", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CED", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEM", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEP", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTA", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTALLCARRYIN", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTALUMODE", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTB", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTC", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTCTRL", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTD", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTM", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTP", "RST", vhdPortDirection.Input)
                    })
            };
            /*
            var file = new vhdFile()
                .WithLibraryReference("ieee")
                .WithUse("ieee.std_logic_1164.all")
                .WithUse("ieee.std_logic_arith.all")
                .WithUse("ieee.std_logic_unsigned.all")
                .WithEntity(
                    new vhdEntity(GetType().Name)
                    {
                        Interface = new vhdEntityInterface()
                            .WithStandardEntityPort("CLK", vhdPortDirection.Input, vhdDataType.StdLogic, 1, null)
                            .WithStandardEntityPort("CE", vhdPortDirection.Input, vhdDataType.StdLogic, 1, null)
                            .WithStandardEntityPort("RST", vhdPortDirection.Input, vhdDataType.StdLogic, 1, null)
                            .WithStandardEntityPort("A", vhdPortDirection.Input, vhdDataType.StdLogic, 29, null)
                            .WithStandardEntityPort("B", vhdPortDirection.Input, vhdDataType.StdLogic, 17, null)
                            .WithStandardEntityPort("D", vhdPortDirection.Input, vhdDataType.StdLogic, 24, null)
                            .WithStandardEntityPort("PCIN", vhdPortDirection.Input, vhdDataType.StdLogic, 47, null)
                            .WithStandardEntityPort("PCOUT", vhdPortDirection.Output, vhdDataType.StdLogic, 47, null)
                            .WithStandardEntityPort("P", vhdPortDirection.Output, vhdDataType.StdLogic, 1, null)
                            .WithStandardEntityPort("OPMODE", vhdPortDirection.Input, vhdDataType.StdLogic, 2, null)
                    }
                )
                .WithArchitecture(new vhdArchitecture("rtl", GetType().Name)
                {
                    Implementation = implementation
                })
                ;
            */

            result.Add(deps.ControllerName, implementation);
            return result;
        }
    }
}
