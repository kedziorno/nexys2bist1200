----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:47:49 08/21/2020 
-- Design Name: 
-- Module Name:    test_oled - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use WORK.p_pkg1.ALL;

entity oled_display is
generic (
g_board_clock : integer;
g_bus_clock : integer
);
port
(
signal i_clk : in std_logic;
signal i_rst : in std_logic;
signal i_refresh : in std_logic;
signal i_row0 : in array1;
signal i_row1 : in array1;
signal i_row2 : in array1;
signal i_row3 : in array1;
signal o_display_ready : out std_logic;
signal o_busy : out std_logic;
signal io_sda,io_scl : inout std_logic
);
end oled_display;

architecture Behavioral of oled_display is

constant GCLK : integer := g_board_clock;
constant BCLK : integer := g_bus_clock;

constant OLED_WIDTH : integer := 128;
constant OLED_HEIGHT : integer := 32;
constant OLED_BLOCKS : integer := (OLED_HEIGHT + 7) / 8;
constant OLED_PAGES_ALL : integer := OLED_WIDTH * OLED_BLOCKS;
constant OLED_DATA : integer := to_integer(unsigned'(x"40"));
constant OLED_COMMAND : integer := to_integer(unsigned'(x"00")); -- 00,80

constant NI_INIT : natural := 26;
type A_INIT is array (0 to NI_INIT-1) of std_logic_vector(7 downto 0);
signal init_display : A_INIT :=
(
 x"AE" -- display off
,x"D5",x"80" -- setdisplayclockdiv
,x"A8",x"1F" -- 00-0f/10-1f - Set Lower Column Start Address for Page Addressing Mode
,x"D3",x"00" -- display offset
,x"40"       -- set start line
,x"8D",x"14" -- chargepump
,x"20",x"00" -- Set Memory Addressing Mode
,x"A1",x"C8" -- A0/A1,C0/C8 - start from specify four display corner - a0|a1 - segremap , c0|c8 - comscandec
,x"DA",x"02" -- setcompins
,x"81",x"8F" -- contrast
,x"D9",x"F1" -- precharge
,x"DB",x"40" -- setvcomdetect
,x"A4"       -- displayon resume
,x"A6"       -- normal display
,x"2E"       -- scroll off
,x"AF" -- display on
);

constant NI_SET_COORDINATION : natural := 6;
type A_SET_COORDINATION is array (0 to NI_SET_COORDINATION-1) of std_logic_vector(7 downto 0);
signal set_coordination : A_SET_COORDINATION := (x"21",x"00",std_logic_vector(to_unsigned(OLED_WIDTH-1,8)),x"22",x"00",std_logic_vector(to_unsigned(OLED_BLOCKS-1,8)));
signal set_coordination_00 : A_SET_COORDINATION := (x"21",x"00",std_logic_vector(to_unsigned(OLED_WIDTH-1,8)),x"22",x"00",x"00");
signal set_coordination_01 : A_SET_COORDINATION := (x"21",x"00",std_logic_vector(to_unsigned(OLED_WIDTH-1,8)),x"22",x"01",x"01");
signal set_coordination_02 : A_SET_COORDINATION := (x"21",x"00",std_logic_vector(to_unsigned(OLED_WIDTH-1,8)),x"22",x"02",x"02");
signal set_coordination_03 : A_SET_COORDINATION := (x"21",x"00",std_logic_vector(to_unsigned(OLED_WIDTH-1,8)),x"22",x"03",x"03");

component glcdfont is
port(
	i_clk : in std_logic;
	i_index : in std_logic_vector(11 downto 0);
	o_character : out std_logic_vector(7 downto 0)
);
end component glcdfont;
for all : glcdfont use entity WORK.glcdfont(behavioral_glcdfont);

COMPONENT i2c IS
GENERIC(
	input_clk : INTEGER := GCLK; --input clock speed from user logic in Hz
	bus_clk   : INTEGER := BCLK  --speed the i2c bus (scl) will run at in Hz
);
PORT(
	clk       : IN     STD_LOGIC;                    --system clock
	reset_n   : IN     STD_LOGIC;                    --active low reset
	ena       : IN     STD_LOGIC;                    --latch in command
	addr      : IN     STD_LOGIC_VECTOR(6 DOWNTO 0); --address of target slave
	rw        : IN     STD_LOGIC;                    --'0' is write, '1' is read
	data_wr   : IN     STD_LOGIC_VECTOR(7 DOWNTO 0); --data to write to slave
	busy      : OUT    STD_LOGIC;                    --indicates transaction in progress
	data_rd   : OUT    STD_LOGIC_VECTOR(7 DOWNTO 0); --data read from slave
	ack_error : BUFFER STD_LOGIC;                    --flag if improper acknowledge from slave
	sda       : INOUT  STD_LOGIC;                    --serial data output of i2c bus
	scl       : INOUT  STD_LOGIC);                   --serial clock output of i2c bus
END component i2c;
for all : i2c use entity WORK.i2c_master(logic);

type state is 
(
	idle,
	initialize,
	clear_display,
	wait0,
	row_0_coordination_00,
	row_0_send_data,
	row_0_clear_rest,
	row_1_coordination_01,
	row_1_send_data,
	row_1_clear_rest,
	row_2_coordination_02,
	row_2_send_data,
	row_2_clear_rest,
	row_3_coordination_03,
	row_3_send_data,
	row_3_clear_rest,
	stop -- when index=counter, i2c disable
);
signal cstate : state;

SIGNAL i2c_enable  : STD_LOGIC;                     --i2c enable signal
SIGNAL i2c_data    : STD_LOGIC_VECTOR(7 DOWNTO 0);  --i2c write data
SIGNAL i2c_busy    : STD_LOGIC;                     --i2c busy signal
SIGNAL i2c_reset   : STD_LOGIC;                     --i2c busy signal
SIGNAL busy_prev   : STD_LOGIC;                     --previous value of i2c busy signal
signal busy_cnt : INTEGER := 0; -- for i2c, count the clk tick when i2c_busy=1
signal t_busy_cnt : std_logic_vector(10 downto 0);
signal index_character : INTEGER := 0;
signal current_character : std_logic_vector(7 downto 0);
signal glcdfont_character : std_logic_vector(7 downto 0) := (others => '0');
signal glcdfont_index : std_logic_vector(11 downto 0) := (others => '0');
signal oled_address : std_logic_vector(6 downto 0) := "0111100"; -- oled address 0x3c
signal oled_rw : std_logic := '0'; -- always write to device

begin

t_busy_cnt <= std_logic_vector(to_unsigned(busy_cnt,11));

c0 : glcdfont
port map
(
	i_clk => i_clk,
	i_index => glcdfont_index,
	o_character => glcdfont_character
);

c1 : i2c
GENERIC MAP
(
	input_clk => GCLK,
	bus_clk => BCLK
)
PORT MAP
(
	clk => i_clk,
	reset_n => i2c_reset,
	ena => i2c_enable,
	addr => oled_address,
	rw => oled_rw,
	data_wr => i2c_data,
	busy => i2c_busy,
	data_rd => open,
	ack_error => open,
	sda => io_sda,
	scl => io_scl
);

p0 : process (i_clk,i_rst) is
begin
	if (i_rst = '1') then -- i_refresh='1'
		cstate <= idle; -- when refresh - set_address_1
		busy_cnt <= 0;
		index_character <= 0;
		o_busy <= '0';
		o_display_ready <= '0';
		i2c_reset <= '1';
	elsif (rising_edge(i_clk)) then
		case cstate is
			when idle =>
				cstate <= initialize;
			when initialize =>
				o_display_ready <= '0';
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_COMMAND,8));
					when 1 to NI_INIT =>
						i2c_data <= init_display(busy_cnt-1);
					when NI_INIT+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							cstate <= clear_display;
						end if;
					when others => null;
				end case;
			when clear_display =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_COMMAND,8));
					when 1 to NI_SET_COORDINATION =>
						i2c_data <= set_coordination(busy_cnt-1);
					when NI_SET_COORDINATION+1 =>
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
					when NI_SET_COORDINATION+2 to OLED_PAGES_ALL+(NI_SET_COORDINATION+2) =>
						i2c_data <= x"00"; -- empty eight bit
					when (OLED_PAGES_ALL+(NI_SET_COORDINATION+2))+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							cstate <= wait0;
						end if;
					when others => null;
				end case;
			when wait0 =>
				cstate <= row_0_coordination_00;
				o_busy <= '1';
				o_display_ready <= '1';
			when row_0_coordination_00 =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_COMMAND,8));
					when 1 to NI_SET_COORDINATION =>
						i2c_data <= set_coordination_00(busy_cnt-1);
					when NI_SET_COORDINATION+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							index_character <= 0;
							cstate <= row_0_send_data;
						end if;
					when others => null;
				end case;
			when row_0_send_data =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
						current_character <= i_row0(index_character);
					when 1 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+0,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 2 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+1,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 3 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+2,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 4 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+3,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 5 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+4,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 6 =>
						i2c_data <= x"00"; -- xxx to space between characters / optional
					when 7 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							if (index_character < i_row0'length-1) then
								cstate <= row_0_send_data;
								index_character <= index_character + 1;
							else
								cstate <= row_0_clear_rest;
							end if;
						end if;
					when others => null;
				end case;
			when row_0_clear_rest =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1'; -- we are busy
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
					when 1 to (OLED_WIDTH-(i_row0'length*6)) =>
						i2c_data <= x"00"; -- rest pixels 0
					when (OLED_WIDTH-(i_row0'length*6))+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							cstate <= row_1_coordination_01;
						end if;
					when others => null;
				end case;
			when row_1_coordination_01 =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_COMMAND,8));
					when 1 to NI_SET_COORDINATION =>
						i2c_data <= set_coordination_01(busy_cnt-1);
					when NI_SET_COORDINATION+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							index_character <= 0;
							cstate <= row_1_send_data;
						end if;
					when others => null;
				end case;
			when row_1_send_data =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
						current_character <= i_row1(index_character);
					when 1 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+0,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 2 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+1,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 3 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+2,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 4 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+3,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 5 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+4,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 6 =>
						i2c_data <= x"00"; -- xxx to space between characters / optional
					when 7 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							if (index_character < i_row1'length-1) then
								cstate <= row_1_send_data;
								index_character <= index_character + 1;
							else
								cstate <= row_1_clear_rest;
							end if;
						end if;
					when others => null;
				end case;
			when row_1_clear_rest =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1'; -- we are busy
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
					when 1 to (OLED_WIDTH-(i_row1'length*6)) =>
						i2c_data <= x"00"; -- rest pixels 0
					when (OLED_WIDTH-(i_row1'length*6))+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							cstate <= row_2_coordination_02;
						end if;
					when others => null;
				end case;
			when row_2_coordination_02 =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_COMMAND,8));
					when 1 to NI_SET_COORDINATION =>
						i2c_data <= set_coordination_02(busy_cnt-1);
					when NI_SET_COORDINATION+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							index_character <= 0;
							cstate <= row_2_send_data;
						end if;
					when others => null;
				end case;
			when row_2_send_data =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
						current_character <= i_row2(index_character);
					when 1 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+0,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 2 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+1,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 3 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+2,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 4 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+3,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 5 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+4,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 6 =>
						i2c_data <= x"00"; -- xxx to space between characters / optional
					when 7 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							if (index_character < i_row2'length-1) then
								cstate <= row_2_send_data;
								index_character <= index_character + 1;
							else
								cstate <= row_2_clear_rest;
							end if;
						end if;
					when others => null;
				end case;
			when row_2_clear_rest =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1'; -- we are busy
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
					when 1 to (OLED_WIDTH-(i_row2'length*6)) =>
						i2c_data <= x"00"; -- rest pixels 0
					when (OLED_WIDTH-(i_row2'length*6))+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							cstate <= row_3_coordination_03;
						end if;
					when others => null;
				end case;
			when row_3_coordination_03 =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_COMMAND,8));
					when 1 to NI_SET_COORDINATION =>
						i2c_data <= set_coordination_03(busy_cnt-1);
					when NI_SET_COORDINATION+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							index_character <= 0;
							cstate <= row_3_send_data;
						end if;
					when others => null;
				end case;
			when row_3_send_data =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1';
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
						current_character <= i_row3(index_character);
					when 1 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+0,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 2 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+1,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 3 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+2,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 4 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+3,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 5 =>
						glcdfont_index <= std_logic_vector(to_unsigned(to_integer(unsigned(current_character))*5+4,glcdfont_index'length));
						i2c_data <= glcdfont_character;
					when 6 =>
						i2c_data <= x"00"; -- xxx to space between characters / optional
					when 7 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							if (index_character < i_row3'length-1) then
								cstate <= row_3_send_data;
								index_character <= index_character + 1;
							else
								cstate <= row_3_clear_rest;
							end if;
						end if;
					when others => null;
				end case;
			when row_3_clear_rest =>
				busy_prev <= i2c_busy;
				if (busy_prev = '0' and i2c_busy = '1') then
					busy_cnt <= busy_cnt + 1;
				end if;
				case busy_cnt is
					when 0 =>
						i2c_enable <= '1'; -- we are busy
						i2c_data <= std_logic_vector(to_unsigned(OLED_DATA,8));
					when 1 to (OLED_WIDTH-(i_row3'length*6)) =>
						i2c_data <= x"00"; -- rest pixels 0
					when (OLED_WIDTH-(i_row3'length*6))+1 =>
						i2c_enable <= '0';
						if (i2c_busy = '0') then
							busy_cnt <= 0;
							cstate <= stop;
						end if;
					when others => null;
				end case;
			when stop =>
				cstate <= wait0;
				o_busy <= '0';
				i2c_enable <= '0';
				index_character <= 0;
			when others => null;
		end case;
	end if;
end process p0;

end Behavioral;
