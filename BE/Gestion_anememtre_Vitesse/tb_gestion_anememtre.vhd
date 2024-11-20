-- Testbench pour l'entité system_anemometre
-- Codé par : BENSUMAIDEA Maged et TIABI Reda

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_system_anemometre is
end tb_system_anemometre;

architecture sim of tb_system_anemometre is

    signal clk_50M         : std_logic := '0';                     
    signal raz_n           : std_logic := '0';                    
    signal in_freq_anemometre : std_logic := '0';                   
    signal continu         : std_logic := '0';                      
    signal start_stop      : std_logic := '0';                     

    signal data_valid      : std_logic;                             
    signal data_anemometre : std_logic_vector(7 downto 0);         

    constant CLK_50M_PERIOD : time := 20 ns;  
    constant FREQ_ANEM_PERIOD : time := 10 ms; 

begin

    UUT: entity work.port_map_anem
        port map(
            clk_50M         => clk_50M,
            raz_n           => raz_n,
            in_freq_anemometre => in_freq_anemometre,
            continu         => continu,
            start_stop      => start_stop,
            data_valid      => data_valid,
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
	 
	 
    in_freq_anem_process : process
    begin
        while true loop
            in_freq_anemometre <= '1';
            wait for FREQ_ANEM_PERIOD / 2;
            in_freq_anemometre <= '0';
            wait for FREQ_ANEM_PERIOD / 2;
        end loop;
    end process;

    stim_proc : process
    begin
	 raz_n <= '0'; 
	 wait for 50 ns;
	 raz_n <= '1'; 
	 			continu <= '1';  
			start_stop <= '0'; 

		  wait for 700 ms;
			--raz_n <= '1';   

        
        --wait for 50 ms;
        continu <= '1';  
        start_stop <= '1'; 

       
        wait for 50 ms;

        
        continu <=   '0' ;
		  start_stop <='0' ; 
        wait for 50 ms;
		  

        
        continu <= '0';
        start_stop <= '1'; 
        wait for 100 ms;

  
        wait;
    end process;

end architecture sim;
