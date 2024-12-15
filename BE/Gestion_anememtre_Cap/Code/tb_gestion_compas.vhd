library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Banc de test pour le module gestion_compas
entity tb_gestion_compas is
end tb_gestion_compas;

architecture testbench of tb_gestion_compas is

    -- Composant à tester
    component gestion_compas
        port (
            clk_50M      : in std_logic;
            raz_n        : in std_logic;
            in_pwm_compas: in std_logic;
            continu      : in std_logic;
            start_stop   : in std_logic;
            data_valid   : out std_logic;
            data_compas  : out std_logic_vector(8 downto 0)
        );
    end component;

    -- Signaux internes pour la simulation
    signal clk_50M      : std_logic := '0';
    signal raz_n        : std_logic := '0';
    signal in_pwm_compas: std_logic := '0';
    signal continu      : std_logic := '0';
    signal start_stop   : std_logic := '0';
    signal data_valid   : std_logic;
    signal data_compas  : std_logic_vector(8 downto 0);

    -- Constantes pour la simulation
    constant CLK_PERIOD : time := 20 ns; -- Période de l'horloge 50 MHz (1/50 MHz = 20 ns)

begin

    -- Instanciation du module gestion_compas
    uut: gestion_compas
        port map (
            clk_50M      => clk_50M,
            raz_n        => raz_n,
            in_pwm_compas=> in_pwm_compas,
            continu      => continu,
            start_stop   => start_stop,
            data_valid   => data_valid,
            data_compas  => data_compas
        );

    -- Génération de l'horloge 50 MHz
    clk_process: process
    begin
        while true loop
            clk_50M <= '1';
            wait for CLK_PERIOD / 2;
            clk_50M <= '0';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

    -- Stimuli pour tester le module
    stimulus_process: process
    begin
        -- Initialisation
        raz_n <= '0';
        continu <= '0';
        start_stop <= '0';
        in_pwm_compas <= '0';
        wait for 100 ns;

        -- Sortie du reset
        raz_n <= '1';
        wait for 50 ns;

        -- Mode monocoup, démarrage d'une mesure
        start_stop <= '1';
        in_pwm_compas <= '1';
        wait for 2 ms; -- Durée d'une impulsion PWM
        in_pwm_compas <= '0';
        wait for 1 ms;
        start_stop <= '0';

        -- Vérification de la sortie
        assert data_valid = '1' report "Erreur: data_valid devrait être à '1'" severity error;
        assert data_compas /= "000000000" report "Erreur: data_compas devrait contenir une valeur" severity error;

        -- Mode continu
        continu <= '1';
        in_pwm_compas <= '1';
        wait for 2 ms;
        in_pwm_compas <= '0';
        wait for 1 s; -- Attendre le rafraîchissement en continu

        -- Vérification de la sortie en continu
        assert data_valid = '1' report "Erreur: data_valid devrait être à '1' en mode continu" severity error;
        assert data_compas /= "000000000" report "Erreur: data_compas devrait contenir une valeur en mode continu" severity error;

        -- Fin de la simulation
        wait;
    end process;

end testbench;
