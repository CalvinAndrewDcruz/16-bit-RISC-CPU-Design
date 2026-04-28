module cpu_top(
    input clk,
    input reset
);

    // ======================
    // Wires
    // ======================
    wire [15:0] pc_out;
    wire [15:0] instruction;
    wire [15:0] pc_next;

    wire [3:0] opcode;
    wire [2:0] rs, rt, rd_r, rd_i;
    wire [5:0] imm;

    wire reg_write, mem_read, mem_write, alu_src, mem_to_reg;
    wire [3:0] alu_control;

    wire [15:0] read_data1, read_data2;
    wire [15:0] alu_in2, alu_result;
    wire [15:0] mem_data;
    wire [15:0] write_back_data;

    wire [2:0] write_reg;

    // ======================
    // Instruction Decode
    // ======================
    assign opcode = instruction[15:12];
    assign rs     = instruction[11:9];
    assign rt     = instruction[8:6];
    assign rd_r   = instruction[5:3];   // R-type destination
    assign rd_i   = instruction[8:6];   // I-type destination
    assign imm    = instruction[5:0];

    // Choose correct destination register
    assign write_reg = (opcode == 4'b0100 || opcode == 4'b1000) ? rd_i : rd_r;

    // ======================
    // Modules
    // ======================
    pc PC(clk, reset, pc_next, pc_out);

    instruction_memory IM(pc_out, instruction);

    register_file RF(
        clk,
        reg_write,
        rs,
        rt,
        write_reg,
        write_back_data,
        read_data1,
        read_data2
    );

    control_unit CU(
        opcode,
        reg_write,
        mem_read,
        mem_write,
        alu_src,
        mem_to_reg,
        alu_control
    );

    // Immediate extend
    wire [15:0] imm_ext;
    assign imm_ext = {10'b0, imm};

    // ALU input mux
    mux2 #(16) ALU_MUX(
        read_data2,
        imm_ext,
        alu_src,
        alu_in2
    );

    // ALU
    alu ALU(
        read_data1,
        alu_in2,
        alu_control,
        alu_result
    );

    // Data Memory
    data_memory DM(
        clk,
        mem_write,
        mem_read,
        alu_result,
        read_data2,
        mem_data
    );

    // Writeback
    assign write_back_data = (mem_to_reg) ? mem_data : alu_result;

    // PC Increment
    assign pc_next = pc_out + 1;

endmodule
