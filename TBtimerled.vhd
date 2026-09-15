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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "09/08/2026 09:50:27"
                                                            
-- Vhdl Test Bench template for design  :  timerled
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TBtimerled IS
END TBtimerled;
ARCHITECTURE timerled_arch OF TBtimerled IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL sel : STD_LOGIC;
SIGNAL led : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL rst : STD_LOGIC;
COMPONENT timerled
	PORT (
	clk : IN STD_LOGIC;
	led : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	sel: in std_logic;
	rst : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : timerled
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	led => led,
	rst => rst,
	sel => sel
	);
                                           
Process_50ns : PROCESS                                              
---- optional sensitivity list                                  
---- (        )                                                 
---- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list
		clk <= '1';
		WAIT FOR 10 ns;
		clk <= '0';
		WAIT FOR 10 ns;                                                   
END PROCESS Process_50ns;
reset :process
			begin
				rst<='0';
				WAIT FOR 20 ns;
				rst <= '1';
				WAIT ;
			end process reset;
button : process
	begin
		sel <= '1';
		wait for 50ns;
		sel <= '0';
		wait for 20ns;
	
	end process button;
END timerled_arch;
