# QuSoC - Low-level RTL design using C# and Quokka FPGA toolkit.

This repository contains 
* Basic CLI for running C# => HDL (Verilog or VHDL) translation
* Test examples for toolkit functionality
* Basic RTL Simulator
* QRV32 - RISCV synthesizable core
* QuSoC - initial implementation for SoC design core
* **TinyFPGA reference project with blinking LED, running off RISCV CPU and sample firmware**

## Setup 

* Install latest .NET Core. Please refer to framework installation guide for Linux (https://docs.microsoft.com/en-us/dotnet/core/install/linux)
* Install docker (https://www.docker.com/)

### QuSoC modules and demo projects

* Get code from github repository 
```
git clone https://github.com/EvgenyMuryshkin/qusoc.git
cd ./qusoc
```
* Run RISC-V toolchain, it is available as docker image.
```
./riscv-pull.cmd
```
* Launch RISC-V toolchain image
```
./riscv-launch.cmd
```

* Open qusoc.demos location in command line
```
cd qusoc/qusoc/qusoc.demos
```

* Run CLI in watch mode
```
./verilog.cmd
```

* Or run CLI in watch mode for **TinyFPGA board**
```
./tinyfpga.cmd
```
TinyFPGA project is prebuilt, so you can run it straight from Atom and APIO (Please refer to TinyFPGA installation guide for all required tools https://tinyfpga.com/bx/guide.html)


Output should look something like next:
```
Quokka.FPGA version: 0.1.0.90
Quokka.RTL version: 0.1.0.71
Cleaning up ...
Checking for config file at C:\code\qusoc\qusoc\qusoc.demos\rtl.verilog.json
Watching C:\code\qusoc\qusoc\qusoc.demos\qusoc.demos.csproj
...
Found SoC Type: Arrays.SOC
Found SoC Type: Fibonacci.SOC
Found SoC Type: Increment.SOC
Found SoC Type: MemBlock.SOC
Found SoC Type: Recursion.SOC
Found CS source: C:\code\qusoc\qusoc\qusoc.demos\apps\Recursion\source\Recursion.cs
Found CS source: C:\code\qusoc\qusoc\qusoc.demos\apps\MemBlock\source\MemBlock.cs
Found CS source: C:\code\qusoc\qusoc\qusoc.demos\apps\Increment\source\Increment.cs
Found CS source: C:\code\qusoc\qusoc\qusoc.demos\apps\Fibonacci\source\Fibonacci.cs
Found CS source: C:\code\qusoc\qusoc\qusoc.demos\apps\Arrays\source\Arrays.cs
Transformation completed: Recursion
Transformation completed: MemBlock
Transformation completed: Increment
Transformation completed: Fibonacci
Transformation completed: BlinkerSim
Transformation completed: BlinkerInf
Transformation completed: Arrays
...
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CounterModule.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CPU.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CPU_RISCVModule_ALU.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CPU_RISCVModule_CMP.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CPU_RISCVModule_ID.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CPU_RISCVModule_Regs.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_CPU_State_CSR.hex
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_InstructionsRAM.v
Generated file: C:\code\qusoc\qusoc\qusoc.hdl\verilog\generated\Increment\Increment_TopLevel_Increment_InstructionsRAM_State_BlockRAM.hex
=== Directory transformation completed
```

Now you should have RTL files in **qusoc\qusoc\qusoc.hdl\verilog** location

## Feedback
Project is in active development, please contact me if you get any issues of have feedback.

Twitter: https://twitter.com/ITMayWorkDev

LinkedIn: https://www.linkedin.com/in/evgenymuryshkin/

## Other resources and parts of Quokka Toolkit
https://github.com/EvgenyMuryshkin/Quokka.RTL

https://github.com/EvgenyMuryshkin/Quokka.RISCV.Docker

https://github.com/EvgenyMuryshkin/Quokka.RISCV.Server

https://github.com/EvgenyMuryshkin/Quokka.RISCV.CS2CPP

https://github.com/EvgenyMuryshkin/QuokkaEvaluation


