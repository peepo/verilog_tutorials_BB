module mojo_top(
    // 12MHz clock input
    input clk,
    // Input from buttons (active low)
//    input [3:0]sw_n,
    // Outputs to the 8 onboard LEDs
    output[7:0]LED,
    );

wire rst = 1'b0;//~sw_n[3]; // make reset active high



  assign LED = {8{pwm}};
   
  wire [7:0] compare;
  wire pwm;
   
  counter fancyCounter (
  .rst(rst),
  .clk(clk),
  .value(compare)
  );
   
  pwm #(.CTR_LEN(8)) fancyPWM (
    .rst(rst),
    .clk(clk),
    .compare(compare),
    .pwm(pwm)
  );
   


endmodule
