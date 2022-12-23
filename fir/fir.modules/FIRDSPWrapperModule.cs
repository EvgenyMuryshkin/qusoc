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
        public bool RST;
        public RTLBitArray A = new RTLBitArray().Resized(30);
        public RTLBitArray B = new RTLBitArray().Resized(18);
        public RTLBitArray D = new RTLBitArray().Resized(25);
        public RTLBitArray PCIN = new RTLBitArray().Resized(48);
        public RTLBitArray OPMODE = new RTLBitArray().Resized(3);
    }

    public class FIRDSPWrapperModuleState
    {
    }

    public class FIRDSPWrapperModule : RTLSynchronousModule<FIRDSPWrapperModuleInputs, FIRDSPWrapperModuleState>, IRTLModuleTranslator
    {
        public RTLBitArray PCOUT => new RTLBitArray().Resized(48);
        public RTLBitArray P => new RTLBitArray().Resized(48);

        protected override void OnStage()
        {
        }

        public override IRTLModuleTranslator InstanceTranslator(IRTLModuleTranslatorDeps deps) => this;
        public ModuleTranslatorResult ToRTL(IRTLModuleTranslatorDeps deps)
        {
            var result = new ModuleTranslatorResult();
            var file = new vhdFile()
                .WithLibraryReference("unisim")
                .WithUse("unisim.vcomponents.all");

            result.Add(deps.ControllerName, file);

            var implementation = new vhdArchitectureImplementation()
            {
                Block = new vhdArchitectureImplementationBlock()
                .WithComponentInstance(
                    new vhdComponentInstance("u_dsp48e1", "DSP48E1")
                    {
                        GenericMappings = new vhdEntityInstanceGenericMappings()
                            .WithEntityInstanceNamedGenericMapping("A_INPUT", "\"DIRECT\"")
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
                            .WithEntityInstanceNamedPortMapping("ACOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("BCOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("CARRYCASCOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("MULTSIGNOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("std_logic_vector(PCOUT)", "PCOUT", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("OVERFLOW", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("PATTERNBDETECT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("PATTERNDETECT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("UNDERFLOW", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("CARRYOUT", "open", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("std_logic_vector(P)", "P", vhdPortDirection.Output)
                            .WithEntityInstanceNamedPortMapping("ACIN", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("BCIN", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CARRYCASCIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("MULTSIGNIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("PCIN", "std_logic_vector(PCIN)", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("ALUMODE", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CARRYINSEL", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CEINMODE", "CE", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CLK", "BoardSignals.Clock", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("INMODE", "\"10100\"", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping(new vhdIdentifier("OPMODE", new vhdRange("3", "0")), "\"0101\"", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping(new vhdIdentifier("OPMODE", new vhdRange("6", "4")), "std_logic_vector(OPMODE)", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("RSTINMODE", "RST", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("A", "std_logic_vector(A)", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("B", "std_logic_vector(B)", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("C", "(others =>'0')", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("CARRYIN", "'0'", vhdPortDirection.Input)
                            .WithEntityInstanceNamedPortMapping("D", "std_logic_vector(D)", vhdPortDirection.Input)
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

            result.Add(deps.ControllerName, implementation);
            return result;
        }
    }
}
