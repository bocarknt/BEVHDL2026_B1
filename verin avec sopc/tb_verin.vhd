library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;






entity tb_gestion_verin is
end entity;








architecture sim of tb_gestion_verin is
    -- Signaux de simu
    signal clk         : std_logic := '0';
    signal reset_n     : std_logic := '0';
    signal chipselect  : std_logic := '0';
    signal write_n     : std_logic := '1';
    signal address     : std_logic_vector(2 downto 0) := (others => '0');
    signal writedata   : std_logic_vector(31 downto 0) := (others => '0');
    signal readdata    : std_logic_vector(31 downto 0);
    signal data_in     : std_logic := '0';
    signal pwm_in      : std_logic := '0';
    signal sens_in     : std_logic := '0';
    signal out_pwm     : std_logic;
    signal out_sens    : std_logic;
    signal cs_n        : std_logic;
    signal clk_adc     : std_logic;

    -- Période de l'horloge sys (50 MHz -> 20 ns)
    constant CLK_PERIOD : time := 20 ns;
	 
	 
	 
	 
	 
	 
	 
	 
begin

    -- Instanciation du module princip
    uut: entity work.gestion_verin
        port map (
            clk         => clk,
            reset_n     => reset_n,
            chipselect  => chipselect,
            write_n     => write_n,
            address     => address,
            writedata   => writedata,
            readdata    => readdata,
            data_in     => data_in,
            pwm_in      => pwm_in,
            sens_in     => sens_in,
            out_pwm     => out_pwm,
            out_sens    => out_sens,
            cs_n        => cs_n,
            clk_adc     => clk_adc
        );

    -- Génération de l'horloge 50 MHz
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimuli de test
    stim_proc: process
    begin
	 
	 
	 
	 
        -- 1. Reset initial
        reset_n <= '0';
        pwm_in <= '0';
        sens_in <= '0';
        wait for 100 ns;
        reset_n <= '1';
        wait for 200 ns;

		  
		  
		  
		  
		  
        -- 2. Écriture des butées via le bus Avalon (Simulation d'un accès Nios II)
        -- Config butée gauche à 100 (0x0064) à l'adresse "000"
        chipselect <= '1';
        write_n <= '0';
        address <= "000";
        writedata <= x"00000064";
        wait for CLK_PERIOD;
		  
		  
		  
		  

        -- Config butée droite à 3500 (0x0DAC) à l'adresse "001"
        address <= "001";
        writedata <= x"00000DAC";
        wait for CLK_PERIOD;
		  
		  
		  
		  
		  

        -- Fin de l'écriture Avalon
        chipselect <= '0';
        write_n <= '1';
		  
		  
		  
        
        -- 3. Activation de la PWM (venant du SOPC) et d'un sens de rota
        pwm_in <= '1';
        sens_in <= '1'; -- Sens droit
		  
		  
		  
		  

        -- Simu d'une acquisition ADC (envoi de bits factices sur data_in)
        wait for 120 ms; -- Laisser le temps à la FSM de lancer une conversion

        wait;
    end process;

end architecture;
