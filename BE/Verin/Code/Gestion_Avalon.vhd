-- **********************************************************
--                      Avalon
--***********************************************************


--*****************************************************************************************************************************
--                                         LIBRARY
--*****************************************************************************************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

--*****************************************************************************************************************************
--                                           ENTITY 
--*****************************************************************************************************************************
entity Gestion_Avalon is
port ( 	
    clk, chipselect, write_n, reset_n : in std_logic;
	 writedata                         : in std_logic_vector (31 downto 0);
	 address                           : in std_logic_vector (2 downto 0);
	 readdata                          : out std_logic_vector (31 downto 0);
	 butee_d, butee_g, freq, duty      : out std_logic_vector (15 downto 0);
	 angle_barre                       : in std_logic_vector (11 downto 0);  -- On l'aura besoin car on a un registre Angle_barre
	 raz_n, enable_pwm, sens           : out std_logic;
	 fin_course_d, fin_course_g        : out std_logic
	);
end Gestion_Avalon;

--*****************************************************************************************************************************
--                                       ARCHITECTURE 
--*****************************************************************************************************************************
architecture arch_avalon of Gestion_Avalon is
  -- J'ai déclaré le 6 registres qui sont spécifié dans le fichier "Spécification des interfaces pilote de barre franche"
   signal registre_freq, registre_duty, registre_butee_g, registre_butee_d : std_logic_vector (15 downto 0);    -- On peut lire et écrire sur ces registres
   signal registre_config                                                  : std_logic_vector (4 downto 0);     -- On peut w/r sur bit 0,1,2. On peut que lire sur bits 3 et 4
   signal registre_Angle_barre                                             : std_logic_vector (11 downto 0);    -- On peut que lire de ce registre

begin
	P_write: process (clk, reset_n)
	begin
		if reset_n = '0' then
			freq <= (others => '0');
			duty <= (others => '0');
			registre_config <= (others => '0');
			butee_g <= (others => '0');
			butee_d <= (others => '0');
			registre_Angle_barre <= (others => '0');
			
		elsif clk'event and	clk='1' then
			if chipselect ='1' and write_n = '0' then
				case address is
					when "000" =>                                     -- Ecriture dans les registres freq 
						registre_freq <= writedata(15 downto 0);
					
					when "001" =>                                     -- Ecriture dans les registres freq 
						registre_duty <= writedata(15 downto 0);
					
					when "010" =>                                     -- Ecriture dans les registres butée_g 
						registre_butee_g <= writedata(15 downto 0);
	
					when "011" =>                                     -- Ecriture dans les registres butée_d
						registre_butee_d <= writedata(15 downto 0);	
					
					when "100" =>                                     -- Ecriture dans le registre config
						registre_config(2 downto 0) <= writedata(2 downto 0);


					when others => null; 
				end case;
				freq <= registre_freq;
				duty <= registre_duty;
				butee_g <= registre_butee_g;
				butee_d <= registre_butee_d;
				raz_n <= registre_config(0);
				enable_pwm <= registre_config(1);
				sens <= registre_config(2);
		
			end if;
		end if;
	end process;

	P_read: process (address, angle_barre, registre_freq, registre_duty, registre_butee_g, registre_butee_d, registre_config)
	begin
		case address is
			when "000"  => readdata <= (31 downto 16 => '0')  & registre_freq; 
			when "001"  => readdata <= (31 downto 16 => '0')  & registre_duty;
			when "010"  => readdata <= (31 downto 16 => '0')  & registre_butee_g;
			when "011"  => readdata <= (31 downto 16 => '0')  & registre_butee_d;
			when "100"  => readdata <= (31 downto  5 => '0')  & registre_config; 
			--when "101"  => readdata <= (31 downto 12 => '0')  & angle_barre;   
			when "101"  => readdata <= X"00000"  & angle_barre;
			when others => readdata <= (others => '0'); 
		end case;
		fin_course_d <= registre_config(3);
		fin_course_g <= registre_config(4);
	end process;

	
  
end arch_avalon;





	  
	
	












