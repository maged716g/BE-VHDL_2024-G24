library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_module is
    port (
        -- Entrées externes
        clk_50M          : in std_logic;
        raz_n            : in std_logic;
        in_pwm_compas    : in std_logic;
        continu          : in std_logic;
        start_stop       : in std_logic;
        
        -- Sorties externes
        data_valid       : out std_logic;
        data_compas      : out std_logic_vector(8 downto 0)
    );
end entity;

architecture arch of top_module is
    -- Signaux internes pour connecter à `gestion_cap`
    signal signal_data_valid   : std_logic;
    signal signal_data_compas  : std_logic_vector(8 downto 0);
begin
    -- Instanciation de gestion_cap
    gestion_cap_inst : entity work.gestion_cap
        port map (
            -- Entrées
            clk_50M        => clk_50M,
            raz_n          => raz_n,
            in_pwm_compas  => in_pwm_compas,
            continu        => continu,
            start_stop     => start_stop,

            -- Sorties
            data_valid     => signal_data_valid,
            data_compas    => signal_data_compas
        );

    -- Connexion des sorties internes aux sorties externes
    data_valid  <= signal_data_valid;
    data_compas <= signal_data_compas;
end architecture;
