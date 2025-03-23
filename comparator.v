module comparator(a,b,aeb,agb,alb);
input [3:0] a,b;
output reg aeb,agb,alb;
always @ (a,b)
begin
if(a>b)begin
alb=1'b0; aeb=1'b0; agb=1'b1;
end
else if(a<b)begin
alb=1'b1; aeb=1'b0; agb=1'b0;
end
else begin
alb=1'b0; aeb=1'b1; agb=1'b0;
end
end
endmodule
	