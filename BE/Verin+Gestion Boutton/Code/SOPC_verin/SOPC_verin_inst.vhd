	component SOPC_verin is
		port (
			clk_clk                                        : in  std_logic                    := 'X';             -- clk
			gestion_verin_0_data_in_adc_beginbursttransfer : in  std_logic                    := 'X';             -- beginbursttransfer
			gestion_verin_0_pwm_out_writeresponsevalid_n   : out std_logic;                                       -- writeresponsevalid_n
			gestion_verin_0_sens_out_writeresponsevalid_n  : out std_logic;                                       -- writeresponsevalid_n
			pio_0_external_connection_export               : in  std_logic_vector(7 downto 0) := (others => 'X'); -- export
			pio_1_external_connection_export               : out std_logic_vector(7 downto 0);                    -- export
			gestion_bp_0_out_bip_writeresponsevalid_n      : out std_logic;                                       -- writeresponsevalid_n
			gestion_bp_0_bp_babord_beginbursttransfer      : in  std_logic                    := 'X';             -- beginbursttransfer
			gestion_bp_0_bp_stby_beginbursttransfer        : in  std_logic                    := 'X';             -- beginbursttransfer
			gestion_bp_0_bp_tribord_beginbursttransfer     : in  std_logic                    := 'X';             -- beginbursttransfer
			gestion_bp_0_lesbabord_writeresponsevalid_n    : out std_logic;                                       -- writeresponsevalid_n
			gestion_bp_0_ledstby_writeresponsevalid_n      : out std_logic;                                       -- writeresponsevalid_n
			gestion_verin_0_clk_adc_writeresponsevalid_n   : out std_logic;                                       -- writeresponsevalid_n
			gestion_verin_0_cs_n_writeresponsevalid_n      : out std_logic;                                       -- writeresponsevalid_n
			gestion_bp_0_ledtribord_writeresponsevalid_n   : out std_logic                                        -- writeresponsevalid_n
		);
	end component SOPC_verin;

	u0 : component SOPC_verin
		port map (
			clk_clk                                        => CONNECTED_TO_clk_clk,                                        --                         clk.clk
			gestion_verin_0_data_in_adc_beginbursttransfer => CONNECTED_TO_gestion_verin_0_data_in_adc_beginbursttransfer, -- gestion_verin_0_data_in_adc.beginbursttransfer
			gestion_verin_0_pwm_out_writeresponsevalid_n   => CONNECTED_TO_gestion_verin_0_pwm_out_writeresponsevalid_n,   --     gestion_verin_0_pwm_out.writeresponsevalid_n
			gestion_verin_0_sens_out_writeresponsevalid_n  => CONNECTED_TO_gestion_verin_0_sens_out_writeresponsevalid_n,  --    gestion_verin_0_sens_out.writeresponsevalid_n
			pio_0_external_connection_export               => CONNECTED_TO_pio_0_external_connection_export,               --   pio_0_external_connection.export
			pio_1_external_connection_export               => CONNECTED_TO_pio_1_external_connection_export,               --   pio_1_external_connection.export
			gestion_bp_0_out_bip_writeresponsevalid_n      => CONNECTED_TO_gestion_bp_0_out_bip_writeresponsevalid_n,      --        gestion_bp_0_out_bip.writeresponsevalid_n
			gestion_bp_0_bp_babord_beginbursttransfer      => CONNECTED_TO_gestion_bp_0_bp_babord_beginbursttransfer,      --      gestion_bp_0_bp_babord.beginbursttransfer
			gestion_bp_0_bp_stby_beginbursttransfer        => CONNECTED_TO_gestion_bp_0_bp_stby_beginbursttransfer,        --        gestion_bp_0_bp_stby.beginbursttransfer
			gestion_bp_0_bp_tribord_beginbursttransfer     => CONNECTED_TO_gestion_bp_0_bp_tribord_beginbursttransfer,     --     gestion_bp_0_bp_tribord.beginbursttransfer
			gestion_bp_0_lesbabord_writeresponsevalid_n    => CONNECTED_TO_gestion_bp_0_lesbabord_writeresponsevalid_n,    --      gestion_bp_0_lesbabord.writeresponsevalid_n
			gestion_bp_0_ledstby_writeresponsevalid_n      => CONNECTED_TO_gestion_bp_0_ledstby_writeresponsevalid_n,      --        gestion_bp_0_ledstby.writeresponsevalid_n
			gestion_verin_0_clk_adc_writeresponsevalid_n   => CONNECTED_TO_gestion_verin_0_clk_adc_writeresponsevalid_n,   --     gestion_verin_0_clk_adc.writeresponsevalid_n
			gestion_verin_0_cs_n_writeresponsevalid_n      => CONNECTED_TO_gestion_verin_0_cs_n_writeresponsevalid_n,      --        gestion_verin_0_cs_n.writeresponsevalid_n
			gestion_bp_0_ledtribord_writeresponsevalid_n   => CONNECTED_TO_gestion_bp_0_ledtribord_writeresponsevalid_n    --     gestion_bp_0_ledtribord.writeresponsevalid_n
		);

