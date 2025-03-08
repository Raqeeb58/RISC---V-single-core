# RISC-V-single-core
This project implements a basic RISC-V processor in Verilog. It includes modules for the program counter, instruction memory, register file, ALU, data memory, and control logic. The design supports a subset of RISC-V instructions and is intended for educational purposes.

Key Features:
Program Counter: Manages instruction fetch and execution sequence.

Instruction Memory: Stores predefined instructions for simulation.

Register File: Provides 32 registers for data storage.

ALU: Performs arithmetic and logical operations.

Data Memory: Simulates memory for data storage and retrieval.

Control Logic: Decodes instructions and generates control signals.

Usage:

Use a Verilog simulator (e.g., ModelSim, VCS) to compile and run the testbench (top_tb.v).

Modify the instruction_memory.v to add or modify instructions.
