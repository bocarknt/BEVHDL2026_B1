library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;




entity controle_butees is
    port (
        pwm_in : in  std_logic;
        sens_in : in  std_logic;
        angle_barre : in  std_logic_vector(11 downto 0);
        butee_g : in  std_logic_vector(11 downto 0);
        butee_d : in  std_logic_vector(11 downto 0);
        pwm_safe : out std_logic;
        sens_safe : out std_logic
    );
end entity;





architecture rtl of controle_butees is
begin
    -- Transmet PWM par défaut, bloquée si dépassement des seuils
    process(pwm_in, sens_in, angle_barre, butee_g, butee_d)
    begin
        pwm_safe  <= pwm_in;
        sens_safe <= sens_in;

        -- Sécu butée gauche (si angle <= seuil gauche et qu'on veut aller plus loin)
        if unsigned(angle_barre) <= unsigned(butee_g) and sens_in = '0' then
            pwm_safe <= '0';
        -- Sécu butée droite (si angle >= seuil droit et qu'on veut aller plus loin)
        elsif unsigned(angle_barre) >= unsigned(butee_d) and sens_in = '1' then
            pwm_safe <= '0';
        end if;
    end process;
end architecture;