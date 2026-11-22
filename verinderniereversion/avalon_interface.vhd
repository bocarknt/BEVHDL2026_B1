library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;





entity avalon_interface is
    port (
        clk : in  std_logic;
        reset_n  : in  std_logic;
        chipselect   : in  std_logic;
        write_n  : in  std_logic;
        address    : in  std_logic_vector(2 downto 0);
        writedata  : in  std_logic_vector(31 downto 0);
        readdata    : out std_logic_vector(31 downto 0);

        -- Signaux vers les autres blocs
        freq_reg   : out std_logic_vector(31 downto 0);
        duty_reg  : out std_logic_vector(31 downto 0);
        butee_g_reg  : out std_logic_vector(11 downto 0);
        butee_d_reg : out std_logic_vector(11 downto 0);
        config_reg  : out std_logic_vector(31 downto 0);
        angle_barre  : in  std_logic_vector(11 downto 0);
        fin_course_d_in : in  std_logic;
        fin_course_g_in : in  std_logic
    );
end entity;








architecture rtl of avalon_interface is

    -- Registres internes pour memoriser ce que le Nios envoie
    signal reg_freq  : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_duty : std_logic_vector(31 downto 0) := (others => '0');
    signal reg_butee_g : std_logic_vector(11 downto 0) := (others => '0');
    signal reg_butee_d : std_logic_vector(11 downto 0) := (others => '0');
    signal reg_config  : std_logic_vector(31 downto 0) := (others => '0');

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
begin

    -- Processus d'ecriture depuis le Nios II
    ecriture : process(clk, reset_n)
    begin
        if (reset_n = '0') then
            reg_freq    <= (others => '0');
            reg_duty    <= (others => '0');
            reg_butee_g <= (others => '0');
            reg_butee_d <= (others => '0');
            reg_config  <= (others => '0');
        elsif (clk'event and clk = '1') then
            if (chipselect = '1' and write_n = '0') then
                case address is
                    when "000" =>
                        reg_freq <= writedata;
                    when "001" =>
                        reg_duty <= writedata;
                    when "010" =>
                        reg_butee_g <= writedata(11 downto 0);
                    when "011" =>
                        reg_butee_d <= writedata(11 downto 0);
                    when "100" =>
                        reg_config <= writedata;
                    when others =>
                        null;
                end case;
            end if;
        end if;
    end process;
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 

    -- On relie les registres aux sorties du bloc
    freq_reg    <= reg_freq;
    duty_reg    <= reg_duty;
    butee_g_reg <= reg_butee_g;
    butee_d_reg <= reg_butee_d;
    config_reg  <= reg_config;

	 
	 
	 
	 
	 
	 
    -- Processus de lecture pour renvoyer les valeurs au Nios II
    lecture : process(address, reg_freq, reg_duty, reg_butee_g, reg_butee_d, reg_config, angle_barre, fin_course_d_in, fin_course_g_in)
    begin
        readdata <= (others => '0'); -- valeur par defaut

        case address is
            when "000" =>
                readdata <= reg_freq;

            when "001" =>
                readdata <= reg_duty;

            when "010" =>
                readdata <= (others => '0');
                readdata(11 downto 0) <= reg_butee_g;

            when "011" =>
                readdata <= (others => '0');
                readdata(11 downto 0) <= reg_butee_d;

            when "100" =>
                readdata <= reg_config;
                -- On rajoute les fins de course sur les bits 3 et 4 comme dans le tableau
                readdata(3) <= fin_course_d_in;
                readdata(4) <= fin_course_g_in;

            when "101" =>
                readdata <= (others => '0');
                readdata(11 downto 0) <= angle_barre;

            when others =>
                readdata <= (others => '0');
        end case;
    end process;

end architecture;