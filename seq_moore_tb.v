module seq_moore_tb;
reg clk, rst, x;
wire y;
seq_moore uut(.clk(clk), .rst(rst), .x(x), .y(y));
reg [15:0] data;
integer k;
initial begin
data=16'b1010010111010101;
clk=0;k=0;
rst=1;
#60; rst=0;
#500;
$stop;
end
always @(posedge clk) begin
x=data>>k;
k=k+1;
end
always #20 clk=~clk;
endmodule
