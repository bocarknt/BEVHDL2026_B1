library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;








entity avalon_interface is
    port (
        clk         : in  std_logic;
        reset_n     : in  std_logic;
        chipselect  : in  std_logic;
        write_n     : in  std_logic;
        address     : in  std_logic_vector(2 downto 0);
        writedata   : in  std_logic_vector(31 downto 0);
        readdata    : out std_logic_vector(31 downto 0);
        
        -- Sorties vers les autres blocs du sys
        freq_reg    : out std_logic_vector(31 downto 0);
        duty_reg    : out std_logic_vector(31 downto 0);
        butee_g_reg : out std_logic_vector(11 downto 0);
        butee_d_reg : out std_logic_vector(11 downto 0);
        config_reg  : out std_logic_vector(31 downto 0);
        angle_barre : in  std_logic_vector(11 downto 0)
    );
end entity;







architecture rtl of avalon_interface is
    signal freq_s    : std_logic_vector(31 downto 0) := (others => '0');
    signal duty_s    : std_logic_vector(31 downto 0) := (others => '0');
    signal butee_g_s : std_logic_vector(11 downto 0) := (others => '0');
    signal butee_d_s : std_logic_vector(11 downto 0) := (others => '0');
    signal config_s  : std_logic_vector(31 downto 0) := (others => '0');
begin








    -- Processus d'écriture synchr(Commandes du NIOS vers les registres)
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            freq_s    <= (others => '0');
            duty_s    <= (others => '0');
            butee_g_s <= (others => '0');
            butee_d_s <= (others => '0');
            config_s  <= (others => '0');
        elsif rising_edge(clk) then
            if chipselect = '1' and write_n = '0' then
                case address is
                    when "000" => freq_s    <= writedata;                 -- Adresse 0: freq
                    when "001" => duty_s    <= writedata;                 -- Adresse 1: duty
                    when "010" => butee_g_s <= writedata(11 downto 0);    -- Adresse 2: Butee_g
                    when "011" => butee_d_s <= writedata(11 downto 0);    -- Adresse 3: Butee_d
                    when "100" => config_s  <= writedata;                 -- Adresse 4: config
                    when others => null;
                end case;
            end if;
        end if;
    end process;
	 
	 
	 
	 
	 

    -- Assignation des sorties de registres
    freq_reg    <= freq_s;
    duty_reg    <= duty_s;
    butee_g_reg <= butee_g_s;
    butee_d_reg <= butee_d_s;
    config_reg  <= config_s;

	 
	 
	 
	 
	 
    -- Processus de relecture sur le bus Avalon (Du matériel vers le NIOS)
    process(address, freq_s, duty_s, butee_g_s, butee_d_s, config_s, angle_barre)
    begin
        readdata <= (others => '0');
        case address is
            when "000" => readdata <= freq_s;                        -- Adresse 0: freq
            when "001" => readdata <= duty_s;                        -- Adresse 1: duty
            when "010" => readdata(11 downto 0) <= butee_g_s;        -- Adresse 2: Butee_g
            when "011" => readdata(11 downto 0) <= butee_d_s;        -- Adresse 3: Butee_d
            when "100" => readdata <= config_s;                      -- Adresse 4: config
            when "101" => readdata(11 downto 0) <= angle_barre;      -- Adresse 5: Angle_barre
            when others => readdata <= (others => '0');
        end case;
    end process;

end architecture;