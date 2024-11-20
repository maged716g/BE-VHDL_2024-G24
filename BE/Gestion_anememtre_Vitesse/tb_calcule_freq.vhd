-- Testbench pour l'entité calcule_freq
-- Codé par : BENSUMAIDEA Maged et TIABI Reda

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_calcule_freq is
end tb_calcule_freq;

architecture sim of tb_calcule_freq is

   
    signal clk_1            : std_logic := '0';  
    signal in_freq_anemometre : std_logic := '0';  
    signal raz_n            : std_logic := '0';  

   
    signal out_freq_calcule : std_logic_vector(7 downto 0);  

    constant CLK_1_PERIOD   : time := 1 sec;    
    constant FREQ_ANEM_PERIOD : time := 100 ms;  

begin

    
    UUT: entity work.calcule_freq
        port map(
            clk_1            => clk_1,
            in_freq_anemometre => in_freq_anemometre,
            raz_n            => raz_n,
            out_freq_calcule => out_freq_calcule
        );

  
    clk_1_process : process
    begin
        while true loop
            clk_1 <= '0';
            wait for CLK_1_PERIOD / 2;
            clk_1 <= '1';
            wait for CLK_1_PERIOD / 2;
        end loop;
    end process;

   
    stim_anemometre: process
    begin
      
        in_freq_anemometre <= '0';
        wait for 100 ns;

      
        while true loop
            in_freq_anemometre <= '1';
            wait for FREQ_ANEM_PERIOD / 2;  
            in_freq_anemometre <= '0';
            wait for FREQ_ANEM_PERIOD / 2;  
        end loop;
    end process;

  
    stim_proc: process
    begin
      
        raz_n <= '0';  
        wait for 100 ns;
        
       
        raz_n <= '1'; 
        wait for 2 sec; 

        
        wait;
    end process;

end architecture sim;
