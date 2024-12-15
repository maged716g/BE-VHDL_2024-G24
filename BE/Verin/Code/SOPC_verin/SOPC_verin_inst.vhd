	component SOPC_verin is
		port (
			clk_clk                                        : in  std_logic                    := 'X';             -- clk
			pio_1_external_connection_export               : out std_logic_vector(7 downto 0);                    -- export
			pio_0_external_connection_export               : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			gestion_verin_0_clk_adc_writeresponsevalid_n   : out std_logic;                                       -- writeresponsevalid_n
			gestion_verin_0_cs_n_writeresponsevalid_n      : out std_logic;                                       -- writeresponsevalid_n
			gestion_verin_0_data_in_adc_beginbursttransfer : in  std_logic                    := 'X';             -- beginbursttransfer
			gestion_verin_0_sens_out_writeresponsevalid_n  : out std_logic;                                       -- writeresponsevalid_n
			gestion_verin_0_pwm_out_writeresponsevalid_n   : out std_logic                                        -- writeresponsevalid_n
		);
	end component SOPC_verin;

	u0 : component SOPC_verin
		port map (
			clk_clk                                        => CONNECTED_TO_clk_clk,                                        --                         clk.clk
			pio_1_external_connection_export               => CONNECTED_TO_pio_1_external_connection_export,               --   pio_1_external_connection.export
			pio_0_external_connection_export               => CONNECTED_TO_pio_0_external_connection_export,               --   pio_0_external_connection.export
			gestion_verin_0_clk_adc_writeresponsevalid_n   => CONNECTED_TO_gestion_verin_0_clk_adc_writeresponsevalid_n,   --     gestion_verin_0_clk_adc.writeresponsevalid_n
			gestion_verin_0_cs_n_writeresponsevalid_n      => CONNECTED_TO_gestion_verin_0_cs_n_writeresponsevalid_n,      --        gestion_verin_0_cs_n.writeresponsevalid_n
			gestion_verin_0_data_in_adc_beginbursttransfer => CONNECTED_TO_gestion_verin_0_data_in_adc_beginbursttransfer, -- gestion_verin_0_data_in_adc.beginbursttransfer
			gestion_verin_0_sens_out_writeresponsevalid_n  => CONNECTED_TO_gestion_verin_0_sens_out_writeresponsevalid_n,  --    gestion_verin_0_sens_out.writeresponsevalid_n
			gestion_verin_0_pwm_out_writeresponsevalid_n   => CONNECTED_TO_gestion_verin_0_pwm_out_writeresponsevalid_n    --     gestion_verin_0_pwm_out.writeresponsevalid_n
		);

