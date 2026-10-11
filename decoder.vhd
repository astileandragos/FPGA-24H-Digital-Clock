library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity decoder is
  Port (  
        clk: in std_logic;
        CE2: in std_logic;
        reset: in std_logic;
        digit1,digit2,digit3,digit4,digit5,digit6, digit7, digit8: in std_logic_vector (3 downto 0);
        blink_5hz    : in std_logic;
        blink_hours  : in std_logic;
        blink_mins   : in std_logic; 
        blink_seconds: in std_logic; 
        segments: out std_logic_vector (7 downto 0);
        anode: out std_logic_vector (7 downto 0)
 );
end decoder;

architecture Behavioral of decoder is

type display is array (0 to 9) of std_logic_vector (7 downto 0);
constant CONVERTER : display :=
    (   "11000000", "11111001", "10100100", "10110000", "10011001", 
        "10010010", "10000010", "11111000", "10000000", "10010000"  
    );
 
 signal anode_reg, anode_comb: std_logic_vector (7 downto 0):=X"FF";
 signal autoblank: std_logic;
 signal blink_mask: std_logic_vector(7 downto 0);
    
begin

anode <= anode_comb;

autoblank <= '1' when digit6 = X"0" else '0';

blink_mask <= "00110000" when (blink_hours = '1' and blink_5hz = '1') else
              "00001100" when (blink_mins  = '1' and blink_5hz = '1') else
              "00000011" when (blink_seconds  = '1' and blink_5hz = '1') else
              "00000000";

anode_comb <= anode_reg OR blink_mask OR ("00" & autoblank & "00000");

walk0: process(clk, reset)
begin
    if rising_edge(clk) then
        if reset='1' then
            anode_reg <= X"FF";
        elsif CE2 = '1' then 
            if anode_reg = X"7F" OR anode_reg = X"FF" then 
                anode_reg <= anode_reg(6 downto 0) & '0';
            else 
                anode_reg(7 downto 0) <= anode_reg(6 downto 0) & '1';
            end if;
        end if;
     end if; 
end process walk0;

process(anode_reg, digit1, digit2, digit3, digit4, digit5, digit6, digit7, digit8)
begin
    CASE anode_reg is
        WHEN "11111110" => 
            segments <= CONVERTER(to_integer(unsigned(digit1)));
        WHEN "11111101" => 
            segments <= CONVERTER(to_integer(unsigned(digit2)));
        WHEN "11111011" => 
            segments <= CONVERTER(to_integer(unsigned(digit3)));
        WHEN "11110111" => 
            segments <= CONVERTER(to_integer(unsigned(digit4)));
        WHEN "11101111" => 
            segments <= CONVERTER(to_integer(unsigned(digit5)));
        WHEN "11011111" => 
            segments <= CONVERTER(to_integer(unsigned(digit6)));
        WHEN "10111111" => 
            segments <= CONVERTER(to_integer(unsigned(digit7)));
        WHEN "01111111" => 
            segments <= CONVERTER(to_integer(unsigned(digit8)));
        WHEN others => 
            segments <= (others => '1'); 
    END CASE;

end process;

end Behavioral;