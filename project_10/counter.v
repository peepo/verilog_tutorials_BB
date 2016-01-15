module counter #(parameter CTR_LEN = 27)(
    input clk,
    input rst,
    output reg [7:0] value
  );
   
  reg[CTR_LEN-1:0] ctr_d, ctr_q;
   
  always @(ctr_q) begin
    ctr_d = ctr_q + 1'b1;
     
    if (ctr_q[CTR_LEN-1])
      value = ~ctr_q[CTR_LEN-2:CTR_LEN-9];
    else
      value = ctr_q[CTR_LEN-2:CTR_LEN-9];
     
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
  end
   
endmodule