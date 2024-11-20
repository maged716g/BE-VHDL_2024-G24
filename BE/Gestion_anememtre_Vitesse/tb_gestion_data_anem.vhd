-- Testbench pour l'entité gestion_data_anem
-- Codé par : BENSUMAIDEA Maged et TIABI Reda

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity tb_gestion_data_anem is
end tb_gestion_data_anem;

architecture sim of tb_gestion_data_anem is

    -- Signaux pour simuler les entrées
    signal clk_50M        : std_logic := '0';                      
    signal continu        : std_logic := '0';                     
    signal raz_n          : std_logic := '0';                      
    signal start_stop     : std_logic := '0';                     
    signal out_freq_calcule : std_logic_vector(7 downto 0) := (others => '0'); 

   
    signal data_valid     : std_logic;                             
    signal data_anemometre : std_logic_vector(7 downto 0);        

   
    constant CLK_50M_PERIOD : time := 20 ns;  

begin

   
    UUT: entity work.gestion_data_anem
        port map(
            clk_50M        => clk_50M,
            continu        => continu,
            raz_n          => raz_n,
            start_stop     => start_stop,
            out_freq_calcule => out_freq_calcule,
            data_valid     => data_valid,
            data_anemometre => data_anemometre
        );

 
    clk_50M_process : process
    begin
        while true loop
            clk_50M <= '0';
            wait for CLK_50M_PERIOD / 2;
            clk_50M <= '1';
            wait for CLK_50M_PERIOD / 2;
        end loop;
    end process;

   
    stim_proc : process
    begin
       
        raz_n <= '1';  
        continu <= '1'; 
        start_stop <= '1';
        out_freq_calcule <= "00000010";

        
        wait for 100 ns;

      

        
        continu <= '1';   
		  start_stop <= '0'; 
        out_freq_calcule <= "00000010";  
        wait for 100 ns;
        
        out_freq_calcule <= "00000011";  
        wait for 100 ns;

        
        continu <= '0';
        start_stop <= '0'; 
        wait for 100 ns;

      
        start_stop <= '1'; 
        out_freq_calcule <= "00111100";  --(60 en décimal)
        wait for 100 ns;

        
   
      
        wait;
    end process;

end architecture sim;
