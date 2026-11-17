library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity controle_butees is
    port (
        pwm_in       : in  std_logic;
        sens_in      : in  std_logic;
        angle_barre  : in  std_logic_vector(11 downto 0);
        butee_g      : in  std_logic_vector(11 downto 0);
        butee_d      : in  std_logic_vector(11 downto 0);
        pwm_safe     : out std_logic;
        sens_safe    : out std_logic;
        fin_course_g : out std_logic;
        fin_course_d : out std_logic
    );
end entity;

architecture rtl of controle_butees is
begin
    process(pwm_in, sens_in, angle_barre, butee_g, butee_d)
    begin
        -- Valeurs par défaut
        pwm_safe     <= pwm_in;
        sens_safe    <= sens_in;
        fin_course_g <= '0';
        fin_course_d <= '0';

        -- Détection et protection butée gauche
        if unsigned(angle_barre) <= unsigned(butee_g) then
            fin_course_g <= '1';
            if sens_in = '0' then
                pwm_safe <= '0'; -- Coupe si on veut aller plus loin à gauche
            end if;
        end if;

        -- Détection et protection butée droite
        if unsigned(angle_barre) >= unsigned(butee_d) then
            fin_course_d <= '1';
            if sens_in = '1' then
                pwm_safe <= '0'; -- Coupe si on veut aller plus loin à droite
            end if;
        end if;
    end process;
end architecture;