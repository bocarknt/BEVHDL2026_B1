--librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



entity timerled is
	generic(max: natural :=50000000); -- 50 Mhz
	port(clk: in std_logic;
			rst: in std_logic;
			led: out std_logic_vector(3 downto 0));

end timerled;


architecture blink of timerled is
 
begin 
	process(clk,rst)
		variable temp: integer range 0 to max;
		variable tout:std_logic_vector(3 downto 0);
		begin
			if(rst='0') then 
				led <="0000";
				temp:=0;
				tout:="0000";
				
				
			elsif (rising_edge(clk)) then
				temp:=temp+1;
					if (temp=max) then
						temp:=0;
						tout:= tout+1;
						
						if (tout = "1010") then
							tout:="0000";
						end if;
						led<=tout;
							
					end if;
					
			end if;
		end process;
		
		

end blink;