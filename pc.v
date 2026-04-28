//===========================
// Program Counter
//===========================

module pc(
    input clk,
    input reset,
    input [15:0] pc_next,
    output reg [15:0] pc_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            pc_out <= 16'h0000; // Reset PC to 0
        else
            pc_out <= pc_next;  // Update PC
    end
endmodule
