library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ClockButton is
    Port ( clk   : in  STD_LOGIC;
           btn   : in  STD_LOGIC;
           pulse : out STD_LOGIC);
end ClockButton;

architecture Behavioral of ClockButton is
    signal count : integer range 0 to 25000000 := 0;
    signal state : std_logic := '0';
begin
    process(clk)
    begin
        if rising_edge(clk) then
            pulse <= '0'; 
            
            if state = '0' then
                if btn = '1' then
                    state <= '1';
                    pulse <= '1';       
                    count <= 25000000;  
                end if;
            else
                if count > 0 then
                    count <= count - 1;  
                else
                    if btn = '1' then
                        pulse <= '1';       
                        count <= 25000000;  
                    else
                        state <= '0';       
                    end if;
                end if;
            end if;
        end if;
    end process;
end Behavioral;