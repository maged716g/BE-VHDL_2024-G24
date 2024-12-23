library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity tb_DivFreq_de_cap is
end tb_DivFreq_de_cap;


architecture test of tb_DivFreq_de_cap is

	signal clk_50M : std_logic := '0';
	signal raz_n : std_logic := '0';
	signal clk_1 : std_logic;
	signal clk_10k : std_logic;
	

	constant clk_period : time := 20 ns;
	
begin

	Test : entity work.DivFreq_de_cap
		port map(
			clk_50M => clk_50M,
			raz_n => raz_n,
			clk_1 => clk_1,
			clk_10k => clk_10k
		);


	clk_process : process
	begin
			clk_50M <= '0';
			wait for clk_period / 2;
			clk_50M <= '1';
			wait for clk_period / 2;
		
	end process clk_process;

	simulation : process
	begin
	
		raz_n <= '0';
		wait for 100 ns;
		
		
		raz_n <= '1';
		
	
		wait for 2000 ms;
		
		
		wait;
	end process simulation;

end architecture test;
