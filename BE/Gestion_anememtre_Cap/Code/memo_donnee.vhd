library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

Entity memo_donnee is
port( 	
		-- entree
		pwm_compas,
		val_compt,
		raz_n : in std_logic;
		dureepwm : in std_logic_vector(8 downto 0);
		-- sortie
		data_compas : out std_logic_vector(8 downto 0); 
		fin_mesure : out std_logic
	);
end memo_donnee ;

Architecture arch of memo_donnee is
begin

process(pwm_compas, val_compt, raz_n)	
	begin
		if raz_n= '0' then
			data_compas <= "000000000";
		elsif val_compt='0' then 
			fin_mesure <= '0';	
		elsif pwm_compas'event and pwm_compas ='0' then
			data_compas <= dureepwm;
			fin_mesure <= '1';
		end if;
	end process;
end arch;	