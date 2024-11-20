library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_NMEA_Interface is
-- Pas de ports car il s'agit d'un testbench
end tb_NMEA_Interface;

architecture behavior of tb_NMEA_Interface is

    -- Déclaration du composant à tester
    component NMEA_Interface
        port (
            clk           : in  std_logic;
            reset_n       : in  std_logic;
            start_stop    : in  std_logic;
            angle_int     : in  std_logic_vector(8 downto 0);
            tx_serial     : out std_logic;
            transmit_done : out std_logic
        );
    end component;

    -- Signaux internes
    signal clk           : std_logic := '0';              -- Signal d'horloge
    signal reset_n       : std_logic := '1';              -- Reset actif bas
    signal start_stop    : std_logic := '0';              -- Signal start/stop
    signal angle_int     : std_logic_vector(8 downto 0);  -- Angle d'entrée
    signal tx_serial     : std_logic;                     -- Données série
    signal transmit_done : std_logic;                     -- Indicateur de fin

    -- Constante pour la période de l'horloge
    constant CLK_PERIOD : time := 20 ns; -- Fréquence d'horloge de 50 MHz

begin

    -- Instanciation du composant à tester
    uut: NMEA_Interface
        port map (
            clk           => clk,
            reset_n       => reset_n,
            start_stop    => start_stop,
            angle_int     => angle_int,
            tx_serial     => tx_serial,
            transmit_done => transmit_done
        );

    -- Génération de l'horloge
    clk_process : process
    begin
        clk <= '0';
        wait for CLK_PERIOD / 2;
        clk <= '1';
        wait for CLK_PERIOD / 2;
    end process;

    -- Stimuli pour la simulation
    stimulus_process : process
    begin
        -- Initialisation
        reset_n <= '0';            -- Activation du reset
        start_stop <= '0';         -- Pas de transmission
        angle_int <= (others => '0'); -- Initialiser l'angle à 0
        wait for 100 ns;

        reset_n <= '1';            -- Désactivation du reset
        wait for 100 ns;

        -- Test 1 : Transmettre un angle de 234
        angle_int <= std_logic_vector(to_unsigned(234, 9)); -- Angle 234
        start_stop <= '1';         -- Activer la transmission
        wait for 10 ms;            -- Attendre pour couvrir toute la trame

        -- Vérifier la fin de transmission
        assert (transmit_done = '1')
        report "Erreur : Transmission non terminée pour l'angle 234."
        severity error;

        start_stop <= '0';         -- Arrêter la transmission
        wait for 100 ns;

        -- Fin de la simulation
        wait;
    end process;

end behavior;
