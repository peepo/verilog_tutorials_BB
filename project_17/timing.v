
module blinker(
	input clk,
	input rst,
	input [8:0] a,
	input [8:0] b,
	output [35:0] c
  );

	reg [8:0] a_d, a_q, b_d, b_q;
	reg [35:0] c_d, c_q;

	assign c = c_q;
   
  	always @(counter_q) begin
        	a_d = a;
        	b_d = b;
        	c_d = a_q * (a_q * a_q) * (a_q * a_q) * (b_q * b_q) * (b_q * b_q);
	end
   
	always @(posedge clk) begin
	        a_q <= a_d;
	        b_q <= b_d;
	        c_q <= c_d;
	end
   
endmodule
