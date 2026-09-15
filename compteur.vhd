-- Compteur 0 - 15 rythmé par un clk de 1s

--- Déclaration des librairy
--librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
	
--- Définition de l'entité
	entity compteur is
		generic(
				
				max : integer :=25000000; -- (50Mhz);
				N : std_logic_vector(3 downto 0) := "1111"
				);
		port	(
				clk : in std_logic;
				rst : in std_logic;
				led : out std_logic_vector(3 downto 0);
				go   : in std_logic
				);
	end compteur;
	
--- Architecture 
	architecture compter of compteur is	
	-- Déclaration des variables globales
	
		type etat_t is (IDLE,Compt,attente);
		signal etat_courant: etat_t := IDLE;
		signal etat_suivant: etat_t;
		signal clk_1s: std_logic :='0';
	--- debut de process pour clk 1s
	begin
		process(rst,clk)
			variable cpt: integer range 0 to max;
			begin
			
			if(rst='0') then
				cpt := 0;
			elsif (rising_edge(clk)) then
				cpt :=cpt + 1;
				if (cpt = max) then
					cpt := 0;
					clk_1s <= not clk_1s;
				end if;
			end if;
		end process;
		
	--- debut process compteur 
		process (clk,clk_1s, rst,etat_courant, etat_suivant)
		-- déclaration des variables locales
			variable cout: std_logic_vector(3 downto 0); 
		begin
			if(rst = '0') then
				--led <= "0000";
				cout := "0000";
			elsif( rising_edge(clk)) then
				if(etat_courant = compt) then
					if(cout = N) then
						cout := "0000";
					else
						
						cout := cout + 1;
						
					end if;
					etat_suivant <= attente;
				end if;
				led <=cout;
			end if;
			
		end process;
--- process séquentiel

process(go,rst,clk)
		
	begin
		if rst = '0' then
			etat_courant <= IDLE;
		
		elsif go ='0' then
			if etat_courant = IDLE then
				etat_suivant <= compt;
			elsif etat_courant = attente then
				etat_suivant <= etat_courant;
			end if;
		end if;
		if go= '1' then
			if etat_courant = IDLE then
				etat_suivant <= etat_courant;
			elsif etat_courant = attente then
				etat_suivant <= IDLE;
			end if;
		end if;
		
		etat_courant <= etat_suivant;
	end process;
end compter;
	