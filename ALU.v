// This module implements a basic Arithmetic Logic Unit (ALU).
`timescale 1ns / 1ps
module ALU(A,B,ALUcontrol,ALUResult,ZERO);
input [31:0] A,B;
input [3:0] ALUcontrol;
output reg [31:0] ALUResult ;
output reg ZERO;
  // Perform operations based on ALUcontrol
always @(*)
begin
    case(ALUcontrol)
    4'b0000 : begin ZERO <= 0 ; ALUResult <= A & B ; end
    4'b0001 : begin ZERO <= 0 ; ALUResult <= A | B ; end
    4'b0010 : begin ZERO <= 0 ; ALUResult <= A + B ; end
    4'b0110 : begin if(A==B) ZERO <= 1 ;else ZERO <= 0 ;  ALUResult <= A - B ; end
    endcase
end
endmodule
