module seq_moore(input clk, input rst, input x, output reg y);
reg [1:0] cst, nst;
parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
always @(cst or x) begin
case(cst)
s0:begin
y=0;
if(x) begin
nst=s1;
end 
else
begin
nst=cst;
end
end
s1:begin
y=0;
if(x==0) begin
nst=s2;
end 
else
begin
nst=cst;
end
end
s2:begin
y=0;
if(x) begin
nst=s3;
end 
else
begin
nst=s0;
end
end
s3:begin
y=1;
if(x) begin
nst=s1;
end 
else
begin
nst=s2;
end
end
default: nst=s0;
endcase
end
always@(posedge clk) begin
if(rst)
cst<=s0;
else
cst<=nst;
end
endmodule
