# 8-Bit-Fixed-Point-Multiplier-in-VHDL.
A purely combinational VHDL multiplier that takes two 8-bit unsigned inputs and produces a 16-bit unsigned product. No clock required — the result updates instantly using a single NUMERIC_STD multiply operation. Verified with 12 test cases in ModelSim, including the maximum case 255×255 = 65,025.
