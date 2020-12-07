--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : VgaPs2Demo.vhf
-- /___/   /\     Timestamp : 12/07/2020 12:52:34
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/nexys2bist1200original/VgaPs2Demo.vhf -w /home/user/workspace/nexys2bist1200original/VgaPs2Demo.sch
--Design Name: VgaPs2Demo
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity VgaPs2Demo is
   port ( demoEnable : in    std_logic; 
          GCLK       : in    std_logic; 
          HSYNC      : out   std_logic; 
          VSYNC      : out   std_logic; 
          PS2C       : inout std_logic; 
          PS2D       : inout std_logic; 
          vgaBlue    : inout std_logic_vector (3 downto 0); 
          vgaGreen   : inout std_logic_vector (3 downto 0); 
          vgaRed     : inout std_logic_vector (3 downto 0));
end VgaPs2Demo;

architecture BEHAVIORAL of VgaPs2Demo is
   attribute BOX_TYPE   : string ;
   signal ck25MHz    : std_logic;
   signal ck100MHz   : std_logic;
   signal XLXN_50    : std_logic_vector (9 downto 0);
   signal XLXN_60    : std_logic;
   signal XLXN_61    : std_logic;
   signal XLXN_62    : std_logic;
   signal XLXN_64    : std_logic_vector (7 downto 0);
   signal XLXN_77    : std_logic_vector (9 downto 0);
   signal XLXN_131   : std_logic_vector (9 downto 0);
   signal XLXN_132   : std_logic_vector (7 downto 0);
   signal XLXN_156   : std_logic;
   signal XLXN_157   : std_logic;
   signal XLXN_159   : std_logic;
   signal XLXN_457   : std_logic;
   signal XLXN_469   : std_logic_vector (13 downto 0);
   signal XLXN_470   : std_logic_vector (3 downto 0);
   signal XLXN_471   : std_logic_vector (3 downto 0);
   signal XLXN_472   : std_logic_vector (3 downto 0);
   signal XLXN_473   : std_logic_vector (3 downto 0);
   signal XLXN_474   : std_logic_vector (3 downto 0);
   signal XLXN_475   : std_logic_vector (3 downto 0);
   signal XLXN_490   : std_logic_vector (10 downto 0);
   signal XLXN_491   : std_logic_vector (10 downto 0);
   component clkdllctrl
      port ( ckDivOut : out   std_logic; 
             ckOut    : inout std_logic; 
             ckIn     : in    std_logic);
   end component;
   
   component DispCtrl
      port ( clk25MHz        : in    std_logic; 
             bitMouseLeftBtn : in    std_logic; 
             xPos            : in    std_logic_vector (9 downto 0); 
             yPos            : in    std_logic_vector (9 downto 0); 
             Hcnt            : in    std_logic_vector (10 downto 0); 
             Vcnt            : in    std_logic_vector (10 downto 0); 
             inRed           : in    std_logic_vector (3 downto 0); 
             inGreen         : in    std_logic_vector (3 downto 0); 
             inBlue          : in    std_logic_vector (3 downto 0); 
             outRed          : out   std_logic_vector (3 downto 0); 
             outGreen        : out   std_logic_vector (3 downto 0); 
             outBlue         : out   std_logic_vector (3 downto 0); 
             adrVideoMem     : out   std_logic_vector (13 downto 0));
   end component;
   
   component gnd10
      port ( busGnd : out   std_logic_vector (9 downto 0));
   end component;
   
   component mouse_controller
      port ( clk       : in    std_logic; 
             rst       : in    std_logic; 
             read      : in    std_logic; 
             err       : in    std_logic; 
             setx      : in    std_logic; 
             sety      : in    std_logic; 
             setmax_x  : in    std_logic; 
             setmax_y  : in    std_logic; 
             rx_data   : in    std_logic_vector (7 downto 0); 
             value     : in    std_logic_vector (9 downto 0); 
             left      : out   std_logic; 
             middle    : out   std_logic; 
             right     : out   std_logic; 
             new_event : out   std_logic; 
             write     : out   std_logic; 
             tx_data   : out   std_logic_vector (7 downto 0); 
             xpos      : out   std_logic_vector (9 downto 0); 
             ypos      : out   std_logic_vector (9 downto 0); 
             zpos      : out   std_logic_vector (3 downto 0));
   end component;
   
   component mouse_displayer
      port ( clk       : in    std_logic; 
             pixel_clk : in    std_logic; 
             blank     : in    std_logic; 
             xpos      : in    std_logic_vector (9 downto 0); 
             ypos      : in    std_logic_vector (9 downto 0); 
             hcount    : in    std_logic_vector (10 downto 0); 
             vcount    : in    std_logic_vector (10 downto 0); 
             red_in    : in    std_logic_vector (3 downto 0); 
             green_in  : in    std_logic_vector (3 downto 0); 
             blue_in   : in    std_logic_vector (3 downto 0); 
             red_out   : out   std_logic_vector (3 downto 0); 
             green_out : out   std_logic_vector (3 downto 0); 
             blue_out  : out   std_logic_vector (3 downto 0));
   end component;
   
   component ps2interface
      port ( clk        : in    std_logic; 
             rst        : in    std_logic; 
             write      : in    std_logic; 
             demoEnable : in    std_logic; 
             tx_data    : in    std_logic_vector (7 downto 0); 
             ps2_clk    : inout std_logic; 
             ps2_data   : inout std_logic; 
             read       : out   std_logic; 
             busy       : out   std_logic; 
             err        : out   std_logic; 
             rx_data    : out   std_logic_vector (7 downto 0));
   end component;
   
   component Synchro
      port ( ck25MHz : in    std_logic; 
             HS      : out   std_logic; 
             VS      : out   std_logic; 
             Hcnt    : out   std_logic_vector (10 downto 0); 
             Vcnt    : out   std_logic_vector (10 downto 0));
   end component;
   
   component VideoRom
      port ( AdrB     : in    std_logic_vector (13 downto 0); 
             outRed   : out   std_logic_vector (3 downto 0); 
             outGreen : out   std_logic_vector (3 downto 0); 
             outBlue  : out   std_logic_vector (3 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
begin
   instClkDllCtrl : clkdllctrl
      port map (ckIn=>GCLK,
                ckDivOut=>ck25MHz,
                ckOut=>ck100MHz);
   
   instDispCtrl : DispCtrl
      port map (bitMouseLeftBtn=>XLXN_457,
                clk25MHz=>ck25MHz,
                Hcnt(10 downto 0)=>XLXN_490(10 downto 0),
                inBlue(3 downto 0)=>XLXN_472(3 downto 0),
                inGreen(3 downto 0)=>XLXN_471(3 downto 0),
                inRed(3 downto 0)=>XLXN_470(3 downto 0),
                Vcnt(10 downto 0)=>XLXN_491(10 downto 0),
                xPos(9 downto 0)=>XLXN_131(9 downto 0),
                yPos(9 downto 0)=>XLXN_50(9 downto 0),
                adrVideoMem(13 downto 0)=>XLXN_469(13 downto 0),
                outBlue(3 downto 0)=>XLXN_473(3 downto 0),
                outGreen(3 downto 0)=>XLXN_474(3 downto 0),
                outRed(3 downto 0)=>XLXN_475(3 downto 0));
   
   instGnd10 : gnd10
      port map (busGnd(9 downto 0)=>XLXN_77(9 downto 0));
   
   instMouseController : mouse_controller
      port map (clk=>ck100MHz,
                err=>XLXN_60,
                read=>XLXN_61,
                rst=>XLXN_157,
                rx_data(7 downto 0)=>XLXN_132(7 downto 0),
                setmax_x=>XLXN_157,
                setmax_y=>XLXN_157,
                setx=>XLXN_157,
                sety=>XLXN_157,
                value(9 downto 0)=>XLXN_77(9 downto 0),
                left=>XLXN_457,
                middle=>open,
                new_event=>open,
                right=>open,
                tx_data(7 downto 0)=>XLXN_64(7 downto 0),
                write=>XLXN_62,
                xpos(9 downto 0)=>XLXN_131(9 downto 0),
                ypos(9 downto 0)=>XLXN_50(9 downto 0),
                zpos=>open);
   
   instMouseDisplayer : mouse_displayer
      port map (blank=>XLXN_159,
                blue_in(3 downto 0)=>XLXN_473(3 downto 0),
                clk=>ck100MHz,
                green_in(3 downto 0)=>XLXN_474(3 downto 0),
                hcount(10 downto 0)=>XLXN_490(10 downto 0),
                pixel_clk=>ck25MHz,
                red_in(3 downto 0)=>XLXN_475(3 downto 0),
                vcount(10 downto 0)=>XLXN_491(10 downto 0),
                xpos(9 downto 0)=>XLXN_131(9 downto 0),
                ypos(9 downto 0)=>XLXN_50(9 downto 0),
                blue_out(3 downto 0)=>vgaBlue(3 downto 0),
                green_out(3 downto 0)=>vgaGreen(3 downto 0),
                red_out(3 downto 0)=>vgaRed(3 downto 0));
   
   instPs2Interface : ps2interface
      port map (clk=>ck100MHz,
                demoEnable=>demoEnable,
                rst=>XLXN_156,
                tx_data(7 downto 0)=>XLXN_64(7 downto 0),
                write=>XLXN_62,
                busy=>open,
                err=>XLXN_60,
                read=>XLXN_61,
                rx_data(7 downto 0)=>XLXN_132(7 downto 0),
                ps2_clk=>PS2C,
                ps2_data=>PS2D);
   
   instSynchro : Synchro
      port map (ck25MHz=>ck25MHz,
                Hcnt(10 downto 0)=>XLXN_490(10 downto 0),
                HS=>HSYNC,
                Vcnt(10 downto 0)=>XLXN_491(10 downto 0),
                VS=>VSYNC);
   
   instVideoRom : VideoRom
      port map (AdrB(13 downto 0)=>XLXN_469(13 downto 0),
                outBlue(3 downto 0)=>XLXN_472(3 downto 0),
                outGreen(3 downto 0)=>XLXN_471(3 downto 0),
                outRed(3 downto 0)=>XLXN_470(3 downto 0));
   
   XLXI_62 : GND
      port map (G=>XLXN_156);
   
   XLXI_64 : GND
      port map (G=>XLXN_159);
   
   XLXI_65 : GND
      port map (G=>XLXN_157);
   
end BEHAVIORAL;


