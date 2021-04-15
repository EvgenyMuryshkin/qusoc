namespace Quokka.RTL.Simulator
{
    public class RTLSimulator<TModule> : RTLInstanceSimulator<TModule>
        where TModule : IRTLCombinationalModule, new()
    {
        public RTLSimulator() : base(new TModule())
        {

        }
    }
     
    public class RTLSimulator<TModule, TInputs> : RTLInstanceSimulator<TModule, TInputs>
        where TModule : IRTLCombinationalModule<TInputs>, new()
        where TInputs : new()
    {
        public RTLSimulator(bool withTestbench = false) : base(new TModule(), withTestbench)
        {

        }
    }
}
