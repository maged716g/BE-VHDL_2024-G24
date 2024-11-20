library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity compteur_horaire is
    Port (
        clk      : in  std_logic;      
        reset    : in  std_logic;      
        enable   : in  std_logic;      
        init12   : in  std_logic;      
        opt24    : in  std_logic;      
        digit1   : out std_logic_vector(6 downto 0);
        digit0   : out std_logic_vector(6 downto 0)  
    );
end compteur_horaire;

architecture Behavioral of compteur_horaire is
    signal count : std_logic_vector(5 downto 0) := "000000";
    signal max_count : std_logic_vector(5 downto 0);
    signal display_count : std_logic_vector(5 downto 0);
    signal digit_tens : std_logic_vector(3 downto 0);
    signal digit_units : std_logic_vector(3 downto 0);

    -- Fonction decode_7seg : 4 bits vers 7 segments
    function decode_7seg(input : std_logic_vector(3 downto 0)) return std_logic_vector is
    begin
        case input is
            when "0000" => return "0111111"; -- 0
            when "0001" => return "0000110"; -- 1
            when "0010" => return "1011011"; -- 2
            when "0011" => return "1001111"; -- 3
            when "0100" => return "1100110"; -- 4
            when "0101" => return "1101101"; -- 5
            when "0110" => return "1111101"; -- 6
            when "0111" => return "0000111"; -- 7
            when "1000" => return "1111111"; -- 8
            when "1001" => return "1101111"; -- 9
            when others => return "0000000"; -- Off
        end case;
    end decode_7seg;

begin
    -- Processus pour la gestion de l'horloge et du reset
    process (clk, reset)
    begin
        if reset = '0' then
            count <= (others => '0');
        elsif rising_edge(clk) then
            if init12 = '1' then
                count <= "001100"; -- 12
            elsif enable = '1' then
                if count = max_count then
                    count <= (others => '0');
                else
                    count <= count + 1;
                end if;
            end if;
        end if;
    end process;

    -- Définition de max_count
    process (opt24)
    begin
        if opt24 = '1' then
            max_count <= "101111"; -- 23
        else
            max_count <= "011011"; -- 12
        end if;
    end process;

    -- Conversion de 0-11 à 1-12 en mode 12h
    process (count, opt24)
    begin
        if opt24 = '0' then
            if count = "000000" then
                display_count <= "001100"; -- 12
            else
                display_count <= count;
            end if;
        else
            display_count <= count; -- Mode 24h
        end if;
    end process;

    -- Décodage en chiffres pour les affichages
process (display_count)
begin
    if display_count >= "010100" then -- 20-23
        digit_tens <= "0010"; -- 2
        digit_units <= std_logic_vector(display_count - "010100")(3 downto 0); -- Réduction à 4 bits
    elsif display_count >= "001100" then -- 10-19
        digit_tens <= "0001"; -- 1
        digit_units <= std_logic_vector(display_count - "001100")(3 downto 0); -- Réduction à 4 bits
    else
        digit_tens <= "0000"; -- 0
        digit_units <= std_logic_vector(display_count)(3 downto 0); -- Réduction à 4 bits
    end if;

    digit1 <= decode_7seg(digit_tens);
    digit0 <= decode_7seg(digit_units);
end process;

end Behavioral;

