`timescale 1ns / 1ps
`include "InstructionFetch.v"
`include "InstructionDecode.v"
`include "ALU.v"
`include "RegisterFile.v"
`include "ControlUnit.v"
module RiscVCPU_tb;
    // Testbench Signals
    reg clk;
    reg reset;

    // Instantiate the CPU
    RiscVCPU cpu (
        .clk(clk),
        .reset(reset)
    );

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns clock period (50 MHz)
    end

    // Test Procedure
    initial begin
        // Initialize the simulation and reset CPU
        reset = 1;
        #10 reset = 0; // Release reset after 10 ns

        // Test different instructions by setting the PC and/or loading values
        // into memory or the register file

        // Example 1: Test R-type instruction (e.g., add)
        // Assuming some mechanism to load instruction and data (for example, instruction memory setup)
        // Load an instruction into memory: add x1, x2, x3 (32-bit binary for `add`)
        // You may load specific values into registers x2 and x3 to test the `add`

        // Wait for the instruction to execute
        #50;

        // Check the output in register file (if the result is as expected)

        // Example 2: Test I-type instruction (e.g., load)
        // Similar setup for other instruction types can be done here

        // Finish simulation
        #100 $stop;
    end

    // Monitor outputs (for debugging purposes)
    initial begin
        $monitor("Time = %0t | PC = %h | Register x1 = %h", $time, cpu.IF.pc, cpu.RF.registers[1]);
    end
endmodule
