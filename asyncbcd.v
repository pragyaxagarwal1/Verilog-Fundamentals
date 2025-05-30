module asyncbcd(rst,clk,q);
input clk,rst;
output reg [3:0] q;
initial q=4'b0000;
always @(posedge clk or posedge rst)
begin
if(rst==0) begin
q=4'b0000;
end
else if(q==4'b1001) begin
q=4'b0000;
end
else
begin
q=q+1;
end
end
endmodule