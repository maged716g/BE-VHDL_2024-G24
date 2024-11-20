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
-- Generated on "11/18/2024 09:08:51"
                                                            
-- Vhdl Test Bench template for design  :  NMEA_Interface_T
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY NMEA_Interface_T_vhd_tst IS
END NMEA_Interface_T_vhd_tst;
ARCHITECTURE NMEA_Interface_T_arch OF NMEA_Interface_T_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL angle : STD_LOGIC_VECTOR(8 DOWNTO 0);
SIGNAL clk : STD_LOGIC;
SIGNAL fin_transmit : STD_LOGIC;
SIGNAL raz_n : STD_LOGIC;
SIGNAL start_stop : STD_LOGIC;
SIGNAL tx_serial : STD_LOGIC;
COMPONENT NMEA_Interface_T
	PORT (
	angle : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
	clk : IN STD_LOGIC;
	fin_transmit : OUT STD_LOGIC;
	raz_n : IN STD_LOGIC;
	start_stop : IN STD_LOGIC;
	tx_serial : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : NMEA_Interface_T
	PORT MAP (
-- list connections between master ports and signals
	angle => angle,
	clk => clk,
	fin_transmit => fin_transmit,
	raz_n => raz_n,
	start_stop => start_stop,
	tx_serial => tx_serial
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END NMEA_Interface_T_arch;
