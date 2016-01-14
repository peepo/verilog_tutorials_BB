module iCE40_top(
    // 12MHz clock input
    input clk,
    // Input from buttons (active low)
//    input [3:0]sw_n,
    // Outputs to the 8 onboard LEDs
    output[7:0]LED,
    );

wire rst = 1'b0;//~sw_n[3]; // make reset active high

wire clk_25;

//https://github.com/SubProto/icestick-vga-test/blob/master/vga.v
  SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                  .PLLOUT_SELECT("GENCLK"),
                  .DIVR(4'b0000),
//                  .DIVF(7'b1000010), //25Mhz
                  .DIVF(7'b0111111),  // 48/96MHz
//                  .DIVQ(3'b101),  //25Mhz
//                  .DIVQ(3'b100),  //48Mhz
                  .DIVQ(3'b011),  //96Mhz

                  .FILTER_RANGE(3'b001),  // wfm without PLL is broken
                 ) uut (
                         .REFERENCECLK(clk),
                         .PLLOUTCORE(clk_25),
 //                        .LOCK(P16),
                         .RESETB(1'b1),
                         .BYPASS(1'b0)
                        );

led_wave #(.CTR_LEN(25)) wave(
    .rst(rst),
    .clk(clk_25),
    .led(LED)
  );  


endmodule
