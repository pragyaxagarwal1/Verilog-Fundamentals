module seq_mealy(input x,input clk, input rst, output reg y);
reg [1:0] cst, nst;
parameter s0=2'b00, s1=2'b01, s2=2'b10;
always @(cst or x)
begin
case(cst)
s0: begin
if (x) begin
nst=s1;
y=0;
end
else begin
nst=cst;
y=0;
end
end
s1: begin
if (x==0) begin
nst=s2;
y=0;
end
else begin
nst=cst;
y=0;
end
end
s2: begin
if (x) begin
nst=s1;
y=1;
end
else begin
nst=s0;
y=0;
end
end
default nst=s0;
endcase 
end
always @(posedge clk) begin
if(rst)begin
cst<=s0;
end
else begin
cst<=nst;
end
end
endmodule


