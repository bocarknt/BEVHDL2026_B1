library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity avalon_cap is
    port(
        clk           : in  std_logic;
        reset_n       : in  std_logic;
        address       : in  std_logic_vector(0 downto 0);
        read          : in  std_logic;
        readdata      : out std_logic_vector(31 downto 0);
        write         : in  std_logic;
        writedata     : in  std_logic_vector(31 downto 0);
        waitrequest   : out std_logic;
        in_pwm_compas : in  std_logic;
        led           : out std_logic_vector(8 downto 0)
    );
end entity avalon_cap;

architecture rtl of avalon_cap is

    component cap is
        generic(
            MAX_DIV : natural := 5000;
            MAX_1S  : natural := 49_999_999
        );
        port(
            clk_50M       : in  std_logic;
            raz_n         : in  std_logic;
            start_stop    : in  std_logic;
            in_pwm_compas : in  std_logic;
            continu       : in  std_logic;
            data_valid    : out std_logic;
            data_compas   : out std_logic_vector(8 downto 0);
            out_1s        : out std_logic;
            led           : out std_logic_vector(8 downto 0)
        );
    end component;

    signal reg_continu    : std_logic := '1'; 
    signal reg_start_stop : std_logic := '1';
    signal data_valid     : std_logic;
    signal data_compas    : std_logic_vector(8 downto 0);
    signal out_1s         : std_logic;

begin
    waitrequest <= '0';

    inst_cap : cap
        generic map(
            MAX_DIV => 5000,
            MAX_1S  => 49_999_999
        )
        port map(
            clk_50M       => clk,
            raz_n         => reset_n,
            start_stop    => reg_start_stop,
            in_pwm_compas => in_pwm_compas,
            continu       => reg_continu,
            data_valid    => data_valid,
            data_compas   => data_compas,
            out_1s        => out_1s,
            led           => led
        );

    -- Processus d'écriture (synchrone)
    process(clk, reset_n)
    begin
        if reset_n = '0' then
            reg_continu    <= '1';
            reg_start_stop <= '0';
        elsif rising_edge(clk) then
            if write = '1' then
                if address = "0" then  -- Écriture à l'adresse 0 (config)
                    reg_continu    <= writedata(1);  -- Bit 1 : Mode continu
                    reg_start_stop <= writedata(2);  -- Bit 2 : Start / Stop
                end if;
            end if;
        end if;
    end process;

    -- Processus de lecture (combinatoire pour l'interface Avalon)
    process(read, address, reg_continu, reg_start_stop, data_valid, out_1s, data_compas)
    begin
        readdata <= (others => '0');
        if read = '1' then
            if address = "0" then
                readdata(0)  <= '1';             -- raz_n état actif
                readdata(1)  <= reg_continu;
                readdata(2)  <= reg_start_stop;
                readdata(9)  <= data_valid;
                readdata(10) <= out_1s;
            else
                readdata(8 downto 0) <= data_compas;
            end if;
        end if;
    end process;

end architecture rtl;