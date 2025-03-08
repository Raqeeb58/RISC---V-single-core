`timescale 1ns / 1ps
module pc_plus4(pc,pcplus4,clk );
input [31:0] pc;
input clk;
output reg [31:0] pcplus4;
always @(posedge clk)
begin
    pcplus4 = 4 + pc;
end

endmodule
