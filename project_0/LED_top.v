module LED_top(
	output [7:0]LED
	);
	assign LED[7:1] = 7'b0;
	assign LED[0] = 1'b1;
endmodule
