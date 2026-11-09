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
        butee_g_reg : out std_logic_vector(11 downto 0);
        butee_d_reg : out std_logic_vector(11 downto 0);
        config_reg  : out std_logic_vector(31 downto 0);
        angle_barre : in  std_logic_vector(11 downto 0)
    );
end entity;

architecture rtl of avalon_interface is
    signal butee_g_s : std_logic_vector(11 downto 0) := (others => '0');
    signal butee_d_s : std_logic_vector(11 downto 0) := (others => '0');
    signal config_s  : std_logic_vector(31 downto 0) := (others => '0');
begin

    process(clk, reset_n)
    begin
        if reset_n = '0' then
            butee_g_s <= (others => '0');
            butee_d_s <= (others => '0');
            config_s  <= (others => '0');
         elsif rising_edge(clk) then
            if chipselect = '1' and write_n = '0' then
                case address is
                    when "000" => butee_g_s <= writedata(11 downto 0);
                    when "001" => butee_d_s <= writedata(11 downto 0);
                    when "010" => config_s  <= writedata;
                    when others => null;
                end case;
            end if;
        end if;
    end process;

    butee_g_reg <= butee_g_s;
    butee_d_reg <= butee_d_s;
    config_reg  <= config_s;

    -- Multiplexage de la relecture sur le bus Avalon
    process(address, butee_g_s, butee_d_s, config_s, angle_barre)
    begin
        readdata <= (others => '0');
        case address is
            when "000" => readdata(11 downto 0) <= butee_g_s;
            when "001" => readdata(11 downto 0) <= butee_d_s;
            when "010" => readdata <= config_s;
            when "011" => readdata(11 downto 0) <= angle_barre;
            when others => readdata <= (others => '0');
        end case;
    end process;

end architecture;