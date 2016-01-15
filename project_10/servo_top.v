module servo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
//    input [3:0]sw_n,
    // pwm driver for servo
    output servo
  );
   
  wire rst = 1'b0;//~sw_n[3]; // make reset active high
   
  wire [7:0] servo_position;
  
wire clk_50;

//https://github.com/SubProto/icestick-vga-test/blob/master/vga.v
  SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                  .PLLOUT_SELECT("GENCLK"),
                  .DIVR(4'b0000),
                  .DIVF(7'b1000010), //50Mhz
                  .DIVQ(3'b100),  //50Mhz

                  .FILTER_RANGE(3'b001),  // wfm without PLL is broken
                 ) uut (
                         .REFERENCECLK(clk),
                         .PLLOUTCORE(clk_50),
 //                        .LOCK(P16),
                         .RESETB(1'b1),
                         .BYPASS(1'b0)
                        );
   
  counter #(.CTR_LEN(28)) servoCounter (
    .clk(clk_50),
    .rst(rst),
    .value(servo_position)
  );
   
  servo myServoController (
    .clk(clk_50),
    .rst(rst),
    .position(servo_position),
    .servo(servo)
  );
   
endmodule
