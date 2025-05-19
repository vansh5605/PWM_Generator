 module pwm(
input clk, reset, // Clock and Reset inputs
input [7:0] PWM_ontime, // 8-bit PWM input
output reg PWM_out // 1-bit PWM output
);
reg [7:0] counter_out; // 8-bit counter
always @(posedge clk or posedge reset) begin
if (reset)
counter_out <= 8'b0;
else
counter_out <= counter_out + 1;
end
always @(posedge clk) begin
if (PWM_ontime > counter_out)
PWM_out <= 1;
else
PWM_out <= 0;

12

end
endmodule
