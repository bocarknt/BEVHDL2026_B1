library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;









entity gestion_verin is 
    port (
        clk : in  std_logic;
        reset_n : in  std_logic;
        -- Signaux du bus Avalon
          chipselect : in  std_logic;
        write_n : in  std_logic;
        address : in  std_logic_vector(2 downto 0);
        writedata : in  std_logic_vector(31 downto 0);
         readdata : out std_logic_vector(31 downto 0);
        
        -- Signaux externes de la carte
        data_in : in  std_logic;
        pwm_in : in  std_logic;
         sens_in : in  std_logic;
        out_pwm : out std_logic;
        out_sens : out std_logic;
        cs_n : out std_logic;
        clk_adc : out std_logic 
    );
end entity;









architecture simple of gestion_verin is

    -- Signaux intern pour relier les sous-blocs 
    -- signal s_freq : std_logic_vector(31 downto 0);
    -- signal s_duty : std_logic_vector(31 downto 0);
    signal s_butee_g : std_logic_vector(11 downto 0);
    signal s_butee_d : std_logic_vector(11 downto 0);
    signal s_config : std_logic_vector(31 downto 0);
    signal s_angle : std_logic_vector(11 downto 0);
    signal s_fc_g : std_logic;
    signal s_fc_d : std_logic;

begin





    -- Bloc interface avec le bus Avalon
    U_AVALON : entity work.avalon_interface
        port map (
            clk  => clk,
            reset_n => reset_n,
            chipselect => chipselect,
            write_n => write_n,
            address => address,
            writedata => writedata,
            readdata => readdata,
            freq_reg => open,
            duty_reg => open,
            butee_g_reg => s_butee_g,
            butee_d_reg => s_butee_d,
            config_reg => s_config,
            angle_barre => s_angle,
            fin_course_d_in => s_fc_d,
            fin_course_g_in => s_fc_g
        );

		  
		  
		  
		  
		  
		  
    -- Bloc Gestion du convertisseur ADC
    U_ADC : entity work.adc_wapper
        port map (
            clk => clk,
            reset_n => reset_n,
            data_in => data_in,
            cs_n => cs_n,
            clk_adc => clk_adc,
            angle_barre => s_angle
        );
		  
		  
		  
		  
		  
		  
		  
		  
		  

    -- Bloc Verif des butees dr et gau
    U_BUTEE : entity work.controle_butees
        port map (
            pwm_in => pwm_in,
            sens_in => sens_in,
            angle_barre => s_angle,
            butee_g => s_butee_g,
            butee_d => s_butee_d,
            pwm_safe => out_pwm,
            sens_safe => out_sens,
            fin_course_g => s_fc_g,
            fin_course_d => s_fc_d
        );

end architecture;