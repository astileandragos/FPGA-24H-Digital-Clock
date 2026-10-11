library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity clock_counter is
  Port (
        clk, clk1, reset : in std_logic;
        btnc, btnl, btnr, btnu, btnd : in std_logic;
        blink_hours, blink_mins, blink_seconds : out std_logic;
        digit1,digit2,digit3,digit4,digit5,digit6: out std_logic_vector (3 downto 0)
  );
end clock_counter;

architecture Behavioral of clock_counter is

    type states is (NORMAL, SET_SECONDS, SET_HOURS, SET_MINUTES);
    signal current_state : states := NORMAL;

    signal sec_u : integer range 0 to 9 := 0;
    signal sec_z : integer range 0 to 5 := 0;
    signal min_u : integer range 0 to 9 := 0;
    signal min_z : integer range 0 to 5 := 0;
    signal hr_u  : integer range 0 to 9 := 0;
    signal hr_z  : integer range 0 to 2 := 0;

begin

process(clk)
begin
    if rising_edge(clk) then
        if reset = '1' then
            current_state <= NORMAL;
            sec_u <= 0; sec_z <= 0;
            min_u <= 0; min_z <= 0;
            hr_u <= 0;  hr_z <= 0;
        else
            case current_state is
                when NORMAL =>
                    if btnc = '1' then current_state <= SET_HOURS; end if;
                when SET_HOURS =>
                    if btnc = '1' then current_state <= NORMAL;
                    elsif btnr = '1' then current_state <= SET_MINUTES; end if;
                when SET_MINUTES =>
                    if btnc = '1' then current_state <= NORMAL;
                    elsif btnr = '1' then current_state <= SET_SECONDS;
                    elsif btnl = '1' then current_state <= SET_HOURS; end if;
                when SET_SECONDS =>
                    if btnc = '1' then current_state <= NORMAL;
                    elsif btnl = '1' then current_state <= SET_MINUTES; end if;
            end case;

            if current_state = NORMAL then
                if clk1 = '1' then
                    if sec_u = 9 then
                        sec_u <= 0;
                        if sec_z = 5 then
                            sec_z <= 0;
                            if min_u = 9 then
                                min_u <= 0;
                                if min_z = 5 then
                                    min_z <= 0;
                                    if hr_z = 2 and hr_u = 3 then
                                        hr_z <= 0; hr_u <= 0;
                                    elsif hr_u = 9 then
                                        hr_u <= 0; hr_z <= hr_z + 1;
                                    else hr_u <= hr_u + 1; end if;
                                else min_z <= min_z + 1; end if;
                            else min_u <= min_u + 1; end if;
                        else sec_z <= sec_z + 1; end if;
                    else sec_u <= sec_u + 1; end if;
                end if;
            
            elsif current_state = SET_HOURS then
                if btnu = '1' then
                    if hr_z = 2 and hr_u = 3 then hr_z <= 0; hr_u <= 0;
                    elsif hr_u = 9 then hr_u <= 0; hr_z <= hr_z + 1;
                    else hr_u <= hr_u + 1; end if;
                elsif btnd = '1' then
                    if hr_z = 0 and hr_u = 0 then hr_z <= 2; hr_u <= 3;
                    elsif hr_u = 0 then hr_u <= 9; hr_z <= hr_z - 1;
                    else hr_u <= hr_u - 1; end if;
                end if;

            elsif current_state = SET_MINUTES then
                if btnu = '1' then
                    if min_u = 9 then
                        min_u <= 0;
                        if min_z = 5 then min_z <= 0; else min_z <= min_z + 1; end if;
                    else min_u <= min_u + 1; end if;
                elsif btnd = '1' then
                    if min_u = 0 then
                        min_u <= 9;
                        if min_z = 0 then min_z <= 5; else min_z <= min_z - 1; end if;
                    else min_u <= min_u - 1; end if;
                end if;

            elsif current_state = SET_SECONDS then
                if btnu = '1' or btnd = '1' then
                    if sec_z >= 3 then
                        if min_u = 9 then
                            min_u <= 0;
                            if min_z = 5 then min_z <= 0; 
                            else min_z <= min_z + 1; end if;
                        else min_u <= min_u + 1; end if;
                    end if;
                    sec_z <= 0;
                    sec_u <= 0;
                end if;
            end if;
        end if;
    end if;
end process;

blink_hours   <= '1' when current_state = SET_HOURS else '0';
blink_mins    <= '1' when current_state = SET_MINUTES else '0';
blink_seconds <= '1' when current_state = SET_SECONDS else '0';

digit1 <= std_logic_vector(to_unsigned(sec_u, 4));
digit2 <= std_logic_vector(to_unsigned(sec_z, 4));
digit3 <= std_logic_vector(to_unsigned(min_u, 4));
digit4 <= std_logic_vector(to_unsigned(min_z, 4));
digit5 <= std_logic_vector(to_unsigned(hr_u, 4));
digit6 <= std_logic_vector(to_unsigned(hr_z, 4));

end Behavioral;