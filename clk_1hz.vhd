library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

entity clk_1hz is
Generic ( COUNT_LIMIT : INTEGER := 99999999);
  Port (
  clk : in std_logic ;
  clk1 : out std_logic 
   );
end clk_1hz;

architecture Behavioral of clk_1hz is

signal temp1: std_logic := '0';
signal counter1: INTEGER RANGE 0 TO COUNT_LIMIT := 0;

begin

process(clk)
begin
    if rising_edge(clk) then
        counter1 <= counter1 + 1;
        temp1 <= '0';
        if (counter1 = COUNT_LIMIT) then
            temp1 <= '1';
            counter1 <= 0;
        end if;
    end if;
end process;




clk1 <= temp1;

end Behavioral;