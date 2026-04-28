//===========================
// Control Unit
//===========================

module control_unit(
    input [3:0] opcode,
    output reg reg_write,
    output reg mem_read,
    output reg mem_write,
    output reg alu_src,
    output reg mem_to_reg,
    output reg [3:0] alu_control
);
    always @(*) begin
        // Default
        reg_write  = 0;
        mem_read   = 0;
        mem_write  = 0;
        alu_src    = 0;
        mem_to_reg = 0;
        alu_control = 4'b0000;

        case (opcode)
            4'b0000: begin // ADD
                reg_write = 1;
                alu_control = 4'b0000;
            end
            4'b0100: begin // ADDI
                reg_write = 1;
                alu_src   = 1;
                alu_control = 4'b0000;
            end
            4'b0001: begin // LOAD
                reg_write  = 1;
                mem_read   = 1;
                alu_src    = 1;
                mem_to_reg = 1;
                alu_control = 4'b0000;
            end
            4'b0010: begin // STORE
                mem_write = 1;
                alu_src   = 1;
                alu_control = 4'b0000;
            end
        endcase
    end
endmodule
