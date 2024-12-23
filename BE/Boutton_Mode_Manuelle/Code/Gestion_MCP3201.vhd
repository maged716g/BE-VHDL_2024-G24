library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;
--use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_signed.all;


entity Gestion_MCP3201 is
  port (
    clk : in std_logic;
    Raz_n : in std_logic;
    Data_in : in std_logic;
    Angle_barre : out std_logic_vector(11 downto 0);
    Clk_adc : out std_logic;
    Cs_n : out std_logic
  );
end Gestion_MCP3201;
architecture Behavioral of Gestion_MCP3201 is
  signal s_clk_adc : std_logic;
  signal conv_state : std_logic;
  signal start_conv : std_logic;
  signal s_data : std_logic_vector(11 downto 0);
  type State_Type is (Idle, Reading);
  signal State : State_Type;

begin
  -------------------------------------------------------------------------------------
  -- MEF
  pilote_adc : process (clk, Raz_n)
  begin
    if Raz_n = '1' then
      State <= Idle;
    elsif rising_edge(clk) then
      case State is
        when Idle =>
          if start_conv = '1' then
            State <= Reading;
          else
            State <= Idle;
          end if;
        when Reading =>
          if conv_state = '0' then
            State <= Idle;
          else
            State <= Reading;
          end if;

      end case;
    end if;
  end process;
  ----------------------------------------------------------------------------------
  compt_fronts : process (s_clk_adc, Raz_n)
    variable count_fronts : integer range 0 to 14 ;
  begin
    if Raz_n = '1' then
      count_fronts := 0;
    elsif (rising_edge(s_clk_adc)) then
      if (count_fronts = 14) then
        count_fronts := 0;
        conv_state <= '0';
      else
        count_fronts := count_fronts + 1;
        conv_state <= '1';
      end if;
    end if;
  end process;

  ------------------------------------------------------------------------
  rec_dec : process (s_clk_adc, Raz_n)
  begin
    if Raz_n = '1' then
      s_data <= (others => '0');
    elsif (rising_edge(s_clk_adc)) then
      if (conv_state = '1') then
        s_data <= std_logic_vector(shift_left(unsigned(s_data), 1));

        s_data(0) <= Data_in;
      end if;
    end if;
    if (conv_state = '0') then
      Angle_barre <= s_data;
    end if;
    
      end process;
  ------------------------------------------------------------------------
  gene_1M : process (clk, Raz_n)
   variable count : integer range 0 to 24;
  begin
    if Raz_n = '1' then
      count := 0;
      s_clk_adc <= '0';
    elsif rising_edge(clk) then
      if count = 24 then
        count := 0;
        s_clk_adc <= not s_clk_adc;
      else
        count := count + 1;
      end if;
    end if;

  end process;
  -------------------------------------------------------------------------
  gene_start_conv : process (s_clk_adc, Raz_n)
    --generer d'un signal chaque 100ms
    variable count_conv : integer range 0 to 99999;
  begin
    if Raz_n = '1' then
      count_conv := 0;
      start_conv <= '0';
    elsif rising_edge(s_clk_adc) then
      if count_conv = 99999 then
        start_conv <= '1';
        count_conv := 0;
      else
        start_conv <= '0';
        count_conv := count_conv + 1;

      end if;
    end if;

  end process;

end Behavioral;