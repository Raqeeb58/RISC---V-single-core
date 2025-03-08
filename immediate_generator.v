// This module generates immediate values based on the opcode.
`timescale 1ns / 1ps
module immediate_generator(opcode,instruction,Immext );
input [6:0] opcode;
input [31:0] instruction;
output reg  [31:0] Immext;
  // Generate immediate based on opcode
always @(*)
begin
    case(opcode)
    7'b0000011,7'b0010011 : Immext <= {{20{instruction[31]}}, instruction[31:20]};
    7'b0100011            : Immext <= {{20{instruction[31]}},instruction[31:25],instruction[11:7]};
    7'b1100011            : Immext <= {{19{instruction[31]}}, instruction[31], instruction[7], instruction[30:25], instruction[11:8], 1'b0};
    default               : Immext <= 32'h00000000; 
    endcase
end

endmodule
