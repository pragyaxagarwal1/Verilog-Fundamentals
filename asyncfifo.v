module asyncfifo(
    input wr_clk, rd_clk, rst,
    input EN, WR, RD,
    input [31:0] DataIn,
    output reg [31:0] DataOut,
    output EMPTY, FULL
);

    reg [31:0] mem [0:7];
    reg [2:0] wr_ptr = 0;
    reg [2:0] rd_ptr = 0;
    reg [3:0] count = 0;

    assign EMPTY = (count == 0);
    assign FULL  = (count == 8);

    always @(posedge wr_clk or posedge rst) begin
        if (rst)
            wr_ptr <= 0;
        else if (EN && WR && !FULL) begin
            mem[wr_ptr] <= DataIn;
            wr_ptr <= wr_ptr + 1;
        end
    end

    always @(posedge rd_clk or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
            DataOut <= 0;
        end else if (EN && RD && !EMPTY) begin
            DataOut <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
        end
    end

    always @(posedge wr_clk or posedge rst) begin
        if (rst)
            count <= 0;
        else begin
            if (EN) begin
                if (WR && !FULL && !(RD && !EMPTY)) count <= count + 1;
                else if (!WR && RD && !EMPTY) count <= count - 1;
                else if (WR && RD && !FULL && !EMPTY) count <= count;
            end
        end
    end
endmodule

