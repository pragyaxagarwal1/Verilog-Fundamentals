module asyncbinary(rst, clk, q);
input rst,clk;
output reg [3:0] q;
initial q=4'b0000;
always @(posedge clk or posedge rst) begin
if(rst==0) begin
q=4'b0000;
end 
else begin
q=q+1;
end
end endmodule 