module servo (
    input clk,
    input rst,
    input [7:0] position,
    output servo
  );
   
  reg pwm_d, pwm_q;
  reg [19:0] ctr_d, ctr_q;
   
  assign servo = pwm_q;
   
  always @(*) begin
    ctr_d = ctr_q + 1'b1;
     
    if (position + 9'd165 > ctr_q[19:8])
      pwm_d = 1'b1;
    else
      pwm_d = 1'b0;
  end
   
  always @(posedge clk) begin
    if (rst) begin
      ctr_q <= 1'b0;
    end else begin
      ctr_q <= ctr_d;
    end
     
    pwm_q <= pwm_d;
  end
   
endmodule
