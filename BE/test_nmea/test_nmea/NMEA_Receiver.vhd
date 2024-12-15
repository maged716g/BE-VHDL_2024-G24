library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity NMEA_Receiver is
    Port (
        clk : in STD_LOGIC;                   -- Horloge principale
        reset_n : in STD_LOGIC;               -- Réinitialisation active bas
        mode : in STD_LOGIC;                  -- Mode fonctionnement (continu ou start/stop)
        start_stop : in STD_LOGIC;            -- Démarre/arrête la réception
        rx : in STD_LOGIC;                    -- Entrée de réception (RS232)
        data_valid : out STD_LOGIC;           -- Indique que la réception est terminée
        received_data : out STD_LOGIC_VECTOR(31 downto 0) -- Trame reçue "SCDU"
    );
end NMEA_Receiver;

architecture Behavioral of NMEA_Receiver is

    -- Constantes pour la configuration du protocole
    constant BAUD_RATE : integer := 4800;
    constant CLK_FREQ : integer := 50_000_000; -- Fréquence horloge (50 MHz)
    constant BAUD_TICKS : integer := CLK_FREQ / BAUD_RATE;

    -- Etats pour la machine d'états
    type state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT, COMPLETE);
    signal state : state_type := IDLE;

    -- Signaux internes
    signal baud_counter : integer range 0 to BAUD_TICKS := 0;
    signal bit_counter : integer range 0 to 7 := 0;
    signal rx_data : STD_LOGIC_VECTOR(7 downto 0) := (others => '0');
    signal rx_buffer : STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
    signal byte_index : integer range 0 to 3 := 0; -- Index du caractère dans la trame
    signal sampling : integer range 0 to 15 := 0;  -- Pour l'échantillonnage
    signal start_detected : STD_LOGIC := '0';

begin

    -- Assignation des sorties
    data_valid <= '1' when state = COMPLETE else '0';
    received_data <= rx_buffer;

    -- Processus principal : Machine d'états pour la réception
    process (clk, reset_n)
    begin
        if reset_n = '0' then
            state <= IDLE;
            baud_counter <= 0;
            bit_counter <= 0;
            rx_buffer <= (others => '0');
            byte_index <= 0;
            start_detected <= '0';
        elsif rising_edge(clk) then
            case state is

                when IDLE =>
                    if (mode = '1' or start_stop = '1') and rx = '0' then
                        -- Détection du bit de start
                        state <= START_BIT;
                        baud_counter <= 0;
                        sampling <= 0;
                    end if;

                when START_BIT =>
                    if baud_counter = BAUD_TICKS / 2 then
                        if rx = '0' then
                            -- Confirmation du bit de start
                            state <= DATA_BITS;
                            baud_counter <= 0;
                            bit_counter <= 0;
                            rx_data <= (others => '0');
                        else
                            state <= IDLE; -- Bit de start non valide
                        end if;
                    else
                        baud_counter <= baud_counter + 1;
                    end if;

                when DATA_BITS =>
                    if baud_counter = BAUD_TICKS then
                        baud_counter <= 0;
                        rx_data(bit_counter) <= rx;
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
                        if rx = '1' then
                            -- Bit de stop valide, stocker le byte reçu
                            rx_buffer((3 - byte_index) * 8 + 7 downto (3 - byte_index) * 8) <= rx_data;
                            if byte_index = 3 then
                                state <= COMPLETE; -- Trame complète
                            else
                                byte_index <= byte_index + 1;
                                state <= START_BIT; -- Prochain byte
                            end if;
                        else
                            state <= IDLE; -- Bit de stop non valide
                        end if;
                    else
                        baud_counter <= baud_counter + 1;
                    end if;

                when COMPLETE =>
                    if mode = '0' and start_stop = '0' then
                        state <= IDLE;
                        byte_index <= 0;
                    end if;

                when others =>
                    state <= IDLE;

            end case;
        end if;
    end process;

end Behavioral;
