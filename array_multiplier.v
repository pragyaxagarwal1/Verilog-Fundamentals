module half_adder(a,b,s,c);
input a,b;
output s,c;
assign s=a^b;
assign c=a&b;
endmodule

module full_adder(a,b,cin,s,c);
input a,b,cin;
output s,c;
assign s=a^b^cin;
assign c=(a&b)|(b&cin)|(a&cin);
endmodule

module array_multiplier(A,B,z);
input [3:0] A,B;
output [7:0] z;
wire signed p[3:0][3:0];
wire [10:0] c;
wire [5:0] s;
genvar g;

generate
for(g=0; g<4; g=g+1)begin
and a0(p[g][0], A[g], B[0]);
and a1(p[g][1], A[g], B[1]);
and a2(p[g][2], A[g], B[2]);
and a3(p[g][3], A[g], B[3]);
end
endgenerate
assign z[0]=p[0][0];

//row1
half_adder h0(p[0][1],p[1][0],z[1],c[0]);
half_adder h1(p[1][1],p[2][0],s[0],c[1]);
half_adder h2(p[2][1],p[3][0],s[1],c[2]);

//row2
full_adder f0(p[0][2],c[0],s[0],z[2],c[3]);
full_adder f1(p[1][2],c[1],s[1],s[2],c[4]);
full_adder f2(p[2][2],c[2],p[3][1],s[3],c[5]);

//row3 
full_adder f3(p[0][3],c[3],s[2],z[3],c[6]);
full_adder f4(p[1][3],c[4],s[3],s[4],c[7]);
full_adder f5(p[2][3],c[5],p[3][2],s[5],c[8]);

//row4
half_adder h3(c[6],s[4],z[4],c[9]);
full_adder f6(c[9],c[7],s[5],z[5],c[10]);
full_adder f7(c[10],c[8],p[3][3],z[6],z[7]);

endmodule