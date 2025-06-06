module GFM(
    input wire clk1,
    input wire clk2,
    input wire select,
    input wire rstn,
    output wire out_clk
);
reg ff1_sync, ff1_async;  
reg ff2_sync, ff2_async;  
    
wire ff1_async_n = ~ff1_async;
wire ff2_async_n = ~ff2_async;
wire select_n = ~select;
    
always @(posedge clk1 or negedge rstn) begin
if (!rstn)
ff1_sync <= 1'b0;
else
ff1_sync <= select & ff2_async_n; 
end
    
always @(negedge clk1 or negedge rstn) begin
if (!rstn)
ff1_async <= 1'b0;
else
ff1_async <= ff1_sync;
end
    
always @(posedge clk2 or negedge rstn) begin
if (!rstn)
ff2_sync <= 1'b0;
else
ff2_sync <= select_n & ff1_async_n; 
end
    
always @(negedge clk2 or negedge rstn) begin
if (!rstn)
ff2_async <= 1'b0;
else
ff2_async <= ff2_sync;
end
    
wire clk1_gated = clk1 & ff1_async;
wire clk2_gated = clk2 & ff2_async;
    
assign out_clk = clk1_gated | clk2_gated;

endmodule
