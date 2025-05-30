module LFSR8_11_tb;
reg clk;
wire [7:0] LFSR;
LFSR8_11 uut(.clk(clk), .LFSR(LFSR));
always #5 clk=~clk;
initial begin
clk=0;
$monitor("Time=%0t|LFSR=%b",$time,LFSR);
#100;
$finish;
end
endmodule