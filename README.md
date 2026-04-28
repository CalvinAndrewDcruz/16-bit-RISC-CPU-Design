# 16-bit RISC CPU in Verilog

## Overview
This project implements a 16-bit RISC CPU using Verilog HDL with a modular architecture.  
The processor follows the instruction cycle: fetch, decode, and execute.

## Features
- Modular design (ALU, Control Unit, Register File)
- Instruction execution cycle implementation
- Functional simulation using testbench
- Scalable architecture

## Design
The CPU consists of:
- Program Counter (PC)
- Instruction Memory
- Register File
- Arithmetic Logic Unit (ALU)
- Control Unit
- Data Memory

Each module was designed and tested individually before integration.

## Tools Used
- Verilog HDL
- ModelSim

## How to Run
1. Compile all RTL modules
2. Run testbench
3. Observe instruction execution in waveform

## Results

![Waveform](sim/waveform.png)

## Folder Structure
rtl/ - CPU modules  
tb/ - testbench  
sim/ - waveform outputs  

## Author
Calvin D'Cruz
