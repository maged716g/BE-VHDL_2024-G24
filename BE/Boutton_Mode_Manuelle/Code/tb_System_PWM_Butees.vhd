-------------------------------- LIBRARIES -----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-------------------------------- ENTITY ---------------------------
entity tb_System_PWM_Butees is
end entity;

-------------------------------- ARCHITECTURE ------------------------
architecture Beh_tb of tb_System_PWM_Butees is

   
    signal clk        : std_logic := '0';
    signal Raz_n      : std_logic := '0';
    signal Enable_pw  : std_logic := '0';
    signal freq       : std_logic_vector(15 downto 0) := (others => '0');
    signal duty       : std_logic_vector(15 downto 0) := (others => '0');
    signal butee_d    : std_logic_vector(11 downto 0) := (others => '0');
    signal butee_g    : std_logic_vector(11 downto 0) := (others => '0');
    signal angle_barre: std_logic_vector(11 downto 0) := (others => '0');
    signal sens       : std_logic := '0';  -- 0=gauche, 1=droite

   
    signal out_pwm    : std_logic;
    signal out_sens   : std_logic;

   
    constant clk_period : time := 20 ns;

begin

  
    Test: entity work.System_PWM_Butees
        port map (
            clk         => clk,
            Raz_n       => Raz_n,
            Enable_pw   => Enable_pw,
            freq        => freq,
            duty        => duty,
            butee_d     => butee_d,
            butee_g     => butee_g,
            angle_barre => angle_barre,
            sens        => sens,
            out_pwm     => out_pwm,
            out_sens    => out_sens
        );

   
    clk_pross : process
    begin
        while true loop
            clk <= '0';
            wait for clk_period / 2;
            clk <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

    simulation : process
    begin

       
        Raz_n <= '0';
        Enable_pw <= '0';
        freq <= "0001001110001000";   -- Fréquence 5000
        duty <= "0000101000000000";   -- Rapport cyclique 40%  2560
        butee_d <= x"0800";   -- Butee droite  'en hexa'  2048 
        butee_g <= x"0100";   -- Butee gauche  256 
        angle_barre <= x"0400"; -- Position actuelle au milieu  1024 
        sens <= '0';       -- Sens gauche 

        --  reset
        wait for 10 ms;
        Raz_n <= '1';      

        -- PWM
        Enable_pw <= '1';
        wait for 10 ms;

        -- butée gauche (angle_barre <= butee_g)
        angle_barre <= x"0080"; -- L'angle atteint la butée gauche 128
        wait for 10 ms;

        -- butée droite (angle_barre >= butee_d)
        sens <= '1';             -- Changer de direction 
        angle_barre <= x"0900";   --2304
        wait for 10 ms;

       
        angle_barre <= x"0500";  -- L'angle est dans une position normale 1280
        wait for 10 ms;

        --  PWM off
        Enable_pw <= '0';
        wait for 10 ms;

        wait;
    end process;

end Beh_tb;
