using Quokka.RTL;

namespace fir.modules
{
    public class t_iq
    {
        public t_iq(int size)
        {
            i = new RTLBitArray().Resized(size);
            q = new RTLBitArray().Resized(size);
        }

        [MemberIndex(0)]
        public RTLBitArray i;

        [MemberIndex(1)]
        public RTLBitArray q;
    }

    public class t_iq16 : t_iq
    {
        public t_iq16() : base(16) { }
    }

    public class t_iq7 : t_iq
    {
        public t_iq7() : base(7) { }
    }

    public class t_iq18 : t_iq
    {
        public t_iq18() : base(18) { }
    }

    public class t_iq24 : t_iq
    {
        public t_iq24() : base(24) { }
    }

    public class t_iq25 : t_iq
    {
        public t_iq25() : base(25) { }
    }

    public class t_iq30 : t_iq
    {
        public t_iq30() : base(30) { }
    }
    public class t_iq43 : t_iq
    {
        public t_iq43() : base(43) { }
    }

    public class t_iq48 : t_iq
    {
        public t_iq48() : base(48) { }
    }
}
