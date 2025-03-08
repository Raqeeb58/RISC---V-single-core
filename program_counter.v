// This module implements a 32-bit program counter
`timescale 1ns / 1ps
module program_counter(pcnext,clk,pc,rst);
input [31:0]pcnext;
input clk,rst;
output reg [31:0]pc;

always@(posedge clk or posedge rst )
begin
    if(rst)
        begin
            pc <= 32'h00000000; // Reset the PC to zero on reset, otherwise update PC on clock edge
        end
    else
        begin
            pc <= pcnext;   
        end
end

    
endmodule
