library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gestion_verin is
    port (
        clk         : in  std_logic;
        reset_n     : in  std_logic;
        -- Interface Bus Avalon
        chipselect  : in  std_logic;
        write_n     : in  std_logic;
        address     : in  std_logic_vector(2 downto 0);
        writedata   : in  std_logic_vector(31 downto 0);
        readdata    : out std_logic_vector(31 downto 0);
        
        -- Entrées / Sorties externes
        data_in     : in  std_logic;       -- Entrée série ADC MCP3201
        pwm_in      : in  std_logic;       -- PWM provenant du SOPC
        sens_in     : in  std_logic;       -- Sens provenant du SOPC / config
        out_pwm     : out std_logic;       -- PWM sécurisée vers le moteur
        out_sens    : out std_logic;       -- Sens sécurisé vers le moteur
        cs_n        : out std_logic;       -- Chip Select ADC
        clk_adc     : out std_logic        -- Horloge ADC (1 MHz)
    );
end entity;

architecture simple of gestion_verin is
    signal butee_g_sig : std_logic_vector(11 downto 0);
    signal butee_d_sig : std_logic_vector(11 downto 0);
    signal config_sig  : std_logic_vector(31 downto 0);
    signal angle_sig   : std_logic_vector(11 downto 0);
begin

    -- 1. Interface Avalon simplifiée (uniquement pour les butées, config et relecture angle)
    U_AVALON: entity work.avalon_interface
        port map (
            clk         => clk,
            reset_n     => reset_n,
            chipselect  => chipselect,
            write_n     => write_n,
            address     => address,
            writedata   => writedata,
            readdata    => readdata,
            butee_g_reg => butee_g_sig,
            butee_d_reg => butee_d_sig,
            config_reg  => config_sig,
            angle_barre => angle_sig
        );

    -- 2. Pilote ADC (Machine à états pour lire l'angle)
    U_ADC: entity work.adc_wapper
        port map (
            clk         => clk,
            reset_n     => reset_n,
            data_in     => data_in,
            cs_n        => cs_n,
            clk_adc     => clk_adc,
            angle_barre => angle_sig
        );

    -- 3. Sécurité des butées (Intercepte la PWM du SOPC et coupe si hors limites)
    U_BUTEE: entity work.controle_butees
        port map (
            pwm_in      => pwm_in,
            sens_in     => sens_in,
            angle_barre => angle_sig,
            butee_g     => butee_g_sig,
            butee_d     => butee_d_sig,
            pwm_safe    => out_pwm,
            sens_safe   => out_sens
        );

end architecture;
