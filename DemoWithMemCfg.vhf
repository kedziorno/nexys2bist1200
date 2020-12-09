--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : DemoWithMemCfg.vhf
-- /___/   /\     Timestamp : 12/05/2020 01:19:40
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: /home/user/.local/Xilinx/14.7/ISE_DS/ISE/bin/lin64/unwrapped/sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl /home/user/workspace/nexys2bist1200/DemoWithMemCfg.vhf -w /home/user/workspace/nexys2bist1200/DemoWithMemCfg.sch
--Design Name: DemoWithMemCfg
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
use WORK.p_pkg1.ALL;

entity DemoWithMemCfg is
   port ( btn        : in    std_logic_vector (3 downto 0); 
          clk        : in    std_logic; 
          EppAstb    : in    std_logic; 
          EppDstb    : in    std_logic; 
          FlashStSts : in    std_logic; 
          RamWait    : in    std_logic; 
          RsRx       : in    std_logic; 
          sw         : in    std_logic_vector (7 downto 0); 
          UsbClk     : in    std_logic; 
          UsbDir     : in    std_logic; 
          UsbFlag    : in    std_logic; 
          UsbMode    : in    std_logic; 
          an         : out   std_logic_vector (3 downto 0); 
          dp         : out   std_logic; 
          EppWait    : out   std_logic; 
          FlashCS    : out   std_logic; 
          FlashRp    : out   std_logic; 
          HSYNC      : out   std_logic; 
          led        : out   std_logic_vector (7 downto 0); 
          MemAdr     : out   std_logic_vector (23 downto 1); 
          MemOe      : out   std_logic; 
          MemWr      : out   std_logic; 
          RamAdv     : out   std_logic; 
          RamClk     : out   std_logic; 
          RamCre     : out   std_logic; 
          RamCS      : out   std_logic; 
          RamLB      : out   std_logic; 
          RamUB      : out   std_logic; 
          seg        : out   std_logic_vector (6 downto 0); 
          UsbAdr     : out   std_logic_vector (1 downto 0); 
          UsbOe      : out   std_logic; 
          UsbPktEnd  : out   std_logic; 
          UsbWr      : out   std_logic; 
          vgaBlue    : out   std_logic_vector (2 downto 1); 
          vgaGreen   : out   std_logic_vector (2 downto 0); 
          vgaRed     : out   std_logic_vector (2 downto 0); 
          VSYNC      : out   std_logic; 
          MemDB      : inout std_logic_vector (15 downto 0); 
          PIO        : inout std_logic_vector (67 downto 0); 
          PS2C       : inout std_logic; 
          PS2D       : inout std_logic; 
          RsTx       : inout std_logic; 
          UsbDB      : inout std_logic_vector (7 downto 0);
          SDA        : inout std_logic;
          SCK        : inout std_logic);
end DemoWithMemCfg;

architecture BEHAVIORAL of DemoWithMemCfg is

   attribute BOX_TYPE   : string ;
   signal XLXN_1487     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_1488     : std_logic := '0';
   signal XLXN_1526     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_1527     : std_logic := '0';
   signal XLXN_1579     : std_logic := '0';
   signal XLXN_1747     : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_1748     : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_1749     : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_1750     : std_logic := '0';
   signal XLXN_1751     : std_logic := '0';
   signal XLXN_1848     : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_1849     : std_logic := '0';
   signal XLXN_1852     : std_logic_vector (6 downto 0) := (others => '0');
   signal XLXN_1882     : std_logic := '0';
   signal XLXN_1902     : std_logic := '0';
   signal XLXN_1938     : std_logic := '0';
   signal XLXN_1939     : std_logic_vector (6 downto 0) := (others => '0');
   signal XLXN_1940     : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_1944     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_1947     : std_logic := '0';
   signal XLXN_1948     : std_logic := '0';
   signal XLXN_1949     : std_logic := '0';
   signal XLXN_2184     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_2186     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_2187     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_2196     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_2212     : std_logic_vector (47 downto 0) := (others => '0');
   signal XLXN_2230     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_2235     : std_logic := '0';
   signal XLXN_2236     : std_logic := '0';
   signal XLXN_2237     : std_logic := '0';
   signal XLXN_2238     : std_logic := '0';
   signal XLXN_2239     : std_logic := '0';
   signal XLXN_2252     : std_logic := '0';
   signal XLXN_2549     : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_2550     : std_logic_vector (1 downto 0) := (others => '0');
   signal XLXN_2570     : std_logic := '0';
   signal RamLB_DUMMY   : std_logic := '0';
   signal MemOe_DUMMY   : std_logic := '0';
   signal RamAdv_DUMMY  : std_logic := '0';
   signal FlashRp_DUMMY : std_logic := '0';
   signal RamUB_DUMMY   : std_logic := '0';
   signal RamCS_DUMMY   : std_logic := '0';
   signal MemWr_DUMMY   : std_logic := '0';
   signal FlashCS_DUMMY : std_logic := '0';
   signal MemAdr_DUMMY  : std_logic_vector (23 downto 1) := (others => '0');
   signal RamCre_DUMMY  : std_logic := '0';
   signal RamClk_DUMMY  : std_logic := '0';

   component BlockRamCtrl
      port ( UsbClk       : in    std_logic; 
             UsbDBOut     : out   std_logic_vector (7 downto 0); 
             UsbRD        : out   std_logic; 
             UsbFlag      : in    std_logic; 
             UsbMode      : in    std_logic; 
             UsbDBIn      : in    std_logic_vector (7 downto 0); 
             UsbDir       : in    std_logic; 
             UsbOE        : out   std_logic; 
             UsbWR        : out   std_logic; 
             UsbPktEnd    : out   std_logic; 
             UsbAdr       : out   std_logic_vector (1 downto 0); 
             Stream6Bytes : in    std_logic_vector (47 downto 0));
   end component;
   
   component Bus8Or
      port ( D1In : in    std_logic_vector (7 downto 0); 
             D2In : in    std_logic_vector (7 downto 0); 
             D3In : in    std_logic_vector (7 downto 0); 
             DOut : out   std_logic_vector (7 downto 0));
   end component;
   
   component ClkDllDiv16
      port ( ckIn     : in    std_logic; 
             ckDivOut : inout std_logic; 
             ckOut    : inout std_logic);
   end component;
   
   component CompSel
      port ( regEppAdrIn : in    std_logic_vector (7 downto 0); 
             CSB0        : out   std_logic; 
             CS80_9F     : out   std_logic; 
             CS0_7       : out   std_logic; 
             CS8_F       : out   std_logic; 
             CS10        : out   std_logic);
   end component;
   
   component ConfReg
      port ( CompSel : in    std_logic; 
             Wr      : in    std_logic; 
             busIn   : in    std_logic_vector (7 downto 0); 
             ck      : in    std_logic; 
             DemoEn  : out   std_logic);
   end component;
   
   component Demo
      port ( ck  : in    std_logic; 
             an  : out   std_logic_vector (3 downto 0); 
             led : out   std_logic_vector (7 downto 0); 
             dp  : out   std_logic; 
             btn : in    std_logic_vector (3 downto 0); 
             sw  : in    std_logic_vector (7 downto 0); 
             seg : out   std_logic_vector (6 downto 0));
   end component;
   
   component DispMux
      port ( seg2 : in    std_logic_vector (6 downto 0); 
             an2  : in    std_logic_vector (3 downto 0); 
             dp2  : in    std_logic; 
             btn  : in    std_logic_vector (3 downto 0); 
             sw   : in    std_logic_vector (7 downto 0); 
             dp1  : in    std_logic; 
             seg1 : in    std_logic_vector (6 downto 0); 
             an1  : in    std_logic_vector (3 downto 0); 
             ck   : in    std_logic; 
             seg  : out   std_logic_vector (6 downto 0); 
             dp   : out   std_logic; 
             an   : out   std_logic_vector (3 downto 0));
   end component;
   
   component EppCtrl
      port ( EppDBOut         : out   std_logic_vector (7 downto 0); 
             EppWait          : out   std_logic; 
             EppDBIn          : in    std_logic_vector (7 downto 0); 
             EppRst           : in    std_logic; 
             EppWr            : in    std_logic; 
             EppDstb          : in    std_logic; 
             EppAstb          : in    std_logic; 
             clk              : in    std_logic; 
             ctlEppDoneIn     : in    std_logic; 
             regEppAdrOut     : inout std_logic_vector (7 downto 0); 
             ctlEppStartOut   : out   std_logic; 
             HandShakeReqIn   : in    std_logic; 
             ctlEppRdCycleOut : inout std_logic; 
             ctlEppDwrOut     : out   std_logic; 
             busEppIn         : in    std_logic_vector (7 downto 0); 
             busEppOut        : out   std_logic_vector (7 downto 0));
   end component;
   
   component NexysOnBoardMemTest
      port ( RamCS           : out   std_logic; 
             FlashCS         : out   std_logic; 
             MemWR           : out   std_logic; 
             MemOE           : out   std_logic; 
             RamUB           : out   std_logic; 
             RamLB           : out   std_logic; 
             RamCre          : out   std_logic; 
             RamAdv          : out   std_logic; 
             RamClk          : out   std_logic; 
             RamWait         : in    std_logic; 
             FlashRp         : out   std_logic; 
             FlashStSts      : in    std_logic; 
             FlashByte       : out   std_logic; 
             TestCtrlEnabled : out   std_logic; 
             MemAdr          : out   std_logic_vector (23 downto 1); 
             MemDB           : inout std_logic_vector (15 downto 0); 
             seg             : out   std_logic_vector (6 downto 0); 
             an              : out   std_logic_vector (3 downto 0); 
             clk             : in    std_logic; 
             EppRdDataOut    : out   std_logic_vector (7 downto 0); 
             EppWrDataIn     : in    std_logic_vector (7 downto 0); 
             ctlMsmDwrIn     : in    std_logic; 
             ctlMsmStartIn   : in    std_logic; 
             ctlEppRdCycleIn : in    std_logic; 
             HandShakeReqOut : out   std_logic; 
             ctlMsmDoneOut   : out   std_logic; 
             regEppAdrIn     : in    std_logic_vector (7 downto 0); 
             ComponentSelect : in    std_logic;
             waitfordisplay  : in    std_logic);
   end component;
   
   component PinDrivers
      port ( DemoEn  : in    std_logic; 
             PIO     : inout std_logic_vector (67 downto 0); 
             btn     : in    std_logic_vector (3 downto 0); 
             sw      : in    std_logic_vector (7 downto 0); 
             RsRx    : in    std_logic; 
             RsTx    : inout std_logic; 
             PS2C    : inout std_logic; 
             PS2D    : inout std_logic; 
             RGBOut  : out   std_logic_vector (7 downto 0); 
             SYNCOut : out   std_logic_vector (1 downto 0); 
             busOut  : out   std_logic_vector (7 downto 0); 
             busIn   : in    std_logic_vector (7 downto 0); 
             Wr      : in    std_logic; 
             ck      : in    std_logic; 
             adrIn   : in    std_logic_vector (7 downto 0); 
             CompSel : in    std_logic);
   end component;
   
   component ShiftReg
      port ( busIn        : in    std_logic_vector (7 downto 0); 
             Wr           : in    std_logic; 
             ck           : in    std_logic; 
             CompSel      : in    std_logic; 
             Stream6Bytes : out   std_logic_vector (47 downto 0));
   end component;
   
   component VgaPs2Demo_MUSER_DemoWithMemCfg
      port ( vgaBlue    : inout std_logic_vector (3 downto 0); 
             vgaGreen   : inout std_logic_vector (3 downto 0); 
             vgaRed     : inout std_logic_vector (3 downto 0); 
             HSYNC      : out   std_logic; 
             VSYNC      : out   std_logic; 
             PS2C       : inout std_logic; 
             PS2D       : inout std_logic; 
             GCLK       : in    std_logic; 
             demoEnable : in    std_logic);
   end component;
   
   component VgaSelect
      port ( vsyncDemo   : in    std_logic; 
             RedDemoIn   : in    std_logic_vector (3 downto 0); 
             GreenDemoIn : in    std_logic_vector (3 downto 0); 
             BlueDemoIn  : in    std_logic_vector (3 downto 0); 
             hsyncDemo   : in    std_logic; 
             hsync       : out   std_logic; 
             vsync       : out   std_logic; 
             vgaGreen    : out   std_logic_vector (2 downto 0); 
             vgaRed      : out   std_logic_vector (2 downto 0); 
             vgaBlue     : out   std_logic_vector (2 downto 1); 
             DemoEn      : in    std_logic; 
             RGBTestIn   : in    std_logic_vector (7 downto 0); 
             SyncTestIn  : in    std_logic_vector (1 downto 0));
   end component;
   
   component GND
      port ( G : out   std_logic);
   end component;
   attribute BOX_TYPE of GND : component is "BLACK_BOX";
   
   component EppSyncMux
      port ( UsbDir     : in    std_logic; 
             BlockRamRd : in    std_logic; 
             BlockRamIn : in    std_logic_vector (7 downto 0); 
             UsbMode    : in    std_logic; 
             EppWr      : in    std_logic; 
             EppDBIn    : in    std_logic_vector (7 downto 0); 
             UsbDB      : inout std_logic_vector (7 downto 0); 
             EppWait    : in    std_logic; 
             UsbRD      : out   std_logic);
   end component;
   
   component NexysOnBoardMemCtrl
      port ( MemCtrlEnabled  : out   std_logic; 
             RamCS           : out   std_logic; 
             FlashCS         : out   std_logic; 
             MemWR           : out   std_logic; 
             MemOE           : out   std_logic; 
             RamUB           : out   std_logic; 
             RamLB           : out   std_logic; 
             RamCre          : out   std_logic; 
             RamAdv          : out   std_logic; 
             RamClk          : out   std_logic; 
             RamWait         : in    std_logic; 
             FlashRp         : out   std_logic; 
             FlashStSts      : in    std_logic; 
             FlashByte       : out   std_logic; 
             MemAdr          : out   std_logic_vector (23 downto 1); 
             MemDB           : inout std_logic_vector (15 downto 0); 
             EppWrDataIn     : in    std_logic_vector (7 downto 0); 
             clk             : in    std_logic; 
             EppRdDataOut    : out   std_logic_vector (7 downto 0); 
             ctlMsmDwrIn     : in    std_logic; 
             ctlEppRdCycleIn : in    std_logic; 
             HandShakeReqOut : out   std_logic; 
             ctlMsmStartIn   : in    std_logic; 
             ctlMsmDoneOut   : out   std_logic; 
             regEppAdrIn     : in    std_logic_vector (7 downto 0); 
             ComponentSelect : in    std_logic);
   end component;
   
   component VCC
      port ( P : out   std_logic);
   end component;
   attribute BOX_TYPE of VCC : component is "BLACK_BOX";
   
   component oled_display is
      generic ( g_board_clock : integer := 50_000_000;
                g_bus_clock : integer := 400_000);
      port ( signal i_clk : in std_logic;
             signal i_rst : in std_logic;
             signal i_refresh : in std_logic;
             signal i_row0 : in array1;
             signal i_row1 : in array1;
             signal i_row2 : in array1;
             signal i_row3 : in array1;
             signal o_display_ready : out std_logic;
             signal o_busy : out std_logic;
             signal io_sda,io_scl : inout std_logic);
   end component oled_display;

   constant TEXT_LENGTH : integer := 8;
   signal text : array1(0 to TEXT_LENGTH-1) := (x"30",x"30",x"30",x"30",x"30",x"30",x"30",x"30");
   signal o_display_ready : std_logic;
   signal o_busy : std_logic;

begin

   FlashCS <= FlashCS_DUMMY;
   FlashRp <= FlashRp_DUMMY;
   MemAdr(23 downto 1) <= MemAdr_DUMMY(23 downto 1);
   MemOe <= MemOe_DUMMY;
   MemWr <= MemWr_DUMMY;
   RamAdv <= RamAdv_DUMMY;
   RamClk <= RamClk_DUMMY;
   RamCre <= RamCre_DUMMY;
   RamCS <= RamCS_DUMMY;
   RamLB <= RamLB_DUMMY;
   RamUB <= RamUB_DUMMY;

   instBlockRamCtrl : BlockRamCtrl
      port map (Stream6Bytes(47 downto 0)=>XLXN_2212(47 downto 0),
                UsbClk=>UsbClk,
                UsbDBIn(7 downto 0)=>UsbDB(7 downto 0),
                UsbDir=>UsbDir,
                UsbFlag=>UsbFlag,
                UsbMode=>UsbMode,
                UsbAdr(1 downto 0)=>UsbAdr(1 downto 0),
                UsbDBOut(7 downto 0)=>XLXN_1487(7 downto 0),
                UsbOE=>UsbOe,
                UsbPktEnd=>UsbPktEnd,
                UsbRD=>XLXN_1488,
                UsbWR=>UsbWr);
   
   instBus8Or : Bus8Or
      port map (D1In(7 downto 0)=>XLXN_2196(7 downto 0),
                D2In(7 downto 0)=>XLXN_1944(7 downto 0),
                D3In(7 downto 0)=>XLXN_2187(7 downto 0),
                DOut(7 downto 0)=>XLXN_2230(7 downto 0));
   
   instClkDllDiv16 : ClkDllDiv16
      port map (ckIn=>clk,
                ckDivOut=>XLXN_1882,
                ckOut=>open);
   
   instCompSel : CompSel
      port map (regEppAdrIn(7 downto 0)=>XLXN_2186(7 downto 0),
                CSB0=>XLXN_2236,
                CS0_7=>XLXN_2238,
                CS8_F=>XLXN_2239,
                CS10=>XLXN_2237,
                CS80_9F=>XLXN_2235);
   
   instConfReg : ConfReg
      port map (busIn(7 downto 0)=>XLXN_2184(7 downto 0),
                ck=>clk,
                CompSel=>XLXN_2236,
                Wr=>XLXN_2252,
                DemoEn=>XLXN_1902);
   
   instDemo : Demo
      port map (btn(3 downto 0)=>btn(3 downto 0),
                ck=>XLXN_1882,
                sw(7 downto 0)=>sw(7 downto 0),
                an(3 downto 0)=>XLXN_1848(3 downto 0),
                dp=>XLXN_1849,
                led(7 downto 0)=>led(7 downto 0),
                seg(6 downto 0)=>XLXN_1852(6 downto 0));
   
   instDispMux : DispMux
      port map (an1(3 downto 0)=>XLXN_1940(3 downto 0),
                an2(3 downto 0)=>XLXN_1848(3 downto 0),
                btn(3 downto 0)=>btn(3 downto 0),
                ck=>clk,
                dp1=>XLXN_2570,
                dp2=>XLXN_1849,
                seg1(6 downto 0)=>XLXN_1939(6 downto 0),
                seg2(6 downto 0)=>XLXN_1852(6 downto 0),
                sw(7 downto 0)=>sw(7 downto 0),
                an(3 downto 0)=>an(3 downto 0),
                dp=>dp,
                seg(6 downto 0)=>seg(6 downto 0));
   
   instEppCtrl : EppCtrl
      port map (busEppIn(7 downto 0)=>XLXN_2230(7 downto 0),
                clk=>clk,
                ctlEppDoneIn=>XLXN_1949,
                EppAstb=>EppAstb,
                EppDBIn(7 downto 0)=>UsbDB(7 downto 0),
                EppDstb=>EppDstb,
                EppRst=>UsbMode,
                EppWr=>UsbFlag,
                HandShakeReqIn=>XLXN_1948,
                busEppOut(7 downto 0)=>XLXN_2184(7 downto 0),
                ctlEppDwrOut=>XLXN_2252,
                ctlEppStartOut=>XLXN_1579, -- xxx XLXN_1579 memctrl ctlMsmStartIn (ctlEppStartOut <= '1' when stEppCur = stEppLaunchProc else '0';)
                EppDBOut(7 downto 0)=>XLXN_1526(7 downto 0),
                EppWait=>XLXN_1527,
                ctlEppRdCycleOut=>XLXN_1947,
                regEppAdrOut(7 downto 0)=>XLXN_2186(7 downto 0));
   
   instNexysOnBoardMemTest : NexysOnBoardMemTest
      port map (clk=>clk,
                waitfordisplay=>o_busy,
                ComponentSelect=>XLXN_2239,
                ctlEppRdCycleIn=>XLXN_1947,
                ctlMsmDwrIn=>XLXN_2252,
                ctlMsmStartIn=>o_display_ready,--XLXN_1938, -- xxx gnd
                EppWrDataIn(7 downto 0)=>XLXN_2184(7 downto 0),
                FlashStSts=>FlashStSts,
                RamWait=>RamWait,
                regEppAdrIn(7 downto 0)=>XLXN_2186(7 downto 0),
                an(3 downto 0)=>XLXN_1940(3 downto 0),
                ctlMsmDoneOut=>open,
                EppRdDataOut(7 downto 0)=>XLXN_1944(7 downto 0),
                FlashByte=>open,
                FlashCS=>FlashCS_DUMMY,
                FlashRp=>FlashRp_DUMMY,
                HandShakeReqOut=>open,
                MemAdr(23 downto 1)=>MemAdr_DUMMY(23 downto 1),
                MemOE=>MemOe_DUMMY,
                MemWR=>MemWr_DUMMY,
                RamAdv=>RamAdv_DUMMY,
                RamClk=>RamClk_DUMMY,
                RamCre=>RamCre_DUMMY,
                RamCS=>RamCS_DUMMY,
                RamLB=>RamLB_DUMMY,
                RamUB=>RamUB_DUMMY,
                seg(6 downto 0)=>XLXN_1939(6 downto 0),
                TestCtrlEnabled=>open,
                MemDB(15 downto 0)=>MemDB(15 downto 0));
   
   instPinDrivers : PinDrivers
      port map (adrIn(7 downto 0)=>XLXN_2186(7 downto 0),
                btn(3 downto 0)=>btn(3 downto 0),
                busIn(7 downto 0)=>XLXN_2184(7 downto 0),
                ck=>clk,
                CompSel=>XLXN_2235,
                DemoEn=>XLXN_1902,
                RsRx=>RsRx,
                sw(7 downto 0)=>sw(7 downto 0),
                Wr=>XLXN_2252,
                busOut(7 downto 0)=>XLXN_2187(7 downto 0),
                RGBOut(7 downto 0)=>XLXN_2549(7 downto 0),
                SYNCOut(1 downto 0)=>XLXN_2550(1 downto 0),
                PIO(67 downto 0)=>PIO(67 downto 0),
                PS2C=>PS2C,
                PS2D=>PS2D,
                RsTx=>RsTx);
   
   instShiftReg : ShiftReg
      port map (busIn(7 downto 0)=>XLXN_2184(7 downto 0),
                ck=>clk,
                CompSel=>XLXN_2237,
                Wr=>XLXN_2252,
                Stream6Bytes(47 downto 0)=>XLXN_2212(47 downto 0));
   
   instVgaPs2Demo : VgaPs2Demo_MUSER_DemoWithMemCfg
      port map (demoEnable=>XLXN_1902,
                GCLK=>clk,
                HSYNC=>XLXN_1750,
                VSYNC=>XLXN_1751,
                PS2C=>PS2C,
                PS2D=>PS2D,
                vgaBlue(3 downto 0)=>XLXN_1747(3 downto 0),
                vgaGreen(3 downto 0)=>XLXN_1748(3 downto 0),
                vgaRed(3 downto 0)=>XLXN_1749(3 downto 0));
   
   instVgaSelect : VgaSelect
      port map (BlueDemoIn(3 downto 0)=>XLXN_1747(3 downto 0),
                DemoEn=>XLXN_1902,
                GreenDemoIn(3 downto 0)=>XLXN_1748(3 downto 0),
                hsyncDemo=>XLXN_1750,
                RedDemoIn(3 downto 0)=>XLXN_1749(3 downto 0),
                RGBTestIn(7 downto 0)=>XLXN_2549(7 downto 0),
                SyncTestIn(1 downto 0)=>XLXN_2550(1 downto 0),
                vsyncDemo=>XLXN_1751,
                hsync=>HSYNC,
                vgaBlue(2 downto 1)=>vgaBlue(2 downto 1),
                vgaGreen(2 downto 0)=>vgaGreen(2 downto 0),
                vgaRed(2 downto 0)=>vgaRed(2 downto 0),
                vsync=>VSYNC);
   
   XLXI_82 : GND
      port map (G=>XLXN_1938);
   
   XLXI_85 : EppSyncMux
      port map (BlockRamIn(7 downto 0)=>XLXN_1487(7 downto 0),
                BlockRamRd=>XLXN_1488,
                EppDBIn(7 downto 0)=>XLXN_1526(7 downto 0),
                EppWait=>XLXN_1527,
                EppWr=>UsbFlag,
                UsbDir=>UsbDir,
                UsbMode=>UsbMode,
                UsbRD=>EppWait,
                UsbDB(7 downto 0)=>UsbDB(7 downto 0));
   
   XLXI_120 : NexysOnBoardMemCtrl
      port map (clk=>clk,
                ComponentSelect=>XLXN_2238,
                ctlEppRdCycleIn=>XLXN_1947,
                ctlMsmDwrIn=>XLXN_2252,
                ctlMsmStartIn=>XLXN_1579, -- xxx eppctrl
                EppWrDataIn(7 downto 0)=>XLXN_2184(7 downto 0),
                FlashStSts=>FlashStSts,
                RamWait=>RamWait,
                regEppAdrIn(7 downto 0)=>XLXN_2186(7 downto 0),
                ctlMsmDoneOut=>XLXN_1949,
                EppRdDataOut(7 downto 0)=>XLXN_2196(7 downto 0),
                FlashByte=>open,
                FlashCS=>FlashCS_DUMMY,
                FlashRp=>FlashRp_DUMMY,
                HandShakeReqOut=>XLXN_1948, -- xxx eppctrl
                MemAdr(23 downto 1)=>MemAdr_DUMMY(23 downto 1),
                MemCtrlEnabled=>open,
                MemOE=>MemOe_DUMMY,
                MemWR=>MemWr_DUMMY,
                RamAdv=>RamAdv_DUMMY,
                RamClk=>RamClk_DUMMY,
                RamCre=>RamCre_DUMMY,
                RamCS=>RamCS_DUMMY,
                RamLB=>RamLB_DUMMY,
                RamUB=>RamUB_DUMMY,
                MemDB(15 downto 0)=>MemDB(15 downto 0));
   
   XLXI_275 : VCC
      port map (P=>XLXN_2570);
   
   c0 : oled_display
      port map (i_clk => clk,
                i_rst => XLXN_1527,
                i_refresh => '0',
                i_row0 => text,
                i_row1 => text,
                i_row2 => text,
                i_row3 => text,
                o_display_ready => o_display_ready,
                o_busy => o_busy,
                io_sda => SDA,
                io_scl => SCK);

   text(7) <= std_logic_vector(to_unsigned(to_integer(unsigned'(x"30"))+to_integer(unsigned(MemAdr_DUMMY(4 downto 1))),8));
   text(6) <= std_logic_vector(to_unsigned(to_integer(unsigned'(x"30"))+to_integer(unsigned(MemAdr_DUMMY(8 downto 5))),8));
   text(5) <= std_logic_vector(to_unsigned(to_integer(unsigned'(x"30"))+to_integer(unsigned(MemAdr_DUMMY(12 downto 9))),8));
   text(4) <= std_logic_vector(to_unsigned(to_integer(unsigned'(x"30"))+to_integer(unsigned(MemAdr_DUMMY(16 downto 13))),8));
   text(3) <= std_logic_vector(to_unsigned(to_integer(unsigned'(x"30"))+to_integer(unsigned(MemAdr_DUMMY(20 downto 17))),8));
   text(2) <= std_logic_vector(to_unsigned(to_integer(unsigned'(x"30"))+to_integer(unsigned(MemAdr_DUMMY(23 downto 21))),8));

end BEHAVIORAL;

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity VgaPs2Demo_MUSER_DemoWithMemCfg is
   port ( demoEnable : in    std_logic; 
          GCLK       : in    std_logic; 
          HSYNC      : out   std_logic; 
          VSYNC      : out   std_logic; 
          PS2C       : inout std_logic; 
          PS2D       : inout std_logic; 
          vgaBlue    : inout std_logic_vector (3 downto 0); 
          vgaGreen   : inout std_logic_vector (3 downto 0); 
          vgaRed     : inout std_logic_vector (3 downto 0));
end VgaPs2Demo_MUSER_DemoWithMemCfg;

architecture BEHAVIORAL of VgaPs2Demo_MUSER_DemoWithMemCfg is

   attribute BOX_TYPE   : string ;
   signal ck25MHz    : std_logic := '0';
   signal ck100MHz   : std_logic := '0';
   signal XLXN_50    : std_logic_vector (9 downto 0) := (others => '0');
   signal XLXN_60    : std_logic := '0';
   signal XLXN_61    : std_logic := '0';
   signal XLXN_62    : std_logic := '0';
   signal XLXN_64    : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_77    : std_logic_vector (9 downto 0) := (others => '0');
   signal XLXN_131   : std_logic_vector (9 downto 0) := (others => '0');
   signal XLXN_132   : std_logic_vector (7 downto 0) := (others => '0');
   signal XLXN_156   : std_logic := '0';
   signal XLXN_157   : std_logic := '0';
   signal XLXN_159   : std_logic := '0';
   signal XLXN_457   : std_logic := '0';
   signal XLXN_469   : std_logic_vector (13 downto 0) := (others => '0');
   signal XLXN_470   : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_471   : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_472   : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_473   : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_474   : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_475   : std_logic_vector (3 downto 0) := (others => '0');
   signal XLXN_490   : std_logic_vector (10 downto 0) := (others => '0');
   signal XLXN_491   : std_logic_vector (10 downto 0) := (others => '0');

   component clkdllctrl
      port ( ckDivOut : inout   std_logic; 
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
