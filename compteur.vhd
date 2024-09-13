--déclaration des libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



--Entité
entity compteur is
port (clk_1hz : in std_logic;
	rst_compteur : in std_logic;
	dout_compteur  : out std_logic_vector(3 downto 0));
end entity;


--Archetecture

architecture compte of compteur is

	begin

	process(clk_1hz,rst_compteur)
	variable comp : std_logic_vector(3 downto 0);
	begin
	if(rst_compteur='0') then
		dout_compteur <= (others =>'0');
		comp := (others =>'0');
	elsif (rising_edge(clk_1hz)) then
		comp := comp +1;
			if ( comp = "1010" ) then
				comp := (others =>'0') ;

			end if;
	
	end if;
	dout_compteur <= comp;
	end process;

end compte;

--Fin du code