module GFM_tb;
    reg clk1, clk2, select, rstn;
    wire out_clk;
    
    GFM uut (
        .clk1(clk1),
        .clk2(clk2), 
        .select(select),
        .rstn(rstn),
        .out_clk(out_clk)
    );
    
    initial begin
        clk1 = 0;
        forever #10 clk1 = ~clk1;
    end
    
    initial begin
        clk2 = 0;
        forever #15 clk2 = ~clk2;
    end
    
    initial begin        
        select = 0;
        rstn = 0;
        #20;
        
        rstn = 1;
        #100;
        
        select = 1;
        #200;
        
        select = 0;
        #200;
        
        select = 1;
        #200;
        
        $finish;
    end
    
    initial begin
        $monitor("Time=%0t: select=%b rstn=%b out_clk=%b", 
                 $time, select, rstn, out_clk);
    end
endmodule
