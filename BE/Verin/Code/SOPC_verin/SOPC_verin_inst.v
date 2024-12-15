	SOPC_verin u0 (
		.clk_clk                                        (<connected-to-clk_clk>),                                        //                         clk.clk
		.pio_1_external_connection_export               (<connected-to-pio_1_external_connection_export>),               //   pio_1_external_connection.export
		.pio_0_external_connection_export               (<connected-to-pio_0_external_connection_export>),               //   pio_0_external_connection.export
		.gestion_verin_0_clk_adc_writeresponsevalid_n   (<connected-to-gestion_verin_0_clk_adc_writeresponsevalid_n>),   //     gestion_verin_0_clk_adc.writeresponsevalid_n
		.gestion_verin_0_cs_n_writeresponsevalid_n      (<connected-to-gestion_verin_0_cs_n_writeresponsevalid_n>),      //        gestion_verin_0_cs_n.writeresponsevalid_n
		.gestion_verin_0_data_in_adc_beginbursttransfer (<connected-to-gestion_verin_0_data_in_adc_beginbursttransfer>), // gestion_verin_0_data_in_adc.beginbursttransfer
		.gestion_verin_0_sens_out_writeresponsevalid_n  (<connected-to-gestion_verin_0_sens_out_writeresponsevalid_n>),  //    gestion_verin_0_sens_out.writeresponsevalid_n
		.gestion_verin_0_pwm_out_writeresponsevalid_n   (<connected-to-gestion_verin_0_pwm_out_writeresponsevalid_n>)    //     gestion_verin_0_pwm_out.writeresponsevalid_n
	);

