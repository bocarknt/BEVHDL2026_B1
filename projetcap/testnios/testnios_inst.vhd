	component testnios is
		port (
			bouton_external_connection_export : in  std_logic_vector(1 downto 0) := (others => 'X'); -- export
			cap_0_conduit_end_export          : in  std_logic                    := 'X';             -- export
			cap_0_conduit_end_cap_led         : out std_logic_vector(7 downto 0);                    -- cap_led
			clk_clk                           : in  std_logic                    := 'X';             -- clk
			led_external_connection_export    : out std_logic_vector(7 downto 0);                    -- export
			pwm_conduit_end_export            : out std_logic;                                       -- export
			reset_reset_n                     : in  std_logic                    := 'X';             -- reset_n
			switch_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X')  -- export
		);
	end component testnios;

	u0 : component testnios
		port map (
			bouton_external_connection_export => CONNECTED_TO_bouton_external_connection_export, -- bouton_external_connection.export
			cap_0_conduit_end_export          => CONNECTED_TO_cap_0_conduit_end_export,          --          cap_0_conduit_end.export
			cap_0_conduit_end_cap_led         => CONNECTED_TO_cap_0_conduit_end_cap_led,         --                           .cap_led
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			led_external_connection_export    => CONNECTED_TO_led_external_connection_export,    --    led_external_connection.export
			pwm_conduit_end_export            => CONNECTED_TO_pwm_conduit_end_export,            --            pwm_conduit_end.export
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                      reset.reset_n
			switch_external_connection_export => CONNECTED_TO_switch_external_connection_export  -- switch_external_connection.export
		);

