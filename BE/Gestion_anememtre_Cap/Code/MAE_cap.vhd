library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity MAE_cap is
port(
		-- entree
		raz_n,
		clk_50M,
		clk_1,
		pwm_compas,
		start_stop,
		continu,
		fin_mesure  : in std_logic;
		-- sortie
		val_compt,
		data_valid : out std_logic
	);
end MAE_cap;


Architecture arch of MAE_cap is
begin

process (raz_n, clk_50M)
	variable etat : integer range 0 to 4;
begin
	if raz_n ='0' then
		etat:= 0;
		val_compt <= '0';
		data_valid<='0';
		
	elsif clk_50M'event and clk_50M='1' then
		case etat is
		when 0 =>
			if continu ='0' then 
				if start_stop='1' and pwm_compas='0' then
					etat:=1; 
					val_compt <= '1';
				end if;
			else
				if clk_1 = '1' and pwm_compas='0' then 
					etat:=3; 
					val_compt <= '1';
				end if;
			end if;
		when 1 =>
			if fin_mesure='1' then 
				etat:=2; 
				val_compt <= '0';
				data_valid<='1';
			end if;
		when 2 =>
			if start_stop='0' then 
			etat:=0;
			val_compt <= '0'; 
			data_valid<='0';
			end if;
		when 3 =>
			if fin_mesure='1' then 
				etat:=4; 
				val_compt <= '0'; 
				data_valid<='1';
			end if;
		when 4 =>
			if clk_1 = '0' then 
				etat:=0; 
				val_compt <= '0'; 
				data_valid<='0';
			end if;
		end case;
	end if;
	end process;
end arch;