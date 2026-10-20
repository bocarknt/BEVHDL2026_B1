
module testnios (
	bouton_external_connection_export,
	cap_0_conduit_end_export,
	cap_0_conduit_end_cap_led,
	clk_clk,
	led_external_connection_export,
	pwm_conduit_end_export,
	reset_reset_n,
	switch_external_connection_export);	

	input	[1:0]	bouton_external_connection_export;
	input		cap_0_conduit_end_export;
	output	[7:0]	cap_0_conduit_end_cap_led;
	input		clk_clk;
	output	[7:0]	led_external_connection_export;
	output		pwm_conduit_end_export;
	input		reset_reset_n;
	input	[3:0]	switch_external_connection_export;
endmodule
