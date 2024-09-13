library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity toplevel is
port(clk_50Mhz : in std_logic ;
	rst_50Mhz : in std_logic;
	seg_out_TOP : out std_logic_vector(6 downto 0));
end entity;

architecture maping of toplevel is 
	
	signal clk_int : std_logic;
	signal segout_int : std_logic_vector(6 downto 0);
	signal dout4bit : std_logic_vector(3 downto 0);
	
	-- Module diviseur 
	component diviseur
		port(clk : in std_logic;
			rst : in std_logic;
			dout  : out std_logic
		);
	end component;
	
	-- Module Compteur 
	component compteur
		port (clk_1hz : in std_logic;
			rst_compteur : in std_logic;
			dout_compteur  : out std_logic_vector(3 downto 0)
		);
	end component;
	
	-- Module Decoudeur 
	component decodeur
		port (
			  entree : in std_logic_vector (3 downto 0);
			  seg_out  : out std_logic_vector(6 downto 0)
			  );
	end component;
begin 

	inst1 : diviseur port map (
		clk =>  clk_50Mhz ,
		rst =>  rst_50Mhz , 
		dout => clk_int 
	); 	
	
	inst2 : compteur port map (
		clk_1hz => clk_int ,
		rst_compteur  => rst_50Mhz,
		dout_compteur => dout4bit
	); 	
	
	inst3 : decodeur port map (
		entree => dout4bit,  
		seg_out => seg_out_TOP
	); 	
	
end maping;
	