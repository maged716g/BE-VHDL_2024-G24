-------------------------------- LIBRARIES -----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;  

-------------------------------- ENTITY ---------------------------
entity PWM is
    port (
        clk, Raz_n, Enable_pw: in std_logic;
        freq, duty : in std_logic_vector (15 downto 0); 
        pwm : out std_logic
    );
end entity;

-------------------------------- ARCHITECTURE ------------------------
architecture arch_pwm of PWM is
    signal comp : unsigned(15 downto 0);
    signal period : unsigned(15 downto 0);
    signal pwm_intern : std_logic;
    constant horloge : integer := 50000000; -- Fréquence de l'horloge à 50 MHz

begin

    -- Processus de divide
    process (clk, Raz_n)
    begin
        if Raz_n = '0' then
            comp <= (others => '0');
        elsif rising_edge(clk) then
            
            if Enable_pw = '1' then
       
                period <= to_unsigned(horloge / to_integer(unsigned(freq)), 16);  -- Calcul de la période

                if comp >= period then
                    comp <= (others => '0');  
                else
                    comp <= comp + 1; 
                end if;
            else
                comp <= (others => '0');  
            end if;
        end if;
    end process;

    -- Processus compare
    process (clk, Raz_n)
    begin
        if Raz_n = '0' then
            pwm_intern <= '0';
        elsif rising_edge(clk) then
            if Enable_pw = '0' then
                pwm_intern <= '0';  
            else
                
                if comp >= (period * unsigned(duty)/unsigned(freq)) then
                    pwm_intern <= '0';  
                else
                    pwm_intern <= '1'; 
                end if;
            end if;
        end if;
    end process;

    pwm <= pwm_intern;  

end arch_pwm;
