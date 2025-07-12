module barrel_shifter_tb;

    reg [3:0] data_in;
    reg [1:0] shift_amt;
    reg dir;
    reg rotate;
    wire [3:0] data_out;
    
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .dir(dir),
        .rotate(rotate),
        .data_out(data_out)
    );
    
    initial begin
        $display("4-Bit Barrel Shifter Testbench");
        $display("===================================");
        $display("Time | Data_In | Shift | Dir | Rotate | Data_Out | Operation");
        $display("-----|---------|-------|-----|--------|----------|----------");
        
        data_in = 4'b1010; shift_amt = 2'b00; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | No shift", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b01; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Log right 1", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b01; dir = 1; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Log left 1", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b01; dir = 0; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Rot right 1", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b01; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Rot left 1", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b10; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Log right 2", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b10; dir = 1; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Log left 2", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b10; dir = 0; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Rot right 2", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b11; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Log right 3", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1010; shift_amt = 2'b11; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Rot left 3", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        $display("\n--- Testing with different input patterns ---");
        
        data_in = 4'b1111; shift_amt = 2'b01; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | All 1s, Log right 1", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b0011; shift_amt = 2'b01; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Pattern test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        data_in = 4'b1100; shift_amt = 2'b00; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Shift by 0", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        $display("\n--- Comprehensive test with one input ---");
        data_in = 4'b1001;
        
        shift_amt = 2'b00; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b00; dir = 0; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b00; dir = 1; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b00; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b01; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b01; dir = 0; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b01; dir = 1; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b01; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b10; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b10; dir = 0; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b10; dir = 1; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b10; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b11; dir = 0; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b11; dir = 0; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b11; dir = 1; rotate = 0;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        shift_amt = 2'b11; dir = 1; rotate = 1;
        #10 $display(" %3d | %b   |   %d   |  %d  |   %d    | %b   | Complete test", 
                    $time, data_in, shift_amt, dir, rotate, data_out);
        
        $display("\nTestbench completed successfully!");
        $finish;
    end
    
    initial begin
        $dumpfile("barrel_shifter.vcd");
        $dumpvars(0, barrel_shifter_tb);
    end
    
endmodule

