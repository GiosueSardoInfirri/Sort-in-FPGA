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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Baud_rate_generator_rx is
    port(
      Clk : in std_logic;
      Din : in std_logic;
      BAUDRATE_out : out std_logic := '0'
    );
end Baud_rate_generator_rx;

architecture Behavioral of Baud_rate_generator_rx is

signal clk_counter : integer := 2;
constant max_baud : integer := 434; --3; --
signal boud_counter : integer := 3;
constant max_counter : integer := 868; --6; --

type state_t is (idle, start, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, stop);
signal State : state_t;

signal pulse_out : std_logic := '0';
signal shifted : std_logic := '0';
signal Enable : std_logic := '0';


begin

pulse_generator : process(Clk) is
begin
    if (rising_edge(Clk) and (Enable = '1')) then
        clk_counter <= clk_counter + 1;

        if(clk_counter > max_counter) then
            clk_counter <= 2;
            pulse_out <= '1';
        else
            pulse_out <= '0';
        end if;
    end if;
end process pulse_generator;



state_machine : process(Clk) is
begin
    if rising_edge(Clk) then
        case State is
            when idle => if (Din = '0') then
                             State <= start;
                             Enable <= '1';
                         end if;
            when start => if (pulse_out = '1') then
                             State <= bit0;
                          end if;
            when bit0 => if (pulse_out = '1') then
                             State <= bit1;
                         end if;
            when bit1 => if (pulse_out = '1') then
                             State <= bit2;
                         end if;
            when bit2 => if (pulse_out = '1') then
                             State <= bit3;
                         end if;
            when bit3 => if (pulse_out = '1') then
                             State <= bit4;
                         end if;
            when bit4 => if (pulse_out = '1') then
                             State <= bit5;
                         end if;
            when bit5 => if (pulse_out = '1') then
                             State <= bit6;
                         end if;
            when bit6 => if (pulse_out  = '1') then
                             State <= bit7;
                         end if;
            when bit7 => if (pulse_out = '1') then
                             State <= idle; -- stop;
                             Enable <= '0';
                         end if;
            when others  => State <= idle;
        end case;
   end if;
end process state_machine;    


baud_rate_generator : process(Clk) is
begin
    if rising_edge(Clk) then
    
        if pulse_out = '1' then
            shifted <= '1';
        end if;
        
        if shifted = '1' then
            boud_counter <= boud_counter + 1;
        end if;
        
        if(boud_counter > max_baud) then
            boud_counter <= 3;
            BAUDRATE_out <= '1';
            shifted <= '0';
        else
            BAUDRATE_out <= '0';
        end if;

    end if;
end process baud_rate_generator;

end Behavioral;
