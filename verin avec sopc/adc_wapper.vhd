library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;





entity adc_wapper is
    port (
        clk  : in  std_logic;            
        reset_n : in  std_logic; 
        data_in : in  std_logic; -- Données série de ADC
        cs_n : out std_logic; -- Chip Select de l'ADC (actif bas)
        clk_adc : out std_logic; -- Horloge de conv ADC
        angle_barre : out std_logic_vector(11 downto 0) -- Val angle sur 12 bits
    );
end entity;







architecture rtl of adc_wapper is

    -- Def des états de la machine à états
    type state_type is (WAIT_START, START_CONV, SHIFT_DATA, STORE_DATA, WAIT_HIGH_CO);
    signal current_state, next_state : state_type;

    -- Compt et registres internes
    signal bit_count : integer range 0 to 15;
    signal shift_reg : std_logic_vector(11 downto 0);
    signal angle_s : std_logic_vector(11 downto 0);
    signal clk_div : std_logic;
    signal clk_div_cnt : integer range 0 to 24 := 0; -- Div horloge pour l'ADC
	 
	 
	 
	 

begin






    -- Div horloge pour générer clk_adc
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            clk_div_cnt <= 0;
            clk_div     <= '0';
        elsif rising_edge(clk) then
            if clk_div_cnt = 24 then
                clk_div     <= not clk_div;
                clk_div_cnt <= 0;
            else
                clk_div_cnt <= clk_div_cnt + 1;
            end if;
        end if;
    end process;

    clk_adc <= clk_div;

    -- Registre d'état synchr
    process(clk_div, reset_n)
    begin
        if reset_n = '0' then
            current_state <= WAIT_START;
        elsif rising_edge(clk_div) then
            current_state <= next_state;
        end if;
    end process;

    -- Logiq de transi et de sortie
    process(current_state, bit_count, data_in)
    begin
        
        next_state <= current_state;
        cs_n  <= '1';

        case current_state is
            when WAIT_START =>
                cs_n <= '1';
                next_state <= START_CONV;

            when START_CONV =>
                cs_n <= '0'; -- Active ADC
                next_state <= SHIFT_DATA;

            when SHIFT_DATA =>
                cs_n <= '0';
                if bit_count = 11 then
                    next_state <= STORE_DATA;
                else
                    next_state <= SHIFT_DATA;
                end if;

            when STORE_DATA =>
                cs_n <= '1';
                next_state <= WAIT_HIGH_CO;

            when WAIT_HIGH_CO =>
                cs_n <= '1';
                next_state <= WAIT_START; -- Boucle relâcher ou relancer une conversion

            when others =>
                next_state <= WAIT_START;
        end case;
    end process;

	 
	 
	 
	 
	 
	 
	 
	 
    process(clk_div, reset_n)
    begin
        if reset_n = '0' then
            shift_reg <= (others => '0');
            angle_s <= (others => '0');
            bit_count <= 0;
        elsif rising_edge(clk_div) then
            case current_state is
                when WAIT_START =>
                    bit_count <= 0;

                when START_CONV =>
                    bit_count <= 0;

                when SHIFT_DATA =>
                    -- Lecture du bit séquentiel sur data_in
                    shift_reg <= shift_reg(10 downto 0) & data_in;
                    if bit_count < 11 then
                        bit_count <= bit_count + 1;
                    end if;

                when STORE_DATA =>
                    angle_s <= shift_reg;

                when others =>
                    null;
            end case;
        end if;
    end process;

    angle_barre <= angle_s;

end architecture;