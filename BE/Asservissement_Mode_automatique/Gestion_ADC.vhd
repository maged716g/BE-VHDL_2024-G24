-- **********************************************************
--                      adc mcp3201
--***********************************************************


--*****************************************************************************************************************************
--                                         LIBRARY
--*****************************************************************************************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_signed.all;


--*****************************************************************************************************************************
--                                           ENTITY 
--*****************************************************************************************************************************
entity Gestion_ADC is
    port (
        clk         : in  std_logic;                    -- Horloge principale (50 MHz)
        Raz_n       : in  std_logic;                    -- Signal de reset actif bas
        Data_in     : in  std_logic;                    -- Données provenant de l'ADC
        Cs_n        : out std_logic;                    -- Chip Select pour l'ADC (actif bas)
        Clk_adc     : out std_logic;                    -- Horloge ADC (utilisée pour SPI)
        Angle_barre : out std_logic_vector(11 downto 0) -- Données converties (12 bits)
    );
end entity;

--*****************************************************************************************************************************
--                                       ARCHITECTURE 
--*****************************************************************************************************************************
architecture arch_adc of Gestion_ADC is

	 signal compt_front    : integer range 0 to 14;
	 signal  Fin           :   std_logic;
	 SIGNAL  clk_1M        :   std_logic;
	 SIGNAL  raz_compteur  :   std_logic;
    signal start_conv     : std_logic := '0';                                -- Démarrage de la conversion
    signal clk_count      : integer := 0;                                    -- Compteur pour générer 1 MHz
    signal adc_data_shift : std_logic_vector(11 downto 0) := (others => '0');-- Registre de décalage pour les données ADC
    signal Etat           : integer := 0;                                    -- État de la machine à états
    signal count_100ms    : integer := 0;                                    -- Compteur pour 100ms
    signal adc_clk        : std_logic := '0';                                -- Horloge utilisée pour compter les bits lors de la conversion

    constant CLK_FREQ     : integer := 50000000;                             -- Fréquence de l'horloge principale (50 MHz)
    constant ADC_CLK_FREQ : integer := 1000000;                              -- Fréquence de l'horloge ADC (1 MHz)
    constant PERIOD_100MS : integer := 100000;                               -- Compteur pour 100ms

begin

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--                       GENERATION DE L'HORLOGE 1 MHZ POUR L'ADC 
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

    gene_1M: process(clk, Raz_n)
    begin
        if Raz_n = '0' then
            clk_count <= 0;
            clk_1M <= '0';
        elsif rising_edge(clk) then
            clk_count <= clk_count + 1;
            if clk_count = (CLK_FREQ / (2 * ADC_CLK_FREQ)) then  -- Division pour obtenir 1 MHz
                clk_1M <= not clk_1M;
                clk_count <= 0;
            end if;
        end if;
    end process;

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--                     GENERATION DU START_CONV (TOUTES LES 100MS) 
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

    gene_start_conv : process(clk_1M, Raz_n )
    begin
        if rising_edge(clk_1M) then
            if Raz_n = '0' then
                count_100ms <= 0;
                start_conv <= '0';
            else
                if count_100ms < PERIOD_100MS then
                    count_100ms <= count_100ms + 1;
                    start_conv <= '0';  
                else
                    start_conv <= '1';  -- Start la conversion toutes les 100ms
                    count_100ms <= 0;
                end if;
            end if;
        end if;
    end process;

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--                             MACHINE A ETAT POUR CONTROLER L'ADC 
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

pilote_adc: process(Raz_n, clk_1M)
begin
    if Raz_n = '0' then
        Etat <= 0;
        Cs_n <= '1';  
        Angle_barre <= (others => '0');
        --adc_data_shift <= (others => '0');  
        adc_clk <= '0'; 
		  raz_compteur    <=  '1';
    elsif rising_edge(clk_1M) then
        if Etat = 0 then 
            Cs_n <= '1'; 
            if start_conv = '1' then
                Etat <= 1;  
                Cs_n <= '0';  
					 raz_compteur    <=  '0';
            end if;
        elsif Etat = 1 then  
            --adc_data_shift <= (others => '0');
            adc_clk <= '1';  
            Etat <= 2;
				
        elsif Etat = 2 then  
            
            adc_clk <= '0';  
            Etat <= 3;				
				
				
				
        elsif Etat = 3 then  
                if Fin  =   '1' then
                    adc_clk   <=  '0';
                    cs_n        <=  '1';
                    Angle_barre <=  adc_data_shift;
                    Etat <= 4;

                else 
						  Etat <= 2;
						  adc_clk   <=  '1';
					 end if;
					 
        elsif Etat = 4 then  
            
                if start_conv   =   '0' then
                    Etat <= 0;
                    cs_n            <=  '1';
                    adc_clk       <=  '0';
                    raz_compteur    <=  '1';
                end if;
				
        else
            Etat <= 0;  
				adc_clk   <=  '0';
            cs_n        <=  '1';
       end if;
    end if;
     
end process;



--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--                   Pour compter les fronts d'horloge de clk_adc
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

Compteur_fronts: process (adc_clk, raz_compteur)
	begin
	if raz_compteur = '1' then
	    compt_front <=  0;
	elsif adc_clk'event and adc_clk =   '1' then
		if compt_front  =   14 then
		    compt_front <=  0;
		    Fin         <= '1';
		else
		    compt_front <=  compt_front +1;
		    Fin         <=  '0';
		end if;
    end if;
end process Compteur_fronts;

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--                   Pour compter les fronts d'horloge de clk_adc
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

reg_shift: process (adc_clk)
	variable i : integer ;
	begin
		 if Raz_n = '0' then
           adc_data_shift <= (others => '0'); 
	    elsif (adc_clk'event and adc_clk    =   '1') and  (compt_front >= 3)   then
	        adc_data_shift(0)   <=  data_in ;
		For i in 1 to 11 loop
		    adc_data_shift(i)   <=  adc_data_shift(i-1);
		end loop;
	End if ;
end process reg_shift;

--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
--                                     Sortie 
--&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

Clk_adc <= adc_clk;  

end arch_adc;
