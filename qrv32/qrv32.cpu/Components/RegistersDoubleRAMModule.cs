using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Text;

namespace QRV32.CPU
{
    public class RegistersDoubleRAMModuleState : RegistersModuleState
    {
        public uint RS1;
        public uint RS2;
        public bool Ready;
        public uint[] x2 { get; set; } = new uint[32];

    }

    public class RegistersDoubleRAMModule : RegistersModule<RegistersDoubleRAMModuleState>
    {
        public override RTLBitArray RS1 => State.RS1;
        public override RTLBitArray RS2 => State.RS2;
        public override bool Ready => State.Ready;

        protected override void OnStage()
        {
            var we = Inputs.WE && Inputs.RD != 0;

            if (we)
            {
                NextState.x[Inputs.RD] = Inputs.WriteData;
                NextState.x2[Inputs.RD] = Inputs.WriteData;
            }

            NextState.RS1 = State.x[Inputs.RS1Addr];
            NextState.RS2 = State.x2[Inputs.RS2Addr];
            NextState.Ready = Inputs.Read;
        }
    }
}
