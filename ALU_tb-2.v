`timescale 1ns / 1ps

module ALU_tb;

    // Testbench signals
    reg [31:0] A, B;
    reg [3:0] ALUControl;
    wire [31:0] Result;
    wire Zero;

    // Instantiate the ALU module
    ALU uut (
        .A(A),
        .B(B),
        .ALUControl(ALUControl),
        .Result(Result),
        .Zero(Zero)
    );

    // Test procedure
    initial begin
        // Dump waveforms to VCD file
        $dumpfile("ALU_waveform.vcd"); // Specify VCD file name
        $dumpvars(0, ALU_tb);         // Dump all variables in ALU_tb scope

        // Monitor output in the terminal
        $monitor("Time = %0t | A = %h | B = %h | ALUControl = %b | Result = %h | Zero = %b", 
                 $time, A, B, ALUControl, Result, Zero);

        // Test Case 1: ADD (A + B)
        A = 32'h00000010;  // 16
        B = 32'h00000020;  // 32
        ALUControl = 4'b0010;  // ADD
        #10;

        // Test Case 2: SUB (A - B)
        A = 32'h00000030;  // 48
        B = 32'h00000010;  // 16
        ALUControl = 4'b0110;  // SUB
        #10;

        // Test Case 3: AND (A & B)
        A = 32'hF0F0F0F0;
        B = 32'h0F0F0F0F;
        ALUControl = 4'b0000;  // AND
        #10;

        // Test Case 4: OR (A | B)
        A = 32'hF0F0F0F0;
        B = 32'h0F0F0F0F;
        ALUControl = 4'b0001;  // OR
        #10;

        // Test Case 5: XOR (A ^ B)
        A = 32'hF0F0F0F0;
        B = 32'h0F0F0F0F;
        ALUControl = 4'b0011;  // XOR
        #10;

        // Test Case 6: Logical Shift Left
        A = 32'h00000001;
        B = 32'h00000002;
        ALUControl = 4'b1000;  // SLL
        #10;

        // Test Case 7: Logical Shift Right
        A = 32'h00000010;
        B = 32'h00000002;
        ALUControl = 4'b1001;  // SRL
        #10;

        // Test Case 8: Arithmetic Shift Right
        A = 32'hF0000000;  // Negative number in two's complement
        B = 32'h00000004;
        ALUControl = 4'b1010;  // ASR
        #10;

        // Test Case 9: Default case
        A = 32'h00000001;
        B = 32'h00000001;
        ALUControl = 4'b1111;  // Undefined operation
        #10;

        // Stop simulation
        $stop;
    end
endmodule
