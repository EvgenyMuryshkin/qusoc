Setup Dev Environment

* Install .NET Core SDK from https://dotnet.microsoft.com/ for your OS
* Clone QuokkaEvaluation repository
* Install Visual Studio or Visual Studio Code
* Open solution QuokkaEvaluation.RTL.sln in VS or QuokkaEvaluation folder in VSCode.

RTL folder contains examples and test cases for RTL module demos.
RTL.Modules - modules source code
RTL.Tests - test cases
RTL.HDL - generated HDL, Quartus projects, memory block templates

Run rtl/rtl.modules/verilog.cmd or rtl/rtl.modules/vhdl.cmd

output should look like next:
```
Transforming C:\code\qusoc\rtl\rtl.modules
Templates: C:\code\qusoc\rtl\rtl.hdl\templates
Vendor: intel
Device: generic
HDL: Verilog
Transformation completed: BitArrayModule
Transformation completed: CompositionModule
Transformation completed: CounterModule
Transformation completed: EmitterModule
Transformation completed: FullAdderModule
Transformation completed: AndGateModule
Transformation completed: NotGateModule
Transformation completed: OrGateModule
Transformation completed: XorGateModule
Transformation completed: CombinationalROMModule
Transformation completed: LogicRAMModule
Transformation completed: SDP_RF_RAMModule
Transformation completed: SDP_WF_RAMModule
Transformation completed: SynchronousROMModule
Transformation completed: ReceiverModule
Transformation completed: TransmitterModule
=== Directory transformation completed
```

Congratulations! 
All configured and ready to work.

