library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_5hz is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        ce    : out STD_LOGIC
    );
end clk_5hz;

architecture Behavioral of clk_5hz is
    constant COUNT_LIMIT : integer := 9999999; 
    signal counter : integer range 0 to COUNT_LIMIT := 0;
    signal blink_state : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter <= 0;
                blink_state <= '0';
            elsif counter = COUNT_LIMIT then
                counter <= 0;
                blink_state <= not blink_state;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    ce <= blink_state;
end Behavioral;
