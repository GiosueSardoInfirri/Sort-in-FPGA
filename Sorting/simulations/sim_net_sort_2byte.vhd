----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.02.2024 12:00:12
-- Design Name: 
-- Module Name: sim_net_sort - Behavioral
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

entity sim_net_sort is
--  Port ( );
end sim_net_sort;

architecture Behavioral of sim_net_sort is

component Network_Sorting is
    Port (
        Clk : in std_logic;
        input : in std_logic_vector(7 downto 0);
        is_valid : in std_logic;

        output : out std_logic_vector(7 downto 0) := (others => '1');
        VALID : out std_logic := '0'
    );
end component;

signal Clk : std_logic := '0';
signal input : std_logic_vector(7 downto 0) := (others => '0');
signal is_valid : std_logic := '0';

signal output : std_logic_vector(7 downto 0) := (others => '1');
signal VALID : std_logic := '0';

signal Clk_period: time := 10 ns;

begin

DUT: Network_Sorting
    port map(
        Clk => Clk,
        input => input,
        is_valid => is_valid,

        output => output,
        VALID => VALID    
    );

Clk <= not Clk after Clk_period/2;

stim_p: process
begin
    wait for 400 ns;
    input <= "00000101";
    is_valid <= '1';
    wait for 10 ns;
    is_valid <= '0';
    wait for 100000 ns;
    
end process;


end Behavioral;
