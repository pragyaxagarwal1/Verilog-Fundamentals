module cld_tb;
reg [3:0] A,B;
reg Cin;
wire Cout;
wire [3:0] S;
cld uut(.A(A), .B(B), .Cin(Cin), .S(S), .Cout(Cout));
initial begin
A = 4'b0001; B = 4'b0010; Cin = 1'b0; #10;
A = 4'b0101; B = 4'b1010; Cin = 1'b1; #10;
A = 4'b1111; B = 4'b0000; Cin = 1'b0; #10;
A = 4'b1001; B = 4'b0110; Cin = 1'b1; #10;
A = 4'b0011; B = 4'b1100; Cin = 1'b0; #10;
A = 4'b0111; B = 4'b1000; Cin = 1'b1; #10;
A = 4'b1010; B = 4'b0101; Cin = 1'b0; #10;
end
endmodule

