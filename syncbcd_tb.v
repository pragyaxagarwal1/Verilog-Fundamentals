module syncbcd_tb;
reg clk,rst;
wire [3:0] q;
syncbcd uut(.clk(clk), .rst(rst), .q(q));
always #5 clk=~clk;
initial begin
clk=0;
rst =1;
#20; rst=0;
#100;
end
endmodule
