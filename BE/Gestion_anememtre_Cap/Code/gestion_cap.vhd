library ieee;
Use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity gestion_cap is
	port(
		-- entree
		clk_50M				: in std_logic;
		raz_n 				: in std_logic;
		in_pwm_compas	 	: in std_logic;
		continu				: in std_logic;
		start_stop			: in std_logic;
		-- sortie
		data_valid 			: out std_logic;
		data_compas		 	: out std_logic_vector(8 downto 0)
	);
end entity;
	
architecture arch of gestion_cap is
	signal signal_clk_1: std_logic;
	signal signal_clk_10k: std_logic;
	signal signal_val_compt: std_logic;
	signal signal_pwm_compas: std_logic;
	signal signal_fin_mesure: std_logic;
	signal signal_data_valid: std_logic;
	signal signal_dureepwm: std_logic_vector(8 downto 0);
	signal signal_data_compas: std_logic_vector(8 downto 0);

---------------------------------------------------------------------------------------
component DivFreq_de_cap 
	port(
		-- entree
		clk_50M,
		raz_n 		: in std_logic;
		-- sortie
		clk_1,
		clk_10k		: out std_logic
		);
end component ;
---------------------------------------------------------------------------------------
component Calcul_La_Duree 
	port(
		-- entree
		clk_10k,
		raz_n,
		val_compt,
		pwm_compas : in std_logic;
		-- sortie
		dureepwm : out std_logic_vector(8 downto 0)
		);
end component ;	
---------------------------------------------------------------------------------------	
component Out_pwm
	 port( 
		-- entree
		clk_10k,
		raz_n,
		in_pwm_compas : in std_logic;
		-- sortie
		pwm_compas : out std_logic
	);
end component;
---------------------------------------------------------------------------------------
component memo_donnee
	 port( 
		-- entree
		pwm_compas,
		val_compt,
		raz_n : in std_logic;
		dureepwm : in std_logic_vector(8 downto 0);
		-- sortie
		data_compas : out std_logic_vector(8 downto 0); 
		fin_mesure : out std_logic
	);
end component;
---------------------------------------------------------------------------------------
component MAE_cap
	 port( 
		-- entree
		raz_n,
		clk_50M,
		clk_1,
		pwm_compas,
		start_stop,
		continu,
		fin_mesure  : in std_logic;
		-- sortie
		val_compt,
		data_valid : out std_logic
	);
end component;
---------------------------------------------------------------------------------------
begin
	
	DivFreq_cap0 : DivFreq_de_cap
	port map(	clk_50M	=>	clk_50M,
				raz_n	=>	raz_n,
				clk_1	=>	signal_clk_1,
				clk_10k	=>	signal_clk_10k
			);
	
	calcul_duree0 : Calcul_La_Duree
	port map(	clk_10k	=>	signal_clk_10k,
				raz_n	=>	raz_n,
				val_compt => signal_val_compt,
				pwm_compas => signal_pwm_compas,
				dureepwm => signal_dureepwm
			);

	synchro_pwm0 : Out_pwm
	port map(	clk_10k	=>	signal_clk_10k,
				raz_n	=>	raz_n,
				in_pwm_compas => in_pwm_compas,
				pwm_compas => signal_pwm_compas
			);

	memo_donnee0 : memo_donnee
	port map(	pwm_compas => signal_pwm_compas,
				val_compt => signal_val_compt,
				raz_n	=>	raz_n,
				dureepwm => signal_dureepwm,
				data_compas => signal_data_compas,
				fin_mesure => signal_fin_mesure
			);

	MAE_cap0 : MAE_cap
	port map(	clk_50M	=>	clk_50M,
				raz_n	=>	raz_n,
				clk_1	=>	signal_clk_1,
				pwm_compas => signal_pwm_compas,
				start_stop => start_stop,
				continu => continu,
				fin_mesure => signal_fin_mesure,
				val_compt => signal_val_compt,
				data_valid => signal_data_valid
			);


data_valid		<=	signal_data_valid;
data_compas		<=	signal_data_compas;
	
end arch;