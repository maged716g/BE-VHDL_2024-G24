
--déclaration des libraries
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;



--Entité
entity pwm is
port (clk_50Mhz : in std_logic;
reset_n : in std_logic;

pwm_out  : out std_logic);
end entity;

--Archetecture

architecture beh of pwm is
signal dout_compteur:std_logic_vector(7 downto 0);
signal dout_compteur2:std_logic_vector(7 downto 0);
signal sig_pwm : std_logic;
begin
--process compteur
process(clk_50Mhz,reset_n)
variable comp : std_logic_vector(7 downto 0);

begin
if(reset_n='0') then
dout_compteur <= (others =>'0');
comp := (others =>'0');
elsif (rising_edge(clk_50Mhz)) then
if(comp < "11111111") then
comp := comp +1;
else
comp := (others =>'0');

end if;
end if;
dout_compteur <= comp;
end process;

dout_compteur2 <= dout_compteur;

--process comparateur

process( clk_50Mhz , dout_compteur2 )
variable Rapport_cyclique :  std_logic_vector(7 downto 0) ;

begin

--if(rising_edge(clk_50Mhz)) then
Rapport_cyclique := "01000000" ;
if ( dout_compteur2 < Rapport_cyclique ) then
sig_pwm <= '1';
elsif(dout_compteur2 >= Rapport_cyclique) then
sig_pwm <= '0';
end if;
--end if;

end process;
pwm_out <= sig_pwm;

end beh;


--Fin du code
