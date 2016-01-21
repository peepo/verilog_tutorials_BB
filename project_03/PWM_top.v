module ice40_top(
    // 12MHz clock input
    input clk,
    // Input from buttons (active low)
//    input [3:0]sw_n,
    // Outputs to the 8 onboard LEDs
    output[7:0]LED
    );

wire rst = 1'b0;//~sw_n[3]; // make reset active high

  genvar i;
  generate
    for (i = 0; i < 8; i=i+1) begin: pwm_gen_loop
    pwm #(.CTR_LEN(3)) pwm (
      .rst(rst),
      .clk(clk),
      .compare(i),
      .pwm(LED[i])
    );
    end
  endgenerate


endmodule
