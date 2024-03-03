----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2023 11:39:20
-- Design Name: 
-- Module Name: Baud_rate_generator - Behavioral
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

entity Baud_rate_generator_tx is
    port(
      Clk : in std_logic;
      BAUDRATE_out : out std_logic
    );
end Baud_rate_generator_tx ;

architecture Behavioral of Baud_rate_generator_tx is

signal clk_counter : integer := 2;
constant max_counter : integer := 867; --868; --6; --

begin

process(Clk) is
begin
    if rising_edge(Clk) then
        clk_counter <= clk_counter + 1;

        if(clk_counter > max_counter) then
            clk_counter <= 2;
            BAUDRATE_out <= '1';
        else
            BAUDRATE_out <= '0';
        end if;
    end if;
end process;

end Behavioral;
