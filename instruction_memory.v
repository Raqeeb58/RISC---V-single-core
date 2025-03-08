// This module simulates instruction memory with predefined instructions.
`timescale 1ns / 1ps
module instruction_memory(read_address,instruction_out,rst,clk);
input [31:0] read_address ;
input rst,clk;
output reg [31:0] instruction_out ;

reg [31:0]i_mem[63:0];   // Array to store instructions
integer i;
 // Initialize instruction memory with specific instructions
initial begin
        
        i_mem[0]  = 32'b00000000000000000000000000000000;       //no op 
        i_mem[4]  = 32'b0000000_11001_10000_000_01101_0110011;  // add x13,x16,x25
        i_mem[8]  = 32'b0100000_00011_01000_000_00101_0110011;  // sub x5,x8,x3
        i_mem[12] = 32'b000000_00011_00010_111_00001_0110011;   // and x1,x2,x3
        i_mem[16] = 32'b0000000_00101_00011_110_00100_0110011;  // or x4,x3,x5 
        
        i_mem[20]  = 32'b000000000011_10101_000_10110_0010011;  //addi x22,x21,3
        i_mem[24]  = 32'b000000000001_01000_110_01001_0010011;  // ori x9,x8,1
         
        i_mem[28]  = 32'b000000001111_00101_000_01000_0000011;   //lw,x8,15(x5)
        i_mem[32]  = 32'b000000000011_00011_000_01001_0000011;   //lw x9,3(x3)
        
        i_mem[36]  = 32'b0000000_01111_00101_000_01100_0100011;  //sw x15,12(x5)
        i_mem[40]  = 32'b0000000_01110_00110_000_01010_0100011;  //sw x14,10(x6)
        
        i_mem[44]  = 32'b0000000_01001_01001_000_01100_1100011;  //beq x9,x9,12
        i_mem[56]  = 32'b0000000000000000000000000_1111111 ;     //halt
    end

always @(*)
begin
    
    begin
        instruction_out <= i_mem[read_address];  // Read instruction from memory based on address
    end
end
endmodule
