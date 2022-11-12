using Quokka.RTL;
using Quokka.RTL.Verilog;
using Quokka.RTL.VHDL;
using System.Collections.Generic;

namespace fir.modules
{
    public class FIRDSPWrapperModuleInputs
    {
        public FIRDSPWrapperModuleInputs() { }
        /*
        public FIRDSPWrapperModuleInputs(FIRParams firParams)
        {
            A = new RTLBitArray().Resized(30);
            B = new RTLBitArray().Resized(18);
            D = new RTLBitArray().Resized(25);
            PCIN = new RTLBitArray().Resized(48);
            OPMODE = new RTLBitArray().Resized(3);
        }
        */
        public bool CE;
        public RTLBitArray A = new RTLBitArray().Resized(30);
        public RTLBitArray B = new RTLBitArray().Resized(18);
        public RTLBitArray D = new RTLBitArray().Resized(25);
        public RTLBitArray PCIN = new RTLBitArray().Resized(48);
        public RTLBitArray OPMODE = new RTLBitArray().Resized(3);
    }

    public class FIRDSPWrapperModuleState
    {
        public FIRDSPWrapperModuleState() { }

        public FIRDSPWrapperModuleState(FIRParams firParams)
        {
        }
    }

    public class FIRDSPWrapperModule : RTLSynchronousModule<FIRDSPWrapperModuleInputs, FIRDSPWrapperModuleState>, IRTLModuleTranslator
    {
        private readonly FIRParams firParams;

        public FIRDSPWrapperModule(FIRParams firParams)
        {
            this.firParams = firParams;

            //InitInputs(new FIRDSPWrapperModuleInputs(firParams));
            InitState(new FIRDSPWrapperModuleState(firParams));
        }

        public RTLBitArray PCOUT => new RTLBitArray().Resized(48);
        public RTLBitArray P => new RTLBitArray().Resized(48);

        protected override void OnStage()
        {
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
                            .WithEntityInstanceNamedPortMapping("BCOUT", "open")
                            .WithEntityInstanceNamedPortMapping("CARRYCASCOUT", "open")
                            .WithEntityInstanceNamedPortMapping("MULTSIGNOUT", "open")
                            .WithEntityInstanceNamedPortMapping("PCOUT", "PCOUT")
                            .WithEntityInstanceNamedPortMapping("OVERFLOW", "open")
                            .WithEntityInstanceNamedPortMapping("PATTERNBDETECT", "open")
                            .WithEntityInstanceNamedPortMapping("PATTERNDETECT", "open")
                            .WithEntityInstanceNamedPortMapping("UNDERFLOW", "open")
                            .WithEntityInstanceNamedPortMapping("CARRYOUT", "open")
                            .WithEntityInstanceNamedPortMapping("P", "P")
                            .WithEntityInstanceNamedPortMapping("ACIN", "(others =>'0')")
                            .WithEntityInstanceNamedPortMapping("BCIN", "(others =>'0')")
                            .WithEntityInstanceNamedPortMapping("CARRYCASCIN", "'0'")
                            .WithEntityInstanceNamedPortMapping("MULTSIGNIN", "'0'")
                            .WithEntityInstanceNamedPortMapping("PCIN", "PCIN")
                            .WithEntityInstanceNamedPortMapping("ALUMODE", "(others =>'0')")
                            .WithEntityInstanceNamedPortMapping("CARRYINSEL", "(others =>'0')")
                            .WithEntityInstanceNamedPortMapping("CEINMODE", "CE")
                            .WithEntityInstanceNamedPortMapping("CLK", "CLK")
                            .WithEntityInstanceNamedPortMapping("INMODE", "\"10100\"")
                            .WithEntityInstanceNamedPortMapping(new vhdIdentifier("OPMODE", new vhdRange("3", "0")), "\"0101\"")
                            .WithEntityInstanceNamedPortMapping(new vhdIdentifier("OPMODE", new vhdRange("6", "4")), "OPMODE")
                            .WithEntityInstanceNamedPortMapping("RSTINMODE", "RST")
                            .WithEntityInstanceNamedPortMapping("A", "A")
                            .WithEntityInstanceNamedPortMapping("B", "B")
                            .WithEntityInstanceNamedPortMapping("C", "(others =>'0')")
                            .WithEntityInstanceNamedPortMapping("CARRYIN", "'0'")
                            .WithEntityInstanceNamedPortMapping("D", "D")
                            .WithEntityInstanceNamedPortMapping("CEA1", "CE")
                            .WithEntityInstanceNamedPortMapping("CEA2", "CE")
                            .WithEntityInstanceNamedPortMapping("CEAD", "CE")
                            .WithEntityInstanceNamedPortMapping("CEALUMODE", "'0'")
                            .WithEntityInstanceNamedPortMapping("CEB1", "CE")
                            .WithEntityInstanceNamedPortMapping("CEB2", "'0'")
                            .WithEntityInstanceNamedPortMapping("CEC", "'0'")
                            .WithEntityInstanceNamedPortMapping("CECARRYIN", "'0'")
                            .WithEntityInstanceNamedPortMapping("CECTRL", "CE")
                            .WithEntityInstanceNamedPortMapping("CED", "CE")
                            .WithEntityInstanceNamedPortMapping("CEM", "CE")
                            .WithEntityInstanceNamedPortMapping("CEP", "CE")
                            .WithEntityInstanceNamedPortMapping("RSTA", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTALLCARRYIN", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTALUMODE", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTB", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTC", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTCTRL", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTD", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTM", "RST")
                            .WithEntityInstanceNamedPortMapping("RSTP", "RST")
                    })
            };

            result.Add(deps.ControllerName, implementation);
            return result;
        }
    }
}
