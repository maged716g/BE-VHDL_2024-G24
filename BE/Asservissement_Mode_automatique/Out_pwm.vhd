library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity Out_pwm is
port(
		-- entree
		clk_10k,
		raz_n,
		in_pwm_compas : in std_logic;
		-- sortie
		pwm_compas : out std_logic
	);
end Out_pwm;

Architecture arch of Out_pwm is
begin
	process(clk_10k,raz_n)
	begin
			if raz_n= '0' then
				pwm_compas <= '0';
			elsif clk_10k'event and clk_10k='1' then
					pwm_compas <= in_pwm_compas;
			end if;	
	end process;
end arch;	
