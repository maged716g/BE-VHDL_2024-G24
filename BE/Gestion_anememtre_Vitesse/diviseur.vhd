--Codé par : BENSUMAIDEA Maged et TIABI Reda


-------------------------------- LIBRARIES -----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------- ENTITY ----------------------------
entity diviseur is
    port(
        -- entrees &  sorties
        clk_50M        : in std_logic;
        raz_n         : in std_logic;
       
        clk_1           : out std_logic
        );
end diviseur ;

--------------------------------- ARCHITRECTURE ------------------------
architecture arch of diviseur is
    signal compteur : integer;
    signal clk_1_int : std_logic;
begin
    process (clk_50M, raz_n, clk_1_int)
    begin
        if raz_n = '0'
        then
        --initialisation
        compteur <= 1;
        clk_1_int <= '0';
        elsif rising_edge (clk_50M)
        then
       
        if compteur < 25000000 then compteur <= compteur +1;
        --if compteur < 25 then compteur <= compteur +1;
        else compteur <= 1; end if;
        if compteur = 1 then clk_1_int <= not(clk_1_int); end if;
        end if;
       
    end process;
    clk_1 <= clk_1_int;
end arch;



