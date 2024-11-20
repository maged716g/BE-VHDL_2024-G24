library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity port_map_anem is
    port(
        clk_50M         : in std_logic;
        raz_n          : in std_logic;
        in_freq_anemometre : in std_logic;
		  continu : in std_logic;
		  start_stop : in std_logic;
		  data_valid : out std_logic;
		  data_anemometre : out std_logic_vector(7 downto 0)
    );
end port_map_anem;

architecture arch of port_map_anem is
    -- Signaux internes
    signal clk_1            : std_logic;
    signal out_freq_calcule : std_logic_vector(7 downto 0);
	 
begin
    -- Instance du diviseur pour générer clk_1
    U1: entity work.diviseur
        port map(
            clk_50M => clk_50M,
            raz_n   => raz_n,
            clk_1   => clk_1
        );

    -- Instance du calculateur de fréquence
    U2: entity work.calcule_freq
        port map(
            clk_1             => clk_1,
            in_freq_anemometre => in_freq_anemometre,
            raz_n             => raz_n,
            out_freq_calcule  => out_freq_calcule
        );

    -- Instance de gestion_data_anem pour gérer le mode continu et manuel
    U3: entity work.gestion_data_anem
        port map(
            clk_50M           => clk_50M,
            continu           => continu ,
            raz_n             => raz_n ,
            start_stop        => start_stop ,
            out_freq_calcule  => out_freq_calcule,
            data_valid        => data_valid,
            data_anemometre   => data_anemometre
        );


end architecture arch;
