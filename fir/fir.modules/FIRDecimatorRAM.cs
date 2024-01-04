using Quokka.RTL;
using Quokka.RTL.VHDL;
using System.Linq;

namespace fir.modules
{
    public class FIRDecimatorRAMInputs
    {
        public FIRDecimatorRAMInputs() { }
        public FIRDecimatorRAMInputs(int g_outreg, int g_ram_size)
        {
            WR_ADDR = new RTLBitArray().Resized(FIRTools.log2(g_ram_size));
            RD_ADDR = new RTLBitArray().Resized(FIRTools.log2(g_ram_size));
        }

        public bool CE;
        public bool WR;
        public RTLBitArray WR_ADDR;
        public RTLBitArray DIN = new RTLBitArray().Resized(16);
        public bool RD;
        public RTLBitArray RD_ADDR;
    }

    public class FIRDecimatorRAMState
    {
        public FIRDecimatorRAMState() { }
        public FIRDecimatorRAMState(int g_outreg = 2, int g_ram_size = 32)
        {
            Buff = Enumerable.Range(0, g_ram_size).Select(_ => new RTLBitArray().Resized(16)).ToArray();
        }

        public RTLBitArray[] Buff;
        public RTLBitArray ram_out_r1 = new RTLBitArray().Resized(16);
        public RTLBitArray ram_out_r2 = new RTLBitArray().Resized(16);
    }

    public class FIRDecimatorRAM : RTLSynchronousModule<FIRDecimatorRAMInputs, FIRDecimatorRAMState>, IRTLModuleTranslator
    {
        private readonly int g_outreg;
        private readonly int g_ram_size;
        public FIRDecimatorRAM(int g_outreg, int g_ram_size)
        {
            this.g_outreg = g_outreg;
            this.g_ram_size = g_ram_size;

            InitInputs(new FIRDecimatorRAMInputs(g_outreg, g_ram_size));
            InitState(new FIRDecimatorRAMState(g_outreg, g_ram_size));
        }

        public RTLBitArray DOUT => State.ram_out_r2;

        protected override void OnStage()
        {
            if (Inputs.CE)
            {
                if (Inputs.RD)
                {
                    if (g_outreg == 1)
                    {
                        NextState.ram_out_r2 = State.Buff[Inputs.RD_ADDR];
                    }
                    else
                    {
                        NextState.ram_out_r1 = State.Buff[Inputs.RD_ADDR];
                        NextState.ram_out_r2 = State.ram_out_r1;
                    }
                }

                if (Inputs.WR)
                {
                    NextState.Buff[Inputs.WR_ADDR] = Inputs.DIN;
                }
            }
        }

        public override IRTLModuleTranslator InstanceTranslator(IRTLModuleTranslatorDeps deps) => this;
        public ModuleTranslatorResult ToRTL(IRTLModuleTranslatorDeps deps)
        {
            var result = new ModuleTranslatorResult();
            var declarations = new vhdArchitectureDeclarations();
            declarations.WithDefaultSignal(
                vhdNetType.Signal, 
                "tmp", 
                vhdDataType.StdLogicVector,
                16, 
                "(others => '0')"
            );

            result.Add(deps.ControllerName, declarations);

            var implementation = new vhdArchitectureImplementation()
            {
                Block = new vhdArchitectureImplementationBlock()
                    .WithEntityInstance(
                        new vhdEntityInstance("u_ram", "work.fir_iq_sym_decimator_ram")
                        {
                            GenericMappings = new vhdEntityInstanceGenericMappings()
                                .WithEntityInstanceNamedGenericMapping("g_outreg", $"{g_outreg}")
                                .WithEntityInstanceNamedGenericMapping("g_ram_size", $"{g_ram_size}")
                                .WithEntityInstanceNamedGenericMapping("g_ram_size_log2", $"{FIRTools.log2(g_ram_size)}"),
                            PortMappings = new vhdEntityInstancePortMappings()
                                .WithEntityInstanceNamedPortMapping("CLK", "BoardSignals.Clock", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("CE", "CE", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("WR", "WR", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("WR_ADDR", "std_logic_vector(WR_ADDR)", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("DIN", "std_logic_vector(DIN)", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("RD", "RD", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("RD_ADDR", "std_logic_vector(RD_ADDR)", vhdPortDirection.Input)
                                .WithEntityInstanceNamedPortMapping("DOUT", "tmp", vhdPortDirection.Output)
                        }
                    )
                    // TODO: add fluent for base types to return parent
            };

            implementation.Block.WithAssignExpression("DOUT", vhdAssignType.Signal, "unsigned(tmp)");

            result.Add(deps.ControllerName, implementation);
            return result;
        }
    }
}
