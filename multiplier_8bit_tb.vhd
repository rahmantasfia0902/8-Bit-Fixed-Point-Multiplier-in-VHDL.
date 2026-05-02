-- ============================================================
-- Testbench for 8-bit Fixed-Point Multiplier
-- Tests: 0x0, normal cases, max value, powers of 2
-- ============================================================

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity multiplier_8bit_tb is
    -- Testbench has no ports
end multiplier_8bit_tb;

architecture Behavioral of multiplier_8bit_tb is

    -- -------------------------------------------------------
    -- Component Declaration (must match your main entity)
    -- -------------------------------------------------------
    component multiplier_8bit
        Port (
            A       : in  STD_LOGIC_VECTOR(7 downto 0);
            B       : in  STD_LOGIC_VECTOR(7 downto 0);
            PRODUCT : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

    -- -------------------------------------------------------
    -- Internal signals to connect to the UUT (Unit Under Test)
    -- -------------------------------------------------------
    signal A_tb       : STD_LOGIC_VECTOR(7 downto 0)  := (others => '0');
    signal B_tb       : STD_LOGIC_VECTOR(7 downto 0)  := (others => '0');
    signal PRODUCT_tb : STD_LOGIC_VECTOR(15 downto 0);

begin

    -- -------------------------------------------------------
    -- Instantiate the Unit Under Test (UUT)
    -- -------------------------------------------------------
    UUT: multiplier_8bit
        port map (
            A       => A_tb,
            B       => B_tb,
            PRODUCT => PRODUCT_tb
        );

    -- -------------------------------------------------------
    -- Stimulus Process
    -- -------------------------------------------------------
    stim_proc: process
    begin

        -- *** Test 1: 0 * 0 = 0 ***
        A_tb <= x"00"; B_tb <= x"00";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0000

        -- *** Test 2: 1 * 1 = 1 ***
        A_tb <= x"01"; B_tb <= x"01";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0001

        -- *** Test 3: 2 * 3 = 6 ***
        A_tb <= x"02"; B_tb <= x"03";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0006

        -- *** Test 4: 10 * 10 = 100 ***
        A_tb <= x"0A"; B_tb <= x"0A";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0064 (decimal 100)

        -- *** Test 5: 16 * 16 = 256 ***
        A_tb <= x"10"; B_tb <= x"10";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0100 (decimal 256)

        -- *** Test 6: 15 * 15 = 225 ***
        A_tb <= x"0F"; B_tb <= x"0F";
        wait for 20 ns;
        -- Expected PRODUCT = 0x00E1 (decimal 225)

        -- *** Test 7: 200 * 100 = 20000 ***
        A_tb <= x"C8"; B_tb <= x"64";
        wait for 20 ns;
        -- Expected PRODUCT = 0x4E20 (decimal 20000)

        -- *** Test 8: 255 * 1 = 255 ***
        A_tb <= x"FF"; B_tb <= x"01";
        wait for 20 ns;
        -- Expected PRODUCT = 0x00FF (decimal 255)

        -- *** Test 9: MAX * MAX = 255 * 255 = 65025 ***
        A_tb <= x"FF"; B_tb <= x"FF";
        wait for 20 ns;
        -- Expected PRODUCT = 0xFE01 (decimal 65025)

        -- *** Test 10: A = 0, B = 255 = 0 ***
        A_tb <= x"00"; B_tb <= x"FF";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0000

        -- *** Test 11: Powers of 2 — 4 * 64 = 256 ***
        A_tb <= x"04"; B_tb <= x"40";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0100 (decimal 256)

        -- *** Test 12: 128 * 2 = 256 ***
        A_tb <= x"80"; B_tb <= x"02";
        wait for 20 ns;
        -- Expected PRODUCT = 0x0100 (decimal 256)

        -- End simulation
        wait;

    end process stim_proc;

end Behavioral;