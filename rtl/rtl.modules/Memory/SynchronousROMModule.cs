using System;
using System.Collections.Generic;
using System.Linq;
using Quokka.RTL;

namespace RTL.Modules
{
    public class SynchronousROMModuleInputs
    {
        public byte Addr1;
        public byte Addr2;
        public byte REAddr;
        public bool RE;
    }

    public class SynchronousROMModuleState
    {
        public byte Data1;
        public byte Data2;
        public byte REData;
        public byte[] Buff;
    }

    public class SynchronousROMModule : RTLSynchronousModule<SynchronousROMModuleInputs, SynchronousROMModuleState>
    {
        protected override void OnSetup()
        {
            base.OnSetup();
            State.Buff = GetBuffer();
        }

        public static byte[] GetBuffer()
        {
            var rnd = new Random(42);

            return Enumerable
                .Range(0, 256)
                .Select(i => (byte)i)
                .OrderBy(r => rnd.Next())
                .ToArray();
        }

        public byte Data1 => State.Data1;
        public byte Data2 => State.Data2;
        public byte REData => State.REData;

        protected override void OnStage()
        {
            NextState.Data1 = State.Buff[Inputs.Addr1];
            NextState.Data2 = State.Buff[Inputs.Addr2];

            if (Inputs.RE)
                NextState.REData = State.Buff[Inputs.REAddr];
        }
    }
}
