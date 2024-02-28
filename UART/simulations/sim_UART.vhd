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

component UART is
  port ( 
    Clk : in std_logic;
    Din : in std_logic;
  
    busy : out std_logic;
    Dout : out std_logic := '1'
  );
end component;

signal Clk: std_logic := '0'; 
signal Din: std_logic := '1';


signal data_out: std_logic; 
signal busy : std_logic := '0';

signal Clk_period: time := 10 ns;


begin
DUT: UART 
    port map (
        Clk => Clk,
        Din => Din,
        
        busy => busy,
        Dout => data_out
        );

Clk <= not Clk after Clk_period/2;

-- Real simulation: change default simulation time in settings

stim_p: process
begin
    wait for 8680 ns;
    Din <= '1';
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
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
    wait for 8680 ns;
    
    Din <= '1';
    wait for 8680 ns;
    Din <= '0';
    wait for 8680 ns;
    Din <= '1';
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
    Din <= '1';
    wait for 8680 ns;
    Din <= '1';
    wait for 200000 ns;

end process; 


end Behavioral;
