// This module simulates data memory.
`timescale 1ns / 1ps
module data_memory(clk,rst,Memwrite,Memread,read_address,write_data,Memdata_out);
input clk,rst,Memwrite,Memread;
input [31:0]read_address,write_data;
output  [31:0]Memdata_out;

reg [31:0] data_registers[63:0];    // Array to store data
integer i;
  // Initialize data memory with specific values
initial
begin
    data_registers[0] = 5;
    data_registers[1] = 5;
    data_registers[2] = 5;
    data_registers[3] = 5;
    data_registers[4] = 5;
    data_registers[5] = 5;
    data_registers[6] = 5;
    data_registers[7] = 5;
    data_registers[8] = 5;
    data_registers[9] = 5;
    data_registers[10] = 5;
    data_registers[11] = 5;
    data_registers[12] = 5;
    data_registers[13] = 5;
    data_registers[14] = 5;
    data_registers[15] = 5;
    data_registers[16] = 5;
    data_registers[17] = 5;
    data_registers[18] = 5;
    data_registers[19] = 5;
    data_registers[20] = 5;
    data_registers[21] = 5;
    data_registers[22] = 5;
    data_registers[23] = 5;
    data_registers[24] = 5;
    


end

always @(posedge clk)
begin
    
    if(Memwrite)
    begin
        data_registers[read_address] <= write_data;    // Write to data memory on clock edge if enabled  
    end
end

assign Memdata_out = (Memread)? data_registers[read_address] : 32'h00000000;  // Read from data memory if enabled
endmodule
