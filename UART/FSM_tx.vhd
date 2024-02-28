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

entity FSM_tx is
    port(
      Clk : in std_logic;
      BAUDRATE_out : in std_logic;
      data : in std_logic_vector(7 downto 0);
      VALID : in std_logic;
      
      busy : out std_logic := '0';
      Dout   : out std_logic := '1'
    );  
end FSM_tx;

architecture Behavioral of FSM_tx is

type state_t is (idle, data_valid, start, bit0, bit1, bit2, bit3, bit4, bit5, bit6, bit7, stop);
signal State : state_t;

begin

process(Clk) is
begin
   if rising_edge(Clk) then
           case State is
               when idle    =>  busy <= '0';
                                Dout <= '1';
                                if (VAlID = '1') then
                                    State <= data_valid;
                                end if;  
               when data_valid => busy <= '1';
                                  if (BAUDRATE_out = '1') then
                                    State <= start;
--                                    Dout <= '1';
                                  end if;
               when start => if (BAUDRATE_out = '1') then
                                    State <= bit0;
                                    Dout <= '0';
                                  end if;
               when bit0 => if (BAUDRATE_out = '1') then
                                    State <= bit1;
                                    Dout <= data(0);
                                  end if;
               when bit1 => if (BAUDRATE_out = '1') then
                                    State <= bit2;
                                    Dout <= data(1);
                                  end if;
               when bit2 => if (BAUDRATE_out = '1') then
                                    State <= bit3;
                                    Dout <= data(2);
                                  end if;
               when bit3 => if (BAUDRATE_out = '1') then
                                    State <= bit4;
                                    Dout <= data(3);
                                  end if;
               when bit4 => if (BAUDRATE_out = '1') then
                                    State <= bit5;
                                    Dout <= data(4);
                                  end if;
               when bit5 => if (BAUDRATE_out = '1') then
                                    State <= bit6;
                                    Dout <= data(5);
                                  end if;
               when bit6 => if (BAUDRATE_out = '1') then
                                    State <= bit7;
                                    Dout <= data(6);
                                  end if;
               when bit7 => if (BAUDRATE_out = '1') then
                                    State <= stop;
                                    Dout <= data(7);
                                  end if;
               when stop => if (BAUDRATE_out = '1') then
                                    State <= idle;
                                    Dout <= '1';
                                  end if;
               when others  => State <= idle;
--                               Dout <= '1';
--                               busy <= '0'; 
           end case;
       end if;
end process;

end Behavioral;
