module ALU(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUControl,
    output reg [31:0] Result,
    output Zero
);

    assign Zero = (Result == 32'b0);

    always @(*) begin
        case (ALUControl)
            4'b0010: Result = A + B;  // ADD
            4'b0110: Result = A - B;  // SUB
            4'b0000: Result = A & B;  // AND
            4'b0001: Result = A | B;  // OR
            // Additional operations...
            default: Result = 32'b0;
        endcase
    end
endmodule
