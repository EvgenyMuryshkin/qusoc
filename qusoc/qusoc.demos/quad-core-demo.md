# AXI SoC demo of quad-core riscv cpu

## Top-level interconnect configuration
https://github.com/EvgenyMuryshkin/qusoc/blob/master/qusoc/qusoc.demos/apps/AXISoC/AXISoCQuadCoreModule.cs

## Setup
CPUs, switches, and LEDs are sitting on the same interconnect.

## Firmware
https://github.com/EvgenyMuryshkin/qusoc/blob/master/qusoc/qusoc.demos/asm/axisocquadcore.S

4 RISC-V cores each driving corresponding LED.

LED0: blinker

LED1: slow/fast blinker based on switch 0

LED2: follow switch 1

LED3: follow button 3
