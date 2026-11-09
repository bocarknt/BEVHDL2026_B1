-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "11/09/2026 11:28:47"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	gestion_verin IS
    PORT (
	clk : IN std_logic;
	reset_n : IN std_logic;
	chipselect : IN std_logic;
	write_n : IN std_logic;
	address : IN std_logic_vector(2 DOWNTO 0);
	writedata : IN std_logic_vector(31 DOWNTO 0);
	readdata : BUFFER std_logic_vector(31 DOWNTO 0);
	data_in : IN std_logic;
	pwm_in : IN std_logic;
	sens_in : IN std_logic;
	out_pwm : BUFFER std_logic;
	out_sens : BUFFER std_logic;
	cs_n : BUFFER std_logic;
	clk_adc : BUFFER std_logic
	);
END gestion_verin;

-- Design Ports Information
-- readdata[0]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[1]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[2]	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[3]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[4]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[5]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[6]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[7]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[8]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[9]	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[10]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[11]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[12]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[13]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[14]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[15]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[16]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[17]	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[18]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[19]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[20]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[21]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[22]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[23]	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[24]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[25]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[26]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[27]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[28]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[29]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[30]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- readdata[31]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_in	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_pwm	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- out_sens	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cs_n	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_adc	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[0]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- address[1]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pwm_in	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- sens_in	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[0]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset_n	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- chipselect	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- write_n	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[1]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[2]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[3]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[4]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[5]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[6]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[7]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[8]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[9]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[10]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[11]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[12]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[13]	=>  Location: PIN_F13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[14]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[15]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[16]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[17]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[18]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[19]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[20]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[21]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[22]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[23]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[24]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[25]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[26]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[27]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[28]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[29]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[30]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- writedata[31]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF gestion_verin IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_chipselect : std_logic;
SIGNAL ww_write_n : std_logic;
SIGNAL ww_address : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_writedata : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_readdata : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_data_in : std_logic;
SIGNAL ww_pwm_in : std_logic;
SIGNAL ww_sens_in : std_logic;
SIGNAL ww_out_pwm : std_logic;
SIGNAL ww_out_sens : std_logic;
SIGNAL ww_cs_n : std_logic;
SIGNAL ww_clk_adc : std_logic;
SIGNAL \reset_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_in~input_o\ : std_logic;
SIGNAL \readdata[0]~output_o\ : std_logic;
SIGNAL \readdata[1]~output_o\ : std_logic;
SIGNAL \readdata[2]~output_o\ : std_logic;
SIGNAL \readdata[3]~output_o\ : std_logic;
SIGNAL \readdata[4]~output_o\ : std_logic;
SIGNAL \readdata[5]~output_o\ : std_logic;
SIGNAL \readdata[6]~output_o\ : std_logic;
SIGNAL \readdata[7]~output_o\ : std_logic;
SIGNAL \readdata[8]~output_o\ : std_logic;
SIGNAL \readdata[9]~output_o\ : std_logic;
SIGNAL \readdata[10]~output_o\ : std_logic;
SIGNAL \readdata[11]~output_o\ : std_logic;
SIGNAL \readdata[12]~output_o\ : std_logic;
SIGNAL \readdata[13]~output_o\ : std_logic;
SIGNAL \readdata[14]~output_o\ : std_logic;
SIGNAL \readdata[15]~output_o\ : std_logic;
SIGNAL \readdata[16]~output_o\ : std_logic;
SIGNAL \readdata[17]~output_o\ : std_logic;
SIGNAL \readdata[18]~output_o\ : std_logic;
SIGNAL \readdata[19]~output_o\ : std_logic;
SIGNAL \readdata[20]~output_o\ : std_logic;
SIGNAL \readdata[21]~output_o\ : std_logic;
SIGNAL \readdata[22]~output_o\ : std_logic;
SIGNAL \readdata[23]~output_o\ : std_logic;
SIGNAL \readdata[24]~output_o\ : std_logic;
SIGNAL \readdata[25]~output_o\ : std_logic;
SIGNAL \readdata[26]~output_o\ : std_logic;
SIGNAL \readdata[27]~output_o\ : std_logic;
SIGNAL \readdata[28]~output_o\ : std_logic;
SIGNAL \readdata[29]~output_o\ : std_logic;
SIGNAL \readdata[30]~output_o\ : std_logic;
SIGNAL \readdata[31]~output_o\ : std_logic;
SIGNAL \out_pwm~output_o\ : std_logic;
SIGNAL \out_sens~output_o\ : std_logic;
SIGNAL \cs_n~output_o\ : std_logic;
SIGNAL \clk_adc~output_o\ : std_logic;
SIGNAL \address[2]~input_o\ : std_logic;
SIGNAL \address[0]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux75~0_combout\ : std_logic;
SIGNAL \address[1]~input_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \writedata[0]~input_o\ : std_logic;
SIGNAL \reset_n~input_o\ : std_logic;
SIGNAL \reset_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \write_n~input_o\ : std_logic;
SIGNAL \chipselect~input_o\ : std_logic;
SIGNAL \U_AVALON|butee_g_s[0]~0_combout\ : std_logic;
SIGNAL \U_AVALON|config_s[0]~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux87~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux83~0_combout\ : std_logic;
SIGNAL \U_AVALON|butee_d_s[0]~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux87~1_combout\ : std_logic;
SIGNAL \writedata[1]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux86~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux86~1_combout\ : std_logic;
SIGNAL \writedata[2]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux85~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux85~1_combout\ : std_logic;
SIGNAL \writedata[3]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux84~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux84~1_combout\ : std_logic;
SIGNAL \writedata[4]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux83~1_combout\ : std_logic;
SIGNAL \U_AVALON|Mux83~2_combout\ : std_logic;
SIGNAL \U_AVALON|Mux83~3_combout\ : std_logic;
SIGNAL \writedata[5]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux82~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux82~1_combout\ : std_logic;
SIGNAL \writedata[6]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux81~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux81~1_combout\ : std_logic;
SIGNAL \U_AVALON|Mux81~2_combout\ : std_logic;
SIGNAL \writedata[7]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux80~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux80~1_combout\ : std_logic;
SIGNAL \U_AVALON|Mux80~2_combout\ : std_logic;
SIGNAL \writedata[8]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux79~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux79~1_combout\ : std_logic;
SIGNAL \U_AVALON|Mux79~2_combout\ : std_logic;
SIGNAL \writedata[9]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux78~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux78~1_combout\ : std_logic;
SIGNAL \U_AVALON|Mux78~2_combout\ : std_logic;
SIGNAL \writedata[10]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux77~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux77~1_combout\ : std_logic;
SIGNAL \U_AVALON|Mux77~2_combout\ : std_logic;
SIGNAL \writedata[11]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux76~0_combout\ : std_logic;
SIGNAL \U_AVALON|Mux76~1_combout\ : std_logic;
SIGNAL \writedata[12]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux75~1_combout\ : std_logic;
SIGNAL \writedata[13]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux74~0_combout\ : std_logic;
SIGNAL \writedata[14]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux73~0_combout\ : std_logic;
SIGNAL \writedata[15]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux72~0_combout\ : std_logic;
SIGNAL \writedata[16]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux71~0_combout\ : std_logic;
SIGNAL \writedata[17]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux70~0_combout\ : std_logic;
SIGNAL \writedata[18]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux69~0_combout\ : std_logic;
SIGNAL \writedata[19]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux68~0_combout\ : std_logic;
SIGNAL \writedata[20]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux67~0_combout\ : std_logic;
SIGNAL \writedata[21]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux66~0_combout\ : std_logic;
SIGNAL \writedata[22]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux65~0_combout\ : std_logic;
SIGNAL \writedata[23]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux64~0_combout\ : std_logic;
SIGNAL \writedata[24]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux63~0_combout\ : std_logic;
SIGNAL \writedata[25]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux62~0_combout\ : std_logic;
SIGNAL \writedata[26]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux61~0_combout\ : std_logic;
SIGNAL \writedata[27]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux60~0_combout\ : std_logic;
SIGNAL \writedata[28]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux59~0_combout\ : std_logic;
SIGNAL \writedata[29]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux58~0_combout\ : std_logic;
SIGNAL \writedata[30]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux57~0_combout\ : std_logic;
SIGNAL \writedata[31]~input_o\ : std_logic;
SIGNAL \U_AVALON|Mux56~0_combout\ : std_logic;
SIGNAL \sens_in~input_o\ : std_logic;
SIGNAL \pwm_in~input_o\ : std_logic;
SIGNAL \U_BUTEE|LessThan0~0_combout\ : std_logic;
SIGNAL \U_BUTEE|pwm_safe~0_combout\ : std_logic;
SIGNAL \U_BUTEE|pwm_safe~1_combout\ : std_logic;
SIGNAL \U_BUTEE|pwm_safe~2_combout\ : std_logic;
SIGNAL \U_BUTEE|LessThan1~0_combout\ : std_logic;
SIGNAL \U_BUTEE|pwm_safe~3_combout\ : std_logic;
SIGNAL \U_BUTEE|pwm_safe~4_combout\ : std_logic;
SIGNAL \U_BUTEE|pwm_safe~5_combout\ : std_logic;
SIGNAL \U_AVALON|config_s\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \U_AVALON|butee_g_s\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \U_AVALON|butee_d_s\ : std_logic_vector(11 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_reset_n <= reset_n;
ww_chipselect <= chipselect;
ww_write_n <= write_n;
ww_address <= address;
ww_writedata <= writedata;
readdata <= ww_readdata;
ww_data_in <= data_in;
ww_pwm_in <= pwm_in;
ww_sens_in <= sens_in;
out_pwm <= ww_out_pwm;
out_sens <= ww_out_sens;
cs_n <= ww_cs_n;
clk_adc <= ww_clk_adc;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset_n~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X51_Y34_N2
\readdata[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux87~1_combout\,
	devoe => ww_devoe,
	o => \readdata[0]~output_o\);

-- Location: IOOBUF_X53_Y26_N23
\readdata[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux86~1_combout\,
	devoe => ww_devoe,
	o => \readdata[1]~output_o\);

-- Location: IOOBUF_X53_Y30_N9
\readdata[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux85~1_combout\,
	devoe => ww_devoe,
	o => \readdata[2]~output_o\);

-- Location: IOOBUF_X43_Y34_N23
\readdata[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux84~1_combout\,
	devoe => ww_devoe,
	o => \readdata[3]~output_o\);

-- Location: IOOBUF_X51_Y34_N9
\readdata[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux83~3_combout\,
	devoe => ww_devoe,
	o => \readdata[4]~output_o\);

-- Location: IOOBUF_X51_Y34_N16
\readdata[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux82~1_combout\,
	devoe => ww_devoe,
	o => \readdata[5]~output_o\);

-- Location: IOOBUF_X53_Y25_N2
\readdata[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux81~2_combout\,
	devoe => ww_devoe,
	o => \readdata[6]~output_o\);

-- Location: IOOBUF_X20_Y34_N9
\readdata[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux80~2_combout\,
	devoe => ww_devoe,
	o => \readdata[7]~output_o\);

-- Location: IOOBUF_X45_Y34_N16
\readdata[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux79~2_combout\,
	devoe => ww_devoe,
	o => \readdata[8]~output_o\);

-- Location: IOOBUF_X45_Y34_N2
\readdata[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux78~2_combout\,
	devoe => ww_devoe,
	o => \readdata[9]~output_o\);

-- Location: IOOBUF_X31_Y34_N9
\readdata[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux77~2_combout\,
	devoe => ww_devoe,
	o => \readdata[10]~output_o\);

-- Location: IOOBUF_X38_Y34_N2
\readdata[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux76~1_combout\,
	devoe => ww_devoe,
	o => \readdata[11]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\readdata[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux75~1_combout\,
	devoe => ww_devoe,
	o => \readdata[12]~output_o\);

-- Location: IOOBUF_X53_Y14_N9
\readdata[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux74~0_combout\,
	devoe => ww_devoe,
	o => \readdata[13]~output_o\);

-- Location: IOOBUF_X34_Y0_N2
\readdata[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux73~0_combout\,
	devoe => ww_devoe,
	o => \readdata[14]~output_o\);

-- Location: IOOBUF_X53_Y24_N23
\readdata[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux72~0_combout\,
	devoe => ww_devoe,
	o => \readdata[15]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\readdata[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux71~0_combout\,
	devoe => ww_devoe,
	o => \readdata[16]~output_o\);

-- Location: IOOBUF_X25_Y0_N16
\readdata[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux70~0_combout\,
	devoe => ww_devoe,
	o => \readdata[17]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\readdata[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux69~0_combout\,
	devoe => ww_devoe,
	o => \readdata[18]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\readdata[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux68~0_combout\,
	devoe => ww_devoe,
	o => \readdata[19]~output_o\);

-- Location: IOOBUF_X53_Y15_N9
\readdata[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux67~0_combout\,
	devoe => ww_devoe,
	o => \readdata[20]~output_o\);

-- Location: IOOBUF_X53_Y6_N23
\readdata[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux66~0_combout\,
	devoe => ww_devoe,
	o => \readdata[21]~output_o\);

-- Location: IOOBUF_X53_Y22_N2
\readdata[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux65~0_combout\,
	devoe => ww_devoe,
	o => \readdata[22]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\readdata[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux64~0_combout\,
	devoe => ww_devoe,
	o => \readdata[23]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\readdata[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux63~0_combout\,
	devoe => ww_devoe,
	o => \readdata[24]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\readdata[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux62~0_combout\,
	devoe => ww_devoe,
	o => \readdata[25]~output_o\);

-- Location: IOOBUF_X43_Y0_N23
\readdata[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux61~0_combout\,
	devoe => ww_devoe,
	o => \readdata[26]~output_o\);

-- Location: IOOBUF_X43_Y0_N16
\readdata[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux60~0_combout\,
	devoe => ww_devoe,
	o => \readdata[27]~output_o\);

-- Location: IOOBUF_X53_Y16_N9
\readdata[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux59~0_combout\,
	devoe => ww_devoe,
	o => \readdata[28]~output_o\);

-- Location: IOOBUF_X29_Y0_N2
\readdata[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux58~0_combout\,
	devoe => ww_devoe,
	o => \readdata[29]~output_o\);

-- Location: IOOBUF_X53_Y11_N2
\readdata[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux57~0_combout\,
	devoe => ww_devoe,
	o => \readdata[30]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\readdata[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_AVALON|Mux56~0_combout\,
	devoe => ww_devoe,
	o => \readdata[31]~output_o\);

-- Location: IOOBUF_X31_Y34_N2
\out_pwm~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \U_BUTEE|pwm_safe~5_combout\,
	devoe => ww_devoe,
	o => \out_pwm~output_o\);

-- Location: IOOBUF_X34_Y34_N9
\out_sens~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sens_in~input_o\,
	devoe => ww_devoe,
	o => \out_sens~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\cs_n~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \cs_n~output_o\);

-- Location: IOOBUF_X0_Y15_N9
\clk_adc~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clk~input_o\,
	devoe => ww_devoe,
	o => \clk_adc~output_o\);

-- Location: IOIBUF_X34_Y34_N1
\address[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(2),
	o => \address[2]~input_o\);

-- Location: IOIBUF_X53_Y10_N15
\address[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(0),
	o => \address[0]~input_o\);

-- Location: LCCOMB_X48_Y18_N16
\U_AVALON|Mux75~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux75~0_combout\ = (!\address[2]~input_o\ & !\address[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[2]~input_o\,
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux75~0_combout\);

-- Location: IOIBUF_X29_Y34_N15
\address[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_address(1),
	o => \address[1]~input_o\);

-- Location: IOIBUF_X0_Y16_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X53_Y30_N1
\writedata[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(0),
	o => \writedata[0]~input_o\);

-- Location: IOIBUF_X0_Y16_N15
\reset_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset_n,
	o => \reset_n~input_o\);

-- Location: CLKCTRL_G4
\reset_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset_n~inputclkctrl_outclk\);

-- Location: IOIBUF_X40_Y34_N8
\write_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_write_n,
	o => \write_n~input_o\);

-- Location: IOIBUF_X43_Y34_N15
\chipselect~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_chipselect,
	o => \chipselect~input_o\);

-- Location: LCCOMB_X43_Y30_N20
\U_AVALON|butee_g_s[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|butee_g_s[0]~0_combout\ = (!\write_n~input_o\ & (!\address[1]~input_o\ & (\U_AVALON|Mux75~0_combout\ & \chipselect~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_n~input_o\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|Mux75~0_combout\,
	datad => \chipselect~input_o\,
	combout => \U_AVALON|butee_g_s[0]~0_combout\);

-- Location: FF_X44_Y30_N3
\U_AVALON|butee_g_s[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[0]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(0));

-- Location: LCCOMB_X43_Y30_N26
\U_AVALON|config_s[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|config_s[0]~0_combout\ = (!\write_n~input_o\ & (\address[1]~input_o\ & (\U_AVALON|Mux75~0_combout\ & \chipselect~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_n~input_o\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|Mux75~0_combout\,
	datad => \chipselect~input_o\,
	combout => \U_AVALON|config_s[0]~0_combout\);

-- Location: FF_X44_Y30_N25
\U_AVALON|config_s[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[0]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(0));

-- Location: LCCOMB_X44_Y30_N2
\U_AVALON|Mux87~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux87~0_combout\ = (\U_AVALON|Mux75~0_combout\ & ((\address[1]~input_o\ & ((\U_AVALON|config_s\(0)))) # (!\address[1]~input_o\ & (\U_AVALON|butee_g_s\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux75~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(0),
	datad => \U_AVALON|config_s\(0),
	combout => \U_AVALON|Mux87~0_combout\);

-- Location: LCCOMB_X48_Y18_N2
\U_AVALON|Mux83~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux83~0_combout\ = (!\address[2]~input_o\ & \address[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[2]~input_o\,
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux83~0_combout\);

-- Location: LCCOMB_X43_Y30_N14
\U_AVALON|butee_d_s[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|butee_d_s[0]~0_combout\ = (!\write_n~input_o\ & (!\address[1]~input_o\ & (\U_AVALON|Mux83~0_combout\ & \chipselect~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \write_n~input_o\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|Mux83~0_combout\,
	datad => \chipselect~input_o\,
	combout => \U_AVALON|butee_d_s[0]~0_combout\);

-- Location: FF_X45_Y30_N9
\U_AVALON|butee_d_s[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[0]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(0));

-- Location: LCCOMB_X45_Y30_N8
\U_AVALON|Mux87~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux87~1_combout\ = (\U_AVALON|Mux87~0_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|butee_d_s\(0) & \U_AVALON|Mux83~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux87~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(0),
	datad => \U_AVALON|Mux83~0_combout\,
	combout => \U_AVALON|Mux87~1_combout\);

-- Location: IOIBUF_X23_Y34_N22
\writedata[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(1),
	o => \writedata[1]~input_o\);

-- Location: FF_X44_Y30_N29
\U_AVALON|config_s[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[1]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(1));

-- Location: FF_X44_Y30_N7
\U_AVALON|butee_g_s[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[1]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(1));

-- Location: LCCOMB_X44_Y30_N6
\U_AVALON|Mux86~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux86~0_combout\ = (\U_AVALON|Mux75~0_combout\ & ((\address[1]~input_o\ & (\U_AVALON|config_s\(1))) # (!\address[1]~input_o\ & ((\U_AVALON|butee_g_s\(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|config_s\(1),
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(1),
	datad => \U_AVALON|Mux75~0_combout\,
	combout => \U_AVALON|Mux86~0_combout\);

-- Location: FF_X45_Y30_N11
\U_AVALON|butee_d_s[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[1]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(1));

-- Location: LCCOMB_X45_Y30_N10
\U_AVALON|Mux86~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux86~1_combout\ = (\U_AVALON|Mux86~0_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|butee_d_s\(1) & \U_AVALON|Mux83~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux86~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(1),
	datad => \U_AVALON|Mux83~0_combout\,
	combout => \U_AVALON|Mux86~1_combout\);

-- Location: IOIBUF_X7_Y34_N1
\writedata[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(2),
	o => \writedata[2]~input_o\);

-- Location: FF_X45_Y30_N29
\U_AVALON|butee_d_s[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[2]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(2));

-- Location: FF_X43_Y30_N19
\U_AVALON|butee_g_s[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[2]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(2));

-- Location: FF_X43_Y30_N17
\U_AVALON|config_s[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[2]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(2));

-- Location: LCCOMB_X43_Y30_N18
\U_AVALON|Mux85~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux85~0_combout\ = (\U_AVALON|Mux75~0_combout\ & ((\address[1]~input_o\ & ((\U_AVALON|config_s\(2)))) # (!\address[1]~input_o\ & (\U_AVALON|butee_g_s\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \U_AVALON|Mux75~0_combout\,
	datac => \U_AVALON|butee_g_s\(2),
	datad => \U_AVALON|config_s\(2),
	combout => \U_AVALON|Mux85~0_combout\);

-- Location: LCCOMB_X45_Y30_N28
\U_AVALON|Mux85~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux85~1_combout\ = (\U_AVALON|Mux85~0_combout\) # ((\U_AVALON|Mux83~0_combout\ & (!\address[1]~input_o\ & \U_AVALON|butee_d_s\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux83~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(2),
	datad => \U_AVALON|Mux85~0_combout\,
	combout => \U_AVALON|Mux85~1_combout\);

-- Location: IOIBUF_X40_Y34_N1
\writedata[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(3),
	o => \writedata[3]~input_o\);

-- Location: FF_X43_Y30_N7
\U_AVALON|butee_g_s[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[3]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(3));

-- Location: FF_X43_Y30_N29
\U_AVALON|config_s[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[3]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(3));

-- Location: LCCOMB_X43_Y30_N6
\U_AVALON|Mux84~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux84~0_combout\ = (\U_AVALON|Mux75~0_combout\ & ((\address[1]~input_o\ & ((\U_AVALON|config_s\(3)))) # (!\address[1]~input_o\ & (\U_AVALON|butee_g_s\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \U_AVALON|Mux75~0_combout\,
	datac => \U_AVALON|butee_g_s\(3),
	datad => \U_AVALON|config_s\(3),
	combout => \U_AVALON|Mux84~0_combout\);

-- Location: FF_X45_Y30_N31
\U_AVALON|butee_d_s[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[3]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(3));

-- Location: LCCOMB_X43_Y30_N8
\U_AVALON|Mux84~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux84~1_combout\ = (\U_AVALON|Mux84~0_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|Mux83~0_combout\ & \U_AVALON|butee_d_s\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux84~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|Mux83~0_combout\,
	datad => \U_AVALON|butee_d_s\(3),
	combout => \U_AVALON|Mux84~1_combout\);

-- Location: IOIBUF_X49_Y34_N1
\writedata[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(4),
	o => \writedata[4]~input_o\);

-- Location: FF_X44_Y30_N1
\U_AVALON|butee_g_s[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[4]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(4));

-- Location: FF_X45_Y30_N19
\U_AVALON|butee_d_s[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[4]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(4));

-- Location: FF_X45_Y30_N1
\U_AVALON|config_s[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[4]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(4));

-- Location: LCCOMB_X45_Y30_N0
\U_AVALON|Mux83~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux83~1_combout\ = (\address[1]~input_o\ & (\U_AVALON|config_s\(4) & !\address[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[1]~input_o\,
	datac => \U_AVALON|config_s\(4),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux83~1_combout\);

-- Location: LCCOMB_X45_Y30_N18
\U_AVALON|Mux83~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux83~2_combout\ = (\U_AVALON|Mux83~1_combout\) # ((\U_AVALON|Mux83~0_combout\ & ((\address[1]~input_o\) # (\U_AVALON|butee_d_s\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux83~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(4),
	datad => \U_AVALON|Mux83~1_combout\,
	combout => \U_AVALON|Mux83~2_combout\);

-- Location: LCCOMB_X44_Y30_N0
\U_AVALON|Mux83~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux83~3_combout\ = (\U_AVALON|Mux83~2_combout\) # ((\U_AVALON|Mux75~0_combout\ & (!\address[1]~input_o\ & \U_AVALON|butee_g_s\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux75~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(4),
	datad => \U_AVALON|Mux83~2_combout\,
	combout => \U_AVALON|Mux83~3_combout\);

-- Location: IOIBUF_X38_Y34_N15
\writedata[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(5),
	o => \writedata[5]~input_o\);

-- Location: FF_X44_Y30_N27
\U_AVALON|config_s[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[5]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(5));

-- Location: FF_X44_Y30_N21
\U_AVALON|butee_g_s[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[5]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(5));

-- Location: LCCOMB_X44_Y30_N26
\U_AVALON|Mux82~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux82~0_combout\ = (\U_AVALON|Mux75~0_combout\ & ((\address[1]~input_o\ & (\U_AVALON|config_s\(5))) # (!\address[1]~input_o\ & ((\U_AVALON|butee_g_s\(5))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux75~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|config_s\(5),
	datad => \U_AVALON|butee_g_s\(5),
	combout => \U_AVALON|Mux82~0_combout\);

-- Location: FF_X45_Y30_N13
\U_AVALON|butee_d_s[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[5]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(5));

-- Location: LCCOMB_X45_Y30_N12
\U_AVALON|Mux82~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux82~1_combout\ = (\U_AVALON|Mux82~0_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|butee_d_s\(5) & \U_AVALON|Mux83~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux82~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(5),
	datad => \U_AVALON|Mux83~0_combout\,
	combout => \U_AVALON|Mux82~1_combout\);

-- Location: IOIBUF_X45_Y34_N8
\writedata[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(6),
	o => \writedata[6]~input_o\);

-- Location: FF_X44_Y30_N9
\U_AVALON|butee_g_s[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[6]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(6));

-- Location: FF_X44_Y30_N15
\U_AVALON|config_s[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[6]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(6));

-- Location: LCCOMB_X44_Y30_N14
\U_AVALON|Mux81~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux81~0_combout\ = (!\address[2]~input_o\ & (\U_AVALON|config_s\(6) & \address[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(6),
	datad => \address[1]~input_o\,
	combout => \U_AVALON|Mux81~0_combout\);

-- Location: FF_X45_Y30_N7
\U_AVALON|butee_d_s[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[6]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(6));

-- Location: LCCOMB_X45_Y30_N6
\U_AVALON|Mux81~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux81~1_combout\ = (\U_AVALON|Mux81~0_combout\) # ((\U_AVALON|Mux83~0_combout\ & ((\address[1]~input_o\) # (\U_AVALON|butee_d_s\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux81~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(6),
	datad => \U_AVALON|Mux83~0_combout\,
	combout => \U_AVALON|Mux81~1_combout\);

-- Location: LCCOMB_X44_Y30_N8
\U_AVALON|Mux81~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux81~2_combout\ = (\U_AVALON|Mux81~1_combout\) # ((\U_AVALON|Mux75~0_combout\ & (!\address[1]~input_o\ & \U_AVALON|butee_g_s\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux75~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(6),
	datad => \U_AVALON|Mux81~1_combout\,
	combout => \U_AVALON|Mux81~2_combout\);

-- Location: IOIBUF_X51_Y34_N22
\writedata[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(7),
	o => \writedata[7]~input_o\);

-- Location: FF_X44_Y30_N11
\U_AVALON|butee_g_s[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[7]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(7));

-- Location: FF_X45_Y30_N27
\U_AVALON|butee_d_s[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[7]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(7));

-- Location: FF_X45_Y30_N17
\U_AVALON|config_s[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[7]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(7));

-- Location: LCCOMB_X45_Y30_N16
\U_AVALON|Mux80~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux80~0_combout\ = (\address[1]~input_o\ & (\U_AVALON|config_s\(7) & !\address[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[1]~input_o\,
	datac => \U_AVALON|config_s\(7),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux80~0_combout\);

-- Location: LCCOMB_X45_Y30_N26
\U_AVALON|Mux80~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux80~1_combout\ = (\U_AVALON|Mux80~0_combout\) # ((\U_AVALON|Mux83~0_combout\ & ((\address[1]~input_o\) # (\U_AVALON|butee_d_s\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux83~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(7),
	datad => \U_AVALON|Mux80~0_combout\,
	combout => \U_AVALON|Mux80~1_combout\);

-- Location: LCCOMB_X44_Y30_N10
\U_AVALON|Mux80~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux80~2_combout\ = (\U_AVALON|Mux80~1_combout\) # ((\U_AVALON|Mux75~0_combout\ & (!\address[1]~input_o\ & \U_AVALON|butee_g_s\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux75~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(7),
	datad => \U_AVALON|Mux80~1_combout\,
	combout => \U_AVALON|Mux80~2_combout\);

-- Location: IOIBUF_X47_Y34_N22
\writedata[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(8),
	o => \writedata[8]~input_o\);

-- Location: FF_X44_Y30_N23
\U_AVALON|butee_g_s[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[8]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(8));

-- Location: FF_X45_Y30_N21
\U_AVALON|butee_d_s[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[8]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(8));

-- Location: FF_X44_Y30_N13
\U_AVALON|config_s[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[8]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(8));

-- Location: LCCOMB_X44_Y30_N12
\U_AVALON|Mux79~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux79~0_combout\ = (!\address[2]~input_o\ & (\U_AVALON|config_s\(8) & \address[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(8),
	datad => \address[1]~input_o\,
	combout => \U_AVALON|Mux79~0_combout\);

-- Location: LCCOMB_X45_Y30_N14
\U_AVALON|Mux79~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux79~1_combout\ = (\U_AVALON|Mux79~0_combout\) # ((\U_AVALON|Mux83~0_combout\ & ((\U_AVALON|butee_d_s\(8)) # (\address[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux83~0_combout\,
	datab => \U_AVALON|butee_d_s\(8),
	datac => \address[1]~input_o\,
	datad => \U_AVALON|Mux79~0_combout\,
	combout => \U_AVALON|Mux79~1_combout\);

-- Location: LCCOMB_X45_Y30_N24
\U_AVALON|Mux79~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux79~2_combout\ = (\U_AVALON|Mux79~1_combout\) # ((\U_AVALON|Mux75~0_combout\ & (\U_AVALON|butee_g_s\(8) & !\address[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux75~0_combout\,
	datab => \U_AVALON|butee_g_s\(8),
	datac => \U_AVALON|Mux79~1_combout\,
	datad => \address[1]~input_o\,
	combout => \U_AVALON|Mux79~2_combout\);

-- Location: IOIBUF_X23_Y34_N15
\writedata[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(9),
	o => \writedata[9]~input_o\);

-- Location: FF_X36_Y4_N1
\U_AVALON|config_s[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[9]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(9));

-- Location: LCCOMB_X36_Y4_N0
\U_AVALON|Mux78~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux78~0_combout\ = (\address[1]~input_o\ & (\U_AVALON|config_s\(9) & !\address[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datac => \U_AVALON|config_s\(9),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux78~0_combout\);

-- Location: FF_X45_Y30_N3
\U_AVALON|butee_d_s[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[9]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(9));

-- Location: LCCOMB_X36_Y4_N2
\U_AVALON|Mux78~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux78~1_combout\ = (\U_AVALON|Mux78~0_combout\) # ((\U_AVALON|Mux83~0_combout\ & ((\address[1]~input_o\) # (\U_AVALON|butee_d_s\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \U_AVALON|Mux78~0_combout\,
	datac => \U_AVALON|butee_d_s\(9),
	datad => \U_AVALON|Mux83~0_combout\,
	combout => \U_AVALON|Mux78~1_combout\);

-- Location: FF_X44_Y30_N17
\U_AVALON|butee_g_s[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[9]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(9));

-- Location: LCCOMB_X44_Y30_N16
\U_AVALON|Mux78~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux78~2_combout\ = (\U_AVALON|Mux78~1_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|butee_g_s\(9) & \U_AVALON|Mux75~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux78~1_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(9),
	datad => \U_AVALON|Mux75~0_combout\,
	combout => \U_AVALON|Mux78~2_combout\);

-- Location: IOIBUF_X49_Y34_N8
\writedata[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(10),
	o => \writedata[10]~input_o\);

-- Location: FF_X45_Y30_N5
\U_AVALON|butee_d_s[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[10]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(10));

-- Location: FF_X44_Y30_N19
\U_AVALON|config_s[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[10]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(10));

-- Location: LCCOMB_X44_Y30_N18
\U_AVALON|Mux77~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux77~0_combout\ = (!\address[2]~input_o\ & (\U_AVALON|config_s\(10) & \address[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(10),
	datad => \address[1]~input_o\,
	combout => \U_AVALON|Mux77~0_combout\);

-- Location: LCCOMB_X45_Y30_N4
\U_AVALON|Mux77~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux77~1_combout\ = (\U_AVALON|Mux77~0_combout\) # ((\U_AVALON|Mux83~0_combout\ & ((\address[1]~input_o\) # (\U_AVALON|butee_d_s\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux83~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_d_s\(10),
	datad => \U_AVALON|Mux77~0_combout\,
	combout => \U_AVALON|Mux77~1_combout\);

-- Location: FF_X44_Y30_N5
\U_AVALON|butee_g_s[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[10]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(10));

-- Location: LCCOMB_X44_Y30_N30
\U_AVALON|Mux77~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux77~2_combout\ = (\U_AVALON|Mux77~1_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|butee_g_s\(10) & \U_AVALON|Mux75~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux77~1_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|butee_g_s\(10),
	datad => \U_AVALON|Mux75~0_combout\,
	combout => \U_AVALON|Mux77~2_combout\);

-- Location: IOIBUF_X53_Y22_N8
\writedata[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(11),
	o => \writedata[11]~input_o\);

-- Location: FF_X43_Y30_N11
\U_AVALON|config_s[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[11]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(11));

-- Location: FF_X43_Y30_N13
\U_AVALON|butee_g_s[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[11]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_g_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_g_s\(11));

-- Location: LCCOMB_X43_Y30_N10
\U_AVALON|Mux76~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux76~0_combout\ = (\U_AVALON|Mux75~0_combout\ & ((\address[1]~input_o\ & (\U_AVALON|config_s\(11))) # (!\address[1]~input_o\ & ((\U_AVALON|butee_g_s\(11))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \U_AVALON|Mux75~0_combout\,
	datac => \U_AVALON|config_s\(11),
	datad => \U_AVALON|butee_g_s\(11),
	combout => \U_AVALON|Mux76~0_combout\);

-- Location: FF_X45_Y30_N23
\U_AVALON|butee_d_s[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[11]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|butee_d_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|butee_d_s\(11));

-- Location: LCCOMB_X43_Y30_N22
\U_AVALON|Mux76~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux76~1_combout\ = (\U_AVALON|Mux76~0_combout\) # ((!\address[1]~input_o\ & (\U_AVALON|Mux83~0_combout\ & \U_AVALON|butee_d_s\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|Mux76~0_combout\,
	datab => \address[1]~input_o\,
	datac => \U_AVALON|Mux83~0_combout\,
	datad => \U_AVALON|butee_d_s\(11),
	combout => \U_AVALON|Mux76~1_combout\);

-- Location: IOIBUF_X45_Y0_N22
\writedata[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(12),
	o => \writedata[12]~input_o\);

-- Location: FF_X36_Y4_N13
\U_AVALON|config_s[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[12]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(12));

-- Location: LCCOMB_X36_Y4_N12
\U_AVALON|Mux75~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux75~1_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(12) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(12),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux75~1_combout\);

-- Location: IOIBUF_X53_Y21_N22
\writedata[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(13),
	o => \writedata[13]~input_o\);

-- Location: FF_X48_Y18_N5
\U_AVALON|config_s[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[13]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(13));

-- Location: LCCOMB_X48_Y18_N4
\U_AVALON|Mux74~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux74~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(13) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(13),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux74~0_combout\);

-- Location: IOIBUF_X27_Y0_N22
\writedata[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(14),
	o => \writedata[14]~input_o\);

-- Location: FF_X36_Y4_N31
\U_AVALON|config_s[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[14]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(14));

-- Location: LCCOMB_X36_Y4_N30
\U_AVALON|Mux73~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux73~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(14) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(14),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux73~0_combout\);

-- Location: IOIBUF_X27_Y0_N15
\writedata[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(15),
	o => \writedata[15]~input_o\);

-- Location: FF_X48_Y18_N15
\U_AVALON|config_s[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[15]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(15));

-- Location: LCCOMB_X48_Y18_N14
\U_AVALON|Mux72~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux72~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(15) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(15),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux72~0_combout\);

-- Location: IOIBUF_X34_Y0_N15
\writedata[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(16),
	o => \writedata[16]~input_o\);

-- Location: FF_X36_Y4_N17
\U_AVALON|config_s[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[16]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(16));

-- Location: LCCOMB_X36_Y4_N16
\U_AVALON|Mux71~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux71~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(16) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(16),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux71~0_combout\);

-- Location: IOIBUF_X27_Y0_N8
\writedata[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(17),
	o => \writedata[17]~input_o\);

-- Location: FF_X36_Y4_N19
\U_AVALON|config_s[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[17]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(17));

-- Location: LCCOMB_X36_Y4_N18
\U_AVALON|Mux70~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux70~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(17) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(17),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux70~0_combout\);

-- Location: IOIBUF_X27_Y0_N1
\writedata[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(18),
	o => \writedata[18]~input_o\);

-- Location: FF_X36_Y4_N29
\U_AVALON|config_s[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[18]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(18));

-- Location: LCCOMB_X36_Y4_N28
\U_AVALON|Mux69~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux69~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(18) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(18),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux69~0_combout\);

-- Location: IOIBUF_X36_Y0_N22
\writedata[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(19),
	o => \writedata[19]~input_o\);

-- Location: FF_X36_Y4_N23
\U_AVALON|config_s[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[19]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(19));

-- Location: LCCOMB_X36_Y4_N22
\U_AVALON|Mux68~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux68~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(19) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(19),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux68~0_combout\);

-- Location: IOIBUF_X0_Y15_N1
\writedata[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(20),
	o => \writedata[20]~input_o\);

-- Location: FF_X48_Y18_N9
\U_AVALON|config_s[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[20]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(20));

-- Location: LCCOMB_X48_Y18_N8
\U_AVALON|Mux67~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux67~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(20) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(20),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux67~0_combout\);

-- Location: IOIBUF_X49_Y0_N1
\writedata[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(21),
	o => \writedata[21]~input_o\);

-- Location: FF_X48_Y18_N19
\U_AVALON|config_s[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[21]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(21));

-- Location: LCCOMB_X48_Y18_N18
\U_AVALON|Mux66~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux66~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(21) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(21),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux66~0_combout\);

-- Location: IOIBUF_X53_Y20_N15
\writedata[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(22),
	o => \writedata[22]~input_o\);

-- Location: FF_X48_Y18_N13
\U_AVALON|config_s[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[22]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(22));

-- Location: LCCOMB_X48_Y18_N12
\U_AVALON|Mux65~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux65~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(22) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(22),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux65~0_combout\);

-- Location: IOIBUF_X36_Y0_N15
\writedata[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(23),
	o => \writedata[23]~input_o\);

-- Location: FF_X36_Y4_N9
\U_AVALON|config_s[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[23]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(23));

-- Location: LCCOMB_X36_Y4_N8
\U_AVALON|Mux64~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux64~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(23) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(23),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux64~0_combout\);

-- Location: IOIBUF_X36_Y0_N8
\writedata[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(24),
	o => \writedata[24]~input_o\);

-- Location: FF_X36_Y4_N11
\U_AVALON|config_s[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[24]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(24));

-- Location: LCCOMB_X36_Y4_N10
\U_AVALON|Mux63~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux63~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(24) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(24),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux63~0_combout\);

-- Location: IOIBUF_X40_Y0_N22
\writedata[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(25),
	o => \writedata[25]~input_o\);

-- Location: FF_X36_Y4_N5
\U_AVALON|config_s[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[25]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(25));

-- Location: LCCOMB_X36_Y4_N4
\U_AVALON|Mux62~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux62~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(25) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(25),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux62~0_combout\);

-- Location: IOIBUF_X14_Y0_N22
\writedata[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(26),
	o => \writedata[26]~input_o\);

-- Location: FF_X36_Y4_N15
\U_AVALON|config_s[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[26]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(26));

-- Location: LCCOMB_X36_Y4_N14
\U_AVALON|Mux61~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux61~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(26) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(26),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux61~0_combout\);

-- Location: IOIBUF_X47_Y0_N22
\writedata[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(27),
	o => \writedata[27]~input_o\);

-- Location: FF_X36_Y4_N25
\U_AVALON|config_s[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[27]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(27));

-- Location: LCCOMB_X36_Y4_N24
\U_AVALON|Mux60~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux60~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(27) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(27),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux60~0_combout\);

-- Location: IOIBUF_X53_Y20_N22
\writedata[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(28),
	o => \writedata[28]~input_o\);

-- Location: FF_X48_Y18_N7
\U_AVALON|config_s[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[28]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(28));

-- Location: LCCOMB_X48_Y18_N6
\U_AVALON|Mux59~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux59~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(28) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(28),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux59~0_combout\);

-- Location: IOIBUF_X16_Y0_N15
\writedata[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(29),
	o => \writedata[29]~input_o\);

-- Location: FF_X36_Y4_N27
\U_AVALON|config_s[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[29]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(29));

-- Location: LCCOMB_X36_Y4_N26
\U_AVALON|Mux58~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux58~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(29) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(29),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux58~0_combout\);

-- Location: IOIBUF_X53_Y14_N1
\writedata[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(30),
	o => \writedata[30]~input_o\);

-- Location: FF_X48_Y18_N1
\U_AVALON|config_s[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[30]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(30));

-- Location: LCCOMB_X48_Y18_N0
\U_AVALON|Mux57~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux57~0_combout\ = (\address[1]~input_o\ & (!\address[2]~input_o\ & (\U_AVALON|config_s\(30) & !\address[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[2]~input_o\,
	datac => \U_AVALON|config_s\(30),
	datad => \address[0]~input_o\,
	combout => \U_AVALON|Mux57~0_combout\);

-- Location: IOIBUF_X40_Y0_N15
\writedata[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_writedata(31),
	o => \writedata[31]~input_o\);

-- Location: FF_X36_Y4_N21
\U_AVALON|config_s[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \writedata[31]~input_o\,
	clrn => \reset_n~inputclkctrl_outclk\,
	sload => VCC,
	ena => \U_AVALON|config_s[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \U_AVALON|config_s\(31));

-- Location: LCCOMB_X36_Y4_N20
\U_AVALON|Mux56~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_AVALON|Mux56~0_combout\ = (\address[1]~input_o\ & (!\address[0]~input_o\ & (\U_AVALON|config_s\(31) & !\address[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \address[1]~input_o\,
	datab => \address[0]~input_o\,
	datac => \U_AVALON|config_s\(31),
	datad => \address[2]~input_o\,
	combout => \U_AVALON|Mux56~0_combout\);

-- Location: IOIBUF_X34_Y34_N15
\sens_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_sens_in,
	o => \sens_in~input_o\);

-- Location: IOIBUF_X18_Y34_N22
\pwm_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_pwm_in,
	o => \pwm_in~input_o\);

-- Location: LCCOMB_X44_Y30_N4
\U_BUTEE|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|LessThan0~0_combout\ = (((!\U_AVALON|butee_g_s\(4) & !\U_AVALON|butee_g_s\(5))) # (!\U_AVALON|butee_g_s\(10))) # (!\U_AVALON|butee_g_s\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|butee_g_s\(4),
	datab => \U_AVALON|butee_g_s\(9),
	datac => \U_AVALON|butee_g_s\(10),
	datad => \U_AVALON|butee_g_s\(5),
	combout => \U_BUTEE|LessThan0~0_combout\);

-- Location: LCCOMB_X44_Y30_N22
\U_BUTEE|pwm_safe~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|pwm_safe~0_combout\ = (\U_AVALON|butee_g_s\(7) & (\U_AVALON|butee_g_s\(6) & (\U_AVALON|butee_g_s\(8) & !\U_BUTEE|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|butee_g_s\(7),
	datab => \U_AVALON|butee_g_s\(6),
	datac => \U_AVALON|butee_g_s\(8),
	datad => \U_BUTEE|LessThan0~0_combout\,
	combout => \U_BUTEE|pwm_safe~0_combout\);

-- Location: LCCOMB_X43_Y30_N12
\U_BUTEE|pwm_safe~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|pwm_safe~1_combout\ = (!\sens_in~input_o\ & (\pwm_in~input_o\ & (!\U_AVALON|butee_g_s\(11) & !\U_BUTEE|pwm_safe~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \sens_in~input_o\,
	datab => \pwm_in~input_o\,
	datac => \U_AVALON|butee_g_s\(11),
	datad => \U_BUTEE|pwm_safe~0_combout\,
	combout => \U_BUTEE|pwm_safe~1_combout\);

-- Location: LCCOMB_X45_Y30_N20
\U_BUTEE|pwm_safe~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|pwm_safe~2_combout\ = (\U_AVALON|butee_d_s\(6) & (\U_AVALON|butee_d_s\(8) & \U_AVALON|butee_d_s\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|butee_d_s\(6),
	datac => \U_AVALON|butee_d_s\(8),
	datad => \U_AVALON|butee_d_s\(7),
	combout => \U_BUTEE|pwm_safe~2_combout\);

-- Location: LCCOMB_X45_Y30_N30
\U_BUTEE|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|LessThan1~0_combout\ = (\U_AVALON|butee_d_s\(1)) # ((\U_AVALON|butee_d_s\(2)) # ((\U_AVALON|butee_d_s\(3)) # (\U_AVALON|butee_d_s\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_AVALON|butee_d_s\(1),
	datab => \U_AVALON|butee_d_s\(2),
	datac => \U_AVALON|butee_d_s\(3),
	datad => \U_AVALON|butee_d_s\(0),
	combout => \U_BUTEE|LessThan1~0_combout\);

-- Location: LCCOMB_X45_Y30_N2
\U_BUTEE|pwm_safe~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|pwm_safe~3_combout\ = (\U_AVALON|butee_d_s\(9) & ((\U_AVALON|butee_d_s\(5)) # ((\U_BUTEE|LessThan1~0_combout\ & \U_AVALON|butee_d_s\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BUTEE|LessThan1~0_combout\,
	datab => \U_AVALON|butee_d_s\(4),
	datac => \U_AVALON|butee_d_s\(9),
	datad => \U_AVALON|butee_d_s\(5),
	combout => \U_BUTEE|pwm_safe~3_combout\);

-- Location: LCCOMB_X45_Y30_N22
\U_BUTEE|pwm_safe~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|pwm_safe~4_combout\ = (\U_AVALON|butee_d_s\(11)) # ((\U_BUTEE|pwm_safe~2_combout\ & (\U_AVALON|butee_d_s\(10) & \U_BUTEE|pwm_safe~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BUTEE|pwm_safe~2_combout\,
	datab => \U_AVALON|butee_d_s\(10),
	datac => \U_AVALON|butee_d_s\(11),
	datad => \U_BUTEE|pwm_safe~3_combout\,
	combout => \U_BUTEE|pwm_safe~4_combout\);

-- Location: LCCOMB_X43_Y30_N24
\U_BUTEE|pwm_safe~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \U_BUTEE|pwm_safe~5_combout\ = (\U_BUTEE|pwm_safe~1_combout\) # ((\pwm_in~input_o\ & (\sens_in~input_o\ & \U_BUTEE|pwm_safe~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \U_BUTEE|pwm_safe~1_combout\,
	datab => \pwm_in~input_o\,
	datac => \sens_in~input_o\,
	datad => \U_BUTEE|pwm_safe~4_combout\,
	combout => \U_BUTEE|pwm_safe~5_combout\);

-- Location: IOIBUF_X7_Y34_N8
\data_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data_in,
	o => \data_in~input_o\);

ww_readdata(0) <= \readdata[0]~output_o\;

ww_readdata(1) <= \readdata[1]~output_o\;

ww_readdata(2) <= \readdata[2]~output_o\;

ww_readdata(3) <= \readdata[3]~output_o\;

ww_readdata(4) <= \readdata[4]~output_o\;

ww_readdata(5) <= \readdata[5]~output_o\;

ww_readdata(6) <= \readdata[6]~output_o\;

ww_readdata(7) <= \readdata[7]~output_o\;

ww_readdata(8) <= \readdata[8]~output_o\;

ww_readdata(9) <= \readdata[9]~output_o\;

ww_readdata(10) <= \readdata[10]~output_o\;

ww_readdata(11) <= \readdata[11]~output_o\;

ww_readdata(12) <= \readdata[12]~output_o\;

ww_readdata(13) <= \readdata[13]~output_o\;

ww_readdata(14) <= \readdata[14]~output_o\;

ww_readdata(15) <= \readdata[15]~output_o\;

ww_readdata(16) <= \readdata[16]~output_o\;

ww_readdata(17) <= \readdata[17]~output_o\;

ww_readdata(18) <= \readdata[18]~output_o\;

ww_readdata(19) <= \readdata[19]~output_o\;

ww_readdata(20) <= \readdata[20]~output_o\;

ww_readdata(21) <= \readdata[21]~output_o\;

ww_readdata(22) <= \readdata[22]~output_o\;

ww_readdata(23) <= \readdata[23]~output_o\;

ww_readdata(24) <= \readdata[24]~output_o\;

ww_readdata(25) <= \readdata[25]~output_o\;

ww_readdata(26) <= \readdata[26]~output_o\;

ww_readdata(27) <= \readdata[27]~output_o\;

ww_readdata(28) <= \readdata[28]~output_o\;

ww_readdata(29) <= \readdata[29]~output_o\;

ww_readdata(30) <= \readdata[30]~output_o\;

ww_readdata(31) <= \readdata[31]~output_o\;

ww_out_pwm <= \out_pwm~output_o\;

ww_out_sens <= \out_sens~output_o\;

ww_cs_n <= \cs_n~output_o\;

ww_clk_adc <= \clk_adc~output_o\;
END structure;


