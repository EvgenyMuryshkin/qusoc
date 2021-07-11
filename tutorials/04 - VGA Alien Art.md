# Inspiration
https://hackaday.com/2021/04/13/alien-art-drawn-with-surprisingly-simple-math/

Demo

[![Live demo](https://img.youtube.com/vi/bCANecq-3nY/0.jpg)](https://www.youtube.com/watch?v=bCANecq-3nY)

# Prerequisites

Sample is configured as Visual Studio solution, but runs well from command line and in non-Windows environment

## Hardware

* VGA compatible screen with 800x600x60 mode support
* Breadboard, wires, three 300 Ohm resistors to connect FPGA to VGA 
* FPGA board, capable of 40Mhz clock. Example is for [Digilent Arty Z7-20](https://reference.digilentinc.com/programmable-logic/arty-z7/reference-manual)
Some ajustments will be required for other boards\vendors

## Software

* Visual Studio 2019 (any edition)
* .NET Core 3 (included in VS installation, but required for non-Windows folks)
* [Quokka FPGA Extension for Visual Studio](https://marketplace.visualstudio.com/items?itemName=EvgenyMuryshkin.qe2019)
* Qusoc repository
* Vivado 2020.2 (or vendor EDA for other FPGA boards)
* Add Vivado location (e.g. *C:\Xilinx\Vivado\2020.2\bin*) to PATH environment variable


# Running the sample for Arty-Z7

* Connect FPGA board to display
* Open Visual Studio
* Add Quokka FPGA toolbar to IDE

![toolbar](https://github.com/EvgenyMuryshkin/qusoc/raw/master/tutorials/img/04%20-%20toolbar.png)
* Open qusoc.sln from repository
* Run **VGAAlienArtModule_RunAll** from *generic* actions
 
![run all](https://github.com/EvgenyMuryshkin/qusoc/raw/master/tutorials/img/04%20-%20Run%20All.png)

After 5 minutes, if everything goes well, bitstream will be generated and programed into FPGA board.

# For other boards
* Open rtl.extensions folder in terminal
* Run *dotnet run -- VGAModuleExtension_Translate.VGAAlienArtModule*. 
* This produce a bunch of verilog code. Use that code with toolchain of your choice to run sample on your board
