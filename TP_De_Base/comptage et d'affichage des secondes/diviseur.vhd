--déclaration des libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



--Entité
entity diviseur is
port (clk : in std_logic;
rst : in std_logic;
dout  : out std_logic);
end entity;


--Archetecture

architecture div of diviseur is

begin

process(clk,rst)
variable comp : integer range 0 to 25000000 ;
variable clk_int :  std_logic;

begin
if(rst='0') then
dout <= '0';
clk_int := '0';
comp := 0 ;


elsif (rising_edge(clk)) then
comp := comp +1;
if ( comp = 25000000 ) then
clk_int := not clk_int;
comp := 0 ;
end if;
dout <= clk_int;
end if;

end process;


end div;

--Fin du code