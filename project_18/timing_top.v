module timing_top(
    // 12MHz clock input
    input clk,
    input [8:0] a,
    input [8:0] b,
    output [35:0] c
    );

wire rst = 1'b0;

blinker awesome_blinker (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .c(c)
);

endmodule
