module instruction_memory(
    input [15:0] addr,
    output [15:0] instruction
);

    reg [15:0] mem [0:255];

    initial begin
        // ADDI R1, R0, 5
        mem[0] = 16'b0100_000_001_000101;

        // ADDI R2, R0, 3
        mem[1] = 16'b0100_000_010_000011;

        // ADD R3, R1, R2
        mem[2] = 16'b0000_001_010_011_000;

        mem[3] = 16'b0000_000_000_000_000;
    end

    assign instruction = mem[addr];

endmodule
