--Codé par : BENSUMAIDEA Maged et TIABI Reda


-------------------------------- LIBRARIES -----------------------------
-- On inclut les bibliothèques VHDL
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

-------------------------------- ENTITY ---------------------------
-- Déclaration de notre entité calcule_freq pour mesurer la fréquence
entity calcule_freq is
    port(
        -- -- Entrees &  sorties
        clk_1                       : in std_logic;                   -- Horloge réduite (1s)qu'on utilise pour les mesures
        in_freq_anemometre         : in std_logic;                    -- Signal du capteur de vitesse
        raz_n                     : in std_logic;                     --Reset pour remettre à zéro
       
        out_freq_calcule        : out std_logic_vector( 7 downto 0)   --fréquence calculée sur 8 bits
        );
end calcule_freq ;

--------------------------------- ARCHITRECTURE ------------------------
-- Ici, on définit comment ça fonctionne
architecture arch of calcule_freq is
    -- On déclare des signaux internes pour les compteurs
    signal signal_front_mont : std_logic_vector( 7 downto 0);   -- Compteur pour les fronts montants
    signal signal_front_desc : std_logic_vector( 7 downto 0);   -- Compteur pour les fronts descendants
    signal signal_somme      : std_logic_vector( 7 downto 0);   -- Stocke la somme des deux compteurs
	 
begin

	  -- Premier processus : compter les fronts montants
     process( clk_1, in_freq_anemometre, raz_n)
    
     begin
         if raz_n='0' then
            signal_front_mont <= (others => '0');
			-- Vérifier s'il y a un front montant sur le signal du capteur
         elsif rising_edge(in_freq_anemometre) then
            if clk_1='1' then
                signal_front_mont <= signal_front_mont+1;
            else signal_front_mont <= (others => '0');
            end if;
        end if;
       
    end process;
       
		 
	 -- Deuxième processus : compter les fronts descendants
    process( clk_1, in_freq_anemometre, raz_n)
    begin
         if raz_n='0' then
            signal_front_desc <= (others => '0');
			
			-- Vérifier s'il y a un front descendant sur le signal du capteur
         elsif falling_edge(in_freq_anemometre) then
            if clk_1='1' then
                signal_front_desc <= signal_front_desc+1;
            else signal_front_desc <= (others => '0');
           end if;
         end if;
    end process;
     
	 
	 -- Troisième processus : calculer la somme des compteurs
    process(clk_1, raz_n)
    begin
         if raz_n='0' then
            signal_somme <= (others => '0');
			-- À chaque front descendant de clk_1, on calcule la somme des deux compteurs
         elsif falling_edge(clk_1) then
            signal_somme <= signal_front_mont+signal_front_desc;
         end if;
    end process;
	 
	 -- On affecte le résultat de la somme à la sortie
    out_freq_calcule <= signal_somme;
end arch;

