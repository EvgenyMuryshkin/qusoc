using Quokka.RTL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RTL.Modules
{
    public class TInputsModuleModule<T> : RTLCombinationalModule<T> where T : new()
    {
    }


    public class NativeInputsModule : TInputsModuleModule<NativeInputs>
    {
    }

    public class NativeArrayInputsModule : TInputsModuleModule<NativeArrayInputs>
    {
    }

    public class RTLBitArrayInputsModule : TInputsModuleModule<RTLBitArrayInputs>
    {
    }

    public class RTLBitArrayArrayInputsModule : TInputsModuleModule<RTLBitArrayArrayInputs>
    {
    }

    public class ClassInputsModule : TInputsModuleModule<ClassInputs>
    {
    }

    public class NativeTupleInputsModule : TInputsModuleModule<NativeTupleInputs>
    {
    }

    public class RTLBitArrayTupleInputsModule : TInputsModuleModule<RTLBitArrayTupleInputs>
    {
    }

    public class ClassTupleInputsModule : TInputsModuleModule<ClassTupleInputs>
    {
    }

    public class ClassArrayInputsModule : TInputsModuleModule<ClassArrayInputs>
    {
    }
}
