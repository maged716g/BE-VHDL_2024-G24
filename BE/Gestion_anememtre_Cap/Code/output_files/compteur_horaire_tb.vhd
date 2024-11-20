library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity compteur_horaire_tb is
end compteur_horaire_tb;

architecture Behavioral of compteur_horaire_tb is

   
    component compteur_horaire
        Port (
            clk      : in  std_logic;
            reset    : in  std_logic;
            enable   : in  std_logic;
            init12   : in  std_logic;
            opt24    : in  std_logic;
            digit1   : out std_logic_vector(6 downto 0);
            digit0   : out std_logic_vector(6 downto 0)
        );
    end component;

   
    signal clk      : std_logic := '0';
    signal reset    : std_logic := '0';
    signal enable   : std_logic := '0';
    signal init12   : std_logic := '0';
    signal opt24    : std_logic := '0';
    signal digit1   : std_logic_vector(6 downto 0);
    signal digit0   : std_logic_vector(6 downto 0);

    constant CLK_PERIOD : time := 20 ns;

begin
   
    UUT: compteur_horaire
        Port map (
            clk => clk,
            reset => reset,
            enable => enable,
            init12 => init12,
            opt24 => opt24,
            digit1 => digit1,
            digit0 => digit0
        );

   
    clk_process: process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD / 2;
            clk <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

   
    stimulus_process: process
    begin
        
        reset <= '0';
        wait for 20 ns;
        reset <= '1';
        enable <= '0';

        -- Test 1: Initialisation à 12
        init12 <= '1';
        wait for CLK_PERIOD;
        init12 <= '0';
        wait for 20 ns;

        -- Test 2: Mode 12h avec comptage
        enable <= '1';
        opt24 <= '0'; -- Mode 12h
        wait for 150 ns; -- Laisser le compteur avancer
        enable <= '0'; -- Désactiver le comptage
        wait for 20 ns;

        -- Test 3: Mode 24h avec comptage
        enable <= '1';
        opt24 <= '1'; -- Mode 24h
        wait for 250 ns; -- Laisser le compteur avancer
        enable <= '0'; -- Désactiver le comptage
        wait for 20 ns;

        -- Test 4: Reset
        reset <= '0';
        wait for 20 ns;
        reset <= '0';

        -- Fin de simulation
        wait;
    end process;

end Behavioral;
