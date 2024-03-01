----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2023 11:55:19
-- Design Name: 
-- Module Name: uart_transmitter - Behavioral
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

entity uart_transmitter is
    port (
      Clk : in std_logic;

------------------------------------------ decomment me for test
--      data : in std_logic_vector(3 downto 0);
      data : in std_logic_vector(7 downto 0);
      VALID : in std_logic;
      
      busy : out std_logic;
      Dout   : out std_logic := '1'
    );
end uart_transmitter;

architecture Behavioral of uart_transmitter is

component Baud_rate_generator_tx is
    port(
      Clk : in std_logic;
      BAUDRATE_out : out std_logic
    );
end component;

component FSM_tx is
    port(
      Clk : in std_logic;
      BAUDRATE_out : in std_logic;
      data : in std_logic_vector(7 downto 0);
      VALID : in std_logic;
      
      busy : out std_logic;
      Dout : out std_logic := '1'
    );
end component;

signal BAUDRATE_out : std_logic;
------------------------------------------ decomment me for test
-- signal data_comb : std_logic_vector(7 downto 0) := "01100000";

begin

comp0: Baud_rate_generator_tx
    port map (
      Clk => Clk,
      BAUDRATE_out => BAUDRATE_out
    );

comp1: FSM_tx
    port map (
      Clk => Clk,
      BAUDRATE_out => BAUDRATE_out,
------------------------------------------ decomment me for test
--      data => data_comb,
      data => data,
      VALID => VALID,
      
      busy => busy,
      Dout => Dout
    );
    
------------------------------------------ decomment me for test
-- data_comb(0) <= data(0);
-- data_comb(1) <= data(1);
-- data_comb(2) <= data(2);
-- data_comb(3) <= data(3);

end Behavioral;
