library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_1khz is
    Port (
        clk   : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        ce    : out STD_LOGIC
    );
end clk_1khz;

architecture Behavioral of clk_1khz is
    constant COUNT_LIMIT : integer := 99999; 
    signal counter : integer range 0 to COUNT_LIMIT := 0;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                counter <= 0;
                ce <= '0';
            elsif counter = COUNT_LIMIT then
                counter <= 0;
                ce <= '1';
            else
                counter <= counter + 1;
                ce <= '0';
            end if;
        end if;
    end process;
end Behavioral;
