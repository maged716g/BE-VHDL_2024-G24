	component Sopc_Cap is
		port (
			clk_clk                                       : in std_logic := 'X'; -- clk
			avalon_cap_0_in_pwm_compas_beginbursttransfer : in std_logic := 'X'  -- beginbursttransfer
		);
	end component Sopc_Cap;

	u0 : component Sopc_Cap
		port map (
			clk_clk                                       => CONNECTED_TO_clk_clk,                                       --                        clk.clk
			avalon_cap_0_in_pwm_compas_beginbursttransfer => CONNECTED_TO_avalon_cap_0_in_pwm_compas_beginbursttransfer  -- avalon_cap_0_in_pwm_compas.beginbursttransfer
		);

