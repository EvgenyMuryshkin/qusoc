`default_nettype none

module top (
    input wire clk,
    input wire [3:0] btn,
    input wire [1:0] sw,
    output wire [3:0] led,
    output wire ck_io13,
    input wire ck_io12,
    output wire ck_io11,
    output wire ck_io10,
    output wire ck_io26,
    output wire ck_io27,
    output wire ck_io28,
    output wire ck_io29,
    output wire ck_io30,
    output wire ck_io31,
    output wire ck_io32,
    output wire ck_io33,
    output wire ck_io41,    
    output wire ck_io40,    
    output wire ck_io39,    
    input wire ck_io38,    
    output wire ck_io37,
    output wire led4_b,
    output wire led4_g,
    output wire led4_r,
    output wire led5_b,
    output wire led5_g,
    output wire led5_r
);

   wire clk100;
   wire clk90;
   wire clk50;
   wire locked;
   wire clkbfout;

   PLLE2_BASE #(
      .BANDWIDTH("OPTIMIZED"),  // OPTIMIZED, HIGH, LOW
      .CLKFBOUT_MULT(8),        // Multiply value for all CLKOUT, (2-64)
      .CLKFBOUT_PHASE(0.0),     // Phase offset in degrees of CLKFB, (-360.000-360.000).
      .CLKIN1_PERIOD(8),      // Input clock period in ns to ps resolution (i.e. 33.333 is 30 MHz).
      // CLKOUT0_DIVIDE - CLKOUT5_DIVIDE: Divide amount for each CLKOUT (1-128)
      .CLKOUT0_DIVIDE(10),
      .CLKOUT1_DIVIDE(20),
      .CLKOUT2_DIVIDE(11),
      .CLKOUT3_DIVIDE(1),
      .CLKOUT4_DIVIDE(1),
      .CLKOUT5_DIVIDE(1),
      // CLKOUT0_DUTY_CYCLE - CLKOUT5_DUTY_CYCLE: Duty cycle for each CLKOUT (0.001-0.999).
      .CLKOUT0_DUTY_CYCLE(0.5),
      .CLKOUT1_DUTY_CYCLE(0.5),
      .CLKOUT2_DUTY_CYCLE(0.5),
      .CLKOUT3_DUTY_CYCLE(0.5),
      .CLKOUT4_DUTY_CYCLE(0.5),
      .CLKOUT5_DUTY_CYCLE(0.5),
      // CLKOUT0_PHASE - CLKOUT5_PHASE: Phase offset for each CLKOUT (-360.000-360.000).
      .CLKOUT0_PHASE(0.0),
      .CLKOUT1_PHASE(0.0),
      .CLKOUT2_PHASE(0.0),
      .CLKOUT3_PHASE(0.0),
      .CLKOUT4_PHASE(0.0),
      .CLKOUT5_PHASE(0.0),
      .DIVCLK_DIVIDE(1),        // Master division value, (1-56)
      .REF_JITTER1(0.0),        // Reference input jitter in UI, (0.000-0.999).
      .STARTUP_WAIT("FALSE")    // Delay DONE until PLL Locks, ("TRUE"/"FALSE")
   )
   PLLE2_BASE_inst (
      // Clock Outputs: 1-bit (each) output: User configurable clock outputs
      .CLKOUT0(clk100),   // 1-bit output: CLKOUT0
      .CLKOUT1(clk50),   // 1-bit output: CLKOUT1
      .CLKOUT2(clk90),   // 1-bit output: CLKOUT2
      //.CLKOUT3(CLKOUT3),   // 1-bit output: CLKOUT3
      //.CLKOUT4(CLKOUT4),   // 1-bit output: CLKOUT4
      //.CLKOUT5(CLKOUT5),   // 1-bit output: CLKOUT5
      // Feedback Clocks: 1-bit (each) output: Clock feedback ports
      .CLKFBOUT(clkbfout), // 1-bit output: Feedback clock
      .LOCKED(locked),     // 1-bit output: LOCK
      .CLKIN1(clk),     // 1-bit input: Input clock
      // Control Ports: 1-bit (each) input: PLL control ports
      .PWRDWN(0),     // 1-bit input: Power-down
      .RST(0),           // 1-bit input: Reset
      // Feedback Clocks: 1-bit (each) input: Clock feedback ports
      .CLKFBIN(clkbfout)    // 1-bit input: Feedback clock
   );

   // End of PLLE2_BASE_inst instantiation
   
  // issue with BRAM initialization, keep CPU in reset for some number of clocks. 127 seems to be ok, 63 does not route
  reg [5:0] resetCounter = 0;
  wire isRunning = resetCounter == 63;
  always @(posedge clk100) begin
    if (resetCounter < 63) begin
      resetCounter <= resetCounter + 1;
    end
  end



  // AXISoCBlinker module connected to LED
  wire [31:0] reg0;
  wire [31:0] reg1;
  wire [31:0] reg2;
  wire [31:0] reg3;

  assign led[0] = reg0[19];
  assign led[1] = reg1[0];
  assign led[2] = reg2[0];
  assign led[3] = reg3[0];
  
  assign ck_io41 = reg3[0];
  assign ck_io40 = reg2[0];

  assign led4_b = 1;
  assign led4_g = 0;
  assign led4_r = 0;
  assign led5_b = 0;
  assign led5_g = 0;
  assign led5_r = 0;

  AXISoCQuadCoreModule_TopLevel AXISoCQuadCoreModule_TopLevel
  (
    .Clock (clk50),
    .Reset (!isRunning || !locked || btn[0]),
    .iSwitch0(sw[0]),
    .iSwitch1(sw[1]),
    .iButton0(btn[0]),
    .iButton1(btn[1]),
    .iButton2(btn[2]),
    .iButton3(btn[3]),
    .oReg0 (reg0),
    .oReg1 (reg1),
    .oReg2 (reg2),
    .oReg3 (reg3),
    .oTX(ck_io13),
    .iRX(ck_io12),
    .oProgrammerTX(ck_io39),
    .iProgrammerRX(ck_io38),
    .oCE(ck_io11),
    .oRXValid(ck_io10),
    .oPWM0(ck_io26),
    .oPWM1(ck_io27),
    .oPWM2(ck_io28),
    .oPWM3(ck_io29),
    .oPWM4(ck_io30),
    .oPWM5(ck_io31),
    .oPWM6(ck_io32),
    .oPWM7(ck_io33),
    .oWS2812(ck_io37)
  );
endmodule
