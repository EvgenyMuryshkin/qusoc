using Quokka.RTL;

namespace RTL.Modules
{
    public class ConfigParams
    {
        public readonly int inputWidth;
        public readonly int resultWidth;
        public ConfigParams(int width)
        {
            inputWidth = width;
            resultWidth = width + 1;
        }
    }

    public class ConfigModuleInputs
    {
        public ConfigModuleInputs() { }
        public ConfigModuleInputs(ConfigParams p)
        {
            i1 = new RTLBitArray().Resized(p.inputWidth);
            i2 = new RTLBitArray().Resized(p.inputWidth);
        }

        public RTLBitArray i1;
        public RTLBitArray i2;
    }

    public class ConfigModule : RTLCombinationalModule<ConfigModuleInputs>
    {
        private readonly ConfigParams configParams;
        public ConfigModule() { }
        public ConfigModule(ConfigParams p)
        {
            configParams = p;
            InitInputs(new ConfigModuleInputs(p));
        }

        public RTLBitArray oResult => (Inputs.i1 + Inputs.i2)[configParams.resultWidth - 1, 0];
    }

    public class ConfigModule8 : ConfigModule
    {
        public ConfigModule8() : base(new ConfigParams(8)) { }
    }
}

