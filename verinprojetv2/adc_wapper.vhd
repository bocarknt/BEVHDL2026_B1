library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adc_wapper is
    port (
        clk         : in  std_logic;            
        reset_n     : in  std_logic; 
        data_in     : in  std_logic; -- Données série de l'ADC
        cs_n        : out std_logic; -- Chip Select de l'ADC (actif bas)
        clk_adc     : out std_logic; -- Horloge de conv ADC
        angle_barre : out std_logic_vector(11 downto 0) -- Val angle sur 12 bits
    );
end entity;

architecture rtl of adc_wapper is

    type state_type is (WAIT_START, ST_CONV, SHIFT_DATA, STORE_DATA, WAIT_HIGH_CO);
    signal current_state, next_state : state_type;

    signal bit_count     : integer range 0 to 15;
    signal shift_reg     : std_logic_vector(11 downto 0);
    signal angle_s       : std_logic_vector(11 downto 0);
    
    -- Gestion de l'horloge et du tick à 1 MHz
    signal clk_div       : std_logic;
    signal clk_div_cnt   : integer range 0 to 24 := 0; 
    signal clk_en        : std_logic; -- Impulsion d'un cycle à 1 MHz
    
    -- Génération des 100ms
    signal start_conv    : std_logic;
    signal ms_cnt        : integer range 0 to 5000000 := 0;
    
    -- Compteur de repos pour CS (WAIT_HIGH_CO)
    signal high_co_cnt   : integer range 0 to 5 := 0;

begin

    -- 1. Génération de l'horloge ADC (1 MHz) et du tic d'activation (clk_en)
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            clk_div_cnt <= 0;
            clk_div     <= '0';
            clk_en      <= '0';
        elsif rising_edge(clk) then
            clk_en <= '0';
            if clk_div_cnt = 24 then
                clk_div     <= not clk_div;
                clk_div_cnt <= 0;
                if clk_div = '1' then -- Front descendant de clk_div pour synchroniser le tic
                    clk_en <= '1';
                end if;
            else
                clk_div_cnt <= clk_div_cnt + 1;
            end if;
        end if;
    end process;

    clk_adc <= clk_div;

    -- 2. Génération périodique toutes les 100ms de start_conv (synchrone sur clk)
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            ms_cnt     <= 0;
            start_conv <= '0';
        elsif rising_edge(clk) then
            start_conv <= '0';
            if ms_cnt = 5000000 - 1 then
                ms_cnt     <= 0;
                start_conv <= '1'; 
            else
                ms_cnt     <= ms_cnt + 1;
            end if;
        end if;
    end process;

    -- 3. Registre d'état synchrone sur clk (cadencé par clk_en pour respecter le rythme 1MHz)
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            current_state <= WAIT_START;
        elsif rising_edge(clk) then
            if clk_en = '1' then
                current_state <= next_state;
            end if;
        end if;
    end process;

    -- 4. Logique de transition et de sortie
    process(current_state, bit_count, start_conv, high_co_cnt)
    begin
        next_state <= current_state;
        cs_n       <= '1';

        case current_state is
            when WAIT_START =>
                cs_n <= '1';
                if start_conv = '1' then
                    next_state <= ST_CONV;
                else
                    next_state <= WAIT_START;
                end if;

            when ST_CONV =>
                cs_n       <= '0'; -- Active l'ADC
                next_state <= SHIFT_DATA;

            when SHIFT_DATA =>
                cs_n <= '0';
                if bit_count = 11 then
                    next_state <= STORE_DATA;
                else
                    next_state <= SHIFT_DATA;
                end if;

            when STORE_DATA =>
                cs_n       <= '1';
                next_state <= WAIT_HIGH_CO;

            when WAIT_HIGH_CO =>
                cs_n <= '1';
                -- On attend quelques cycles de sécurité pour respecter le temps de repos du CS
                if high_co_cnt = 3 then
                    next_state <= WAIT_START;
                else
                    next_state <= WAIT_HIGH_CO;
                end if;

            when others =>
                next_state <= WAIT_START;
        end case;
    end process;

    -- 5. Comptage des fronts et registre à décalage
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            shift_reg   <= (others => '0');
            angle_s     <= (others => '0');
            bit_count   <= 0;
            high_co_cnt <= 0;
        elsif rising_edge(clk) then
            if clk_en = '1' then
                case current_state is
                    when WAIT_START =>
                        bit_count   <= 0;
                        high_co_cnt <= 0;

                    when ST_CONV =>
                        bit_count <= 0;

                    when SHIFT_DATA =>
                        shift_reg <= shift_reg(10 downto 0) & data_in;
                        if bit_count < 11 then
                            bit_count <= bit_count + 1;
                        end if;

                    when STORE_DATA =>
                        angle_s     <= shift_reg;
                        high_co_cnt <= 0;

                    when WAIT_HIGH_CO =>
                        if high_co_cnt < 3 then
                            high_co_cnt <= high_co_cnt + 1;
                        end if;

                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;

    angle_barre <= angle_s;

end architecture;