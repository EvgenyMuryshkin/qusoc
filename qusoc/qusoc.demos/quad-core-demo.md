# AXI SoC demo of quad-core riscv cpu

## DEMO
https://twitter.com/ITMayWorkDev/status/1788108065553985816

## Top-level interconnect configuration
https://github.com/EvgenyMuryshkin/qusoc/blob/master/qusoc/qusoc.demos/apps/AXISoC/AXISoCQuadCoreModule.cs

## Architecture

CPUs, switches, and LEDs are sitting on the same interconnect.

CPUs share the same memory and firmware.

On load, they read the value from AXI4IncrementOnReadCounter.

Each CPU will get the unique number and then dispatch it to the corresponding handler. Each handler will read and write to interconnect according to address setup.

## Hardware
Project setup for ARTY-Z7-20 FPGA development board.

Vivado project location: C:\code\qusoc\qusoc\qusoc.hdl\Verilog\generated\Vivado\test.xpr

**NOTE:** repository must be cloned to C:\code\qusoc folder as file locations are rooted in project file

```
cd c:\
mkdir code
cd code
git clone https://github.com/EvgenyMuryshkin/qusoc.git
```

## Firmware
https://github.com/EvgenyMuryshkin/qusoc/blob/master/qusoc/qusoc.demos/asm/axisocquadcore.S

4 RISC-V cores each driving corresponding LED.

LED0: blinker

LED1: slow/fast blinker based on switch 0

LED2: follow switch 1

LED3: follow button 3
