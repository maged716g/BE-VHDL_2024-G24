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
-- Generated on "09/24/2024 19:26:47"
                                                            
-- Vhdl Test Bench template for design  :  port_map_anem
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY port_map_anem_vhd_tst IS
END port_map_anem_vhd_tst;
ARCHITECTURE port_map_anem_arch OF port_map_anem_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk_50M : STD_LOGIC;
SIGNAL continu : STD_LOGIC;
SIGNAL data_anemometre : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL data_valid : STD_LOGIC;
SIGNAL in_freq_anemometre : STD_LOGIC;
SIGNAL raz_n : STD_LOGIC;
SIGNAL start_stop : STD_LOGIC;
COMPONENT port_map_anem
	PORT (
	clk_50M : IN STD_LOGIC;
	continu : IN STD_LOGIC;
	data_anemometre : BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	data_valid : BUFFER STD_LOGIC;
	in_freq_anemometre : IN STD_LOGIC;
	raz_n : IN STD_LOGIC;
	start_stop : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : port_map_anem
	PORT MAP (
-- list connections between master ports and signals
	clk_50M => clk_50M,
	continu => continu,
	data_anemometre => data_anemometre,
	data_valid => data_valid,
	in_freq_anemometre => in_freq_anemometre,
	raz_n => raz_n,
	start_stop => start_stop
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
END port_map_anem_arch;
