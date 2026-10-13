library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cap is
    generic(max: natural := 50000); -- diviseur de clk pour 1 ms
    port(
        clk_50M      : in  std_logic;
        raz_n        : in  std_logic;
        start_stop   : in  std_logic;
        in_pmw_compas: in  std_logic;
        continu      : in  std_logic;
        data_valid   : out std_logic;
        data_compas  : out std_logic_vector(8 downto 0);
        out_1s       : out std_logic;
        led          : out std_logic_vector(3 downto 0));
end cap;

architecture cmd_cap of cap is

    type etat_t is (init, attente, compt, traitement, post_traitement);
    signal ep, es : etat_t := init;

    signal cpt_div   : integer range 0 to max-1 := 0;
    signal tick_1ms  : std_logic := '0';
    signal TH_buffer : unsigned(5 downto 0) := (others => '0');

begin

    -- Bloc F : transition (uniquement combinatoire, pas de clk ici)
    F : process(ep, start_stop, in_pmw_compas)
    begin
        es <= ep; -- valeur par défaut : pas de latch
        case ep is
            when init =>
                if start_stop = '1' then
                    es <= attente;
                end if;
            when attente =>
                if in_pmw_compas = '1' then
                    es <= compt;
                end if;
            when compt =>
                if in_pmw_compas = '0' then
                    es <= traitement;
                end if;
            when traitement =>
                es <= post_traitement;
            when post_traitement =>
                if continu = '1' then
                    es <= attente;
                else
                    es <= init;
                end if;
        end case;
    end process F;

    -- Bloc M : mémoire (séquentiel pur, clk et raz_n seuls)
    M : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            ep <= init;
        elsif rising_edge(clk_50M) then
            ep <= es;
        end if;
    end process M;

    -- Prédiviseur : génère un tick toutes les 1 ms (max=50000 @ 50 MHz)
    PRESCALER : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            cpt_div  <= 0;
            tick_1ms <= '0';
        elsif rising_edge(clk_50M) then
            if ep = compt then
                if cpt_div = max-1 then
                    cpt_div  <= 0;
                    tick_1ms <= '1';
                else
                    cpt_div  <= cpt_div + 1;
                    tick_1ms <= '0';
                end if;
            else
                cpt_div  <= 0;
                tick_1ms <= '0';
            end if;
        end if;
    end process PRESCALER;

    -- Compteur TH_buffer : nombre de ms où in_pmw_compas est resté haut
    CPT_TH : process(clk_50M, raz_n)
    begin
        if raz_n = '0' then
            TH_buffer <= (others => '0');
        elsif rising_edge(clk_50M) then
            if ep = attente then
                TH_buffer <= (others => '0');
            elsif ep = compt and tick_1ms = '1' then
                TH_buffer <= TH_buffer + 1;
            end if;
        end if;
    end process CPT_TH;

    -- Bloc G : sortie (purement combinatoire, décodage de ep)
    G : process(ep, TH_buffer)
        variable angle_v : unsigned(9 downto 0);
    begin
        -- valeurs par défaut pour éviter les latches
        led         <= "0000";
        data_valid  <= '0';
        out_1s      <= '0';
        data_compas <= (others => '0');

        case ep is
            when init           => led <= "0001";
            when attente        => led <= "0010";
            when compt          => led <= "0011";
            when traitement     => led <= "0100";
            when post_traitement =>
                led <= "0101";
                data_valid <= '1';
                if TH_buffer = 0 then
                    angle_v := (others => '0');
                else
                    angle_v := (resize(TH_buffer, 10) - 1) * 10;
                end if;
                data_compas <= std_logic_vector(angle_v(8 downto 0));
        end case;
    end process G;

end cmd_cap;