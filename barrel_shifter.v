module barrel_shifter (data_in, data_out, shift_amt, dir, rotate);
input [3:0] data_in;
input [1:0] shift_amt;
input dir;    // dir=0 means right shift, dir=1 means left shift
input rotate;
output [3:0] data_out;
reg [3:0] data_out;
reg [3:0] shift_0, shift_1, shift_2, shift_3;
always @(*) begin
case (shift_amt)
2'b00: begin
data_out=data_in;
end
2'b01: begin
if(dir==0) begin //right shift
if(rotate)
data_out={data_in[0], data_in[3:1]};
else
data_out = {1'b0, data_in[3:1]};
end
else begin
if(rotate) 
data_out={data_in[2:0], data_in[3]};
else
data_out={data_in[2:0], 1'b0};
end
end
2'b10: begin
if(dir==0) begin
if(rotate)
data_out={data_in[1:0], data_in[3:2]}; 
end
else
begin
if(rotate)
data_out = {data_in[1:0], data_in[3:2]};
else
data_out = {data_in[1:0], 2'b00};
end
end
2'b11: begin
if(dir==0) begin
if(rotate)
data_out = {data_in[2:0], data_in[3]};
else
data_out = {3'b000, data_in[3]};
end
else
begin
if(rotate)
data_out = {data_in[0], data_in[3:1]};
else
data_out = {data_in[0], 3'b000};
end
end
endcase
end
endmodule



