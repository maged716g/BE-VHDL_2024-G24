--Codé par : BENSUMAIDEA Maged et TIABI Reda


--gestion data
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;


entity gestion_data_anem is
 
 port(
    clk_50M            : in std_logic;
    continu            : in std_logic;
    raz_n            : in std_logic;
    start_stop        : in std_logic;
    out_freq_calcule    : in std_logic_vector(7 downto 0);
    data_valid         : out std_logic;
    data_anemometre     : out std_logic_vector(7 downto 0)
    );

end gestion_data_anem;

architecture arch of gestion_data_anem is
signal signal_valid: std_logic;
signal signal_out : std_logic_vector(7 downto 0);   
    begin
    process(clk_50M, raz_n, continu, start_stop)
    begin
    if rising_edge(clk_50M) then     
        if (raz_n='0') then
            signal_valid <='0';
            signal_out <=(others=> '0');
        elsif (continu='1') then
            signal_valid <= '1';
            signal_out <= out_freq_calcule;               
        elsif (continu='0') then
            if (start_stop= '0') then    
                signal_valid <= '0';
                signal_out <=(others=> '0');   
            elsif (start_stop= '1') then 
                 signal_out <= out_freq_calcule;
                 signal_valid <= '1';     
            end if;
        end if;
    end if;
    end process;
    data_anemometre <= signal_out;
    data_valid <= signal_valid;
end architecture arch;