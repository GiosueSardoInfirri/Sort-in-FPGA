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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity UART is
  port ( 
    Clk : in std_logic;
    Din : in std_logic;
  
    busy : out std_logic;
    Dout : out std_logic := '1'
  );
end UART;

architecture Behavioral of UART is

component uart_receiver is
    port (
      Clk : in std_logic;
      Din : in std_logic;
      
      data_valid : out std_logic_vector(7 downto 0);
      is_valid : out std_logic
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

signal data_signal : std_logic_vector(7 downto 0);
signal valid_signal : std_logic;

begin
comp_rx: uart_receiver 
    port map(
      Clk => Clk,
      Din => Din,
      
      data_valid => data_signal,
      is_valid => valid_signal 
    );

comp_tx: uart_transmitter
    port map(
      Clk => Clk,
      data => data_signal,
      VALID => valid_signal,
      
      busy => busy,
      Dout => Dout
    );


end Behavioral;
