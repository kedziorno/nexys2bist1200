v {xschem version=3.4.6RC file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {--------------------------------------------------------------------------------
--
--                             O o
--                              L   
---------------------------OO-------OO------------------------------------------
-- Originally header from VHD file
--------------------------------------------------------------------------------
------------------------------------------------------------------------
-- Company: Digilent
-- Engineer: Mircea Dabacan
--
-- Create Date: 12:36:33 12/06/05
-- Design Name: Nexys2 board demo
-- Module Name: Demo - Behavioral
-- Project Name:   
-- Target Device: XC3S500E  
-- Tool versions: Xilinx ISE 9.2
-- Description: This file contains the demo for the 7 Segment Display and
--					and the leds on the Nexys 2 Board. 
--
--Each Led is assigned to a switch on the board. When a switch is moved to 
--the HIGH the coresponding led will turn on slowly. When it is moved to
--the LOW position the led will turn off slowly. This is done using PWM's.
--
--The Snake is the demo on the 7 Segment Display. A snake apears on one digit. 
--The head of the snake is the represented by the brightest line and it's tale
--by the least bright line. When a button is pressed the snake moves to the 
--coresponding digit.
--
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
------------------------------------------------------------------------

--  Small feature to use more buttons, switches, LEDs and 7 Segment Displays (max 8).
--------------------------------------------------------------------------------} 70 -560 0 0 0.15 0.15 {}
C {SnakeLedDemo.sym} 630 -170 0 0 {name=TOP c_number_buttons=c_tb_number_buttons c_number_switches=c_tb_number_switches}
C {use.sym} 30 -920 0 0 {library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.p_constants.all;}
C {title.sym} 180 -50 0 0 {name=l1 author=""}
C {arch_declarations.sym} 30 -820 0 0 {
constant c_tb_number_switches : integer := g_tb_number_switches;
constant c_tb_number_buttons : integer := g_tb_number_buttons;
type sw_t is array (0 to 0) of std_logic_vector (c_tb_number_switches - 1 downto 0);
type btn_t is array (0 to 0) of std_logic_vector (c_tb_number_buttons - 1 downto 0);
type segment_t is array (0 to 0) of std_logic_vector (6 downto 0);
}
C {generic_pin.sym} 470 -150 0 0 {name=g1 generic_type=integer value="8" lab=g_tb_number_switches}
C {generic_pin.sym} 470 -130 0 0 {name=g2 generic_type=integer value="8" lab=g_tb_number_buttons}
C {code_shown.sym} 10 -690 0 0 {name=clock only_toplevel=false value="
clock_generate_10ns : process is
begin
  ck <= '0'; wait for 5 ns;
  ck <= '1'; wait for 5 ns;
end process;
"}
C {code_shown.sym} 440 -920 0 0 {name="stimuli" only_toplevel=false value="
stimulus_sw : process is
begin
  sw <= (others => '0');
  wait for 20 ns;
  sw(1) <= '1';
  sw(5) <= '1';
  wait for 100 ms;
  sw(1) <= '0';
  sw(5) <= '0';
  wait for 100 ns;
  wait;
end process;

stimulus_btn : process is
  procedure push_btn (index : in integer) is
  begin
    btn (index) <= '1'; wait for 10 ns; btn (index) <= '0';
    wait for 1000 ms;
  end procedure;
begin
  btn <= (others => '0');
  push_btn (1);
  push_btn (5);
  push_btn (1);
  push_btn (3);
  push_btn (2);
  push_btn (4);
  push_btn (1);
  report \\"tb done\\" severity failure;
end process;
"}
C {lab_pin.sym} 480 -210 0 0 {name=p1 sig_type=std_logic lab=ck}
C {lab_pin.sym} 480 -190 0 0 {name=p3 sig_type=std_logic lab=btn[c_number_buttons-1:0]}
C {lab_pin.sym} 480 -170 0 0 {name=p8 sig_type=std_logic lab=sw[c_number_switches-1:0]}
C {lab_pin.sym} 780 -210 2 0 {name=p6 sig_type=std_logic lab=an[c_number_buttons-1:0]}
C {lab_pin.sym} 780 -130 2 0 {name=p2 sig_type=std_logic lab=led[c_number_switches-1:0]}
C {lab_pin.sym} 780 -190 2 0 {name=p5 sig_type=std_logic lab=seg[6:0]}
C {lab_pin.sym} 780 -170 2 0 {name=p7 sig_type=std_logic lab=seg_ex[6:0]}
C {lab_pin.sym} 780 -150 2 0 {name=p4 sig_type=std_logic lab=dp}
