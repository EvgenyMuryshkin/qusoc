`default_nettype none
// look in pins.pcf for all the pin names on the TinyFPGA BX board
module top (
    input CLK,    // 16MHz clock
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);
  // drive USB pull-up resistor to '0' to disable USB
  assign USBPU = 0;

  // issue with BRAM initialization, keep CPU in reset for some number of clocks. 127 seems to be ok, 63 does not route
  reg [5:0] resetCounter = 0;
  wire isRunning = resetCounter == 63;
  always @(posedge CLK) begin
    if (resetCounter < 63) begin
      resetCounter <= resetCounter + 1;
    end
  end

  // QuSoC increment module connected to LED
  wire [31:0] counter;
  assign LED = counter[18];
  Increment_TopLevel_TopLevel Increment_TopLevel_TopLevel
  (
    .Clock (CLK),
    .Reset (!isRunning),
    .Counter (counter)
  );
endmodule
