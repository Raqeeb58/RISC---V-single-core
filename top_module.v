// This module represents the top-level design of a RISC-V processor.
`timescale 1ns / 1ps
module top_module(clk,rst );
input clk,rst;
// Signals for program counter, instructions, registers, and control signals
wire [31:0]pc_top,instruction_top,rd1_top,rd2_top,immext_top,mux1out_top,ALUResult_top,Memdata_out_top,mux2out_top,pcplus4_top,sum_top,mux3out_top;
wire regwrite_top,ALUsrc_top,Memwrite_top,Memread_top,Memtoreg_top,zero_top,branch_top,andblock;
wire [1:0]ALUop_top;
wire [3:0]ALUcontrol_top;

assign andblock = zero_top & branch_top;  // AND gate for branch condition
// Program Counter Module
program_counter  pc(.pcnext(mux3out_top),.clk(clk),.pc(pc_top),.rst(rst));

  // Instruction Memory Module
instruction_memory im(.read_address(pc_top),.instruction_out(instruction_top),.rst(rst),.clk(clk));

 // PC+4 Module
pc_plus4  pcplus(.pc(pc_top),.pcplus4(pcplus4_top),.clk(clk));

  // Control Unit Module
control_unit cu(.instruction(instruction_top[6:0]) ,.Branch(branch_top),.Memread(Memread_top),.Memtoreg(Memtoreg_top),.Aluop(ALUop_top),
                 .Memwrite(Memwrite_top),.ALUsrc(ALUsrc_top),.Regwrite(regwrite_top));
   // Register File Module
register_file rf(.clk(clk),.rst(rst),.RS1(instruction_top[19:15]),.RS2(instruction_top[24:20]),
                 .RD(instruction_top[11:7]),.write_enable(regwrite_top), .Write_data(mux2out_top),.Rd1(rd1_top),.Rd2(rd2_top) );

// Immediate Generator Module
immediate_generator ig(.opcode(instruction_top[6:0]),.instruction(instruction_top),.Immext(immext_top));

// MUX for Register and ALU Input
multiplexer mux1(.x(rd2_top),.z(immext_top),.sel(ALUsrc_top),.y(mux1out_top),.rst(rst));     

// ALU Module  
ALU alu1(.A(rd1_top),.B(mux1out_top),.ALUcontrol(ALUcontrol_top),.ALUResult(ALUResult_top),.ZERO(zero_top));  

// Data Memory Module
data_memory dm(.clk(clk),.rst(rst),.Memwrite(Memwrite_top),.Memread(Memread_top),.read_address(ALUResult_top),.write_data(rd2_top),.Memdata_out(Memdata_out_top));         

// Adder for PC Offset
ALU alu2(.A(pc_top),.B(immext_top),.ALUcontrol(4'b0010),.ALUResult(sum_top),.ZERO());

// MUX after Data Memory
multiplexer mux2(.x(ALUResult_top),.z(Memdata_out_top),.sel(Memtoreg_top),.y(mux2out_top),.rst(rst));

// ALU Control Module
alu_control aluc(.ALUop(ALUop_top),.funct3(instruction_top[14:12]),.funct7(instruction_top[30]),.ALUcontrol(ALUcontrol_top));

// MUX for PC Selection
multiplexer mux3(.x(pcplus4_top),.z(sum_top),.sel(andblock),.y(mux3out_top),.rst(rst));


endmodule
