// This module implements a 32-bit multiplexer.
`timescale 1ns / 1ps
module multiplexer(x,z,sel,y,rst);
input [31:0]x,z;
input sel,rst;
output [31:0]y;
 // Select output based on sel signal, reset to zero if rst is high
assign y = ( rst )? 0 : 
            (sel == 0)? x : z;

endmodule
