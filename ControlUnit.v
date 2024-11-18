module ControlUnit(
    input [6:0] opcode,
    output reg [1:0] ALUOp,
    output reg reg_write,
    output reg branch,
    output reg mem_read,
    output reg mem_write
);

    always @(*) begin
    case (opcode)
        7'b0110011: begin // R-type
            reg_write = 1;  // Write to register file
            ALUOp = 2'b10;  // ALU performs R-type operation
            branch = 0;     // No branching
            mem_read = 0;   // No memory read
            mem_write = 0;  // No memory write
        end
        7'b0010011: begin // I-type (Immediate ALU operations)
            reg_write = 1;  // Write to register file
            ALUOp = 2'b11;  // ALU performs immediate operation
            branch = 0;     // No branching
            mem_read = 0;   // No memory read
            mem_write = 0;  // No memory write
        end
        7'b0000011: begin // Load instruction
            reg_write = 1;  // Write to register file
            ALUOp = 2'b00;  // ALU calculates memory address
            branch = 0;     // No branching
            mem_read = 1;   // Enable memory read
            mem_write = 0;  // No memory write
        end
        7'b0100011: begin // Store instruction
            reg_write = 0;  // No register write
            ALUOp = 2'b00;  // ALU calculates memory address
            branch = 0;     // No branching
            mem_read = 0;   // No memory read
            mem_write = 1;  // Enable memory write
        end
        7'b1100011: begin // Branch instruction
            reg_write = 0;  // No register write
            ALUOp = 2'b01;  // ALU performs comparison for branch
            branch = 1;     // Enable branching
            mem_read = 0;   // No memory read
            mem_write = 0;  // No memory write
        end
        default: begin // Default case for unsupported opcodes
            reg_write = 0;  // Disable register write
            ALUOp = 2'b00;  // Default ALU operation
            branch = 0;     // Disable branching
            mem_read = 0;   // Disable memory read
            mem_write = 0;  // Disable memory write
        end
    endcase
end

endmodule