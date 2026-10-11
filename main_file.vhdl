library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity counter is
    Port ( clk      : in  STD_LOGIC;
           reset    : in  STD_LOGIC;
           btnc     : in  STD_LOGIC;
           btnl     : in  STD_LOGIC;
           btnr     : in  STD_LOGIC;
           btnu     : in  STD_LOGIC;
           btnd     : in  STD_LOGIC;
           anode    : out std_logic_vector(7 downto 0);
           segments : out std_logic_vector (7 downto 0)
           );
end counter;

architecture Behavioral of counter is

component clk_1hz 
    Generic ( COUNT_LIMIT : INTEGER := 99999999);
    Port ( clk : in std_logic ; clk1 : out std_logic );
end component;

component clk_1khz
    port (clk: in std_logic ; CE2: out std_logic);
end component;

component clk_5hz
    port (clk: in std_logic; reset: in std_logic; clk_5hz_out: out std_logic);
end component;

component mod6counter
    port (clk2: in std_logic; WhichDisplay: out std_logic_vector (2 downto 0));
end component;

component clock_counter
    port( clk, clk1, reset                         : in std_logic; 
          btnc, btnl, btnr, btnu, btnd             : in std_logic;
          blink_hours, blink_mins, blink_seconds   : out std_logic;
          digit1,digit2,digit3,digit4,digit5,digit6: out std_logic_vector(3 downto 0));
end component;

component anode_picker
    port (WhichDisplay: in std_logic_vector (2 downto 0);
          anode: out std_logic_vector (7 downto 0));
end component;

component decoder
    port (clk, CE2, reset                                          : in std_logic;
          digit1,digit2,digit3,digit4,digit5,digit6, digit7, digit8: in std_logic_vector (3 downto 0);
          blink_5hz, blink_hours, blink_mins, blink_seconds        : in std_logic;
          segments                                                 : out std_logic_vector (7 downto 0);
          anode                                                    : out std_logic_vector (7 downto 0));
end component;

component ClockButton
    Port ( clk, btn : in STD_LOGIC; pulse : out STD_LOGIC);
end component;

signal clk_1hz_int, CE_1khz_int, clk_5hz_int : std_logic;
signal digit1_s,digit2_s,digit3_s,digit4_s,digit5_s,digit6_s: std_logic_vector (3 downto 0);
signal p_btnc, p_btnl, p_btnr, p_btnu, p_btnd : std_logic;
signal blink_h_sig, blink_m_sig, blink_s_sig : std_logic;
signal RESETn: std_logic;

begin

RESETn <= not reset;

deb_c: ClockButton port map(clk => clk, btn => btnc, pulse => p_btnc);
deb_l: ClockButton port map(clk => clk, btn => btnl, pulse => p_btnl);
deb_r: ClockButton port map(clk => clk, btn => btnr, pulse => p_btnr);
deb_u: ClockButton port map(clk => clk, btn => btnu, pulse => p_btnu);
deb_d: ClockButton port map(clk => clk, btn => btnd, pulse => p_btnd);

comp1: clk_1hz GENERIC MAP (COUNT_LIMIT => 99999999) PORT MAP(clk => clk, clk1 => clk_1hz_int);
comp2: clk_1khz PORT MAP(clk => clk, CE2 => CE_1khz_int);
comp3: clk_5hz PORT MAP(clk => clk, reset => RESETn, clk_5hz_out => clk_5hz_int);


comp4: clock_counter PORT MAP(
    clk => clk, clk1 => clk_1hz_int, reset => RESETn, 
    btnc => p_btnc, btnl => p_btnl, btnr => p_btnr, btnu => p_btnu, btnd => p_btnd,
    blink_hours => blink_h_sig, blink_mins => blink_m_sig, blink_seconds=> blink_s_sig,
    digit1 => digit1_s, digit2 => digit2_s, digit3 => digit3_s,
    digit4 => digit4_s, digit5 => digit5_s, digit6 => digit6_s
);

comp6: decoder PORT MAP(
    clk => clk, CE2 => CE_1khz_int, reset => RESETn, 
    digit1 => digit1_s, digit2 => digit2_s, digit3 => digit3_s,
    digit4 => digit4_s, digit5 => digit5_s, digit6 => digit6_s,
    digit7 => X"0", digit8 => X"0",
    blink_5hz => clk_5hz_int, blink_hours => blink_h_sig, blink_mins => blink_m_sig, blink_seconds => blink_s_sig,
    segments => segments, anode => anode
);

end Behavioral;