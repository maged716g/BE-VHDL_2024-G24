library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity avalon_cap is
    port(
        clk_50M               : in std_logic;
        reset_n               : in std_logic;
        in_pwm_compas         : in std_logic;
        chipselect, write_n   : in std_logic;
        writedata             : in std_logic_vector(31 downto 0);
        readdata              : out std_logic_vector(31 downto 0);
        address               : in std_logic_vector(1 downto 0)
    );
end avalon_cap;

architecture arch of avalon_cap is
    -- Signaux interne
    
    signal config  : std_logic_vector(2 downto 0);    -- b2=Start/Stop, b1=continu, b0=raz_n
    signal code    : std_logic_vector(9 downto 0);    -- b9=valid, b8..b0=data_compas
	 
	 component gestion_cap
        port(
            clk_50M           : in std_logic;
            continu           : in std_logic;
            raz_n             : in std_logic;
            start_stop        : in std_logic;
            data_valid        : out std_logic;
            data_compas       : out std_logic_vector(8 downto 0);
            in_pwm_compas     : in std_logic
        );
    end component;


begin
 

    -- Instance de gestion_data_cap pour gérer le mode continu et manuel
    U3: gestion_cap
        port map(
            clk_50M           => clk_50M,
            continu           => config(1) ,
            raz_n             => config(0) ,
            start_stop        => config(2) ,
            data_valid        => code(9),
            data_compas       => code(8 downto 0),
				in_pwm_compas     => in_pwm_compas
        );


    -- Processus d'écriture dans les registres
    process_write: process (clk_50M, reset_n)
    begin
        if reset_n = '0' then
            -- Réinitialisation des registres
            config <= (others => '0');
            --code <= (others => '0');
        elsif rising_edge(clk_50M) then
            if chipselect = '1' and write_n = '0' then
                if address = "00" then 
                        config <= writedata(2 downto 0);  -- Configuration (Start/Stop, Continu, Raz_n)
					  end if;
				end if;	 
            
        end if;
    end process process_write;

    -- Processus de lecture des registres
    process_read: process (address, config, code)
    begin
       if address = "00" then
            -- Lecture de la configuration, étendue sur 32 bits
            readdata <= X"0000000"&"0"&config;  -- config est sur 3 bits, on ajoute 29 zéros
		 end if;
        if address = "01" then
            -- Lecture du code, étendue sur 32 bits
            readdata <= X"00000"&"00"&code;   -- code est sur 10 bits, on ajoute 23 zéros
	 end if;
    end process process_read;

end architecture arch;
