----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2024 11:16:38
-- Design Name: 
-- Module Name: UART - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART_sorter is
  port (
    Clk : in std_logic;
    Din : in std_logic;

    led_still_moving : out std_logic := '0';
    led_is_valid : out std_logic := '0';
    led_VALID : out std_logic := '0';

    busy : out std_logic;
    Dout : out std_logic := '1'
  );
end UART_sorter;

architecture Behavioral of UART_sorter is

component uart_receiver is
    port (
      Clk : in std_logic;
      Din : in std_logic;
      
      led_is_valid : out std_logic := '0';

      data_valid : out std_logic_vector(7 downto 0);
      is_valid : out std_logic
    );
end component;

component Network_Sorting is
    Port (
        Clk : in std_logic;
        input : in std_logic_vector(7 downto 0);
        is_valid : in std_logic;

        led_still_moving : out std_logic := '0';
        led_VALID : out std_logic := '0';

        output : out std_logic_vector(7 downto 0) := (others => '1');
        VALID : out std_logic := '0'
    );
end component;


component uart_transmitter is
    port (
      Clk : in std_logic;
      data : in std_logic_vector(7 downto 0);
      VALID : in std_logic;
      
      busy : out std_logic;
      Dout : out std_logic := '1'
    );
end component;

signal data_signal_rx: std_logic_vector(7 downto 0);
signal valid_signal_rx: std_logic;
signal data_signal_tx : std_logic_vector(7 downto 0);
signal valid_signal_tx : std_logic;

begin


comp_rx: uart_receiver 
    port map(
      Clk => Clk,
      Din => Din,
      
      led_is_valid => led_is_valid,

      data_valid => data_signal_rx,
      is_valid => valid_signal_rx
    );

    
comp_sort: Network_Sorting
    port map(
        Clk => Clk,
        input => data_signal_rx,
        is_valid => valid_signal_rx,
        
        led_still_moving => led_still_moving,
        led_VALID => led_VALID,
 
        output => data_signal_tx,
        VALID => valid_signal_tx
    );

comp_tx: uart_transmitter
    port map(
      Clk => Clk,
      data => data_signal_tx,
      VALID => valid_signal_tx,
      
      busy => busy,
      Dout => Dout
    );


end Behavioral;
