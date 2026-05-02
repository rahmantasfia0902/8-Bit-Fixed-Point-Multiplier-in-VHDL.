# 8-Bit-Fixed-Point-Multiplier-in-VHDL.
A purely combinational VHDL multiplier that takes two 8-bit unsigned inputs and produces a 16-bit unsigned product. No clock required — the result updates instantly using a single NUMERIC_STD multiply operation. Verified with 12 test cases in ModelSim, including the maximum case 255×255 = 65,025.

Overview
A purely combinational VHDL multiplier that takes two 8-bit unsigned inputs and produces a 16-bit unsigned product. No clock required — the result updates instantly using a single NUMERIC_STD multiply operation. Verified with 12 test cases in ModelSim, including the maximum case 255×255 = 65,025.

PRODUCT <= STD_LOGIC_VECTOR(UNSIGNED(A) * UNSIGNED(B));
Signal interface
Signal	Direction	Width	Range
A	Input	8-bit unsigned	0 – 255
B	Input	8-bit unsigned	0 – 255
PRODUCT	Output	16-bit unsigned	0 – 65,535
16-bit output is required because the maximum product 255×255 = 65,025 exceeds the 15-bit maximum of 32,767.

Files
File	Description
multiplier_8bit.vhd	Main entity — combinational multiplier
multiplier_8bit_tb.vhd	Testbench — 12 test vectors, 20 ns per case
Simulation results
All 12 test cases pass. Simulation run in ModelSim Intel FPGA Edition 2020.1.

TC	A (hex)	B (hex)	A	B	Product	PRODUCT (hex)	
1	0x00	0x00	0	0	0	0x0000	PASS
2	0x01	0x01	1	1	1	0x0001	PASS
3	0x02	0x03	2	3	6	0x0006	PASS
4	0x0A	0x0A	10	10	100	0x0064	PASS
5	0x10	0x10	16	16	256	0x0100	PASS
6	0x0F	0x0F	15	15	225	0x00E1	PASS
7	0xC8	0x64	200	100	20,000	0x4E20	PASS
8	0xFF	0x01	255	1	255	0x00FF	PASS
9	0xFF	0xFF	255	255	65,025	0xFE01	PASS
10	0x00	0xFF	0	255	0	0x0000	PASS
11	0x04	0x40	4	64	256	0x0100	PASS
12	0x80	0x02	128	2	256	0x0100	PASS
How to simulate
vcom multiplier_8bit.vhd
vcom multiplier_8bit_tb.vhd
vsim multiplier_8bit_tb
add wave /*
run 240ns
Key design notes
Uses IEEE.NUMERIC_STD — UNSIGNED(A) * UNSIGNED(B) automatically yields a 16-bit result
No clock, no process blocks — single concurrent signal assignment
16-bit output prevents overflow; max product 255×255 = 65,025 = 0xFE01
PRODUCT updates instantly as inputs change (zero clock latency)
