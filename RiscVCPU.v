module RiscVCPU(
    input clk,
    input reset
);
    // Internal Wires
    wire [31:0] pc;
    wire [31:0] instruction;
    wire [31:0] read_data1, read_data2;
    wire [31:0] alu_result;
    wire [4:0] rs1, rs2, rd;
    wire [6:0] opcode;
    wire [3:0] ALUControl;   // Updated to 4 bits
    wire [1:0] ALUOp;        // Updated to 2 bits
    wire reg_write, branch, mem_read, mem_write;
    wire Zero;

    // Instantiate Modules
    InstructionFetch IF(.clk(clk), .reset(reset), .next_pc(pc), .pc(pc));
    InstructionDecode ID(.instruction(instruction), .rs1(rs1), .rs2(rs2), .rd(rd), .opcode(opcode));
    RegisterFile RF(.clk(clk), .reg_write(reg_write), .read_reg1(rs1), .read_reg2(rs2), .write_reg(rd),
                    .write_data(alu_result), .read_data1(read_data1), .read_data2(read_data2));
    ALU ALU(.A(read_data1), .B(read_data2), .ALUControl(ALUControl), .Result(alu_result), .Zero(Zero));
    ControlUnit CU(.opcode(opcode), .ALUOp(ALUOp), .reg_write(reg_write), .branch(branch), .mem_read(mem_read), .mem_write(mem_write));

    // Additional connections and modules for memory and branching can be added here
endmodule
