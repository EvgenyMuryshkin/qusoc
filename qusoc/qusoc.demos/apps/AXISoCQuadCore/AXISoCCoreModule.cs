using axi.modules;
using QRV32.CPU;
using Quokka.RTL;
using Quokka.RTL.Tools;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AXISoC
{
    public class AXISoCCoreModuleInputs
    {
        public bool iExtReset;
        public AXI4_M2S iProgrammerM2S;
        public AXI4_M2S iCPUM2S;
        public AXI4_S2M iIOInterconnectS2M;
        public AXI4_S2M iCPUS2M;
        public AXI4_M2S iMemoryM2S;
        public AXI4_M2S iIncrementM2S;
        public AXI4_M2S iDecrementM2S;

        public AXISoCCoreModuleInputs()
        {
            iProgrammerM2S = new AXI4_M2S(axiSize.B4);
            iCPUM2S = new AXI4_M2S(axiSize.B4);
            iIOInterconnectS2M = new AXI4_S2M(axiSize.B4);
            iCPUS2M = new AXI4_S2M(axiSize.B4);
            iMemoryM2S = new AXI4_M2S(axiSize.B4);
            iIncrementM2S = new AXI4_M2S(axiSize.B4);
            iDecrementM2S = new AXI4_M2S(axiSize.B4);
        }
    }

    public class AXISoCCoreModule : RTLCombinationalModule<AXISoCCoreModuleInputs>
    {
        internal AXI4RISCVModule CPU0 = new AXI4RISCVModule(CPURegsType.RAM, 0);
        internal AXI4MemoryModule cpu0Memory = new AXI4MemoryModule(axiSize.B4, 0x8000);
        internal AXI4IncrementOnReadCounterModule cpu0AutoIncrementCounter = new AXI4IncrementOnReadCounterModule(axiSize.B4);
        internal AXI4AutoDecrementRegisterModule cpu0AutoDecrementRegister = new AXI4AutoDecrementRegisterModule(axiSize.B4);
        internal AXI4GatewayModule cpu0IOGateway = new AXI4GatewayModule(axiSize.B4);
        //internal AXI4InteconnectModule cpu0Interconnect = new AXI4InteconnectModule(
        //    axiSize.B4,
        //    2,
        //    new List<RangeInfo>()
        //    {
        //        new RangeInfo(0x00000000, 0x00020000),// instructions memory
        //        new RangeInfo(0x10000000, 0x10000000),// auto increment on read
        //        new RangeInfo(0x10000004, 0x10000004),// auto decrement
        //        new RangeInfo(0x80000000, 0xA0000000),// io interconnect
        //    }
        //);

        public void Initialize(uint[] cpu0Instructions)
        {
            Func<uint[], byte[][]> toBytes =
                (instructions) => instructions.Select(i => new RTLBitArray(i)).Select((r) => (byte[])r).ToArray();

            cpu0Memory.Initialize(toBytes(cpu0Instructions));
        }
        public override IEnumerable<IRTLModuleValidator> Validators(IRTLClassFactory classFactory)
            => [classFactory.Create<AXI4InterconnectScheduleValidator>()];

        protected override void OnSchedule(Func<AXISoCCoreModuleInputs> inputsFactory)
        {
            base.OnSchedule(inputsFactory);

            // CPU0
            CPU0.Schedule(() => new()
            {
                S2M = Inputs.iCPUS2M,//cpu0Interconnect.oS2M[1],
                ExtReset = Inputs.iExtReset
            });
            cpu0Memory.Schedule(() => new()
            {
                M2S = Inputs.iMemoryM2S// cpu0Interconnect.oM2S[0]
            });
            cpu0AutoIncrementCounter.Schedule(() => new()
            {
                M2S = Inputs.iIncrementM2S,// cpu0Interconnect.oM2S[1]
            });
            cpu0AutoDecrementRegister.Schedule(() => new()
            {
                M2S = Inputs.iDecrementM2S,// cpu0Interconnect.oM2S[2]
            });
            cpu0IOGateway.Schedule(() => new()
            {
                iM2S = Inputs.iCPUM2S,//cpu0Interconnect.oM2S[3],
                iS2M = Inputs.iIOInterconnectS2M
            });

            //cpu0Interconnect.Schedule(() => new()
            //{
            //    iM2S = [
            //        Inputs.iProgrammerM2S,
            //        CPU0.M2S
            //    ],
            //    iS2M = [
            //        cpu0Memory.S2M,
            //        cpu0AutoIncrementCounter.S2M,
            //        cpu0AutoDecrementRegister.S2M,
            //        cpu0IOGateway.oS2M,
            //    ]
            //});
        }

        //public AXI4_S2M oProgrammerInterconnectS2M => cpu0Interconnect.oS2M[0];
        public AXI4_M2S oIOGatewayM2S => cpu0IOGateway.oM2S;
        public AXI4_S2M oIOGatewayS2M => cpu0IOGateway.oS2M;
        public AXI4_M2S oCPUM2S => CPU0.M2S;
        public AXI4_S2M oMemoryS2M => cpu0Memory.S2M;
        public AXI4_S2M oIncrementS2M => cpu0AutoIncrementCounter.S2M;
        public AXI4_S2M oDecrementS2M => cpu0AutoDecrementRegister.S2M;

    }
}
