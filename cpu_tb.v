module cpu_tb;

    reg clk = 0;
    reg reset = 1;

    cpu_top DUT(
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        #10 reset = 0;
        #200 $stop;
    end

    always @(posedge clk) begin
        $display("Time=%0t | PC=%0d | R1=%0d | R2=%0d | R3=%0d",
                 $time,
                 DUT.pc_out,
                 DUT.RF.regs[1],
                 DUT.RF.regs[2],
                 DUT.RF.regs[3]);
    end

endmodule
