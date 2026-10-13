library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cap is
    generic(
        MAX_DIV : natural := 5000;        -- 5000 cycles @ 50MHz = 0.1 ms
        MAX_1S  : natural := 49_999_999   -- 50 000 000 cycles @ 50MHz = 1 s (réel)
                                           -- réduire en simulation pour accélérer les tests
    );
    port(
        clk_50M       : in  std_logic;
        raz_n         : in  std_logic;
        start_stop    : in  std_logic;
        in_pwm_compas : in  std_logic;
        continu       : in  std_logic;      -- 1 = continu, 0 = monocoup
        data_valid    : out std_logic;
        data_compas   : out std_logic_vector(8 downto 0);
        out_1s        : out std_logic;
        led           : out std_logic_vector(8 downto 0)
    );
end entity cap;

architecture cmd_cap of cap is

    type etat_t is (wait_in_pwm, compt, traitement, wait_start, wait_1s);
    signal ep, es : etat_t := wait_start;

    -- Diviseur 0.1 ms (comptage de la largeur d'impulsion PWM)
    signal cpt_div    : integer range 0 to MAX_DIV-1 := 0;
    signal tick_0_1ms : std_logic := '0';

    -- Diviseur 1 s (rafraîchissement périodique en mode continu), libre, non lié à ep
    signal cpt_1s  : integer range 0 to MAX_1S-1 := 0;
    signal tick_1s : std_logic := '0';

    signal TH_buffer : unsigned(8 downto 0) := (others => '0'); -- jusqu'à 36 ms (360 ticks)

    -- Registre de sortie : conserve le résultat, valide tant qu'en post_traitement
    signal compas_reg : std_logic_vector(8 downto 0) := (others => '0');
    signal valid_reg  : std_logic := '0';

begin

    ------------------------------------------------------------------
    -- Bloc F : Évolution des états (Combinatoire)
    ------------------------------------------------------------------
    F : process(ep, start_stop, in_pwm_compas, continu, tick_1s)
    begin
        es <= ep; -- Valeur par défaut

        case ep is
            when wait_in_pwm =>
                if in_pwm_compas = '1' then
                    es <= compt;
                end if;

            when compt =>
                if in_pwm_compas = '0' then
                    es <= traitement;
                end if;

            when traitement =>
					 if continu = '0' and valid_reg = '1' then
							es <= wait_start; --attente un appuie sur le boutton start_stop
					 elsif continu = '1' and valid_reg = '1' then
							es <= wait_1s; --attente 1s pour une nouvelle mesure
					 else
							es <= ep; --n'a pas fini la mesure
					 end if;
            when wait_start => 
				--mode monocoup attente d'un appuie sur satrt_stop
                if start_stop = '0' then
                    es <= wait_in_pwm;
					 elsif continu = '1' then -- chansement de mode
							es <= wait_1s; --attente 1s pour une nouvelle mesure
					 end if;
			   when wait_1s =>  
				--mode continu: attente de 1s pour une nouvelle acquistion
                if tick_1s = '1' then  -- mode continu : rafraîchit toutes les secondes
							es <= wait_in_pwm;
					 elsif continu = '0' then -- chagement de mode
								es <= wait_start; --attente un appuie sur le boutton start_stop
					 end if;

            when others =>
                es <= wait_start;
        end case;
    end process F;

    ------------------------------------------------------------------
    -- Bloc M : Registre d'état (Séquentiel)
    ------------------------------------------------------------------
    M : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            ep <= wait_start;
        elsif rising_edge(clk_50M) then
            ep <= es;
        end if;
    end process M;

    ------------------------------------------------------------------
    -- Prédiviseur 0.1 ms : actif uniquement pendant le comptage (compt)
    ------------------------------------------------------------------
    PRESCALER_0_1MS : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            cpt_div    <= 0;
            tick_0_1ms <= '0';
        elsif rising_edge(clk_50M) then
            if ep = compt then
                if cpt_div = MAX_DIV - 1 then
                    cpt_div    <= 0;
                    tick_0_1ms <= '1';
                else
                    cpt_div    <= cpt_div + 1;
                    tick_0_1ms <= '0';
                end if;
            else
                cpt_div    <= 0;
                tick_0_1ms <= '0';
            end if;
        end if;
    end process PRESCALER_0_1MS;

    ------------------------------------------------------------------
    -- Prédiviseur 1 s : libre, tourne en permanence, indépendant de ep
    ------------------------------------------------------------------
    PRESCALER_1S : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            cpt_1s  <= 0;
            tick_1s <= '0';
        elsif rising_edge(clk_50M) then
            if cpt_1s = MAX_1S - 1 then
                cpt_1s  <= 0;
                tick_1s <= '1';
            else
                cpt_1s  <= cpt_1s + 1;
                tick_1s <= '0';
            end if;
        end if;
    end process PRESCALER_1S;

    ------------------------------------------------------------------
    -- Compteur TH_buffer : Incrémenté à chaque tick de 0.1 ms pendant compt
    ------------------------------------------------------------------
    CPT_TH : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            TH_buffer <= (others => '0');
        elsif rising_edge(clk_50M) then
            if ep = wait_in_pwm then
                TH_buffer <= (others => '0');
            elsif ep = compt and tick_0_1ms = '1' then
                TH_buffer <= TH_buffer + 1;
            end if;
        end if;
    end process CPT_TH;

    ------------------------------------------------------------------
    -- Registre de sortie : capture le résultat en post_traitement
    -- et le conserve (valid_reg reste haut tant que ep=post_traitement)
    ------------------------------------------------------------------
    REG_OUT : process(clk_50M, raz_n)
        variable cap_calc : integer;
    begin
        if raz_n = '0' then
            compas_reg <= (others => '0');
            valid_reg  <= '0';
        elsif rising_edge(clk_50M) then
            valid_reg <= '0'; -- valeur par défaut

            if ep = traitement then
                -- Angle = (TH_buffer - 10) à raison de 0.1 ms par degré
                -- (1 ms = offset 10 ticks)
                if TH_buffer >= 10 then
                    cap_calc := to_integer(TH_buffer) - 10;
                else
                    cap_calc := 0;
                end if;

                if cap_calc > 359 then
                    compas_reg <= std_logic_vector(to_unsigned(359, 9));
                else
                    compas_reg <= std_logic_vector(to_unsigned(cap_calc, 9));
                end if;

                valid_reg <= '1';
            end if;
        end if;
    end process REG_OUT;

    ------------------------------------------------------------------
    -- Bloc G : Génération des LEDs (état courant uniquement)
    ------------------------------------------------------------------
--    G : process(ep)
--    begin
--        led <= "00000000";
--
--        case ep is
--            when wait_in_pwm      => led <= "0001";
--            when compt            => led <= "0010";
--            when traitement       => led <= "0011";
--            when wait_start       => led <= "0100";
--            when wait_1s          => led <= "0101";
--            when others          => null;
--        end case;
--    end process G;

    -- Sorties finales (chaque signal a un seul driver, ici concurrent)
    out_1s      <= tick_1s;
	 led			 <= compas_reg;
    data_compas <= compas_reg;
    data_valid  <= valid_reg;

end architecture cmd_cap;