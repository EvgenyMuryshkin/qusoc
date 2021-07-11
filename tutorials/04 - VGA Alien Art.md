# Inspiration
https://hackaday.com/2021/04/13/alien-art-drawn-with-surprisingly-simple-math/

# Prerequisites

## Hardware

* VGA compatible screen with 800x600x60 mode support
* Breadboard, wires, three 300Ohm resistors to connect FPGA to VGA 
* FPGA board. Smaple is configured to run in [Digilent Arty Z7-20](https://reference.digilentinc.com/programmable-logic/arty-z7/reference-manual)
Some ajustments will be required for other boards\vendors

## Software
Windows users are in luck, just follow the steps. Rest should adapt as we go. 
Sample is configured as Visual Studio solution, but runs well from command line and in non-Windows environment

* Visual Studio 2019 (any edition)
* .NET Core 3 (included in VS installation, but required for non-Windows folks)
* [Quokka FPGA Extension for Visual Studio](https://marketplace.visualstudio.com/items?itemName=EvgenyMuryshkin.qe2019)
* Qusoc repository
* Vivado 2020.2 (verndor EDA for other FPGA boards)

# Running the sample

* Connect FPGA board to display
* Open Visual Studio
* Open qusoc.sln from repository
* Press 
