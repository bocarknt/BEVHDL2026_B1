library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity proj1tpled is
    generic (
        max : natural := 50000000 
    );
    port (
        clk :in  STD_LOGIC;
        rst :in  STD_LOGIC;
        led :out STD_LOGIC_VECTOR(3 downto 0)
    );
end proj1tpled;

architecture Beh of proj1tpled is
    signal s_comp :STD_LOGIC_VECTOR(3 downto 0);
	 signal d :STD_LOGIC_VECTOR(3 downto 0) :="1000";
	 signal clk1 : STD_LOGIC;
begin

    process(clk, rst)
        variable temp :integer range 0 to max;
    begin
        if rst = '0' then
            temp :=0;
            s_comp<= "0000";
        elsif rising_edge(clk) then
            if (temp= max) then
                temp :=0;
                s_comp<=s_comp+ 1; 
					 clk1 <='1';
            else
                temp :=temp +1;
					 clk1 <='0';
				 end if;
            end if;
       
    end process;
	 
	 process(clk, rst)
		variable temp1 :integer range 0 to max;
	 begin
		if rst = '0' then
            temp1 :=0;
            d<= "1000";
	  elsif rising_edge(clk) then
		if (temp1=max)then
			temp1:=0;
			 d<= d(0) & d(3 downto 1) ;
		  else
                temp1 :=temp1 +1;		
			
		end if;
		end if;
	 
	 end process;
	

  
    led <= d;

end Beh;
