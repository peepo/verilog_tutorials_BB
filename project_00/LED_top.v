module LED_top(
	output out,
	output [7:0]LED
	);
	assign LED[7:1] = 7'b0;
	assign LED[0] = 1'b01;
	assign out = 1'b01;
endmodule
