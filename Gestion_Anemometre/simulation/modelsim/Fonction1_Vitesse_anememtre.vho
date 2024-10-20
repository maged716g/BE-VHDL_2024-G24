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
-- VERSION "Version 18.0.0 Build 614 04/24/2018 SJ Lite Edition"

-- DATE "09/24/2024 17:59:29"

-- 
-- Device: Altera EP4CE115F29I8L Package FBGA780
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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

ENTITY 	port_map_anem IS
    PORT (
	clk_50M : IN std_logic;
	raz_n : IN std_logic;
	in_freq_anemometre : IN std_logic;
	continu : IN std_logic;
	start_stop : IN std_logic;
	data_valid : BUFFER std_logic;
	data_anemometre : BUFFER std_logic_vector(7 DOWNTO 0)
	);
END port_map_anem;

-- Design Ports Information
-- data_valid	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[0]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[1]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[2]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[3]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[4]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[5]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[6]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data_anemometre[7]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk_50M	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- continu	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- start_stop	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- raz_n	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- in_freq_anemometre	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF port_map_anem IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk_50M : std_logic;
SIGNAL ww_raz_n : std_logic;
SIGNAL ww_in_freq_anemometre : std_logic;
SIGNAL ww_continu : std_logic;
SIGNAL ww_start_stop : std_logic;
SIGNAL ww_data_valid : std_logic;
SIGNAL ww_data_anemometre : std_logic_vector(7 DOWNTO 0);
SIGNAL \in_freq_anemometre~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \DivFreq0|clk_1_int~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \raz_n~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk_50M~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \data_valid~output_o\ : std_logic;
SIGNAL \data_anemometre[0]~output_o\ : std_logic;
SIGNAL \data_anemometre[1]~output_o\ : std_logic;
SIGNAL \data_anemometre[2]~output_o\ : std_logic;
SIGNAL \data_anemometre[3]~output_o\ : std_logic;
SIGNAL \data_anemometre[4]~output_o\ : std_logic;
SIGNAL \data_anemometre[5]~output_o\ : std_logic;
SIGNAL \data_anemometre[6]~output_o\ : std_logic;
SIGNAL \data_anemometre[7]~output_o\ : std_logic;
SIGNAL \clk_50M~input_o\ : std_logic;
SIGNAL \clk_50M~inputclkctrl_outclk\ : std_logic;
SIGNAL \continu~input_o\ : std_logic;
SIGNAL \start_stop~input_o\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_valid~0_combout\ : std_logic;
SIGNAL \raz_n~input_o\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_valid~q\ : std_logic;
SIGNAL \DivFreq0|Add0~95_combout\ : std_logic;
SIGNAL \raz_n~inputclkctrl_outclk\ : std_logic;
SIGNAL \DivFreq0|Add0~1_cout\ : std_logic;
SIGNAL \DivFreq0|Add0~2_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~94_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~3\ : std_logic;
SIGNAL \DivFreq0|Add0~4_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~93_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~5\ : std_logic;
SIGNAL \DivFreq0|Add0~6_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~92_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~7\ : std_logic;
SIGNAL \DivFreq0|Add0~8_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~91_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~9\ : std_logic;
SIGNAL \DivFreq0|Add0~10_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~90_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~11\ : std_logic;
SIGNAL \DivFreq0|Add0~12_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~87_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~13\ : std_logic;
SIGNAL \DivFreq0|Add0~14_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~78_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~15\ : std_logic;
SIGNAL \DivFreq0|Add0~16_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~77_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~17\ : std_logic;
SIGNAL \DivFreq0|Add0~18_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~76_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~19\ : std_logic;
SIGNAL \DivFreq0|Add0~20_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~75_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~21\ : std_logic;
SIGNAL \DivFreq0|Add0~22_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~89_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~23\ : std_logic;
SIGNAL \DivFreq0|Add0~24_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~88_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~25\ : std_logic;
SIGNAL \DivFreq0|Add0~26_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~86_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~27\ : std_logic;
SIGNAL \DivFreq0|Add0~28_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~85_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~29\ : std_logic;
SIGNAL \DivFreq0|Add0~30_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~84_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~31\ : std_logic;
SIGNAL \DivFreq0|Add0~33\ : std_logic;
SIGNAL \DivFreq0|Add0~34_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~69_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~35\ : std_logic;
SIGNAL \DivFreq0|Add0~36_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~83_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~37\ : std_logic;
SIGNAL \DivFreq0|Add0~38_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~82_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~39\ : std_logic;
SIGNAL \DivFreq0|Add0~40_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~81_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~41\ : std_logic;
SIGNAL \DivFreq0|Add0~42_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~80_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~43\ : std_logic;
SIGNAL \DivFreq0|Add0~44_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~79_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~45\ : std_logic;
SIGNAL \DivFreq0|Add0~46_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~74_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~47\ : std_logic;
SIGNAL \DivFreq0|Add0~48_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~66_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~49\ : std_logic;
SIGNAL \DivFreq0|Add0~50_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~68_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~51\ : std_logic;
SIGNAL \DivFreq0|Add0~52_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~67_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~53\ : std_logic;
SIGNAL \DivFreq0|Add0~54_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~65_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~55\ : std_logic;
SIGNAL \DivFreq0|Add0~56_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~64_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~57\ : std_logic;
SIGNAL \DivFreq0|Add0~58_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~63_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~59\ : std_logic;
SIGNAL \DivFreq0|Add0~60_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~62_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~0_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~1_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~61\ : std_logic;
SIGNAL \DivFreq0|Add0~71_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~73_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~5_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~0_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~1_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~3_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~2_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~3_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~4_combout\ : std_logic;
SIGNAL \DivFreq0|LessThan0~6_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~32_combout\ : std_logic;
SIGNAL \DivFreq0|Add0~70_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~2_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~7_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~8_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~4_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~5_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~6_combout\ : std_logic;
SIGNAL \DivFreq0|Equal0~9_combout\ : std_logic;
SIGNAL \DivFreq0|clk_1_int~0_combout\ : std_logic;
SIGNAL \DivFreq0|clk_1_int~q\ : std_logic;
SIGNAL \DivFreq0|clk_1_int~clkctrl_outclk\ : std_logic;
SIGNAL \in_freq_anemometre~input_o\ : std_logic;
SIGNAL \in_freq_anemometre~inputclkctrl_outclk\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[0]~8_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[0]~8_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[0]~8_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~0_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[0]~9\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[1]~10_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[0]~9\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[1]~10_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[0]~9\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[1]~10_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~1_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[1]~11\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[2]~12_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[1]~11\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[2]~12_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[1]~11\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[2]~12_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~2_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[2]~13\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[3]~14_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[2]~13\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[3]~14_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[2]~13\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[3]~14_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~3_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[3]~15\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[4]~16_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[3]~15\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[4]~16_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[3]~15\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[4]~16_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~4_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[4]~17\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[5]~18_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[4]~17\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[5]~18_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[4]~17\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[5]~18_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~5_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[5]~19\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[6]~20_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[5]~19\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[6]~20_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[5]~19\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[6]~20_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~6_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[6]~21\ : std_logic;
SIGNAL \Frequence_calcule0|signal_2[7]~22_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[6]~21\ : std_logic;
SIGNAL \Frequence_calcule0|signal_1[7]~22_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[6]~21\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3[7]~22_combout\ : std_logic;
SIGNAL \gestion_data_anemometre0|signal_out~7_combout\ : std_logic;
SIGNAL \Frequence_calcule0|signal_3\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Frequence_calcule0|signal_2\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \Frequence_calcule0|signal_1\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \gestion_data_anemometre0|signal_out\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \DivFreq0|compteur\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \DivFreq0|ALT_INV_clk_1_int~q\ : std_logic;
SIGNAL \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_raz_n~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk_50M <= clk_50M;
ww_raz_n <= raz_n;
ww_in_freq_anemometre <= in_freq_anemometre;
ww_continu <= continu;
ww_start_stop <= start_stop;
data_valid <= ww_data_valid;
data_anemometre <= ww_data_anemometre;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\in_freq_anemometre~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \in_freq_anemometre~input_o\);

\DivFreq0|clk_1_int~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \DivFreq0|clk_1_int~q\);

\raz_n~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \raz_n~input_o\);

\clk_50M~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk_50M~input_o\);
\DivFreq0|ALT_INV_clk_1_int~q\ <= NOT \DivFreq0|clk_1_int~q\;
\DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\ <= NOT \DivFreq0|clk_1_int~clkctrl_outclk\;
\ALT_INV_in_freq_anemometre~inputclkctrl_outclk\ <= NOT \in_freq_anemometre~inputclkctrl_outclk\;
\ALT_INV_raz_n~input_o\ <= NOT \raz_n~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X42_Y0_N23
\data_valid~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_valid~q\,
	devoe => ww_devoe,
	o => \data_valid~output_o\);

-- Location: IOOBUF_X49_Y0_N16
\data_anemometre[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(0),
	devoe => ww_devoe,
	o => \data_anemometre[0]~output_o\);

-- Location: IOOBUF_X49_Y0_N23
\data_anemometre[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(1),
	devoe => ww_devoe,
	o => \data_anemometre[1]~output_o\);

-- Location: IOOBUF_X47_Y0_N9
\data_anemometre[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(2),
	devoe => ww_devoe,
	o => \data_anemometre[2]~output_o\);

-- Location: IOOBUF_X52_Y0_N23
\data_anemometre[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(3),
	devoe => ww_devoe,
	o => \data_anemometre[3]~output_o\);

-- Location: IOOBUF_X52_Y0_N2
\data_anemometre[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(4),
	devoe => ww_devoe,
	o => \data_anemometre[4]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\data_anemometre[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(5),
	devoe => ww_devoe,
	o => \data_anemometre[5]~output_o\);

-- Location: IOOBUF_X47_Y0_N2
\data_anemometre[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(6),
	devoe => ww_devoe,
	o => \data_anemometre[6]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\data_anemometre[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \gestion_data_anemometre0|signal_out\(7),
	devoe => ww_devoe,
	o => \data_anemometre[7]~output_o\);

-- Location: IOIBUF_X0_Y36_N8
\clk_50M~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk_50M,
	o => \clk_50M~input_o\);

-- Location: CLKCTRL_G2
\clk_50M~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk_50M~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk_50M~inputclkctrl_outclk\);

-- Location: IOIBUF_X45_Y0_N15
\continu~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_continu,
	o => \continu~input_o\);

-- Location: IOIBUF_X45_Y0_N22
\start_stop~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start_stop,
	o => \start_stop~input_o\);

-- Location: LCCOMB_X45_Y4_N28
\gestion_data_anemometre0|signal_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_valid~0_combout\ = (\continu~input_o\) # (!\start_stop~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \continu~input_o\,
	datad => \start_stop~input_o\,
	combout => \gestion_data_anemometre0|signal_valid~0_combout\);

-- Location: IOIBUF_X0_Y36_N22
\raz_n~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_raz_n,
	o => \raz_n~input_o\);

-- Location: FF_X45_Y4_N29
\gestion_data_anemometre0|signal_valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_valid~0_combout\,
	sclr => \ALT_INV_raz_n~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_valid~q\);

-- Location: LCCOMB_X57_Y3_N16
\DivFreq0|Add0~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~95_combout\ = (!\DivFreq0|compteur\(0) & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(0),
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~95_combout\);

-- Location: CLKCTRL_G0
\raz_n~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \raz_n~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \raz_n~inputclkctrl_outclk\);

-- Location: FF_X58_Y3_N11
\DivFreq0|compteur[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	asdata => \DivFreq0|Add0~95_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(0));

-- Location: LCCOMB_X58_Y3_N0
\DivFreq0|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~1_cout\ = CARRY(!\DivFreq0|compteur\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(0),
	datad => VCC,
	cout => \DivFreq0|Add0~1_cout\);

-- Location: LCCOMB_X58_Y3_N2
\DivFreq0|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~2_combout\ = (\DivFreq0|compteur\(1) & (!\DivFreq0|Add0~1_cout\)) # (!\DivFreq0|compteur\(1) & ((\DivFreq0|Add0~1_cout\) # (GND)))
-- \DivFreq0|Add0~3\ = CARRY((!\DivFreq0|Add0~1_cout\) # (!\DivFreq0|compteur\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(1),
	datad => VCC,
	cin => \DivFreq0|Add0~1_cout\,
	combout => \DivFreq0|Add0~2_combout\,
	cout => \DivFreq0|Add0~3\);

-- Location: LCCOMB_X57_Y3_N0
\DivFreq0|Add0~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~94_combout\ = (\DivFreq0|Add0~2_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|Add0~2_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~94_combout\);

-- Location: FF_X58_Y3_N15
\DivFreq0|compteur[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	asdata => \DivFreq0|Add0~94_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(1));

-- Location: LCCOMB_X58_Y3_N4
\DivFreq0|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~4_combout\ = (\DivFreq0|compteur\(2) & (\DivFreq0|Add0~3\ $ (GND))) # (!\DivFreq0|compteur\(2) & (!\DivFreq0|Add0~3\ & VCC))
-- \DivFreq0|Add0~5\ = CARRY((\DivFreq0|compteur\(2) & !\DivFreq0|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(2),
	datad => VCC,
	cin => \DivFreq0|Add0~3\,
	combout => \DivFreq0|Add0~4_combout\,
	cout => \DivFreq0|Add0~5\);

-- Location: LCCOMB_X59_Y3_N30
\DivFreq0|Add0~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~93_combout\ = (\DivFreq0|Add0~4_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|Add0~4_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~93_combout\);

-- Location: FF_X59_Y3_N31
\DivFreq0|compteur[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~93_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(2));

-- Location: LCCOMB_X58_Y3_N6
\DivFreq0|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~6_combout\ = (\DivFreq0|compteur\(3) & (!\DivFreq0|Add0~5\)) # (!\DivFreq0|compteur\(3) & ((\DivFreq0|Add0~5\) # (GND)))
-- \DivFreq0|Add0~7\ = CARRY((!\DivFreq0|Add0~5\) # (!\DivFreq0|compteur\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(3),
	datad => VCC,
	cin => \DivFreq0|Add0~5\,
	combout => \DivFreq0|Add0~6_combout\,
	cout => \DivFreq0|Add0~7\);

-- Location: LCCOMB_X59_Y3_N4
\DivFreq0|Add0~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~92_combout\ = (\DivFreq0|Add0~6_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|Add0~6_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~92_combout\);

-- Location: FF_X59_Y3_N5
\DivFreq0|compteur[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~92_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(3));

-- Location: LCCOMB_X58_Y3_N8
\DivFreq0|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~8_combout\ = (\DivFreq0|compteur\(4) & (\DivFreq0|Add0~7\ $ (GND))) # (!\DivFreq0|compteur\(4) & (!\DivFreq0|Add0~7\ & VCC))
-- \DivFreq0|Add0~9\ = CARRY((\DivFreq0|compteur\(4) & !\DivFreq0|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(4),
	datad => VCC,
	cin => \DivFreq0|Add0~7\,
	combout => \DivFreq0|Add0~8_combout\,
	cout => \DivFreq0|Add0~9\);

-- Location: LCCOMB_X57_Y3_N6
\DivFreq0|Add0~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~91_combout\ = (\DivFreq0|Add0~8_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|Add0~8_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~91_combout\);

-- Location: FF_X58_Y3_N5
\DivFreq0|compteur[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	asdata => \DivFreq0|Add0~91_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(4));

-- Location: LCCOMB_X58_Y3_N10
\DivFreq0|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~10_combout\ = (\DivFreq0|compteur\(5) & (!\DivFreq0|Add0~9\)) # (!\DivFreq0|compteur\(5) & ((\DivFreq0|Add0~9\) # (GND)))
-- \DivFreq0|Add0~11\ = CARRY((!\DivFreq0|Add0~9\) # (!\DivFreq0|compteur\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(5),
	datad => VCC,
	cin => \DivFreq0|Add0~9\,
	combout => \DivFreq0|Add0~10_combout\,
	cout => \DivFreq0|Add0~11\);

-- Location: LCCOMB_X57_Y3_N26
\DivFreq0|Add0~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~90_combout\ = (\DivFreq0|Add0~10_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|Add0~10_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~90_combout\);

-- Location: FF_X57_Y3_N27
\DivFreq0|compteur[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~90_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(5));

-- Location: LCCOMB_X58_Y3_N12
\DivFreq0|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~12_combout\ = (\DivFreq0|compteur\(6) & (\DivFreq0|Add0~11\ $ (GND))) # (!\DivFreq0|compteur\(6) & (!\DivFreq0|Add0~11\ & VCC))
-- \DivFreq0|Add0~13\ = CARRY((\DivFreq0|compteur\(6) & !\DivFreq0|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(6),
	datad => VCC,
	cin => \DivFreq0|Add0~11\,
	combout => \DivFreq0|Add0~12_combout\,
	cout => \DivFreq0|Add0~13\);

-- Location: LCCOMB_X57_Y3_N12
\DivFreq0|Add0~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~87_combout\ = (\DivFreq0|Add0~12_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|Add0~12_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~87_combout\);

-- Location: FF_X57_Y3_N13
\DivFreq0|compteur[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~87_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(6));

-- Location: LCCOMB_X58_Y3_N14
\DivFreq0|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~14_combout\ = (\DivFreq0|compteur\(7) & (!\DivFreq0|Add0~13\)) # (!\DivFreq0|compteur\(7) & ((\DivFreq0|Add0~13\) # (GND)))
-- \DivFreq0|Add0~15\ = CARRY((!\DivFreq0|Add0~13\) # (!\DivFreq0|compteur\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(7),
	datad => VCC,
	cin => \DivFreq0|Add0~13\,
	combout => \DivFreq0|Add0~14_combout\,
	cout => \DivFreq0|Add0~15\);

-- Location: LCCOMB_X59_Y2_N18
\DivFreq0|Add0~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~78_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~14_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~14_combout\,
	combout => \DivFreq0|Add0~78_combout\);

-- Location: FF_X59_Y2_N19
\DivFreq0|compteur[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~78_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(7));

-- Location: LCCOMB_X58_Y3_N16
\DivFreq0|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~16_combout\ = (\DivFreq0|compteur\(8) & (\DivFreq0|Add0~15\ $ (GND))) # (!\DivFreq0|compteur\(8) & (!\DivFreq0|Add0~15\ & VCC))
-- \DivFreq0|Add0~17\ = CARRY((\DivFreq0|compteur\(8) & !\DivFreq0|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(8),
	datad => VCC,
	cin => \DivFreq0|Add0~15\,
	combout => \DivFreq0|Add0~16_combout\,
	cout => \DivFreq0|Add0~17\);

-- Location: LCCOMB_X59_Y2_N8
\DivFreq0|Add0~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~77_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~16_combout\,
	combout => \DivFreq0|Add0~77_combout\);

-- Location: FF_X59_Y2_N9
\DivFreq0|compteur[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~77_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(8));

-- Location: LCCOMB_X58_Y3_N18
\DivFreq0|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~18_combout\ = (\DivFreq0|compteur\(9) & (!\DivFreq0|Add0~17\)) # (!\DivFreq0|compteur\(9) & ((\DivFreq0|Add0~17\) # (GND)))
-- \DivFreq0|Add0~19\ = CARRY((!\DivFreq0|Add0~17\) # (!\DivFreq0|compteur\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(9),
	datad => VCC,
	cin => \DivFreq0|Add0~17\,
	combout => \DivFreq0|Add0~18_combout\,
	cout => \DivFreq0|Add0~19\);

-- Location: LCCOMB_X59_Y2_N26
\DivFreq0|Add0~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~76_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~18_combout\,
	combout => \DivFreq0|Add0~76_combout\);

-- Location: FF_X59_Y2_N27
\DivFreq0|compteur[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~76_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(9));

-- Location: LCCOMB_X58_Y3_N20
\DivFreq0|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~20_combout\ = (\DivFreq0|compteur\(10) & (\DivFreq0|Add0~19\ $ (GND))) # (!\DivFreq0|compteur\(10) & (!\DivFreq0|Add0~19\ & VCC))
-- \DivFreq0|Add0~21\ = CARRY((\DivFreq0|compteur\(10) & !\DivFreq0|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(10),
	datad => VCC,
	cin => \DivFreq0|Add0~19\,
	combout => \DivFreq0|Add0~20_combout\,
	cout => \DivFreq0|Add0~21\);

-- Location: LCCOMB_X59_Y2_N4
\DivFreq0|Add0~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~75_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~20_combout\,
	combout => \DivFreq0|Add0~75_combout\);

-- Location: FF_X59_Y2_N5
\DivFreq0|compteur[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~75_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(10));

-- Location: LCCOMB_X58_Y3_N22
\DivFreq0|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~22_combout\ = (\DivFreq0|compteur\(11) & (!\DivFreq0|Add0~21\)) # (!\DivFreq0|compteur\(11) & ((\DivFreq0|Add0~21\) # (GND)))
-- \DivFreq0|Add0~23\ = CARRY((!\DivFreq0|Add0~21\) # (!\DivFreq0|compteur\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(11),
	datad => VCC,
	cin => \DivFreq0|Add0~21\,
	combout => \DivFreq0|Add0~22_combout\,
	cout => \DivFreq0|Add0~23\);

-- Location: LCCOMB_X57_Y3_N10
\DivFreq0|Add0~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~89_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~22_combout\,
	combout => \DivFreq0|Add0~89_combout\);

-- Location: FF_X57_Y3_N11
\DivFreq0|compteur[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~89_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(11));

-- Location: LCCOMB_X58_Y3_N24
\DivFreq0|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~24_combout\ = (\DivFreq0|compteur\(12) & (\DivFreq0|Add0~23\ $ (GND))) # (!\DivFreq0|compteur\(12) & (!\DivFreq0|Add0~23\ & VCC))
-- \DivFreq0|Add0~25\ = CARRY((\DivFreq0|compteur\(12) & !\DivFreq0|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(12),
	datad => VCC,
	cin => \DivFreq0|Add0~23\,
	combout => \DivFreq0|Add0~24_combout\,
	cout => \DivFreq0|Add0~25\);

-- Location: LCCOMB_X57_Y3_N8
\DivFreq0|Add0~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~88_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~24_combout\,
	combout => \DivFreq0|Add0~88_combout\);

-- Location: FF_X57_Y3_N9
\DivFreq0|compteur[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~88_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(12));

-- Location: LCCOMB_X58_Y3_N26
\DivFreq0|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~26_combout\ = (\DivFreq0|compteur\(13) & (!\DivFreq0|Add0~25\)) # (!\DivFreq0|compteur\(13) & ((\DivFreq0|Add0~25\) # (GND)))
-- \DivFreq0|Add0~27\ = CARRY((!\DivFreq0|Add0~25\) # (!\DivFreq0|compteur\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(13),
	datad => VCC,
	cin => \DivFreq0|Add0~25\,
	combout => \DivFreq0|Add0~26_combout\,
	cout => \DivFreq0|Add0~27\);

-- Location: LCCOMB_X57_Y3_N30
\DivFreq0|Add0~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~86_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~26_combout\,
	combout => \DivFreq0|Add0~86_combout\);

-- Location: FF_X57_Y3_N31
\DivFreq0|compteur[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~86_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(13));

-- Location: LCCOMB_X58_Y3_N28
\DivFreq0|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~28_combout\ = (\DivFreq0|compteur\(14) & (\DivFreq0|Add0~27\ $ (GND))) # (!\DivFreq0|compteur\(14) & (!\DivFreq0|Add0~27\ & VCC))
-- \DivFreq0|Add0~29\ = CARRY((\DivFreq0|compteur\(14) & !\DivFreq0|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(14),
	datad => VCC,
	cin => \DivFreq0|Add0~27\,
	combout => \DivFreq0|Add0~28_combout\,
	cout => \DivFreq0|Add0~29\);

-- Location: LCCOMB_X57_Y3_N4
\DivFreq0|Add0~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~85_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~28_combout\,
	combout => \DivFreq0|Add0~85_combout\);

-- Location: FF_X57_Y3_N5
\DivFreq0|compteur[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~85_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(14));

-- Location: LCCOMB_X58_Y3_N30
\DivFreq0|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~30_combout\ = (\DivFreq0|compteur\(15) & (!\DivFreq0|Add0~29\)) # (!\DivFreq0|compteur\(15) & ((\DivFreq0|Add0~29\) # (GND)))
-- \DivFreq0|Add0~31\ = CARRY((!\DivFreq0|Add0~29\) # (!\DivFreq0|compteur\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(15),
	datad => VCC,
	cin => \DivFreq0|Add0~29\,
	combout => \DivFreq0|Add0~30_combout\,
	cout => \DivFreq0|Add0~31\);

-- Location: LCCOMB_X57_Y3_N24
\DivFreq0|Add0~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~84_combout\ = (\DivFreq0|Add0~30_combout\ & \DivFreq0|LessThan0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|Add0~30_combout\,
	datad => \DivFreq0|LessThan0~6_combout\,
	combout => \DivFreq0|Add0~84_combout\);

-- Location: FF_X57_Y3_N25
\DivFreq0|compteur[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~84_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(15));

-- Location: LCCOMB_X58_Y2_N0
\DivFreq0|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~32_combout\ = (\DivFreq0|compteur\(16) & (\DivFreq0|Add0~31\ $ (GND))) # (!\DivFreq0|compteur\(16) & (!\DivFreq0|Add0~31\ & VCC))
-- \DivFreq0|Add0~33\ = CARRY((\DivFreq0|compteur\(16) & !\DivFreq0|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(16),
	datad => VCC,
	cin => \DivFreq0|Add0~31\,
	combout => \DivFreq0|Add0~32_combout\,
	cout => \DivFreq0|Add0~33\);

-- Location: LCCOMB_X58_Y2_N2
\DivFreq0|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~34_combout\ = (\DivFreq0|compteur\(17) & (!\DivFreq0|Add0~33\)) # (!\DivFreq0|compteur\(17) & ((\DivFreq0|Add0~33\) # (GND)))
-- \DivFreq0|Add0~35\ = CARRY((!\DivFreq0|Add0~33\) # (!\DivFreq0|compteur\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(17),
	datad => VCC,
	cin => \DivFreq0|Add0~33\,
	combout => \DivFreq0|Add0~34_combout\,
	cout => \DivFreq0|Add0~35\);

-- Location: LCCOMB_X57_Y2_N28
\DivFreq0|Add0~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~69_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~34_combout\,
	combout => \DivFreq0|Add0~69_combout\);

-- Location: FF_X57_Y2_N29
\DivFreq0|compteur[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~69_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(17));

-- Location: LCCOMB_X58_Y2_N4
\DivFreq0|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~36_combout\ = (\DivFreq0|compteur\(18) & (\DivFreq0|Add0~35\ $ (GND))) # (!\DivFreq0|compteur\(18) & (!\DivFreq0|Add0~35\ & VCC))
-- \DivFreq0|Add0~37\ = CARRY((\DivFreq0|compteur\(18) & !\DivFreq0|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(18),
	datad => VCC,
	cin => \DivFreq0|Add0~35\,
	combout => \DivFreq0|Add0~36_combout\,
	cout => \DivFreq0|Add0~37\);

-- Location: LCCOMB_X57_Y2_N14
\DivFreq0|Add0~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~83_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~36_combout\,
	combout => \DivFreq0|Add0~83_combout\);

-- Location: FF_X57_Y2_N15
\DivFreq0|compteur[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~83_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(18));

-- Location: LCCOMB_X58_Y2_N6
\DivFreq0|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~38_combout\ = (\DivFreq0|compteur\(19) & (!\DivFreq0|Add0~37\)) # (!\DivFreq0|compteur\(19) & ((\DivFreq0|Add0~37\) # (GND)))
-- \DivFreq0|Add0~39\ = CARRY((!\DivFreq0|Add0~37\) # (!\DivFreq0|compteur\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(19),
	datad => VCC,
	cin => \DivFreq0|Add0~37\,
	combout => \DivFreq0|Add0~38_combout\,
	cout => \DivFreq0|Add0~39\);

-- Location: LCCOMB_X57_Y2_N22
\DivFreq0|Add0~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~82_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~38_combout\,
	combout => \DivFreq0|Add0~82_combout\);

-- Location: FF_X57_Y2_N23
\DivFreq0|compteur[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~82_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(19));

-- Location: LCCOMB_X58_Y2_N8
\DivFreq0|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~40_combout\ = (\DivFreq0|compteur\(20) & (\DivFreq0|Add0~39\ $ (GND))) # (!\DivFreq0|compteur\(20) & (!\DivFreq0|Add0~39\ & VCC))
-- \DivFreq0|Add0~41\ = CARRY((\DivFreq0|compteur\(20) & !\DivFreq0|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(20),
	datad => VCC,
	cin => \DivFreq0|Add0~39\,
	combout => \DivFreq0|Add0~40_combout\,
	cout => \DivFreq0|Add0~41\);

-- Location: LCCOMB_X57_Y2_N12
\DivFreq0|Add0~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~81_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~40_combout\,
	combout => \DivFreq0|Add0~81_combout\);

-- Location: FF_X57_Y2_N13
\DivFreq0|compteur[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~81_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(20));

-- Location: LCCOMB_X58_Y2_N10
\DivFreq0|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~42_combout\ = (\DivFreq0|compteur\(21) & (!\DivFreq0|Add0~41\)) # (!\DivFreq0|compteur\(21) & ((\DivFreq0|Add0~41\) # (GND)))
-- \DivFreq0|Add0~43\ = CARRY((!\DivFreq0|Add0~41\) # (!\DivFreq0|compteur\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(21),
	datad => VCC,
	cin => \DivFreq0|Add0~41\,
	combout => \DivFreq0|Add0~42_combout\,
	cout => \DivFreq0|Add0~43\);

-- Location: LCCOMB_X57_Y2_N26
\DivFreq0|Add0~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~80_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~42_combout\,
	combout => \DivFreq0|Add0~80_combout\);

-- Location: FF_X57_Y2_N27
\DivFreq0|compteur[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~80_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(21));

-- Location: LCCOMB_X58_Y2_N12
\DivFreq0|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~44_combout\ = (\DivFreq0|compteur\(22) & (\DivFreq0|Add0~43\ $ (GND))) # (!\DivFreq0|compteur\(22) & (!\DivFreq0|Add0~43\ & VCC))
-- \DivFreq0|Add0~45\ = CARRY((\DivFreq0|compteur\(22) & !\DivFreq0|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(22),
	datad => VCC,
	cin => \DivFreq0|Add0~43\,
	combout => \DivFreq0|Add0~44_combout\,
	cout => \DivFreq0|Add0~45\);

-- Location: LCCOMB_X57_Y2_N16
\DivFreq0|Add0~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~79_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~44_combout\,
	combout => \DivFreq0|Add0~79_combout\);

-- Location: FF_X57_Y2_N17
\DivFreq0|compteur[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~79_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(22));

-- Location: LCCOMB_X58_Y2_N14
\DivFreq0|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~46_combout\ = (\DivFreq0|compteur\(23) & (!\DivFreq0|Add0~45\)) # (!\DivFreq0|compteur\(23) & ((\DivFreq0|Add0~45\) # (GND)))
-- \DivFreq0|Add0~47\ = CARRY((!\DivFreq0|Add0~45\) # (!\DivFreq0|compteur\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(23),
	datad => VCC,
	cin => \DivFreq0|Add0~45\,
	combout => \DivFreq0|Add0~46_combout\,
	cout => \DivFreq0|Add0~47\);

-- Location: LCCOMB_X59_Y2_N14
\DivFreq0|Add0~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~74_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~46_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~46_combout\,
	combout => \DivFreq0|Add0~74_combout\);

-- Location: FF_X59_Y2_N15
\DivFreq0|compteur[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~74_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(23));

-- Location: LCCOMB_X58_Y2_N16
\DivFreq0|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~48_combout\ = (\DivFreq0|compteur\(24) & (\DivFreq0|Add0~47\ $ (GND))) # (!\DivFreq0|compteur\(24) & (!\DivFreq0|Add0~47\ & VCC))
-- \DivFreq0|Add0~49\ = CARRY((\DivFreq0|compteur\(24) & !\DivFreq0|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(24),
	datad => VCC,
	cin => \DivFreq0|Add0~47\,
	combout => \DivFreq0|Add0~48_combout\,
	cout => \DivFreq0|Add0~49\);

-- Location: LCCOMB_X59_Y2_N2
\DivFreq0|Add0~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~66_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~48_combout\,
	combout => \DivFreq0|Add0~66_combout\);

-- Location: FF_X59_Y2_N3
\DivFreq0|compteur[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~66_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(24));

-- Location: LCCOMB_X58_Y2_N18
\DivFreq0|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~50_combout\ = (\DivFreq0|compteur\(25) & (!\DivFreq0|Add0~49\)) # (!\DivFreq0|compteur\(25) & ((\DivFreq0|Add0~49\) # (GND)))
-- \DivFreq0|Add0~51\ = CARRY((!\DivFreq0|Add0~49\) # (!\DivFreq0|compteur\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(25),
	datad => VCC,
	cin => \DivFreq0|Add0~49\,
	combout => \DivFreq0|Add0~50_combout\,
	cout => \DivFreq0|Add0~51\);

-- Location: LCCOMB_X59_Y2_N30
\DivFreq0|Add0~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~68_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~50_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~50_combout\,
	combout => \DivFreq0|Add0~68_combout\);

-- Location: FF_X59_Y2_N31
\DivFreq0|compteur[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~68_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(25));

-- Location: LCCOMB_X58_Y2_N20
\DivFreq0|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~52_combout\ = (\DivFreq0|compteur\(26) & (\DivFreq0|Add0~51\ $ (GND))) # (!\DivFreq0|compteur\(26) & (!\DivFreq0|Add0~51\ & VCC))
-- \DivFreq0|Add0~53\ = CARRY((\DivFreq0|compteur\(26) & !\DivFreq0|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(26),
	datad => VCC,
	cin => \DivFreq0|Add0~51\,
	combout => \DivFreq0|Add0~52_combout\,
	cout => \DivFreq0|Add0~53\);

-- Location: LCCOMB_X59_Y2_N20
\DivFreq0|Add0~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~67_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~52_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~52_combout\,
	combout => \DivFreq0|Add0~67_combout\);

-- Location: FF_X59_Y2_N21
\DivFreq0|compteur[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~67_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(26));

-- Location: LCCOMB_X58_Y2_N22
\DivFreq0|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~54_combout\ = (\DivFreq0|compteur\(27) & (!\DivFreq0|Add0~53\)) # (!\DivFreq0|compteur\(27) & ((\DivFreq0|Add0~53\) # (GND)))
-- \DivFreq0|Add0~55\ = CARRY((!\DivFreq0|Add0~53\) # (!\DivFreq0|compteur\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(27),
	datad => VCC,
	cin => \DivFreq0|Add0~53\,
	combout => \DivFreq0|Add0~54_combout\,
	cout => \DivFreq0|Add0~55\);

-- Location: LCCOMB_X59_Y2_N22
\DivFreq0|Add0~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~65_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~54_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~54_combout\,
	combout => \DivFreq0|Add0~65_combout\);

-- Location: FF_X59_Y2_N23
\DivFreq0|compteur[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~65_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(27));

-- Location: LCCOMB_X58_Y2_N24
\DivFreq0|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~56_combout\ = (\DivFreq0|compteur\(28) & (\DivFreq0|Add0~55\ $ (GND))) # (!\DivFreq0|compteur\(28) & (!\DivFreq0|Add0~55\ & VCC))
-- \DivFreq0|Add0~57\ = CARRY((\DivFreq0|compteur\(28) & !\DivFreq0|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(28),
	datad => VCC,
	cin => \DivFreq0|Add0~55\,
	combout => \DivFreq0|Add0~56_combout\,
	cout => \DivFreq0|Add0~57\);

-- Location: LCCOMB_X59_Y2_N12
\DivFreq0|Add0~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~64_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~56_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~56_combout\,
	combout => \DivFreq0|Add0~64_combout\);

-- Location: FF_X59_Y2_N13
\DivFreq0|compteur[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~64_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(28));

-- Location: LCCOMB_X58_Y2_N26
\DivFreq0|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~58_combout\ = (\DivFreq0|compteur\(29) & (!\DivFreq0|Add0~57\)) # (!\DivFreq0|compteur\(29) & ((\DivFreq0|Add0~57\) # (GND)))
-- \DivFreq0|Add0~59\ = CARRY((!\DivFreq0|Add0~57\) # (!\DivFreq0|compteur\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(29),
	datad => VCC,
	cin => \DivFreq0|Add0~57\,
	combout => \DivFreq0|Add0~58_combout\,
	cout => \DivFreq0|Add0~59\);

-- Location: LCCOMB_X59_Y2_N10
\DivFreq0|Add0~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~63_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~58_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~58_combout\,
	combout => \DivFreq0|Add0~63_combout\);

-- Location: FF_X59_Y2_N11
\DivFreq0|compteur[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~63_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(29));

-- Location: LCCOMB_X58_Y2_N28
\DivFreq0|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~60_combout\ = (\DivFreq0|compteur\(30) & (\DivFreq0|Add0~59\ $ (GND))) # (!\DivFreq0|compteur\(30) & (!\DivFreq0|Add0~59\ & VCC))
-- \DivFreq0|Add0~61\ = CARRY((\DivFreq0|compteur\(30) & !\DivFreq0|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|compteur\(30),
	datad => VCC,
	cin => \DivFreq0|Add0~59\,
	combout => \DivFreq0|Add0~60_combout\,
	cout => \DivFreq0|Add0~61\);

-- Location: LCCOMB_X59_Y2_N24
\DivFreq0|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~62_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~60_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DivFreq0|LessThan0~6_combout\,
	datad => \DivFreq0|Add0~60_combout\,
	combout => \DivFreq0|Add0~62_combout\);

-- Location: FF_X59_Y2_N25
\DivFreq0|compteur[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~62_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(30));

-- Location: LCCOMB_X59_Y2_N28
\DivFreq0|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~0_combout\ = (!\DivFreq0|compteur\(28) & (!\DivFreq0|compteur\(30) & (!\DivFreq0|compteur\(27) & !\DivFreq0|compteur\(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(28),
	datab => \DivFreq0|compteur\(30),
	datac => \DivFreq0|compteur\(27),
	datad => \DivFreq0|compteur\(29),
	combout => \DivFreq0|Equal0~0_combout\);

-- Location: LCCOMB_X59_Y2_N16
\DivFreq0|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~1_combout\ = (!\DivFreq0|compteur\(25) & (!\DivFreq0|compteur\(26) & (!\DivFreq0|compteur\(24) & \DivFreq0|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(25),
	datab => \DivFreq0|compteur\(26),
	datac => \DivFreq0|compteur\(24),
	datad => \DivFreq0|Equal0~0_combout\,
	combout => \DivFreq0|Equal0~1_combout\);

-- Location: LCCOMB_X58_Y2_N30
\DivFreq0|Add0~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~71_combout\ = \DivFreq0|Add0~61\ $ (\DivFreq0|compteur\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \DivFreq0|compteur\(31),
	cin => \DivFreq0|Add0~61\,
	combout => \DivFreq0|Add0~71_combout\);

-- Location: LCCOMB_X57_Y2_N8
\DivFreq0|Add0~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~73_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~71_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~71_combout\,
	combout => \DivFreq0|Add0~73_combout\);

-- Location: FF_X57_Y2_N9
\DivFreq0|compteur[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~73_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(31));

-- Location: LCCOMB_X59_Y2_N6
\DivFreq0|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~5_combout\ = (!\DivFreq0|compteur\(25) & (!\DivFreq0|compteur\(26) & (!\DivFreq0|compteur\(23) & \DivFreq0|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(25),
	datab => \DivFreq0|compteur\(26),
	datac => \DivFreq0|compteur\(23),
	datad => \DivFreq0|Equal0~0_combout\,
	combout => \DivFreq0|LessThan0~5_combout\);

-- Location: LCCOMB_X57_Y2_N24
\DivFreq0|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~0_combout\ = (((!\DivFreq0|compteur\(16) & !\DivFreq0|compteur\(17))) # (!\DivFreq0|compteur\(22))) # (!\DivFreq0|compteur\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(16),
	datab => \DivFreq0|compteur\(17),
	datac => \DivFreq0|compteur\(21),
	datad => \DivFreq0|compteur\(22),
	combout => \DivFreq0|LessThan0~0_combout\);

-- Location: LCCOMB_X57_Y2_N10
\DivFreq0|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~1_combout\ = ((\DivFreq0|LessThan0~0_combout\) # ((!\DivFreq0|compteur\(20)) # (!\DivFreq0|compteur\(18)))) # (!\DivFreq0|compteur\(19))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(19),
	datab => \DivFreq0|LessThan0~0_combout\,
	datac => \DivFreq0|compteur\(18),
	datad => \DivFreq0|compteur\(20),
	combout => \DivFreq0|LessThan0~1_combout\);

-- Location: LCCOMB_X59_Y2_N0
\DivFreq0|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~3_combout\ = (!\DivFreq0|compteur\(8) & (!\DivFreq0|compteur\(10) & (!\DivFreq0|compteur\(9) & !\DivFreq0|compteur\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(8),
	datab => \DivFreq0|compteur\(10),
	datac => \DivFreq0|compteur\(9),
	datad => \DivFreq0|compteur\(7),
	combout => \DivFreq0|Equal0~3_combout\);

-- Location: LCCOMB_X57_Y3_N28
\DivFreq0|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~2_combout\ = (((!\DivFreq0|compteur\(11)) # (!\DivFreq0|compteur\(12))) # (!\DivFreq0|compteur\(14))) # (!\DivFreq0|compteur\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(13),
	datab => \DivFreq0|compteur\(14),
	datac => \DivFreq0|compteur\(12),
	datad => \DivFreq0|compteur\(11),
	combout => \DivFreq0|LessThan0~2_combout\);

-- Location: LCCOMB_X57_Y2_N20
\DivFreq0|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~3_combout\ = (\DivFreq0|LessThan0~2_combout\) # ((!\DivFreq0|compteur\(6) & \DivFreq0|Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(6),
	datac => \DivFreq0|Equal0~3_combout\,
	datad => \DivFreq0|LessThan0~2_combout\,
	combout => \DivFreq0|LessThan0~3_combout\);

-- Location: LCCOMB_X57_Y2_N18
\DivFreq0|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~4_combout\ = (\DivFreq0|LessThan0~1_combout\) # ((!\DivFreq0|compteur\(17) & (!\DivFreq0|compteur\(15) & \DivFreq0|LessThan0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|LessThan0~1_combout\,
	datab => \DivFreq0|compteur\(17),
	datac => \DivFreq0|compteur\(15),
	datad => \DivFreq0|LessThan0~3_combout\,
	combout => \DivFreq0|LessThan0~4_combout\);

-- Location: LCCOMB_X57_Y2_N4
\DivFreq0|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|LessThan0~6_combout\ = (\DivFreq0|Equal0~1_combout\) # ((\DivFreq0|compteur\(31)) # ((\DivFreq0|LessThan0~5_combout\ & \DivFreq0|LessThan0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|Equal0~1_combout\,
	datab => \DivFreq0|compteur\(31),
	datac => \DivFreq0|LessThan0~5_combout\,
	datad => \DivFreq0|LessThan0~4_combout\,
	combout => \DivFreq0|LessThan0~6_combout\);

-- Location: LCCOMB_X57_Y2_N6
\DivFreq0|Add0~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Add0~70_combout\ = (\DivFreq0|LessThan0~6_combout\ & \DivFreq0|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DivFreq0|LessThan0~6_combout\,
	datac => \DivFreq0|Add0~32_combout\,
	combout => \DivFreq0|Add0~70_combout\);

-- Location: FF_X57_Y2_N7
\DivFreq0|compteur[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \DivFreq0|Add0~70_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|compteur\(16));

-- Location: LCCOMB_X57_Y2_N30
\DivFreq0|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~2_combout\ = (!\DivFreq0|compteur\(16) & (!\DivFreq0|compteur\(17) & (!\DivFreq0|compteur\(31) & !\DivFreq0|compteur\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(16),
	datab => \DivFreq0|compteur\(17),
	datac => \DivFreq0|compteur\(31),
	datad => \DivFreq0|compteur\(23),
	combout => \DivFreq0|Equal0~2_combout\);

-- Location: LCCOMB_X57_Y3_N22
\DivFreq0|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~7_combout\ = (!\DivFreq0|compteur\(4) & (!\DivFreq0|compteur\(12) & (!\DivFreq0|compteur\(5) & !\DivFreq0|compteur\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(4),
	datab => \DivFreq0|compteur\(12),
	datac => \DivFreq0|compteur\(5),
	datad => \DivFreq0|compteur\(11),
	combout => \DivFreq0|Equal0~7_combout\);

-- Location: LCCOMB_X59_Y3_N16
\DivFreq0|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~8_combout\ = (!\DivFreq0|compteur\(0) & (!\DivFreq0|compteur\(3) & (!\DivFreq0|compteur\(2) & !\DivFreq0|compteur\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(0),
	datab => \DivFreq0|compteur\(3),
	datac => \DivFreq0|compteur\(2),
	datad => \DivFreq0|compteur\(1),
	combout => \DivFreq0|Equal0~8_combout\);

-- Location: LCCOMB_X57_Y2_N0
\DivFreq0|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~4_combout\ = (!\DivFreq0|compteur\(20) & (!\DivFreq0|compteur\(19) & (!\DivFreq0|compteur\(21) & !\DivFreq0|compteur\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(20),
	datab => \DivFreq0|compteur\(19),
	datac => \DivFreq0|compteur\(21),
	datad => \DivFreq0|compteur\(22),
	combout => \DivFreq0|Equal0~4_combout\);

-- Location: LCCOMB_X57_Y3_N14
\DivFreq0|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~5_combout\ = (!\DivFreq0|compteur\(13) & (!\DivFreq0|compteur\(15) & (!\DivFreq0|compteur\(14) & !\DivFreq0|compteur\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(13),
	datab => \DivFreq0|compteur\(15),
	datac => \DivFreq0|compteur\(14),
	datad => \DivFreq0|compteur\(18),
	combout => \DivFreq0|Equal0~5_combout\);

-- Location: LCCOMB_X57_Y3_N2
\DivFreq0|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~6_combout\ = (!\DivFreq0|compteur\(6) & (\DivFreq0|Equal0~4_combout\ & (\DivFreq0|Equal0~5_combout\ & \DivFreq0|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|compteur\(6),
	datab => \DivFreq0|Equal0~4_combout\,
	datac => \DivFreq0|Equal0~5_combout\,
	datad => \DivFreq0|Equal0~3_combout\,
	combout => \DivFreq0|Equal0~6_combout\);

-- Location: LCCOMB_X57_Y3_N18
\DivFreq0|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|Equal0~9_combout\ = (\DivFreq0|Equal0~7_combout\ & (\DivFreq0|Equal0~8_combout\ & \DivFreq0|Equal0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|Equal0~7_combout\,
	datab => \DivFreq0|Equal0~8_combout\,
	datad => \DivFreq0|Equal0~6_combout\,
	combout => \DivFreq0|Equal0~9_combout\);

-- Location: LCCOMB_X57_Y3_N20
\DivFreq0|clk_1_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DivFreq0|clk_1_int~0_combout\ = \DivFreq0|clk_1_int~q\ $ (((\DivFreq0|Equal0~2_combout\ & (\DivFreq0|Equal0~1_combout\ & \DivFreq0|Equal0~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DivFreq0|clk_1_int~q\,
	datab => \DivFreq0|Equal0~2_combout\,
	datac => \DivFreq0|Equal0~1_combout\,
	datad => \DivFreq0|Equal0~9_combout\,
	combout => \DivFreq0|clk_1_int~0_combout\);

-- Location: FF_X57_Y3_N19
\DivFreq0|clk_1_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	asdata => \DivFreq0|clk_1_int~0_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \DivFreq0|clk_1_int~q\);

-- Location: CLKCTRL_G17
\DivFreq0|clk_1_int~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \DivFreq0|clk_1_int~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \DivFreq0|clk_1_int~clkctrl_outclk\);

-- Location: IOIBUF_X0_Y36_N15
\in_freq_anemometre~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_in_freq_anemometre,
	o => \in_freq_anemometre~input_o\);

-- Location: CLKCTRL_G4
\in_freq_anemometre~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \in_freq_anemometre~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \in_freq_anemometre~inputclkctrl_outclk\);

-- Location: LCCOMB_X50_Y4_N16
\Frequence_calcule0|signal_2[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[0]~8_combout\ = \Frequence_calcule0|signal_2\(0) $ (VCC)
-- \Frequence_calcule0|signal_2[0]~9\ = CARRY(\Frequence_calcule0|signal_2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_2\(0),
	datad => VCC,
	combout => \Frequence_calcule0|signal_2[0]~8_combout\,
	cout => \Frequence_calcule0|signal_2[0]~9\);

-- Location: FF_X50_Y4_N17
\Frequence_calcule0|signal_2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[0]~8_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(0));

-- Location: LCCOMB_X50_Y4_N0
\Frequence_calcule0|signal_1[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[0]~8_combout\ = \Frequence_calcule0|signal_1\(0) $ (VCC)
-- \Frequence_calcule0|signal_1[0]~9\ = CARRY(\Frequence_calcule0|signal_1\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_1\(0),
	datad => VCC,
	combout => \Frequence_calcule0|signal_1[0]~8_combout\,
	cout => \Frequence_calcule0|signal_1[0]~9\);

-- Location: FF_X50_Y4_N1
\Frequence_calcule0|signal_1[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[0]~8_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(0));

-- Location: LCCOMB_X49_Y4_N10
\Frequence_calcule0|signal_3[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[0]~8_combout\ = (\Frequence_calcule0|signal_2\(0) & (\Frequence_calcule0|signal_1\(0) $ (VCC))) # (!\Frequence_calcule0|signal_2\(0) & (\Frequence_calcule0|signal_1\(0) & VCC))
-- \Frequence_calcule0|signal_3[0]~9\ = CARRY((\Frequence_calcule0|signal_2\(0) & \Frequence_calcule0|signal_1\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(0),
	datab => \Frequence_calcule0|signal_1\(0),
	datad => VCC,
	combout => \Frequence_calcule0|signal_3[0]~8_combout\,
	cout => \Frequence_calcule0|signal_3[0]~9\);

-- Location: FF_X49_Y4_N11
\Frequence_calcule0|signal_3[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[0]~8_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(0));

-- Location: LCCOMB_X49_Y4_N8
\gestion_data_anemometre0|signal_out~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~0_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(0) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \continu~input_o\,
	datad => \Frequence_calcule0|signal_3\(0),
	combout => \gestion_data_anemometre0|signal_out~0_combout\);

-- Location: FF_X49_Y4_N9
\gestion_data_anemometre0|signal_out[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(0));

-- Location: LCCOMB_X50_Y4_N2
\Frequence_calcule0|signal_1[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[1]~10_combout\ = (\Frequence_calcule0|signal_1\(1) & (!\Frequence_calcule0|signal_1[0]~9\)) # (!\Frequence_calcule0|signal_1\(1) & ((\Frequence_calcule0|signal_1[0]~9\) # (GND)))
-- \Frequence_calcule0|signal_1[1]~11\ = CARRY((!\Frequence_calcule0|signal_1[0]~9\) # (!\Frequence_calcule0|signal_1\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_1\(1),
	datad => VCC,
	cin => \Frequence_calcule0|signal_1[0]~9\,
	combout => \Frequence_calcule0|signal_1[1]~10_combout\,
	cout => \Frequence_calcule0|signal_1[1]~11\);

-- Location: FF_X50_Y4_N3
\Frequence_calcule0|signal_1[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[1]~10_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(1));

-- Location: LCCOMB_X50_Y4_N18
\Frequence_calcule0|signal_2[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[1]~10_combout\ = (\Frequence_calcule0|signal_2\(1) & (!\Frequence_calcule0|signal_2[0]~9\)) # (!\Frequence_calcule0|signal_2\(1) & ((\Frequence_calcule0|signal_2[0]~9\) # (GND)))
-- \Frequence_calcule0|signal_2[1]~11\ = CARRY((!\Frequence_calcule0|signal_2[0]~9\) # (!\Frequence_calcule0|signal_2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_2\(1),
	datad => VCC,
	cin => \Frequence_calcule0|signal_2[0]~9\,
	combout => \Frequence_calcule0|signal_2[1]~10_combout\,
	cout => \Frequence_calcule0|signal_2[1]~11\);

-- Location: FF_X50_Y4_N19
\Frequence_calcule0|signal_2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[1]~10_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(1));

-- Location: LCCOMB_X49_Y4_N12
\Frequence_calcule0|signal_3[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[1]~10_combout\ = (\Frequence_calcule0|signal_1\(1) & ((\Frequence_calcule0|signal_2\(1) & (\Frequence_calcule0|signal_3[0]~9\ & VCC)) # (!\Frequence_calcule0|signal_2\(1) & (!\Frequence_calcule0|signal_3[0]~9\)))) # 
-- (!\Frequence_calcule0|signal_1\(1) & ((\Frequence_calcule0|signal_2\(1) & (!\Frequence_calcule0|signal_3[0]~9\)) # (!\Frequence_calcule0|signal_2\(1) & ((\Frequence_calcule0|signal_3[0]~9\) # (GND)))))
-- \Frequence_calcule0|signal_3[1]~11\ = CARRY((\Frequence_calcule0|signal_1\(1) & (!\Frequence_calcule0|signal_2\(1) & !\Frequence_calcule0|signal_3[0]~9\)) # (!\Frequence_calcule0|signal_1\(1) & ((!\Frequence_calcule0|signal_3[0]~9\) # 
-- (!\Frequence_calcule0|signal_2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_1\(1),
	datab => \Frequence_calcule0|signal_2\(1),
	datad => VCC,
	cin => \Frequence_calcule0|signal_3[0]~9\,
	combout => \Frequence_calcule0|signal_3[1]~10_combout\,
	cout => \Frequence_calcule0|signal_3[1]~11\);

-- Location: FF_X49_Y4_N13
\Frequence_calcule0|signal_3[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[1]~10_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(1));

-- Location: LCCOMB_X49_Y4_N6
\gestion_data_anemometre0|signal_out~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~1_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(1) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \continu~input_o\,
	datad => \Frequence_calcule0|signal_3\(1),
	combout => \gestion_data_anemometre0|signal_out~1_combout\);

-- Location: FF_X49_Y4_N7
\gestion_data_anemometre0|signal_out[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(1));

-- Location: LCCOMB_X50_Y4_N20
\Frequence_calcule0|signal_2[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[2]~12_combout\ = (\Frequence_calcule0|signal_2\(2) & (\Frequence_calcule0|signal_2[1]~11\ $ (GND))) # (!\Frequence_calcule0|signal_2\(2) & (!\Frequence_calcule0|signal_2[1]~11\ & VCC))
-- \Frequence_calcule0|signal_2[2]~13\ = CARRY((\Frequence_calcule0|signal_2\(2) & !\Frequence_calcule0|signal_2[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_2\(2),
	datad => VCC,
	cin => \Frequence_calcule0|signal_2[1]~11\,
	combout => \Frequence_calcule0|signal_2[2]~12_combout\,
	cout => \Frequence_calcule0|signal_2[2]~13\);

-- Location: FF_X50_Y4_N21
\Frequence_calcule0|signal_2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[2]~12_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(2));

-- Location: LCCOMB_X50_Y4_N4
\Frequence_calcule0|signal_1[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[2]~12_combout\ = (\Frequence_calcule0|signal_1\(2) & (\Frequence_calcule0|signal_1[1]~11\ $ (GND))) # (!\Frequence_calcule0|signal_1\(2) & (!\Frequence_calcule0|signal_1[1]~11\ & VCC))
-- \Frequence_calcule0|signal_1[2]~13\ = CARRY((\Frequence_calcule0|signal_1\(2) & !\Frequence_calcule0|signal_1[1]~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_1\(2),
	datad => VCC,
	cin => \Frequence_calcule0|signal_1[1]~11\,
	combout => \Frequence_calcule0|signal_1[2]~12_combout\,
	cout => \Frequence_calcule0|signal_1[2]~13\);

-- Location: FF_X50_Y4_N5
\Frequence_calcule0|signal_1[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[2]~12_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(2));

-- Location: LCCOMB_X49_Y4_N14
\Frequence_calcule0|signal_3[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[2]~12_combout\ = ((\Frequence_calcule0|signal_2\(2) $ (\Frequence_calcule0|signal_1\(2) $ (!\Frequence_calcule0|signal_3[1]~11\)))) # (GND)
-- \Frequence_calcule0|signal_3[2]~13\ = CARRY((\Frequence_calcule0|signal_2\(2) & ((\Frequence_calcule0|signal_1\(2)) # (!\Frequence_calcule0|signal_3[1]~11\))) # (!\Frequence_calcule0|signal_2\(2) & (\Frequence_calcule0|signal_1\(2) & 
-- !\Frequence_calcule0|signal_3[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(2),
	datab => \Frequence_calcule0|signal_1\(2),
	datad => VCC,
	cin => \Frequence_calcule0|signal_3[1]~11\,
	combout => \Frequence_calcule0|signal_3[2]~12_combout\,
	cout => \Frequence_calcule0|signal_3[2]~13\);

-- Location: FF_X49_Y4_N15
\Frequence_calcule0|signal_3[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[2]~12_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(2));

-- Location: LCCOMB_X49_Y4_N28
\gestion_data_anemometre0|signal_out~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~2_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(2) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \Frequence_calcule0|signal_3\(2),
	datad => \continu~input_o\,
	combout => \gestion_data_anemometre0|signal_out~2_combout\);

-- Location: FF_X49_Y4_N29
\gestion_data_anemometre0|signal_out[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(2));

-- Location: LCCOMB_X50_Y4_N6
\Frequence_calcule0|signal_1[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[3]~14_combout\ = (\Frequence_calcule0|signal_1\(3) & (!\Frequence_calcule0|signal_1[2]~13\)) # (!\Frequence_calcule0|signal_1\(3) & ((\Frequence_calcule0|signal_1[2]~13\) # (GND)))
-- \Frequence_calcule0|signal_1[3]~15\ = CARRY((!\Frequence_calcule0|signal_1[2]~13\) # (!\Frequence_calcule0|signal_1\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_1\(3),
	datad => VCC,
	cin => \Frequence_calcule0|signal_1[2]~13\,
	combout => \Frequence_calcule0|signal_1[3]~14_combout\,
	cout => \Frequence_calcule0|signal_1[3]~15\);

-- Location: FF_X50_Y4_N7
\Frequence_calcule0|signal_1[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[3]~14_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(3));

-- Location: LCCOMB_X50_Y4_N22
\Frequence_calcule0|signal_2[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[3]~14_combout\ = (\Frequence_calcule0|signal_2\(3) & (!\Frequence_calcule0|signal_2[2]~13\)) # (!\Frequence_calcule0|signal_2\(3) & ((\Frequence_calcule0|signal_2[2]~13\) # (GND)))
-- \Frequence_calcule0|signal_2[3]~15\ = CARRY((!\Frequence_calcule0|signal_2[2]~13\) # (!\Frequence_calcule0|signal_2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(3),
	datad => VCC,
	cin => \Frequence_calcule0|signal_2[2]~13\,
	combout => \Frequence_calcule0|signal_2[3]~14_combout\,
	cout => \Frequence_calcule0|signal_2[3]~15\);

-- Location: FF_X50_Y4_N23
\Frequence_calcule0|signal_2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[3]~14_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(3));

-- Location: LCCOMB_X49_Y4_N16
\Frequence_calcule0|signal_3[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[3]~14_combout\ = (\Frequence_calcule0|signal_1\(3) & ((\Frequence_calcule0|signal_2\(3) & (\Frequence_calcule0|signal_3[2]~13\ & VCC)) # (!\Frequence_calcule0|signal_2\(3) & (!\Frequence_calcule0|signal_3[2]~13\)))) # 
-- (!\Frequence_calcule0|signal_1\(3) & ((\Frequence_calcule0|signal_2\(3) & (!\Frequence_calcule0|signal_3[2]~13\)) # (!\Frequence_calcule0|signal_2\(3) & ((\Frequence_calcule0|signal_3[2]~13\) # (GND)))))
-- \Frequence_calcule0|signal_3[3]~15\ = CARRY((\Frequence_calcule0|signal_1\(3) & (!\Frequence_calcule0|signal_2\(3) & !\Frequence_calcule0|signal_3[2]~13\)) # (!\Frequence_calcule0|signal_1\(3) & ((!\Frequence_calcule0|signal_3[2]~13\) # 
-- (!\Frequence_calcule0|signal_2\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_1\(3),
	datab => \Frequence_calcule0|signal_2\(3),
	datad => VCC,
	cin => \Frequence_calcule0|signal_3[2]~13\,
	combout => \Frequence_calcule0|signal_3[3]~14_combout\,
	cout => \Frequence_calcule0|signal_3[3]~15\);

-- Location: FF_X49_Y4_N17
\Frequence_calcule0|signal_3[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[3]~14_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(3));

-- Location: LCCOMB_X49_Y4_N26
\gestion_data_anemometre0|signal_out~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~3_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(3) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \continu~input_o\,
	datad => \Frequence_calcule0|signal_3\(3),
	combout => \gestion_data_anemometre0|signal_out~3_combout\);

-- Location: FF_X49_Y4_N27
\gestion_data_anemometre0|signal_out[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(3));

-- Location: LCCOMB_X50_Y4_N24
\Frequence_calcule0|signal_2[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[4]~16_combout\ = (\Frequence_calcule0|signal_2\(4) & (\Frequence_calcule0|signal_2[3]~15\ $ (GND))) # (!\Frequence_calcule0|signal_2\(4) & (!\Frequence_calcule0|signal_2[3]~15\ & VCC))
-- \Frequence_calcule0|signal_2[4]~17\ = CARRY((\Frequence_calcule0|signal_2\(4) & !\Frequence_calcule0|signal_2[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_2\(4),
	datad => VCC,
	cin => \Frequence_calcule0|signal_2[3]~15\,
	combout => \Frequence_calcule0|signal_2[4]~16_combout\,
	cout => \Frequence_calcule0|signal_2[4]~17\);

-- Location: FF_X50_Y4_N25
\Frequence_calcule0|signal_2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[4]~16_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(4));

-- Location: LCCOMB_X50_Y4_N8
\Frequence_calcule0|signal_1[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[4]~16_combout\ = (\Frequence_calcule0|signal_1\(4) & (\Frequence_calcule0|signal_1[3]~15\ $ (GND))) # (!\Frequence_calcule0|signal_1\(4) & (!\Frequence_calcule0|signal_1[3]~15\ & VCC))
-- \Frequence_calcule0|signal_1[4]~17\ = CARRY((\Frequence_calcule0|signal_1\(4) & !\Frequence_calcule0|signal_1[3]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_1\(4),
	datad => VCC,
	cin => \Frequence_calcule0|signal_1[3]~15\,
	combout => \Frequence_calcule0|signal_1[4]~16_combout\,
	cout => \Frequence_calcule0|signal_1[4]~17\);

-- Location: FF_X50_Y4_N9
\Frequence_calcule0|signal_1[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[4]~16_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(4));

-- Location: LCCOMB_X49_Y4_N18
\Frequence_calcule0|signal_3[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[4]~16_combout\ = ((\Frequence_calcule0|signal_2\(4) $ (\Frequence_calcule0|signal_1\(4) $ (!\Frequence_calcule0|signal_3[3]~15\)))) # (GND)
-- \Frequence_calcule0|signal_3[4]~17\ = CARRY((\Frequence_calcule0|signal_2\(4) & ((\Frequence_calcule0|signal_1\(4)) # (!\Frequence_calcule0|signal_3[3]~15\))) # (!\Frequence_calcule0|signal_2\(4) & (\Frequence_calcule0|signal_1\(4) & 
-- !\Frequence_calcule0|signal_3[3]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(4),
	datab => \Frequence_calcule0|signal_1\(4),
	datad => VCC,
	cin => \Frequence_calcule0|signal_3[3]~15\,
	combout => \Frequence_calcule0|signal_3[4]~16_combout\,
	cout => \Frequence_calcule0|signal_3[4]~17\);

-- Location: FF_X49_Y4_N19
\Frequence_calcule0|signal_3[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[4]~16_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(4));

-- Location: LCCOMB_X49_Y4_N4
\gestion_data_anemometre0|signal_out~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~4_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(4) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \continu~input_o\,
	datad => \Frequence_calcule0|signal_3\(4),
	combout => \gestion_data_anemometre0|signal_out~4_combout\);

-- Location: FF_X49_Y4_N5
\gestion_data_anemometre0|signal_out[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(4));

-- Location: LCCOMB_X50_Y4_N26
\Frequence_calcule0|signal_2[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[5]~18_combout\ = (\Frequence_calcule0|signal_2\(5) & (!\Frequence_calcule0|signal_2[4]~17\)) # (!\Frequence_calcule0|signal_2\(5) & ((\Frequence_calcule0|signal_2[4]~17\) # (GND)))
-- \Frequence_calcule0|signal_2[5]~19\ = CARRY((!\Frequence_calcule0|signal_2[4]~17\) # (!\Frequence_calcule0|signal_2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(5),
	datad => VCC,
	cin => \Frequence_calcule0|signal_2[4]~17\,
	combout => \Frequence_calcule0|signal_2[5]~18_combout\,
	cout => \Frequence_calcule0|signal_2[5]~19\);

-- Location: FF_X50_Y4_N27
\Frequence_calcule0|signal_2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[5]~18_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(5));

-- Location: LCCOMB_X50_Y4_N10
\Frequence_calcule0|signal_1[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[5]~18_combout\ = (\Frequence_calcule0|signal_1\(5) & (!\Frequence_calcule0|signal_1[4]~17\)) # (!\Frequence_calcule0|signal_1\(5) & ((\Frequence_calcule0|signal_1[4]~17\) # (GND)))
-- \Frequence_calcule0|signal_1[5]~19\ = CARRY((!\Frequence_calcule0|signal_1[4]~17\) # (!\Frequence_calcule0|signal_1\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_1\(5),
	datad => VCC,
	cin => \Frequence_calcule0|signal_1[4]~17\,
	combout => \Frequence_calcule0|signal_1[5]~18_combout\,
	cout => \Frequence_calcule0|signal_1[5]~19\);

-- Location: FF_X50_Y4_N11
\Frequence_calcule0|signal_1[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[5]~18_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(5));

-- Location: LCCOMB_X49_Y4_N20
\Frequence_calcule0|signal_3[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[5]~18_combout\ = (\Frequence_calcule0|signal_2\(5) & ((\Frequence_calcule0|signal_1\(5) & (\Frequence_calcule0|signal_3[4]~17\ & VCC)) # (!\Frequence_calcule0|signal_1\(5) & (!\Frequence_calcule0|signal_3[4]~17\)))) # 
-- (!\Frequence_calcule0|signal_2\(5) & ((\Frequence_calcule0|signal_1\(5) & (!\Frequence_calcule0|signal_3[4]~17\)) # (!\Frequence_calcule0|signal_1\(5) & ((\Frequence_calcule0|signal_3[4]~17\) # (GND)))))
-- \Frequence_calcule0|signal_3[5]~19\ = CARRY((\Frequence_calcule0|signal_2\(5) & (!\Frequence_calcule0|signal_1\(5) & !\Frequence_calcule0|signal_3[4]~17\)) # (!\Frequence_calcule0|signal_2\(5) & ((!\Frequence_calcule0|signal_3[4]~17\) # 
-- (!\Frequence_calcule0|signal_1\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(5),
	datab => \Frequence_calcule0|signal_1\(5),
	datad => VCC,
	cin => \Frequence_calcule0|signal_3[4]~17\,
	combout => \Frequence_calcule0|signal_3[5]~18_combout\,
	cout => \Frequence_calcule0|signal_3[5]~19\);

-- Location: FF_X49_Y4_N21
\Frequence_calcule0|signal_3[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[5]~18_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(5));

-- Location: LCCOMB_X49_Y4_N2
\gestion_data_anemometre0|signal_out~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~5_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(5) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \continu~input_o\,
	datad => \Frequence_calcule0|signal_3\(5),
	combout => \gestion_data_anemometre0|signal_out~5_combout\);

-- Location: FF_X49_Y4_N3
\gestion_data_anemometre0|signal_out[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(5));

-- Location: LCCOMB_X50_Y4_N28
\Frequence_calcule0|signal_2[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[6]~20_combout\ = (\Frequence_calcule0|signal_2\(6) & (\Frequence_calcule0|signal_2[5]~19\ $ (GND))) # (!\Frequence_calcule0|signal_2\(6) & (!\Frequence_calcule0|signal_2[5]~19\ & VCC))
-- \Frequence_calcule0|signal_2[6]~21\ = CARRY((\Frequence_calcule0|signal_2\(6) & !\Frequence_calcule0|signal_2[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Frequence_calcule0|signal_2\(6),
	datad => VCC,
	cin => \Frequence_calcule0|signal_2[5]~19\,
	combout => \Frequence_calcule0|signal_2[6]~20_combout\,
	cout => \Frequence_calcule0|signal_2[6]~21\);

-- Location: FF_X50_Y4_N29
\Frequence_calcule0|signal_2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[6]~20_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(6));

-- Location: LCCOMB_X50_Y4_N12
\Frequence_calcule0|signal_1[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[6]~20_combout\ = (\Frequence_calcule0|signal_1\(6) & (\Frequence_calcule0|signal_1[5]~19\ $ (GND))) # (!\Frequence_calcule0|signal_1\(6) & (!\Frequence_calcule0|signal_1[5]~19\ & VCC))
-- \Frequence_calcule0|signal_1[6]~21\ = CARRY((\Frequence_calcule0|signal_1\(6) & !\Frequence_calcule0|signal_1[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_1\(6),
	datad => VCC,
	cin => \Frequence_calcule0|signal_1[5]~19\,
	combout => \Frequence_calcule0|signal_1[6]~20_combout\,
	cout => \Frequence_calcule0|signal_1[6]~21\);

-- Location: FF_X50_Y4_N13
\Frequence_calcule0|signal_1[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[6]~20_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(6));

-- Location: LCCOMB_X49_Y4_N22
\Frequence_calcule0|signal_3[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[6]~20_combout\ = ((\Frequence_calcule0|signal_2\(6) $ (\Frequence_calcule0|signal_1\(6) $ (!\Frequence_calcule0|signal_3[5]~19\)))) # (GND)
-- \Frequence_calcule0|signal_3[6]~21\ = CARRY((\Frequence_calcule0|signal_2\(6) & ((\Frequence_calcule0|signal_1\(6)) # (!\Frequence_calcule0|signal_3[5]~19\))) # (!\Frequence_calcule0|signal_2\(6) & (\Frequence_calcule0|signal_1\(6) & 
-- !\Frequence_calcule0|signal_3[5]~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(6),
	datab => \Frequence_calcule0|signal_1\(6),
	datad => VCC,
	cin => \Frequence_calcule0|signal_3[5]~19\,
	combout => \Frequence_calcule0|signal_3[6]~20_combout\,
	cout => \Frequence_calcule0|signal_3[6]~21\);

-- Location: FF_X49_Y4_N23
\Frequence_calcule0|signal_3[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[6]~20_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(6));

-- Location: LCCOMB_X49_Y4_N0
\gestion_data_anemometre0|signal_out~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~6_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(6) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \Frequence_calcule0|signal_3\(6),
	datad => \continu~input_o\,
	combout => \gestion_data_anemometre0|signal_out~6_combout\);

-- Location: FF_X49_Y4_N1
\gestion_data_anemometre0|signal_out[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(6));

-- Location: LCCOMB_X50_Y4_N30
\Frequence_calcule0|signal_2[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_2[7]~22_combout\ = \Frequence_calcule0|signal_2[6]~21\ $ (\Frequence_calcule0|signal_2\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Frequence_calcule0|signal_2\(7),
	cin => \Frequence_calcule0|signal_2[6]~21\,
	combout => \Frequence_calcule0|signal_2[7]~22_combout\);

-- Location: FF_X50_Y4_N31
\Frequence_calcule0|signal_2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_2[7]~22_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_2\(7));

-- Location: LCCOMB_X50_Y4_N14
\Frequence_calcule0|signal_1[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_1[7]~22_combout\ = \Frequence_calcule0|signal_1[6]~21\ $ (\Frequence_calcule0|signal_1\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Frequence_calcule0|signal_1\(7),
	cin => \Frequence_calcule0|signal_1[6]~21\,
	combout => \Frequence_calcule0|signal_1[7]~22_combout\);

-- Location: FF_X50_Y4_N15
\Frequence_calcule0|signal_1[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \in_freq_anemometre~inputclkctrl_outclk\,
	d => \Frequence_calcule0|signal_1[7]~22_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	sclr => \DivFreq0|ALT_INV_clk_1_int~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_1\(7));

-- Location: LCCOMB_X49_Y4_N24
\Frequence_calcule0|signal_3[7]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Frequence_calcule0|signal_3[7]~22_combout\ = \Frequence_calcule0|signal_2\(7) $ (\Frequence_calcule0|signal_1\(7) $ (\Frequence_calcule0|signal_3[6]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Frequence_calcule0|signal_2\(7),
	datab => \Frequence_calcule0|signal_1\(7),
	cin => \Frequence_calcule0|signal_3[6]~21\,
	combout => \Frequence_calcule0|signal_3[7]~22_combout\);

-- Location: FF_X49_Y4_N25
\Frequence_calcule0|signal_3[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \DivFreq0|ALT_INV_clk_1_int~clkctrl_outclk\,
	d => \Frequence_calcule0|signal_3[7]~22_combout\,
	clrn => \raz_n~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Frequence_calcule0|signal_3\(7));

-- Location: LCCOMB_X49_Y4_N30
\gestion_data_anemometre0|signal_out~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \gestion_data_anemometre0|signal_out~7_combout\ = (\raz_n~input_o\ & (\Frequence_calcule0|signal_3\(7) & ((\continu~input_o\) # (!\start_stop~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \raz_n~input_o\,
	datab => \start_stop~input_o\,
	datac => \continu~input_o\,
	datad => \Frequence_calcule0|signal_3\(7),
	combout => \gestion_data_anemometre0|signal_out~7_combout\);

-- Location: FF_X49_Y4_N31
\gestion_data_anemometre0|signal_out[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk_50M~inputclkctrl_outclk\,
	d => \gestion_data_anemometre0|signal_out~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \gestion_data_anemometre0|signal_out\(7));

ww_data_valid <= \data_valid~output_o\;

ww_data_anemometre(0) <= \data_anemometre[0]~output_o\;

ww_data_anemometre(1) <= \data_anemometre[1]~output_o\;

ww_data_anemometre(2) <= \data_anemometre[2]~output_o\;

ww_data_anemometre(3) <= \data_anemometre[3]~output_o\;

ww_data_anemometre(4) <= \data_anemometre[4]~output_o\;

ww_data_anemometre(5) <= \data_anemometre[5]~output_o\;

ww_data_anemometre(6) <= \data_anemometre[6]~output_o\;

ww_data_anemometre(7) <= \data_anemometre[7]~output_o\;
END structure;


