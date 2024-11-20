	component sopc_anemo is
		port (
			clk_clk                                             : in  std_logic                    := 'X';             -- clk
			pio_0_external_connection_export                    : in  std_logic_vector(2 downto 0) := (others => 'X'); -- export
			pio_1_external_connection_export                    : out std_logic_vector(7 downto 0);                    -- export
			avalon_mesure_freq_0_conduit_end_beginbursttransfer : in  std_logic                    := 'X'              -- beginbursttransfer
		);
	end component sopc_anemo;

	u0 : component sopc_anemo
		port map (
			clk_clk                                             => CONNECTED_TO_clk_clk,                                             --                              clk.clk
			pio_0_external_connection_export                    => CONNECTED_TO_pio_0_external_connection_export,                    --        pio_0_external_connection.export
			pio_1_external_connection_export                    => CONNECTED_TO_pio_1_external_connection_export,                    --        pio_1_external_connection.export
			avalon_mesure_freq_0_conduit_end_beginbursttransfer => CONNECTED_TO_avalon_mesure_freq_0_conduit_end_beginbursttransfer  -- avalon_mesure_freq_0_conduit_end.beginbursttransfer
		);

