module iCE40_top(
    // 12MHz clock input
//    input clk,
    // Input from buttons (active low)
//    input [3:0]sw_n,
    input ext_button,
    // Outputs to the 8 onboard LEDs
    output[7:0]LED,
    );

    assign LED[6:0] = 7'b0;
    assign LED[7] = ext_button;

endmodule
