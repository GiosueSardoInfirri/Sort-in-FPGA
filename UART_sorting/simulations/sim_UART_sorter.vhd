----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 15:09:25
-- Design Name: 
-- Module Name: sim_UART - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sim_UART is
--  Port ( );
end sim_UART;

architecture Behavioral of sim_UART is

component UART_sorter is
  port ( 
    Clk : in std_logic;
    Din : in std_logic;
    reset_button : in std_logic;
  
    busy : out std_logic;
    Dout : out std_logic := '1'
  );
end component;

signal Clk: std_logic := '0'; 
signal Din: std_logic := '1';
signal reset_button : std_logic := '1';

signal data_out: std_logic; 
signal busy : std_logic := '0';

signal Clk_period: time := 10 ns;


begin
DUT: UART_sorter
    port map (
        Clk => Clk,
        Din => Din,
        reset_button => reset_button,
        
        busy => busy,
        Dout => data_out
        );

Clk <= not Clk after Clk_period/2;

stim_p: process
begin
-------------------------------------- 1 -> 1
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;


-------------------------------------- 2 -> 5
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 3 -> 3
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 4 -> 7
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 5 -> 4
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 6 -> 2
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 7 -> 8
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 8 -> 6
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 9 -> 6
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;
    
    reset_button <= '0';
    wait for 8680 ns;
    reset_button <= '1';
    wait for 1000000 ns;


-------------------------------------- 1 -> 1
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;


-------------------------------------- 2 -> 5
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 3 -> 3
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 4 -> 7
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 5 -> 4
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 6 -> 2
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 7 -> 8
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 8 -> 6
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;

-------------------------------------- 9 -> 6
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '0'; --
    wait for 8680 ns;
    Din <= '1';
--    wait for 8680 ns;
    wait for 1000000 ns;


    wait for 200000000 ns;

end process; 


end Behavioral;
