
module sopc_anemo (
	clk_clk,
	pio_0_external_connection_export,
	pio_1_external_connection_export,
	avalon_mesure_freq_0_conduit_end_beginbursttransfer);	

	input		clk_clk;
	input	[2:0]	pio_0_external_connection_export;
	output	[7:0]	pio_1_external_connection_export;
	input		avalon_mesure_freq_0_conduit_end_beginbursttransfer;
endmodule
