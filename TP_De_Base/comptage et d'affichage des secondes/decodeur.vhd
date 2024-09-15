--déclaration des libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



--Entité
entity decodeur is

	port (
		  entree : in std_logic_vector (3 downto 0);
		  seg_out  : out std_logic_vector(6 downto 0)
		  );
end entity;


--Archetecture
architecture decode of decodeur is

	begin
		
	process(entree)
	begin
		case entree is --le numerotage des bits commence par la gauche
			when "0000" => seg_out <= "1000000" ; --0
			when "0001" => seg_out <= "1111001" ; --1
			when "0010" => seg_out <= "0100100" ; --2
			when "0011" => seg_out <= "0110000" ; --3
			when "0100" => seg_out <= "0011001" ; --4
			
			when "0101" => seg_out <= "0010010" ; --5
			when "0110" => seg_out <= "0000010" ; --6
			when "0111" => seg_out <= "1111000" ; --7
			when "1000" => seg_out <= "0000000" ; --8
			
			when "1001" => seg_out <= "0010000" ; --9
			when others => seg_out <= "1000000" ;
		end case;

	end process;

end decode;

--Fin du code