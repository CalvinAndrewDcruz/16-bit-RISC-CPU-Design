//===========================
// Data Memory (RAM)
//===========================

module data_memory(
    input clk,
    input mem_write,
    input mem_read,
    input [15:0] address,
    input [15:0] write_data,
    output [15:0] read_data
);
    reg [15:0] mem [0:255];

    // Write
    always @(posedge clk) begin
        if (mem_write)
            mem[address] <= write_data;
    end

    // Read
    assign read_data = mem_read ? mem[address] : 16'h0000;
endmodule
