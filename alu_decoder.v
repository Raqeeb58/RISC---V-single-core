// This module generates ALU control signals based on ALUop, funct3, and funct7.
`timescale 1ns / 1ps
module alu_control(ALUop,funct3,funct7,ALUcontrol );
input [1:0]ALUop;
input [2:0]funct3;
input funct7;
output reg [3:0]ALUcontrol ;

always@(*)
begin
    case({ALUop,funct7,funct3})
    6'b00_0_000 : ALUcontrol <= 4'b0010 ;
    6'b01_0_000 : ALUcontrol <= 4'b0110 ;
    6'b10_0_000 : ALUcontrol <= 4'b0010 ;
    6'b10_1_000 : ALUcontrol <= 4'b0110 ;
    6'b10_0_111 : ALUcontrol <= 4'b0000 ;
    6'b10_0_110 : ALUcontrol <= 4'b0001 ;
    endcase
end
endmodule
