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
                reg_write = 1;
                ALUOp = 2'b10;
                branch = 0;
                mem_read = 0;
                mem_write = 0;
            end
            // Add cases for other instruction types (e.g., Load, Store, Branch)
            default: begin
                reg_write = 0;
                ALUOp = 2'b00;
                branch = 0;
                mem_read = 0;
                mem_write = 0;
            end
        endcase
    end
endmodule
