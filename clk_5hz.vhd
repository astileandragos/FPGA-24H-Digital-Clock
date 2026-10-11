library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_5hz is
    Port ( clk         : in  STD_LOGIC;
           reset       : in  STD_LOGIC;
           clk_5hz_out : out STD_LOGIC);
end clk_5hz;

architecture Behavioral of clk_5hz is
    constant COUNT_LIMIT : integer := 9999999; 
    signal counter : integer range 0 to COUNT_LIMIT := 0;
    signal temp    : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter <= 0;
                temp <= '0';
            elsif counter = COUNT_LIMIT then
                counter <= 0;
                temp <= not temp;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

    clk_5hz_out <= temp;
end Behavioral;