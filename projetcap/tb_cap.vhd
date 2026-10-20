library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cap is
end entity tb_cap;

architecture beh of tb_cap is

    -- MAX_1S réduit pour simulation rapide (au lieu de 49 999 999 = 1s réel)
    constant MAX_1S_SIM : natural := 999; -- ~20 µs de "faux 1 s"

    signal clk_50M       : std_logic := '0';
    signal raz_n         : std_logic := '0';
    signal start_stop    : std_logic := '1'; -- '1' = inactif/stop par défaut
    signal in_pwm_compas : std_logic := '0';
    signal continu       : std_logic := '0';
    signal data_valid    : std_logic;
    signal data_compas   : std_logic_vector(8 downto 0);
    signal out_1s        : std_logic;
    signal led           : std_logic_vector(3 downto 0);

    constant CLK_PERIOD : time := 20 ns; -- 50 MHz

    -- Encodage led défini dans le bloc G du DUT
    constant LED_WAIT_IN_PWM : std_logic_vector(3 downto 0) := "0001";
    constant LED_COMPT       : std_logic_vector(3 downto 0) := "0010";
    constant LED_TRAITEMENT  : std_logic_vector(3 downto 0) := "0011";
    constant LED_WAIT_START  : std_logic_vector(3 downto 0) := "0100";
    constant LED_WAIT_1S     : std_logic_vector(3 downto 0) := "0101";

begin

    uut: entity work.cap(cmd_cap)
        generic map (
            MAX_DIV => 5000,
            MAX_1S  => MAX_1S_SIM
        )
        port map (
            clk_50M       => clk_50M,
            raz_n         => raz_n,
            start_stop    => start_stop,
            in_pwm_compas => in_pwm_compas,
            continu       => continu,
            data_valid    => data_valid,
            data_compas   => data_compas,
            out_1s        => out_1s,
            led           => led
        );

    clk_process : process
    begin
        clk_50M <= '0';
        wait for CLK_PERIOD / 2;
        clk_50M <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    ----------------------------------------------------------------------
    -- Stimuli
    ----------------------------------------------------------------------
    stim_proc: process

        -- Simule un appui bref sur le bouton start_stop (actif à '0')
        procedure press_start_stop(constant press_time : in time := 200 ns) is
        begin
            start_stop <= '0';
            wait for press_time;
            start_stop <= '1'; -- relâché : redevient inactif
        end procedure;

        -- Envoie une impulsion PWM, attend data_valid='1', affiche et vérifie le résultat
        procedure send_pulse(
            constant pulse_time : in time;
            constant test_name  : in string;
            constant expected   : in integer) is
            variable mesure : integer;
        begin
            in_pwm_compas <= '1';
            wait for pulse_time;
            in_pwm_compas <= '0';

            wait until data_valid = '1';
            wait for 1 ns;
            mesure := to_integer(unsigned(data_compas));

            report test_name & " : cap mesure = " & integer'image(mesure) &
                   " (attendu ~" & integer'image(expected) & ")";

            assert (mesure >= expected - 2 and mesure <= expected + 2)
                report test_name & " : ERREUR angle hors tolerance (obtenu=" &
                       integer'image(mesure) & ", attendu=" & integer'image(expected) & ")"
                severity error;
        end procedure;

    begin
        -- Reset initial
        raz_n         <= '0';
        start_stop    <= '1'; -- inactif
        in_pwm_compas <= '0';
        continu       <= '0';
        wait for 100 ns;
        raz_n <= '1';
        wait for 200 ns;

        assert (led = LED_WAIT_START)
            report "Etat initial incorrect : attendu wait_start"
            severity error;
        report "Etat initial OK : wait_start (led=0100)";

        ------------------------------------------------------------------
        -- SCENARIO 1 : MODE MONOCOUP (continu = '0')
        ------------------------------------------------------------------
        report "=== SCENARIO 1 : MODE MONOCOUP (continu=0) ===";
        continu <= '0';
        wait for 200 ns;

        -- Appui bref sur start_stop pour armer une mesure
        press_start_stop(200 ns);
        wait for 100 ns;

        assert (led = LED_WAIT_IN_PWM)
            report "SCENARIO1 : la FSM n'a pas quitte wait_start apres l'appui sur start_stop"
            severity error;
        report "SCENARIO1 : FSM armee, en attente d'impulsion PWM";

        -- Mesure 1 : impulsion de 19 ms -> cap attendu ~180
        send_pulse(19 ms, "Monocoup_Mesure1", 180);

        wait for 100 ns;
        assert (led = LED_WAIT_START)
            report "Monocoup_Mesure1 : ERREUR la FSM n'est pas revenue en wait_start apres la mesure"
            severity error;
        report "Monocoup_Mesure1 : OK - FSM revenue en wait_start (verrouillee)";

        -- Test de verrouillage : nouvelle impulsion SANS appuyer sur start_stop
        -- -> doit etre completement ignoree car la FSM reste en wait_start
        wait for 500 us;
        in_pwm_compas <= '1';
        wait for 10 ms;
        in_pwm_compas <= '0';
        wait for 500 us;

        assert (led = LED_WAIT_START)
            report "Monocoup_Verrouillage : ERREUR la FSM a quitte wait_start sans appui sur start_stop"
            severity error;
        assert (to_integer(unsigned(data_compas)) >= 178 and
                to_integer(unsigned(data_compas)) <= 182)
            report "Monocoup_Verrouillage : ERREUR la valeur mesuree a change alors qu'elle devait rester verrouillee"
            severity error;
        report "Monocoup_Verrouillage : OK - impulsion ignoree, valeur toujours verrouillee a 180";

        -- Nouvel appui sur start_stop -> nouvelle mesure autorisee
        press_start_stop(200 ns);
        wait for 100 ns;
        send_pulse(10 ms, "Monocoup_Mesure2", 90);

        wait for 200 us;

        ------------------------------------------------------------------
        -- SCENARIO 2 : MODE CONTINU (continu = '1')
        ------------------------------------------------------------------
        report "=== SCENARIO 2 : MODE CONTINU (continu=1) ===";

        -- Passage en continu depuis wait_start : bascule directement vers
        -- wait_1s (sans avoir besoin d'appuyer sur start_stop, cf. code FSM)
        continu <= '1';
        wait for 100 ns;

        assert (led = LED_WAIT_1S)
            report "SCENARIO2 : la FSM n'est pas passee en wait_1s apres continu=1"
            severity error;
        report "SCENARIO2 : FSM en attente du 1er tick_1s (mode continu arme)";

        -- Attente du rafraichissement automatique -> repasse en wait_in_pwm
        wait until led = LED_WAIT_IN_PWM;
        report "SCENARIO2 : FSM prete a mesurer (wait_in_pwm), envoi impulsion 1";
        send_pulse(19 ms, "Continu_Mesure1", 180);

        -- Nouveau cycle automatique (sans aucune action sur start_stop)
        wait until led = LED_WAIT_IN_PWM;
        report "SCENARIO2 : nouveau cycle automatique, envoi impulsion 2";
        send_pulse(10 ms, "Continu_Mesure2", 90);

        wait until led = LED_WAIT_IN_PWM;
        report "SCENARIO2 : nouveau cycle automatique, envoi impulsion 3";
        send_pulse(1 ms, "Continu_Mesure3", 0);

        ------------------------------------------------------------------
        -- SCENARIO 3 : retour au monocoup pendant le mode continu
        ------------------------------------------------------------------
        report "=== SCENARIO 3 : retour en monocoup depuis le mode continu ===";
        wait until led = LED_WAIT_1S; -- on attend d'etre dans la phase d'attente
        continu <= '0';
        wait for 100 ns;

        assert (led = LED_WAIT_START)
            report "SCENARIO3 : ERREUR la FSM n'est pas revenue en wait_start apres continu=0"
            severity error;
        report "SCENARIO3 : OK - retour en wait_start, mode monocoup reactif";

        report "=== FIN DE SIMULATION ===";
        wait;
    end process stim_proc;

end architecture beh;