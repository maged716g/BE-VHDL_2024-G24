library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_Gestion_ADC is
end entity tb_Gestion_ADC;

architecture behavior of tb_Gestion_ADC is

    -- Déclaration des signaux pour simuler les ports du DUT
    signal clk         : std_logic := '0';
    signal Raz_n       : std_logic := '0';
    signal Data_in     : std_logic := '0';
    signal Cs_n        : std_logic;
    signal Clk_adc     : std_logic;
    signal Angle_barre : std_logic_vector(11 downto 0);

    -- Constantes pour générer les signaux
    constant CLK_PERIOD : time := 20 ns; -- 50 MHz

begin

    -- Instanciation du DUT (Device Under Test)
    DUT: entity work.Gestion_ADC
    port map (
        clk         => clk,
        Raz_n       => Raz_n,
        Data_in     => Data_in,
        Cs_n        => Cs_n,
        Clk_adc     => Clk_adc,
        Angle_barre => Angle_barre
    );

    -- Génération du signal d'horloge (clk)
    clk_process : process
    begin
  
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
     
    end process;
	 
	 Data_in_process : process
begin
    Data_in <= '0';
    wait for 1 us;
    Data_in <= '1';
    wait for 1 us;
    Data_in <= '1';
    wait for 1 us;
end process Data_in_process;

stim_proc: process
begin
    -- Initialisation des signaux
    --Raz_n <= '0';
    --Data_in <= '0';
    --wait for 100 ns;

    -- Lever le reset
    Raz_n <= '1';
    wait for 100 ns;

    -- Simuler une conversion ADC
    --for i in 0 to 30000 loop
        -- Simuler des données analogiques entrantes
      --  if (i mod 2 = 0) then
        --    Data_in <= '0';
        --else
          --  Data_in <= '1';
       --nd if;
        --wait for 1.2 us; -- Période du signal Data_in correspondant à votre fréquence ADC
    --end loop;

    -- Attendre la fin de la simulation
    --wait for 500 ms;
    
end process;


end architecture behavior;
