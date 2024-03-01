----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 17:00:27
-- Design Name: 
-- Module Name: Network Sorting - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Network_Sorting is
    Port (
        Clk : in std_logic;
        input : in std_logic_vector(7 downto 0);
        is_valid : in std_logic;

        output : out std_logic_vector(7 downto 0) := (others => '1');
        VALID : out std_logic := '0'
    );
end Network_Sorting;

architecture Behavioral of Network_Sorting is

signal value0, value1, value2, value3, value4, dummy0, dummy1 : std_logic_vector(7 downto 0) := (others => '0');

signal max_rand : unsigned(2 downto 0) := "101";
signal VALID_counter : unsigned(2 downto 0) := (others => '0');
signal allocate, still_moving : std_logic := '1';
signal to_swap0, to_swap1, to_swap2, to_swap3 : std_logic := '1';
signal swap0, swap1, swap2, swap3 : std_logic := '1';
signal start0, start1, start2, start3 : std_logic := '0';

begin

allocation : process(Clk) is
begin
    if rising_edge(Clk) and is_valid = '1' then

        if allocate = '1' then
            VALID_counter <= VALID_counter + 1;
        end if;
        
        if VALID_counter = (max_rand - 1) then
            allocate <= '0';
        end if;
        
    end if; 
end process allocation;

switch_0 : process(Clk) is
begin

    if rising_edge(Clk) and is_valid = '1' then
        value0 <= input;
        start0 <= '1';
    end if;
    
    if rising_edge(Clk) and still_moving = '1' and start0 = '1' then
        if to_swap0 = '1' then
            if unsigned(value0) > unsigned(value1) then
                dummy0 <= value1;
                dummy1 <= value0;
            else
                dummy0 <= value0;
                dummy1 <= value1;
            end if;
            to_swap0 <= '0';
        elsif swap0 = '1' then
            value0 <= dummy0;
            value1 <= dummy1;
            swap0 <= '0';
            start0 <= '0';
        end if;
    end if;

end process switch_0;

end Behavioral;
