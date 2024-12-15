-------------------------------- LIBRARIES -----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------- ENTITY ---------------------------
entity DivFreq_de_cap is
	port(
		clk_50M,
		raz_n 		: in std_logic;
		
		clk_10k		: out std_logic; -- La résolution
		clk_1		: out std_logic
		);
end DivFreq_de_cap ;

--------------------------------- ARCHITRECTURE ------------------------
architecture arch of DivFreq_de_cap is
	signal compteur1 : integer;
	signal compteur10k : integer;
	signal clk_1_s : std_logic;
	signal clk_10k_s : std_logic;
begin
	process (clk_50M, raz_n, clk_1_s, clk_10k_s)
	begin 
		if raz_n = '0'
		then 
		compteur1 <= 1;
		compteur10k <= 1;
		clk_1_s <= '0';
		clk_10k_s <= '0';
		elsif rising_edge (clk_50M)
			then
			if compteur1 < 25_000_000 then compteur1 <= compteur1 +1;
			else compteur1 <= 1; end if;
			if compteur1 = 1 then clk_1_s <= not(clk_1_s); end if;
		
			if compteur10k < 2_500 then compteur10k <= compteur10k +1;
			else compteur10k <= 1; end if;
			if compteur10k = 1 then clk_10k_s <= not(clk_10k_s); end if;
				
				clk_1 <= clk_1_s;
				clk_10k <= clk_10k_s;
		end if;
		
	end process;

end arch;