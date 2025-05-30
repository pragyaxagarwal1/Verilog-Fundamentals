module asyncbcd_tb;
reg clk,rst;
wire [3:0] q;
asyncbcd uut(.clk(clk), .rst(rst), .q(q));
always #5 clk=~clk;
initial begin
clk=0;
rst=1;
#10; rst=0;
#100; rst=1;
#10;
rst=0;
#20;
end
endmodule