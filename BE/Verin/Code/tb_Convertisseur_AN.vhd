library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tb_Convertisseur_AN is
end entity tb_Convertisseur_AN;

architecture sim of tb_Convertisseur_AN is
    -- Signaux de test
    signal clk         : std_logic := '0';
    signal Raz_n       : std_logic := '1';
    signal Data_in     : std_logic := '0';
    signal cs_n        : std_logic;
    signal clk_adc     : std_logic;
    signal angle_barre : std_logic_vector(11 downto 0);

    -- Période d'horloge
    constant clk_period : time := 20 ns;

begin
    -- Instance du Convertisseur_AN
    uut: entity work.Convertisseur_AN
        port map (
            clk         => clk,
            Raz_n       => Raz_n,
            Data_in     => Data_in,
            cs_n        => cs_n,
            clk_adc     => clk_adc,
            angle_barre => angle_barre
        );

    -- Générateur d'horloge
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process clk_process;
Data_in_process : process
begin
    Data_in <= '0';
    wait for 1 us;
    Data_in <= '1';
    wait for 1 us;
    Data_in <= '1';
    wait for 1 us;
end process Data_in_process;
    -- Processus de stimulus
    stimulus_process: process
    begin
        -- Réinitialisation
        --Raz_n <= '0';
        --wait for 40 ns;
        Raz_n <= '1';


 
     

        -- Fin de la simulation
        wait; -- Attend indéfiniment
    end process stimulus_process;

end architecture sim;
