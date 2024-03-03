----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 26.02.2024 12:25:39
-- Design Name: 
-- Module Name: uart_receiver - Behavioral
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

entity uart_receiver is

    port (
      Clk : in std_logic;
      Din : in std_logic;

      led_is_valid : out std_logic := '0';

      data_valid : out std_logic_vector(7 downto 0);
      is_valid : out std_logic
    );

end uart_receiver;

architecture Behavioral of uart_receiver is

component Baud_rate_generator_rx is
    port(
      Clk : in std_logic;
      Din : in std_logic;
      BAUDRATE_out : out std_logic
    );
end component;

component FSM_rx is
    port(
      Clk : in std_logic;
      BAUDRATE_out : in std_logic;
      Din : in std_logic;

      led_is_valid : out std_logic := '0';

      data_valid : out std_logic_vector(7 downto 0);
      is_valid : out std_logic
    );  
end component;

signal BAUDRATE_out_signal : std_logic;

begin

comp0: Baud_rate_generator_rx
    port map (
      Clk => Clk,
      Din => Din,
      
      BAUDRATE_out => BAUDRATE_out_signal
    );

comp1: FSM_rx
    port map (
      Clk => Clk,
      BAUDRATE_out => BAUDRATE_out_signal,
      Din => Din,
      
      led_is_valid => led_is_valid,

      data_valid => data_valid,
      is_valid => is_valid
    );

end Behavioral;