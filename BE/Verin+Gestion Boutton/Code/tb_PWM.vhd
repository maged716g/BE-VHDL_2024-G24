-------------------------------- LIBRARIES -----------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-------------------------------- ENTITY ---------------------------

entity tb_PWM is
end entity;

-------------------------------- ARCHITECTURE ------------------------
architecture TB_arch of tb_PWM is

    
    component PWM
        port(
            clk : in std_logic;
            Raz_n : in std_logic;
            Enable_pw : in std_logic;
            freq : in std_logic_vector(15 downto 0);
            duty : in std_logic_vector(15 downto 0);
            pwm : out std_logic
        );
    end component;

  
    signal clk_tb : std_logic := '0';
    signal Raz_n_tb : std_logic := '0';
    signal Enable_pw_tb : std_logic := '0';
    signal freq_tb : std_logic_vector(15 downto 0) := (others => '0');
    signal duty_tb : std_logic_vector(15 downto 0) := (others => '0');
    signal pwm_tb : std_logic;

    constant clk_period : time := 20 ns;

begin

   
    UUT: PWM
        port map(
            clk => clk_tb,
            Raz_n => Raz_n_tb,
            Enable_pw => Enable_pw_tb,
            freq => freq_tb,
            duty => duty_tb,
            pwm => pwm_tb
        );

   
    clk_process : process
    begin
        while true loop
            clk_tb <= '0';
            wait for clk_period / 2;
            clk_tb <= '1';
            wait for clk_period / 2;
        end loop;
    end process;

   
    stimulus_process : process
    begin
		  Raz_n_tb <= '0';
		  Enable_pw_tb <= '1';
        freq_tb <= "0000001111101000";  -- 1000
        duty_tb <= "0000000111110100";  -- 500
        wait for 10 ms;
		  
        Raz_n_tb <= '1';
        Enable_pw_tb <= '0';
		  freq_tb <= "0000001111101000";  -- 1000
        duty_tb <= "0000000111110100";  -- 500
		  wait for 10 ms;
		  
		  Enable_pw_tb <= '1';
        freq_tb <= "0000001111101000";  -- 1000
        duty_tb <= "0000000111110100";  -- 500
        wait for 10 ms;

        -- Changement du rapport cyclique et freq
		  freq_tb <= "0001001110001000"; --5000
        duty_tb <= "0000011111010000";  -- 2000
        wait for 30 ms;

        wait;
    end process;

end architecture;
