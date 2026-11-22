library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;







entity adc_wapper is
    port (
        clk : in  std_logic;
        reset_n : in  std_logic;
        data_in : in  std_logic;
        cs_n : out std_logic;
        clk_adc : out std_logic;
        angle_barre : out std_logic_vector(11 downto 0)
    );
end entity;











architecture rtl of adc_wapper is

    -- Etats de la machine a etats pour lire adc
    type t_etat is (ATTENTE, DECALAGE, SAUVEGARDE, REPOS_CS);
    signal etat_present, etat_suivant : t_etat;

	 
	 
	 
	 
	 
    -- Signaux pour la div d'horloge a 1 MHz (a partir de 50 MHz)
    signal cpt_1M  : integer range 0 to 24 := 0;
    signal horloge_adc   : std_logic := '0';
    signal front_montant : std_logic := '0';
    signal front_descendant : std_logic := '0';

	 
	 
	 
	 
	 
    -- Signaux pour le timer de 100 ms
    signal cpt_100ms : integer range 0 to 5000000 := 0;
    -- Drapeau pour memoriser la demande de conv (sinon ca rate entre 50MHz et 1MHz)
    signal mem_start : std_logic := '0';

	 
	 
	 
	 
    -- Compteurs et registre a decalage
    signal nb_fronts : integer range 0 to 15 := 0;
    signal cpt_repos : integer range 0 to 5 := 0;
    signal reg_decalage : std_logic_vector(11 downto 0) := (others => '0');
    signal valeur_angle : std_logic_vector(11 downto 0) := (others => '0');

	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
begin

    -- Crea du signal 1 MHz et detect des fronts de clk_adc
    gene_1M : process(clk, reset_n)
    begin
	 
	 
	 
        if (reset_n = '0') then
            cpt_1M <= 0;
            horloge_adc <= '0';
            front_montant <= '0';
            front_descendant <= '0';
        elsif (clk'event and clk = '1') then
            front_montant <= '0';
            front_descendant <= '0';
			
			
			
			
			
            if (cpt_1M = 24) then
                cpt_1M      <= 0;
                horloge_adc <= not horloge_adc;

                if (horloge_adc = '0') then
                    front_montant <= '1';
                else
                    front_descendant <= '1';
                end if;
            else
                cpt_1M <= cpt_1M +1;
            end if;
        end if;
    end process;

    clk_adc <= horloge_adc;

	 
	 
	 
	 
	 
    -- Compteur pour lancer une conv toutes les 100 ms
    gene_start_conv : process(clk, reset_n)
    begin
        if (reset_n = '0') then
            cpt_100ms <= 0;
            mem_start <= '0';
        elsif (clk'event and clk = '1') then
            if (cpt_100ms = 4999999) then
                cpt_100ms <= 0;
                mem_start <= '1';
            else
                cpt_100ms <= cpt_100ms + 1;
            end if;

            -- On efface la demande une fois que la machine demarre
            if (front_descendant = '1' and etat_present = ATTENTE and mem_start = '1') then
                mem_start <= '0';
            end if;
        end if;
    end process;

	 
	 
	 
	 
	 
	 
    -- Memo de l'etat courant (sur front descendant de clk_adc)
    maj_etat : process(clk, reset_n)
    begin
        if (reset_n = '0') then
            etat_present <= ATTENTE;
        elsif (clk'event and clk = '1') then
            if (front_descendant = '1') then
                etat_present <= etat_suivant;
            end if;
        end if;
    end process;

	 
	 
	 
	 
	 
    -- Calcul de l'etat suivant et pilotage de cs_n
    pilote_adc : process(etat_present, nb_fronts, mem_start, cpt_repos)
    begin
        etat_suivant <= etat_present;
        cs_n   <= '1';

        case etat_present is
            when ATTENTE =>
                cs_n <= '1';
                if (mem_start = '1') then
                    etat_suivant <= DECALAGE;
                else
                    etat_suivant <= ATTENTE;
                end if;

            when DECALAGE =>
                cs_n <= '0'; -- on active l'ADC
                -- Il faut 15 coups d'horloge (3 bits vides au debut + 12 bits de donnee)
                if (nb_fronts = 15) then
                    etat_suivant <= SAUVEGARDE;
                else
                    etat_suivant <= DECALAGE;
                end if;
					 
					 

            when SAUVEGARDE =>
                cs_n         <= '1';
                etat_suivant <= REPOS_CS;

            when REPOS_CS =>
                cs_n <= '1';
                -- On attend un peu avant de refaire une mesure
                if (cpt_repos = 3) then
                    etat_suivant <= ATTENTE;
                else
                    etat_suivant <= REPOS_CS;
                end if;
					 
					 

            when others =>
                etat_suivant <= ATTENTE;
        end case;
    end process;
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 

    -- Lecture des bits sur front montant et gestion des compteurs
    rec_dec : process(clk, reset_n)
    begin
        if (reset_n = '0') then
            reg_decalage <= (others => '0');
            valeur_angle <= (others => '0');
            nb_fronts    <= 0;
            cpt_repos    <= 0;
        elsif (clk'event and clk = '1') then

            -- On lit data_in sur le front montant pour etre bien cale sur le bit
            if (front_montant = '1' and etat_present = DECALAGE) then
                if (nb_fronts < 15) then
                    reg_decalage <= reg_decalage(10 downto 0) & data_in;
                    nb_fronts    <= nb_fronts + 1;
                end if;
            end if;

            -- Gestion des compteurs sur le front descendant
            if (front_descendant = '1') then
                case etat_present is
                    when ATTENTE =>
                        nb_fronts <= 0;
                        cpt_repos <= 0;

                    when SAUVEGARDE =>
                        valeur_angle <= reg_decalage;
                        cpt_repos    <= 0;

                    when REPOS_CS =>
                        if (cpt_repos < 3) then
                            cpt_repos <= cpt_repos + 1;
                        end if;

                    when others =>
                        null;
                end case;
            end if;

        end if;
    end process;

    angle_barre <= valeur_angle;

end architecture;