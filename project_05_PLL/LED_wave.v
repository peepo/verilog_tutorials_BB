module led_wave #(
    parameter CTR_LEN = 25
  )(
    input wire clk,
    input wire rst,
    output reg[7:0] led
  );
   
  reg[CTR_LEN-1:0] ctr_d, ctr_q = {CTR_LEN{1'b0}};
  reg[3:0] i;
  reg[7:0] acmp;
  reg[8:0] result;
   
  always @(ctr_q) begin
    ctr_d = ctr_q + 1'b1;
     
    for (i = 0; i < 8; i = i + 1) begin
      result = ctr_q[CTR_LEN-1:CTR_LEN-9] + i * 8'd64;
       
      if (result[8])
        acmp = ~result[7:0];
      else
        acmp = result[7:0];
       
      led[i] = acmp > ctr_q[7:0];
    end
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= {CTR_LEN{1'b0}};
    end else begin
      ctr_q <= ctr_d;
    end
  end
   
endmodule
