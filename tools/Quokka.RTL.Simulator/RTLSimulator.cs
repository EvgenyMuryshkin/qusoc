namespace Quokka.RTL.Simulator
{
    public class RTLSimulator<TModule> : RTLInstanceSimulator<TModule>
        where TModule : IRTLCombinationalModule, new()
    {
        public RTLSimulator(string vcdPath = null, RTLModuleSnapshotConfig config = null) : base(new TModule(), vcdPath, config)
        {

        }
    }
     
    public class RTLSimulator<TModule, TInputs> : RTLInstanceSimulator<TModule, TInputs>
        where TModule : IRTLCombinationalModule<TInputs>, new()
        where TInputs : new()
    {
        public RTLSimulator(
            string vcdPath = null, RTLModuleSnapshotConfig config = null,
            bool withTestbench = false) : base(new TModule(), vcdPath, config, withTestbench)
        {

        }
    }
}
