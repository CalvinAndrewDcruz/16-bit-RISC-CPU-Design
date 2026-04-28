//===========================
// Register File: 8 registers
//===========================

module register_file(
    input clk,
    input we,                 // write enable
    input [2:0] ra1, ra2,     // read addresses
    input [2:0] wa,           // write address
    input [15:0] wd,          // write data
    output [15:0] rd1, rd2    // read data
);
    reg [15:0] regs [0:7];    // 8 registers of 16 bits

    // Continuous read
    assign rd1 = regs[ra1];
    assign rd2 = regs[ra2];

    // Write on posedge clock
    always @(posedge clk) begin
        if (we)
            regs[wa] <= wd;
    end

    // Initialize all registers to 0
    integer i;
    initial begin
        for (i = 0; i < 8; i = i + 1)
            regs[i] = 16'h0000;
    end
endmodule
