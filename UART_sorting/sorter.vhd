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
signal reset, one_clock : std_logic := '0';

signal clk_counter : integer := 2;
constant max_counter : integer := 12*868; --6; --
signal pulse : std_logic := '0';
signal stop_all : std_logic := '0';

signal still_moving_counter : integer := 2;
constant sm_max_counter : integer := 4*12*868; --6; --


type state_t is (idle, send_v_1, send_v_2, send_v_3, send_v_4, stop);
signal State : state_t;

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

pulse_generator : process(Clk) is 
begin 
    if rising_edge(Clk) and still_moving = '0' then
        clk_counter <= clk_counter + 1;

        if stop_all = '1' then
            pulse <= '0';   
        elsif(clk_counter > max_counter) then
            clk_counter <= 2;
            pulse <= '1';
        else
            pulse <= '0';
        end if;
    end if;
end process pulse_generator;

switch : process(Clk) is
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
            start1 <= '1';
        end if;
    end if;

    if rising_edge(Clk) and still_moving = '1' and start1 = '1' then
        if to_swap1 = '1' then
            if unsigned(value1) > unsigned(value2) then
                dummy0 <= value2;
                dummy1 <= value1;
            else
                dummy0 <= value1;
                dummy1 <= value2;
            end if;
            to_swap1 <= '0';
        elsif swap1 = '1' then
            value1 <= dummy0;
            value2 <= dummy1;
            swap1 <= '0';
            start1 <= '0';
            start2 <= '1';
        end if;
    end if;

    if rising_edge(Clk) and still_moving = '1' and start2 = '1' then
        if to_swap2 = '1' then
            if unsigned(value2) > unsigned(value3) then
                dummy0 <= value3;
                dummy1 <= value2;
            else
                dummy0 <= value2;
                dummy1 <= value3;
            end if;
            to_swap2 <= '0';
        elsif swap2 = '1' then
            value2 <= dummy0;
            value3 <= dummy1;
            swap2 <= '0';
            start2 <= '0';
            start3 <= '1';
        end if;
    end if;

    if rising_edge(Clk) and still_moving = '1' and start3 = '1' then
        if to_swap3 = '1' then
            if unsigned(value3) > unsigned(value4) then
                dummy0 <= value4;
                dummy1 <= value3;
            else
                dummy0 <= value3;
                dummy1 <= value4;
            end if;
            to_swap3 <= '0';
        elsif swap3 = '1' then
            value3 <= dummy0;
            value4 <= dummy1;
            swap3 <= '0';
            start3 <= '0';

            -- update the variables
            reset <= '1';
        end if;
    end if;

    if rising_edge(Clk) and reset = '1' then
        to_swap0 <= '1';
        to_swap1 <= '1';
        to_swap2 <= '1';
        to_swap3 <= '1';

        swap0 <= '1';
        swap1 <= '1';
        swap2 <= '1';
        swap3 <= '1';

        reset <= '0';
        
        if allocate = '0' then
            one_clock <= '1';
            output <= value0;
            VALID <= '1';
        end if;
    end if;


    if rising_edge(Clk) and reset = '0' and one_clock <= '1' then
        -- procedure di output
        VALID <= '0';
        one_clock <= '0';
    end if;


    if rising_edge(Clk) and still_moving = '0' then
       case State is
        when idle     => VALID <= '0';
                         if pulse = '1' then
                             State <= send_v_1;
                             value0 <= (others => '0');
                         end if;
        when send_v_1 => if pulse = '1' then
                             output <= value1;
                             VALID <= '1';
                             value1 <= (others => '0');
                             State <= send_v_2;
                         else 
                           VALID <= '0';
                         end if;
       when send_v_2 =>  if pulse = '1' then
                             output <= value2;
                             VALID <= '1';
                             value2 <= (others => '0');
                             State <= send_v_3;
                         else 
                            VALID <= '0';
                         end if;
       when send_v_3 =>  if pulse = '1' then
                            output <= value3;
                            VALID <= '1';
                            value3 <= (others => '0');
                            State <= send_v_4;
                         else 
                            VALID <= '0';
                         end if;
       when send_v_4 =>  if pulse = '1' then
                            output <= value4;
                            VALID <= '1';
                            value4 <= (others => '0');
                            State <= stop;
                         else 
                            VALID <= '0';
                         end if;
       when stop    =>   if pulse = '1' then
                            State <= idle;
                            stop_all <= '1';
                         end if;
       when others  =>   State <= idle;                                 
           
     end case;              
   end if;


end process switch;

am_I_still_moving: process(Clk) is 
begin 
    if rising_edge(Clk) then
        if is_valid = '0' then
            still_moving_counter <= still_moving_counter + 1;
    
            if(still_moving_counter  > sm_max_counter) then
                still_moving <= '0';
            else
                still_moving <= '1';
            end if;
        else
            still_moving_counter <= 2;
        end if;
    end if;
 
end process am_I_still_moving;

end Behavioral;
