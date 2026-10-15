library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pwm_tb is
end entity pwm_tb;

architecture sim of pwm_tb is

    constant CLK_PERIOD : time := 20 ns;               -- 50 MHz
    constant PWM_PERIOD : time := 1024 * CLK_PERIOD;   -- 20,48 us

    signal clk     : std_logic := '0';
    signal rst     : std_logic := '0';
    signal boutton : std_logic := '1';                 -- bouton relâché = '1'
    signal pwm     : std_logic;

begin

    -- Instanciation du DUT
    dut : entity work.pwm
        port map (
            clk     => clk,
            rst     => rst,
            boutton => boutton,
            pwm     => pwm
        );

    -- Horloge 50 MHz
    clk <= not clk after CLK_PERIOD / 2;

    -- Stimuli
    stimuli : process

        -- Un appui = impulsion de 3 ns à '0', calée entre deux fronts de clk
        -- (plus courte que 10 ns => un seul incrément de cpt dans pwm.vhd)
        procedure appui is
        begin
            wait until rising_edge(clk);
            wait for 2 ns;
            boutton <= '0';
            wait for 3 ns;
            boutton <= '1';
        end procedure;

    begin
        -- Reset initial
        rst     <= '0';
        boutton <= '1';
        wait for 100 ns;
        rst <= '1';

        -- Étape 0 : 150/1024 (~14,6 %)
        wait for 3 * PWM_PERIOD;

        -- Appui 1 -> 250/1024 (~24,4 %)
        appui;
        wait for 3 * PWM_PERIOD;

        -- Appui 2 -> 500/1024 (~48,8 %)
        appui;
        wait for 3 * PWM_PERIOD;

        -- Appui 3 -> 750/1024 (~73,2 %)
        appui;
        wait for 3 * PWM_PERIOD;

        -- Pas de 4e appui (cpt sortirait de 0..3) : on repasse par le reset
        rst <= '0';
        wait for 100 ns;
        rst <= '1';
        wait for 3 * PWM_PERIOD;      -- retour à 150/1024

        -- Nouvel appui après reset -> 250/1024
        appui;
        wait for 3 * PWM_PERIOD;

        report "Fin de la simulation" severity note;
        wait;
    end process;

    -- Moniteur : mesure le temps haut et la période du PWM
    moniteur : process
        variable t_rise, t_fall, t_rise_prev : time := 0 ns;
    begin
        wait until rising_edge(pwm);
        t_rise_prev := t_rise;
        t_rise := now;
        wait until falling_edge(pwm);
        t_fall := now;
        if t_rise_prev /= 0 ns then
            report "T_haut = " & time'image(t_fall - t_rise) &
                   " | Periode = " & time'image(t_rise - t_rise_prev) &
                   " | Rapport = " &
                   integer'image((t_fall - t_rise) / CLK_PERIOD) & "/1024";
        end if;
    end process;

end architecture sim;