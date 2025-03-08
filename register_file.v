// This module implements a 32-register file.
`timescale 1ns / 1ps
module register_file(clk,rst,RS1,RS2,RD,write_enable,Write_data,Rd1,Rd2 );
input clk,rst,write_enable;
input [4:0] RS1,RS2,RD;
input [31:0] Write_data;
output  [31:0]Rd1,Rd2;

reg [31:0]register[31:0];  // Array to store register values
integer i;
        // Initialize registers with specific values
initial
begin
    register[0]=0;
    register[1]=7;
    register[2]=5;
    register[3]=2;
    register[4]=40;
    register[5]=7;
    register[6]=8;
    register[7]=9;
    register[8]=10;
    register[9]=3;
    register[10]=2;
    register[11]=1;
    register[12]=35;
    register[13]=42;
    register[14]=11;
    register[15]=12;
    register[16]=14;
    register[17]=25;
    register[18]=26;
    register[19]=27;
    register[20]=45;
    register[21]=55;
    register[22]=66;
    register[23]=67;
    register[24]=68;
    register[25]=69;
    register[26]=33;
    register[27]=4;
    register[28]=1;
    register[29]=28;
    register[30]=13;
    register[31]=19;

end

// Read registers
assign Rd1 = register[RS1];
assign Rd2 = register[RS2];

always @(posedge clk)
begin
    
     if(write_enable)
        begin
            register[RD] <= Write_data;  // Write to register on clock edge if enabled
        end
end
endmodule
