----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.10.2023 14:26:57
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM_rx is
    port(
      Clk : in std_logic;
      BAUDRATE_out : in std_logic;
      Din : in std_logic;

      led_is_valid : out std_logic := '0';

      data_valid : out std_logic_vector(7 downto 0) := (others => '0');
      is_valid : out std_logic := '0'
    );  
end FSM_rx;

architecture Behavioral of FSM_rx is

type state_t is (idle, start, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, stop);
signal State : state_t;
signal stop_bit : std_logic := '0';
signal data : std_logic_vector(7 downto 0);

begin

process(Clk) is
begin
   if rising_edge(Clk) then
           case State is
               when idle  =>     data <= (others => '0');
                                 is_valid <= '0';
                                 led_is_valid <= '0';
                                 if (BAUDRATE_out = '1') then
                                    State <= bit0;
                                    data(0) <= Din;
                                  end if;
--               when start => if (BAUDRATE_out = '1') then
--                                    State <= bit0;
--                                    data(0) <= Din;
--                                  end if;
               when bit0 => if (BAUDRATE_out = '1') then
                                    State <= bit1;
                                    data(1) <= Din;
                                  end if;
               when bit1 => if (BAUDRATE_out = '1') then
                                    State <= bit2;
                                    data(2) <= Din;
                                  end if;
               when bit2 => if (BAUDRATE_out = '1') then
                                    State <= bit3;
                                    data(3) <= Din;
                                  end if;
               when bit3 => if (BAUDRATE_out = '1') then
                                    State <= bit4;
                                    data(4) <= Din;
                                  end if;
               when bit4 => if (BAUDRATE_out = '1') then
                                    State <= bit5;
                                    data(5) <= Din;
                                  end if;
               when bit5 => if (BAUDRATE_out = '1') then
                                    State <= bit6;
                                    data(6) <= Din;
                                  end if;
               when bit6 => if (BAUDRATE_out = '1') then
                                    State <= bit7;
                                    data(7) <= Din;
                                  end if;
               when bit7 => if (BAUDRATE_out = '1') then
                                    State <= stop;
                                    stop_bit <= Din; -- se torna in stop, allora va ad 1
                                  end if;
               when stop => if (stop_bit = '1') then
                                    State <= idle;
                                    data_valid <= data;
                                    is_valid <= '1';
                                    led_is_valid <= '1';
                                    stop_bit <= '0';
                            elsif (stop_bit = '0') then
                                    State <= idle;
                            end if;
               when others  => State <= idle;
           end case;
       end if;
end process;

end Behavioral;
