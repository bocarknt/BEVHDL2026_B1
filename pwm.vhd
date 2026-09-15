
-- Entité PWM

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm is
    port (
        clk              : in  std_logic;                     -- Clk 50MHz
        rst              : in  std_logic;                     -- reset asynchrone
		  boutton          : in  std_logic; -- variateur
       -- rapport_cyclique : in  std_logic_vector(9 downto 0);   -- duty cycle 10 bits
        pwm              : out std_logic                      -- sortie PWM (1 bit)
    );
end entity pwm;


architecture rtl of pwm is

    signal compteur : unsigned(9 downto 0) := (others => '0');
	 signal rapport_cyclique : unsigned(9 downto 0):= to_unsigned(512,10);




begin

	process(rst,clk,boutton)
	variable cpt : integer range 0 to 3;
	begin
		if rst = '0' then
			rapport_cyclique <= to_unsigned(150,10);
			cpt := 0;
		elsif boutton = '0' then
			cpt := cpt + 1;
		end if;
		if cpt = 0 then
			rapport_cyclique <= to_unsigned(150,10);
		end if;
		if cpt = 1 then
			rapport_cyclique <= to_unsigned(250,10);
		end if;
		if cpt = 2 then
			rapport_cyclique <= to_unsigned(500,10);
		end if;
		if cpt = 3 then
			rapport_cyclique <= to_unsigned(750,10);
		end if;
	end process;
    -- Bloc "Compteur 10 bits" : compteur libre 0 -> 1023 -> 0 
    process(rst,clk)
    begin
        if rst = '0' then
            compteur <= (others => '0');
        elsif rising_edge(clk) then
            compteur <= compteur + 1;   -- déborde naturellement à 1023
        end if;
    end process;

    
    -- Bloc "Comparateur" : compare compteur vs rapport_cyclique
   
    process(clk, rst)
    begin
        if rst = '0' then
            pwm <= '0';
        elsif rising_edge(clk) then
            if compteur < unsigned(rapport_cyclique) then
                pwm <= '1';
            else
                pwm <= '0';
            end if;
        end if;
    end process;

end architecture rtl;