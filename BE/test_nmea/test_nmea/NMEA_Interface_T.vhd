 library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NMEA_Interface_T is
    Port (
        clk : in STD_LOGIC;                  -- Horloge principale
        reset_n : in STD_LOGIC;              -- Réinitialisation active bas
        start_stop : in STD_LOGIC;          -- Démarre/arrête la transmission
         
        tx : out STD_LOGIC;                 -- Sortie de transmission (RS232)
        fin_transmit : out STD_LOGIC        -- Indique que la transmission est terminée
    );
end NMEA_Interface_T;

architecture Behavioral of NMEA_Interface_T is

    -- Constantes pour la configuration du protocole
    constant BAUD_RATE : integer := 4800;
    constant CLK_FREQ : integer := 50_000_000; -- Fréquence horloge (50 MHz)
    constant BAUD_TICKS : integer := CLK_FREQ / BAUD_RATE;
	 
    -- Etats pour la machine d'états
    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT, NEXT_BYTE, COMPLETE);
    signal state : state_type := IDLE;

    -- Signaux internes
	 signal angle :  STD_LOGIC_VECTOR(7 downto 0) := "11010111";-- Angle en degrés (centaines, dizaines, unités)
    signal baud_counter : integer range 0 to BAUD_TICKS := 0;
    signal bit_counter : integer range 0 to 7 := 0; -- 8 data bits
    signal tx_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal tx_reg : STD_LOGIC := '1';
    signal msg : STD_LOGIC_VECTOR(31 downto 0); -- Message à transmettre "SXXX"
    signal msg_index : integer range 0 to 3 := 0; -- Index du caractère dans le message

    -- Fonction pour convertir un nombre en ASCII
    function to_ascii(value : integer) return STD_LOGIC_VECTOR is
        variable result : STD_LOGIC_VECTOR(7 downto 0);
    begin
        result := std_logic_vector(to_unsigned(value, 8)) + X"30";
        return result;
    end function;

begin

    -- Assignation de la sortie de transmission
    tx <= tx_reg;
    fin_transmit <= '1' when state = COMPLETE else '0';

    -- Processus principal : Machine d'états pour la transmission
process (clk, reset_n)
    variable hundreds, tens, unit_val : integer;
begin
    if reset_n = '0' then
        state <= IDLE;
        tx_reg <= '1';
        baud_counter <= 0;
        bit_counter <= 0;
        msg_index <= 0;
        msg <= (others => '0');
    elsif rising_edge(clk) then
        -- Vérification de l'arrêt dans chaque état
        if start_stop = '1' then
            state <= IDLE;
            tx_reg <= '1';
            baud_counter <= 0;
            bit_counter <= 0;
            msg_index <= 0;
            msg <= (others => '0');
        else
            case state is
                when IDLE =>
                    if start_stop = '0' then
                        -- Conversion de l'angle et construction du message "SXXX"
                        hundreds := to_integer(unsigned(angle)) / 100;
                        tens := (to_integer(unsigned(angle)) / 10) rem 10;
                        unit_val := to_integer(unsigned(angle)) rem 10;

                        msg(31 downto 24) <= "01010011"; -- 'S'
                        msg(23 downto 16) <= to_ascii(hundreds); -- Centaines
                        msg(15 downto 8) <= to_ascii(tens); -- Dizaines
                        msg(7 downto 0) <= to_ascii(unit_val); -- Unités

                        state <= START_BIT;
                        tx_data <= msg(31 downto 24); -- Premier octet "S"
                        msg_index <= 1;
                        bit_counter <= 0;
                        baud_counter <= 0;
                    end if;

                when START_BIT =>
                    if baud_counter = BAUD_TICKS then
                        baud_counter <= 0;
                        tx_reg <= '0'; -- Start bit
                        state <= DATA_BITS;
                    else
                        baud_counter <= baud_counter + 1;
                    end if;

                when DATA_BITS =>
                    if baud_counter = BAUD_TICKS then
                        baud_counter <= 0;
                        tx_reg <= tx_data(bit_counter);
                        if bit_counter = 7 then
                            bit_counter <= 0;
                            state <= STOP_BIT;
                        else
                            bit_counter <= bit_counter + 1;
                        end if;
                    else
                        baud_counter <= baud_counter + 1;
                    end if;

                when STOP_BIT =>
                    if baud_counter = BAUD_TICKS then
                        baud_counter <= 0;
                        tx_reg <= '1'; -- Stop bit
                        state <= NEXT_BYTE;
                    else
                        baud_counter <= baud_counter + 1;
                    end if;

                when NEXT_BYTE =>
                    if msg_index = 4 then -- Tous les octets transmis
                        state <= COMPLETE;
                    else
                        tx_data <= msg((4 - msg_index) * 8 - 1 downto (4 - msg_index - 1) * 8);
                        msg_index <= msg_index + 1;
                        state <= START_BIT;
                    end if;

                when COMPLETE =>
                    if start_stop = '1' then
                        state <= IDLE;
                    end if;

                when others =>
                    state <= IDLE;

            end case;
        end if;
		 end if;
    end process;


end Behavioral;