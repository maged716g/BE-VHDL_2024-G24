-------------------------------- LIBRARIES -----------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-------------------------------- ENTITY ---------------------------
entity controle_butees is
    Port (
        pwm          : in  STD_LOGIC;    
        butee_d      : in  STD_LOGIC_VECTOR(11 downto 0); 
        butee_g      : in  STD_LOGIC_VECTOR(11 downto 0); 
        angle_barre  : in  STD_LOGIC_VECTOR(11 downto 0); 
        sens         : in  STD_LOGIC;     -- (0=gauche, 1=droite)
		  
        out_pwm      : out STD_LOGIC;    
        out_sens     : out STD_LOGIC     
    );
end controle_butees;

-------------------------------- ARCHITECTURE ------------------------
architecture Beh_b of controle_butees is

begin

    process(pwm, butee_d, butee_g, angle_barre, sens)
    begin
        
        if (angle_barre <= butee_g and sens = '0') then
            out_pwm <= '0'; 
        elsif (angle_barre >= butee_d and sens = '1') then
            out_pwm <= '0'; 
        else
            out_pwm <= pwm;  
        end if;

       
        out_sens <= sens;
    end process;

end Beh_b;
