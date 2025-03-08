// This module decodes instructions and generates control signals
`timescale 1ns / 1ps
module control_unit(instruction ,Branch,Memread,Memtoreg,Aluop,Memwrite,ALUsrc,Regwrite );
input [6:0] instruction;
output reg Branch,Memread,Memtoreg,Memwrite,ALUsrc,Regwrite;
output reg [1:0]Aluop;

 // Decode instruction and set control signals accordingly
always @(*)
begin
    case(instruction)
    7'b0110011 : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'b001000_10;
    7'b0000011 : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'b111100_00;
    7'b0100011 : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'b100010_00;
    7'b1100011 : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'b000001_01;
    7'b0010011 : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'b101000_00;
    7'b1111111 : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'bxxxxxx_xx;
    default    : {ALUsrc,Memtoreg,Regwrite,Memread,Memwrite,Branch,Aluop} = 8'b000000_00;
   
    
    endcase
    


end
endmodule
