module seq_mealy_tb;
reg clk, rst, x;
wire y;
seq_mealy uut(.clk(clk), .rst(rt), .x(x), .y(y));
reg [19:0] data;
integer k;
initial begin
data=20'b0011001010001011010;
clk=0;
k=0;
rst=1;
#60; rst=0;
#370;
end
always@(posedge clk) begin
x=data>>k;
k=k+1;
end
always #20 clk=~clk;
endmodule