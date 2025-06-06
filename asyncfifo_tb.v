module asyncfifo_tb;

    reg [31:0] dataIn;
    reg wr_clk = 0;
    reg rd_clk = 0;
    reg rst = 1;
    reg write = 0;
    reg read = 0;
    reg enable = 0;
    wire [31:0] dataOut;
    wire full, empty;

    asyncfifo uut (
        .DataIn(dataIn),
        .wr_clk(wr_clk),
        .rd_clk(rd_clk),
        .rst(rst),
        .WR(write),
        .RD(read),
        .EN(enable),
        .DataOut(dataOut),
        .FULL(full),
        .EMPTY(empty)
    );

    always #5 wr_clk = ~wr_clk;
    always #7 rd_clk = ~rd_clk;

    initial begin
        dataIn = 0;
        #15 rst = 0;
        enable = 1;

        @(posedge wr_clk); dataIn = 32'h1111_0001; write = 1;
        @(posedge wr_clk); dataIn = 32'h1111_0002;
        @(posedge wr_clk); dataIn = 32'h1111_0003;
        @(posedge wr_clk); dataIn = 32'h1111_0004;
        @(posedge wr_clk); dataIn = 32'h1111_0005;
        @(posedge wr_clk); dataIn = 32'h1111_0006;
        @(posedge wr_clk); dataIn = 32'h1111_0007;
        @(posedge wr_clk); dataIn = 32'h1111_0008;
        @(posedge wr_clk); write = 0;

        #30;

        @(posedge rd_clk); read = 1;
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk);
        @(posedge rd_clk); read = 0;

        #50;
        $finish;
    end

endmodule

