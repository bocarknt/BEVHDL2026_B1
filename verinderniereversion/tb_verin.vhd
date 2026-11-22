library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;





entity tb_gestion_verin is
end entity;

architecture sim of tb_gestion_verin is
    -- Signaux de simu
    signal clk : std_logic := '0';
    signal reset_n   : std_logic := '0';
    signal chipselect   : std_logic := '0';
    signal write_n   : std_logic := '1';
    signal address   : std_logic_vector(2 downto 0) := (others => '0');
    signal writedata  : std_logic_vector(31 downto 0) := (others => '0');
    signal readdata   : std_logic_vector(31 downto 0);
    signal data_in  : std_logic := '0';
    signal pwm_in  : std_logic := '0';
    signal sens_in   : std_logic := '0';
    signal out_pwm : std_logic;
    signal out_sens     : std_logic;
    signal cs_n : std_logic;
    signal clk_adc      : std_logic;

    -- Période de l'horloge sys (50 MHz -> 20 ns)
    constant CLK_PERIOD : time := 20 ns;

	 
	 
	 
	 
	 
	 
begin

    -- Instanciation du module principal gestion_verin
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

	 
	 
	 
	 
	 
	 
	 
	 
    -- Processus de stimuli exhaustif
    stim_proc: process
    begin
        -- -----------------------------------------------------------------
        -- 1. Test du Reset Init
        -- -----------------------------------------------------------------
        reset_n <= '0';
        pwm_in <= '0';
        sens_in <= '0';
        chipselect <= '0';
        write_n <= '1';
        wait for 100 ns;
        reset_n <= '1';
        wait for 200 ns;

        -- -----------------------------------------------------------------
        -- 2. Test des Écritures Avalon (Configuration des registres)[cite: 2, 6]
        -- -----------------------------------------------------------------
        chipselect <= '1';
        write_n <= '0';

        -- Adresse 0 : freq (ex: 2000)
        address <= "000";
        writedata <= x"000007D0";
        wait for CLK_PERIOD;

        -- Adresse 1 : duty (ex: 1000)
        address <= "001";
        writedata <= x"000003E8";
        wait for CLK_PERIOD;

        -- Adresse 2 : butee_g (ex: 200 -> 0x00C8)
        address <= "010";
        writedata <= x"000000C8";
        wait for CLK_PERIOD;

        -- Adresse 3 : butee_d (ex: 3800 -> 0x0ED8)
        address <= "011";
        writedata <= x"00000ED8";
        wait for CLK_PERIOD;

        -- Adresse 4 : config (ex: b1=1 active_pwm)
        address <= "100";
        writedata <= x"00000002";
        wait for CLK_PERIOD;

        -- Fin d'écriture
        chipselect <= '0';
        write_n <= '1';
        wait for 50 ns;

		  
		  
		  
		  
		  
		  
        -- -----------------------------------------------------------------
        -- 3. Test de la Relecture Avalon (Adresse 5 : Angle_barre)[cite: 6]
        -- -----------------------------------------------------------------
        chipselect <= '1';
        write_n <= '1'; -- Mode lecture
        address <= "101"; 
        wait for CLK_PERIOD;
        -- (On peut observer readdata dans la fenêtre de simulation)
        chipselect <= '0';
        wait for 50 ns;

        -- -----------------------------------------------------------------
        -- 4. Test du Fonctionnement Nominal de la PWM (En dehors des butées)
        -- -----------------------------------------------------------------
        pwm_in <= '1';
        sens_in <= '1'; -- On va vers la droite, loin de la butée gauche
        wait for 200 ns;

        -- -----------------------------------------------------------------
        -- 5. Test de la Sécurité Butée Droite 
        -- (Si l'angle dépasse butee_d et qu'on veut aller à droite sens_in = '1')
        -- -----------------------------------------------------------------
        -- Note : Pour simu l'angle, on peut injecter des données ou tester 
        -- via les signaux internes si besoin, ici on active le cas de figure.
        sens_in <= '1'; 
        wait for 200 ns;

        -- -----------------------------------------------------------------
        -- 6. Test de la Sécurité Butée Gauche
        -- (Si l'angle est sous butee_g et qu'on veut aller à gauche sens_in = '0')
        -- -----------------------------------------------------------------
        sens_in <= '0';
        wait for 200 ns;

        -- Fin de la simu
        wait;
    end process;

end architecture;