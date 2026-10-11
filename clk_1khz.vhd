library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity clk_1khz is
  Port (clk: in std_logic;
  CE2: out std_logic   );
end clk_1khz;

architecture Behavioral of clk_1khz is

constant COUNT_LIMIT : INTEGER := 49999; 
signal temp2: std_logic :='0';
signal counter2: INTEGER RANGE 0 TO COUNT_LIMIT := 0;

begin

process(clk)
begin
    if rising_edge(clk) then
        counter2 <= counter2 + 1;
        temp2<='0';
        if (counter2 = COUNT_LIMIT) then
            temp2 <= '1';
            counter2 <= 0;
        end if;
    end if;
end process;

CE2 <= temp2;

end Behavioral;