-- ============================================================
-- 8-bit Fixed-Point Multiplier
-- Inputs : A, B  (8-bit unsigned)
-- Output : PRODUCT (16-bit unsigned)
-- A * B fits exactly in 16 bits (max = 255*255 = 65025)
-- ============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;       -- gives us UNSIGNED multiply

entity multiplier_8bit is
    Port (
        A       : in  STD_LOGIC_VECTOR(7 downto 0);   -- 8-bit operand A
        B       : in  STD_LOGIC_VECTOR(7 downto 0);   -- 8-bit operand B
        PRODUCT : out STD_LOGIC_VECTOR(15 downto 0)   -- 16-bit result
    );
end multiplier_8bit;

architecture Behavioral of multiplier_8bit is
begin

    -- Convert inputs to UNSIGNED, multiply, convert result back to SLV
    -- UNSIGNED(A) is 8 bits, UNSIGNED(B) is 8 bits
    -- Their product is automatically 16 bits wide
    PRODUCT <= STD_LOGIC_VECTOR(UNSIGNED(A) * UNSIGNED(B));

end Behavioral;