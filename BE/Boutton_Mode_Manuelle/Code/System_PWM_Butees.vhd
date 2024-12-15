-------------------------------- LIBRARIES -----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------- ENTITY ---------------------------
entity System_PWM_Butees is
    port (
        clk, Raz_n, Enable_pw : in std_logic;
        freq, duty : in std_logic_vector(15 downto 0);
        butee_d, butee_g, angle_barre : in std_logic_vector(11 downto 0);
        sens : in std_logic;  -- (0=gauche, 1=droite)
        
        out_pwm : out std_logic;
        out_sens : out std_logic
    );
end entity;

-------------------------------- ARCHITECTURE ------------------------
architecture Beh_sys of System_PWM_Butees is
    
    signal pwm_signal : std_logic;
begin

    
    PWM : entity work.PWM
        port map (
            clk        => clk,
            Raz_n      => Raz_n,
            Enable_pw  => Enable_pw,
            freq       => freq,
            duty       => duty,
            pwm        => pwm_signal  
        );

    
    butees : entity work.controle_butees
        port map (
            pwm         => pwm_signal,  
            butee_d     => butee_d,
            butee_g     => butee_g,
            angle_barre => angle_barre,
            sens        => sens,
            out_pwm     => out_pwm,     
            out_sens    => out_sens      
        );

end Beh_sys;
