**NOTE:**
Default installation of APIO is using arachne-pnr, which intermittently fails to route project.

In order to build this project, please download latest binaries of nextpnr-ice40 (it was not part of APIO when this demo was prepared) 

```
https://github.com/xobs/toolchain-nextpnr-ice40/releases
```

Archive contains bunch of pythons, nextpnr-ice40.exe and some dlls. Copy exe and dlls to APIO binaries folder 

```
C:\Users\<<account>>\.apio\packages\toolchain-icestorm\bin
```

Project is hardcoded for TinyFPGA BX chip and package. Modify next line in SConstruct for another device

```
nextpnr-ice40 --lp8k --package cm81 --pcf {2} --asc $TARGET {3} --json $SOURCE
```
