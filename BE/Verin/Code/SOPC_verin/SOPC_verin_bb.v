
module SOPC_verin (
	clk_clk,
	pio_1_external_connection_export,
	pio_0_external_connection_export,
	gestion_verin_0_clk_adc_writeresponsevalid_n,
	gestion_verin_0_cs_n_writeresponsevalid_n,
	gestion_verin_0_data_in_adc_beginbursttransfer,
	gestion_verin_0_sens_out_writeresponsevalid_n,
	gestion_verin_0_pwm_out_writeresponsevalid_n);	

	input		clk_clk;
	output	[7:0]	pio_1_external_connection_export;
	input	[7:0]	pio_0_external_connection_export;
	output		gestion_verin_0_clk_adc_writeresponsevalid_n;
	output		gestion_verin_0_cs_n_writeresponsevalid_n;
	input		gestion_verin_0_data_in_adc_beginbursttransfer;
	output		gestion_verin_0_sens_out_writeresponsevalid_n;
	output		gestion_verin_0_pwm_out_writeresponsevalid_n;
endmodule
