-- Codé par : BENSUMAIDEA Maged et TIABI Reda

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_diviseur is
end tb_diviseur;

architecture sim of tb_diviseur is

    signal clk_50M  : std_logic := '0';  
    signal raz_n    : std_logic := '0';  

   
    signal clk_1    : std_logic; 

  
    constant CLK_PERIOD : time := 20 ns; 
    
begin

 
    UUT: entity work.diviseur
        port map(
            clk_50M => clk_50M,
            raz_n   => raz_n,
            clk_1   => clk_1
        );

   
    clk_process : process
    begin
        while true loop
            clk_50M <= '0';
            wait for CLK_PERIOD / 2;
            clk_50M <= '1';
            wait for CLK_PERIOD / 2;
        end loop;
    end process;

   
    stim_proc: process
    begin
       
        raz_n <= '0'; 
        wait for 100 ns;
        
       
        raz_n <= '1';  
        wait for 10 us;

       
        wait for 500 ms; 
        
      
        wait;
    end process;

end architecture sim;
