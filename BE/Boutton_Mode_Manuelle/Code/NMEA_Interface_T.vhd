library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity NMEA_Interface_T is
    Port (
        clk         : in  STD_LOGIC;            -- Horloge principale
        raz_n       : in  STD_LOGIC;            -- Signal de remise à zéro (actif bas)
        start_stop  : in  STD_LOGIC;            -- Démarre/arrête la transmission
        --angle       : in  STD_LOGIC_VECTOR(8 downto 0); -- Valeur de l'angle (0-511)
        tx_serial   : out STD_LOGIC;            -- Sortie série de la trame
        fin_transmit: out STD_LOGIC             -- Signal indiquant la fin de la transmission
    );
end NMEA_Interface_T;

architecture Behavioral of NMEA_Interface_T is
    constant BAUD_RATE      : integer := 4800;
    constant CLOCK_FREQ     : integer := 50000000; -- 50 MHz horloge principale
    constant BIT_PERIOD     : integer := CLOCK_FREQ / BAUD_RATE;
	 signal angle          : STD_LOGIC_VECTOR(8 downto 0) := "111111111";

    type TX_STATE_TYPE is (IDLE, START_BIT, DATA_BITS, STOP_BIT, PAUSE);
    signal tx_state         : TX_STATE_TYPE := IDLE;
    signal bit_counter      : integer range 0 to 7 := 0;
    signal tx_shift_reg     : STD_LOGIC_VECTOR(7 downto 0);
    signal baud_counter     : integer range 0 to BIT_PERIOD-1 := 0;
    signal byte_index       : integer range 0 to 3 := 0;
	 
    -- Trame NMEA "SCDU" à envoyer en ASCII
    signal message          : STD_LOGIC_VECTOR(31 downto 0);
    signal tx_active        : STD_LOGIC := '0';
    signal transmit_done    : STD_LOGIC := '0';

begin
    -- Conversion de l'angle en caractères ASCII pour SCDU
    process(angle)
        variable angle_int : integer; -- Variable entière pour stocker l'angle
    begin
        -- Conversion de STD_LOGIC_VECTOR vers integer
        angle_int := CONV_INTEGER(angle);

        -- Message formaté "SXXX" où XXX sont les centaines, dizaines, unités de l'angle (de 000 à 511)
        message(31 downto 24) <= x"53"; -- 'S' en ASCII
        message(23 downto 16) <= CONV_STD_LOGIC_VECTOR(48 + (angle_int / 100), 8);         -- Centaines de l'angle
        message(15 downto 8)  <= CONV_STD_LOGIC_VECTOR(48 + ((angle_int / 10) mod 10), 8); -- Dizaines de l'angle
        message(7 downto 0)   <= CONV_STD_LOGIC_VECTOR(48 + (angle_int mod 10), 8);        -- Unités de l'angle
    end process;

    -- FSM pour gérer la transmission série de la trame
    process(clk)
    begin
        if rising_edge(clk) then
            if raz_n = '0' then
                tx_state <= IDLE;
                tx_serial <= '1';
                tx_active <= '0';
                fin_transmit <= '0';
                baud_counter <= 0;
                byte_index <= 0;
            elsif start_stop = '1' then
                case tx_state is
                    when IDLE =>
                        if tx_active = '0' then
                            tx_active <= '1';
                            tx_state <= START_BIT;
                            tx_shift_reg <= message((3-byte_index)*8+7 downto (3-byte_index)*8);
                            tx_serial <= '0'; -- Bit de start
                            baud_counter <= 0;
                            fin_transmit <= '0';
                        end if;

                    when START_BIT =>
                        if baud_counter = BIT_PERIOD - 1 then
                            baud_counter <= 0;
                            tx_state <= DATA_BITS;
                            bit_counter <= 0;
                        else
                            baud_counter <= baud_counter + 1;
                        end if;

                    when DATA_BITS =>
                        if baud_counter = BIT_PERIOD - 1 then
                            baud_counter <= 0;
                            tx_serial <= tx_shift_reg(bit_counter);
                            if bit_counter = 7 then
                                tx_state <= STOP_BIT;
                            else
                                bit_counter <= bit_counter + 1;
                            end if;
                        else
                            baud_counter <= baud_counter + 1;
                        end if;

                    when STOP_BIT =>
                        if baud_counter = BIT_PERIOD - 1 then
                            baud_counter <= 0;
                            tx_serial <= '1'; -- Bit de stop
                            if byte_index = 3 then
                                tx_state <= PAUSE;
                                transmit_done <= '1';
                                byte_index <= 0;
                            else
                                tx_state <= START_BIT;
                                byte_index <= byte_index + 1;
                                tx_shift_reg <= message((3-byte_index)*8+7 downto (3-byte_index)*8);
                            end if;
                        else
                            baud_counter <= baud_counter + 1;
                        end if;

                    when PAUSE =>
                        if baud_counter = CLOCK_FREQ - 1 then -- Pause d'une seconde (à 50 MHz)
                            baud_counter <= 0;
                            tx_state <= IDLE;
                            tx_active <= '0';
                            fin_transmit <= '1';
                        else
                            baud_counter <= baud_counter + 1;
                        end if;
                end case;
            else
                -- Réinitialisation des signaux
                tx_state <= IDLE;
                tx_active <= '0';
                fin_transmit <= '0';
                tx_serial <= '1'; -- ligne au repos
            end if;
        end if;
    end process;
end Behavioral;

