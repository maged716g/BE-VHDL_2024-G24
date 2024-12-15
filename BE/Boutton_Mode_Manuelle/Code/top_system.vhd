-- **********************************************************
--                      LIBRARIES
-- **********************************************************
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- **********************************************************
--                       ENTITY
-- **********************************************************
entity top_system is
    port (
        clk           : in  std_logic;  
        reset_n        : in  std_logic;                                                          
        Data_in_adc   : in  std_logic;                    
        chipselect    : in  std_logic;                    
        write_n       : in  std_logic;                    
        address       : in  std_logic_vector(2 downto 0); 
        writedata     : in  std_logic_vector(31 downto 0);
		  
        readdata      : out std_logic_vector(31 downto 0);
        pwm_out       : out std_logic;                    
        sens_out      : out std_logic;   
		  Clk_adc       : out std_logic;
		  Cs_n          : out std_logic
    );
end entity;

-- **********************************************************
--                   ARCHITECTURE
-- **********************************************************
architecture arch_top of top_system is
    
    signal pwm_internal      : std_logic;
    signal angle_barre       : std_logic_vector(11 downto 0); 
    signal out_pwm_interne   : std_logic;
    signal out_sens_interne  : std_logic;
    signal cs_n_adc          : std_logic;
    signal clk_adc_out       : std_logic;
    signal freq_avalon       : std_logic_vector(15 downto 0);
    signal duty_avalon       : std_logic_vector(15 downto 0);
    signal butee_d_avalon    : std_logic_vector(15 downto 0);
    signal butee_g_avalon    : std_logic_vector(15 downto 0);
    signal raz_n_avalon      : std_logic;
    signal enable_pwm_avalon : std_logic;
    signal sens_avalon       : std_logic;

begin

    -- **********************************************************
    --                     PWM
    -- **********************************************************
    PW : entity work.PWM
        port map (
            clk       => clk,              
            Raz_n     => raz_n_avalon,      
            Enable_pw => enable_pwm_avalon, 
            freq      => freq_avalon,       
            duty      => duty_avalon,      
            pwm       => pwm_internal       
        );

    -- **********************************************************
    --                 controle_butees
    -- **********************************************************
    controle_butees : entity work.controle_butees
        port map (
            pwm         => pwm_internal,        
            butee_d     => butee_d_avalon(11 downto 0), 
            butee_g     => butee_g_avalon(11 downto 0), 
            angle_barre => angle_barre,         
            sens        => sens_avalon,          
            out_pwm     => out_pwm_interne,    
            out_sens    => out_sens_interne    
        );

    -- **********************************************************
    --                 Gestion_ADC
    -- **********************************************************
    Gestion_ADC : entity work.Gestion_ADC
        port map (
            clk         => clk,                
            Raz_n       => raz_n_avalon,               
            Data_in     => Data_in_adc,         
            Cs_n        => cs_n_adc,            
            Clk_adc     => clk_adc_out,          
            Angle_barre => angle_barre          
        );

    -- **********************************************************
    --                 Gestion_Avalon
    -- **********************************************************
    Gestion_Avalon : entity work.Gestion_Avalon
        port map (
            clk           => clk,                
            chipselect    => chipselect,          
            write_n       => write_n,            
            reset_n       => reset_n,               
            writedata     => writedata,           
            address       => address,            
            readdata      => readdata,            
            butee_d       => butee_d_avalon,      
            butee_g       => butee_g_avalon,     
            freq          => freq_avalon,        
            duty          => duty_avalon,        
            angle_barre   => angle_barre,         
            raz_n         => raz_n_avalon,        
            enable_pwm    => enable_pwm_avalon,   
            sens          => sens_avalon          
        );

   
    pwm_out <= out_pwm_interne;  
    sens_out <= out_sens_interne; 
	 Cs_n     <= cs_n_adc; 
	 Clk_adc  <= clk_adc_out;

end architecture;
