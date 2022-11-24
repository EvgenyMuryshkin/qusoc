﻿using Quokka.RTL;
using System.Linq;

namespace RTL.Modules
{
    public class TStruct
    {
        public TStruct(int size)
        {
            a = new RTLBitArray().Resized(size);
            b = new RTLBitArray().Resized(size);
        }

        [MemberIndex(0)]
        public RTLBitArray a;

        [MemberIndex(1)]
        public RTLBitArray b;
    }

    public class TStruct4 : TStruct
    {
        public TStruct4() : base(4) { }
    }

    public class TStruct12 : TStruct
    {
        public TStruct12() : base(12) { }
    }

    public class StructsCombinationalIteratorModuleInputs
    {
        public StructsCombinationalIteratorModuleInputs()
        {
            i1 = new TStruct4();
            i2 = new TStruct4();
            addr = new RTLBitArray().Resized(2);
        }

        public TStruct4 i1;
        public TStruct4 i2;
        public bool store;
        public RTLBitArray addr;
        public sbyte s1;
        public sbyte s2;
    }

    public class StructsCombinationalIteratorModuleState
    {
        public StructsCombinationalIteratorModuleState()
        {
            i1 = Enumerable.Range(0, 4).Select(_ => new TStruct4()).ToArray();
            i2 = Enumerable.Range(0, 4).Select(_ => new TStruct4()).ToArray();
            o = Enumerable.Range(0, 4).Select(_ => new TStruct12()).ToArray();
            c = Enumerable.Range(0, 4).Select(_ => new TStruct4()).ToArray();
            f = Enumerable.Range(0, 4).Select(_ => new TStruct4()).ToArray();
        }

        public TStruct4[] i1;
        public TStruct4[] i2;
        public TStruct12[] o;
        public TStruct4[] c;
        public TStruct4[] f;
    }

    public class StructsCombinationalIteratorModule : RTLSynchronousModule<StructsCombinationalIteratorModuleInputs, StructsCombinationalIteratorModuleState>
    {
        public short sOut => (short)(Inputs.s1 * Inputs.s2);
        public sbyte sByte => (sbyte)(Inputs.s1 * Inputs.s2);
        public TStruct12[] sStruct => State.o;
        public TStruct4[] cStruct => State.c;
        public TStruct4[] fStruct => State.f;

        protected override void OnStage()
        {
            if (Inputs.store)
            {
                NextState.i1[Inputs.addr] = Inputs.i1;
                NextState.i2[Inputs.addr] = Inputs.i2;
            }
            else
            {
                for (var i = 0; i < 4; i++)
                {
                    NextState.o[i].a = (State.i1[i].a.Signed().Resized(6) * State.i2[i].a.Signed().Resized(6)).Unsigned();
                    NextState.o[i].b = (State.i1[i].b.Unsigned().Resized(6) * State.i2[i].b.Unsigned().Resized(6)).Unsigned();
                }
            }

            for (var i = 0; i < 4; i++)
            {
                NextState.c[i].a = Inputs.addr == 0 ? new RTLBitArray(10).Resized(4) : Inputs.i1.a;
                NextState.c[i].b = Inputs.addr != 0 ? new RTLBitArray(11).Resized(4) : Inputs.i1.b;
            }

            for (var i = 0; i < 4; i++)
            {
                NextState.f[i].a = Inputs.store ? Inputs.i1.b : Inputs.i1.a;
                NextState.f[i].b = !Inputs.store ? Inputs.i1.a : Inputs.i1.b;
            }
        }
    }
}