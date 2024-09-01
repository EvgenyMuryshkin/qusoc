using Quokka.RTL;

namespace RTL.Modules
{
    public class CollectionInitializerModuleInputs
    {
        public bool i1;
        public bool i2;
        public bool i3;
        public byte data;
    }

    public class CollectionInitializerModuleState
    {
        public byte[] state = new byte[4];
    }

    public class CollectionInitializerModule : RTLSynchronousModule<CollectionInitializerModuleInputs, CollectionInitializerModuleState>
    {
        public byte[] oState => State.state;

        protected override void OnStage()
        {
            if (Inputs.i1)
            {
                NextState.state = [0x55, 1, 2, 3];
            }
            else if (Inputs.i2)
            {
                NextState.state = new byte[] { 0xAA, 4, 5, 6 };
            }
            else if (Inputs.i3)
            {
                NextState.state = new byte[] { Inputs.data, 0x80, 0x82, 0x01 };
            }
        }
    }
}

