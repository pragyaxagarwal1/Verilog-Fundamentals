module syncbcd(rst, clk, q);
input rst,clk;
output reg [3:0] q;
initial q=4'b0000;
always @(posedge clk) begin
if(rst==1|q==4'b1001) begin
q=4'b0000;
end
else
begin 
q=q+1;
end
end
endmodule