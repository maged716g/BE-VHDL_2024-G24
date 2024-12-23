library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity Calcul_La_Duree is 
port ( 	
		-- entree
		clk_10k,
		raz_n,
		val_compt,
		pwm_compas : in std_logic;
		-- sortie
		dureepwm : out std_logic_vector(8 downto 0)
	);
end Calcul_La_Duree;

Architecture arch of Calcul_La_Duree is
signal dureepwm_s : std_logic_vector(8 downto 0);
begin
	process(clk_10K,raz_n)	
	begin
		if raz_n= '0' then
		dureepwm_s <= "000000000";	
		elsif clk_10k'event and clk_10k ='1' then
			if val_compt ='1' then 
				if pwm_compas = '1' then
					dureepwm_s <= dureepwm_s + "000000001";
				end if;
			else dureepwm_s <= "000000000";
			end if;
		end if;	
	end process;

dureepwm <= dureepwm_s;

end arch;