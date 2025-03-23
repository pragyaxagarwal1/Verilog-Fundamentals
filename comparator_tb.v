module comparator_tb;
reg [3:0] a,b;
wire alb,aeb,agb;
comparator uut(.a(a),.b(b),.alb(alb),.aeb(aeb),.agb(agb));
initial begin
a=4'b0000; b=4'b0000; #10;
a=4'b0001; b=4'b0000; #10;
a=4'b0100; b=4'b0100; #10;
a=4'b0010; b=4'b0010; #10;
a=4'b1100; b=4'b1100; #10;
a=4'b0111; b=4'b0000; #10;
a=4'b0110; b=4'b0110; #10;
a=4'b1000; b=4'b1111; #10;
a=4'b0101; b=4'b0000; #10;
a=4'b1111; b=4'b0111; #10;
a=4'b0100; b=4'b0001; #10;
a=4'b0101; b=4'b0100; #10;
$finish;
end
endmodule

 


 

