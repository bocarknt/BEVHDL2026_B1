library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adc_wapper is
    port (
        clk         : in  std_logic;
        reset_n     : in  std_logic;
        data_in     : in  std_logic;
        cs_n        : out std_logic;
        clk_adc     : out std_logic;
        angle_barre : out std_logic_vector(11 downto 0)
    );
end entity;

architecture rtl of adc_wapper is
    
    signal angle_s : unsigned(11 downto 0) := x"7D0"; 
begin
    cs_n    <= '0';
    clk_adc <= clk;
    angle_barre <= std_logic_vector(angle_s);
end architecture;