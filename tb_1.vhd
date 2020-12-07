-- Vhdl test bench created from schematic /home/user/workspace/nexys2bist1200/DemoWithMemCfg.sch - Fri Dec  4 13:37:46 2020
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;

ENTITY DemoWithMemCfg_DemoWithMemCfg_sch_tb IS
END DemoWithMemCfg_DemoWithMemCfg_sch_tb;

ARCHITECTURE behavioral OF DemoWithMemCfg_DemoWithMemCfg_sch_tb IS 

   COMPONENT DemoWithMemCfg
   PORT( EppDstb	:	IN	STD_LOGIC; 
          EppAstb	:	IN	STD_LOGIC; 
          HSYNC	:	OUT	STD_LOGIC; 
          VSYNC	:	OUT	STD_LOGIC; 
          vgaBlue	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 1); 
          vgaRed	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          vgaGreen	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          RamCS	:	OUT	STD_LOGIC; 
          FlashCS	:	OUT	STD_LOGIC; 
          MemWr	:	OUT	STD_LOGIC; 
          MemOe	:	OUT	STD_LOGIC; 
          RamUB	:	OUT	STD_LOGIC; 
          RamLB	:	OUT	STD_LOGIC; 
          RamCre	:	OUT	STD_LOGIC; 
          RamAdv	:	OUT	STD_LOGIC; 
          RamClk	:	OUT	STD_LOGIC; 
          RamWait	:	IN	STD_LOGIC; 
          FlashRp	:	OUT	STD_LOGIC; 
          FlashStSts	:	IN	STD_LOGIC; 
          MemAdr	:	OUT	STD_LOGIC_VECTOR (23 DOWNTO 1); 
          MemDB	:	INOUT	STD_LOGIC_VECTOR (15 DOWNTO 0); 
          UsbDir	:	IN	STD_LOGIC; 
          UsbAdr	:	OUT	STD_LOGIC_VECTOR (1 DOWNTO 0); 
          UsbPktEnd	:	OUT	STD_LOGIC; 
          UsbWr	:	OUT	STD_LOGIC; 
          UsbOe	:	OUT	STD_LOGIC; 
          UsbClk	:	IN	STD_LOGIC; 
          EppWait	:	OUT	STD_LOGIC; 
          UsbDB	:	INOUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          UsbMode	:	IN	STD_LOGIC; 
          UsbFlag	:	IN	STD_LOGIC; 
          RsRx	:	IN	STD_LOGIC; 
          RsTx	:	INOUT	STD_LOGIC; 
          sw	:	IN	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          btn	:	IN	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          PIO	:	INOUT	STD_LOGIC_VECTOR (67 DOWNTO 0); 
          PS2D	:	INOUT	STD_LOGIC; 
          PS2C	:	INOUT	STD_LOGIC; 
          clk	:	IN	STD_LOGIC; 
          led	:	OUT	STD_LOGIC_VECTOR (7 DOWNTO 0); 
          dp	:	OUT	STD_LOGIC; 
          an	:	OUT	STD_LOGIC_VECTOR (3 DOWNTO 0); 
          seg	:	OUT	STD_LOGIC_VECTOR (6 DOWNTO 0));
   END COMPONENT;

   SIGNAL EppDstb	:	STD_LOGIC := '0';
   SIGNAL EppAstb	:	STD_LOGIC := '0';
   SIGNAL HSYNC	:	STD_LOGIC := '0';
   SIGNAL VSYNC	:	STD_LOGIC := '0';
   SIGNAL vgaBlue	:	STD_LOGIC_VECTOR (2 DOWNTO 1) := (others => '0');
   SIGNAL vgaRed	:	STD_LOGIC_VECTOR (2 DOWNTO 0) := (others => '0');
   SIGNAL vgaGreen	:	STD_LOGIC_VECTOR (2 DOWNTO 0) := (others => '0');
   SIGNAL RamCS	:	STD_LOGIC := '0';
   SIGNAL FlashCS	:	STD_LOGIC := '0';
   SIGNAL MemWr	:	STD_LOGIC := '0';
   SIGNAL MemOe	:	STD_LOGIC := '0';
   SIGNAL RamUB	:	STD_LOGIC := '0';
   SIGNAL RamLB	:	STD_LOGIC := '0';
   SIGNAL RamCre	:	STD_LOGIC := '0';
   SIGNAL RamAdv	:	STD_LOGIC := '0';
   SIGNAL RamClk	:	STD_LOGIC := '0';
   SIGNAL RamWait	:	STD_LOGIC := '0';
   SIGNAL FlashRp	:	STD_LOGIC := '0';
   SIGNAL FlashStSts	:	STD_LOGIC := '0';
   SIGNAL MemAdr	:	STD_LOGIC_VECTOR (23 DOWNTO 1) := (others => '0');
   SIGNAL MemDB	:	STD_LOGIC_VECTOR (15 DOWNTO 0) := (others => '0');
   SIGNAL UsbDir	:	STD_LOGIC := '0';
   SIGNAL UsbAdr	:	STD_LOGIC_VECTOR (1 DOWNTO 0) := (others => '0');
   SIGNAL UsbPktEnd	:	STD_LOGIC;
   SIGNAL UsbWr	:	STD_LOGIC := '0';
   SIGNAL UsbOe	:	STD_LOGIC := '0';
   SIGNAL UsbClk	:	STD_LOGIC := '0';
   SIGNAL EppWait	:	STD_LOGIC := '0';
   SIGNAL UsbDB	:	STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
   SIGNAL UsbMode	:	STD_LOGIC := '0';
   SIGNAL UsbFlag	:	STD_LOGIC := '0';
   SIGNAL RsRx	:	STD_LOGIC := '0';
   SIGNAL RsTx	:	STD_LOGIC := '0';
   SIGNAL sw	:	STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
   SIGNAL btn	:	STD_LOGIC_VECTOR (3 DOWNTO 0) := (others => '0');
   SIGNAL PIO	:	STD_LOGIC_VECTOR (67 DOWNTO 0) := (others => '0');
   SIGNAL PS2D	:	STD_LOGIC := '0';
   SIGNAL PS2C	:	STD_LOGIC := '0';
   SIGNAL clk	:	STD_LOGIC := '0';
   SIGNAL led	:	STD_LOGIC_VECTOR (7 DOWNTO 0) := (others => '0');
   SIGNAL dp	:	STD_LOGIC := '0';
   SIGNAL an	:	STD_LOGIC_VECTOR (3 DOWNTO 0) := (others => '0');
   SIGNAL seg	:	STD_LOGIC_VECTOR (6 DOWNTO 0) := (others => '0');

	-- Clock period definitions
	constant i_clk_period : time := 20 ns;
	constant i_clkusb_period : time := 20 ns;

BEGIN

   UUT: DemoWithMemCfg PORT MAP(
		EppDstb => EppDstb, 
		EppAstb => EppAstb, 
		HSYNC => HSYNC, 
		VSYNC => VSYNC, 
		vgaBlue => vgaBlue, 
		vgaRed => vgaRed, 
		vgaGreen => vgaGreen, 
		RamCS => RamCS, 
		FlashCS => FlashCS, 
		MemWr => MemWr, 
		MemOe => MemOe, 
		RamUB => RamUB, 
		RamLB => RamLB, 
		RamCre => RamCre, 
		RamAdv => RamAdv, 
		RamClk => RamClk, 
		RamWait => RamWait, 
		FlashRp => FlashRp, 
		FlashStSts => FlashStSts, 
		MemAdr => MemAdr, 
		MemDB => MemDB, 
		UsbDir => UsbDir, 
		UsbAdr => UsbAdr, 
		UsbPktEnd => UsbPktEnd, 
		UsbWr => UsbWr, 
		UsbOe => UsbOe, 
		UsbClk => clk, 
		EppWait => EppWait, 
		UsbDB => UsbDB, 
		UsbMode => UsbMode, 
		UsbFlag => UsbFlag, 
		RsRx => RsRx, 
		RsTx => RsTx, 
		sw => sw, 
		btn => btn, 
		PIO => PIO, 
		PS2D => PS2D, 
		PS2C => PS2C, 
		clk => clk, 
		led => led, 
		dp => dp, 
		an => an, 
		seg => seg
   );

	-- Clock process definitions
	i_clk_process :process
	begin
		clk <= '0';
		wait for i_clk_period/2;
		clk <= '1';
		wait for i_clk_period/2;
	end process;
i_clkusb_process :process
	begin
		usbclk <= '0';
		wait for i_clkusb_period/2;
		usbclk <= '1';
		wait for i_clkusb_period/2;
	end process;

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
	usbmode <= '1';
	eppastb <= '1';
	eppdstb <= '1';
	wait for i_clk_period;
	eppastb <= '0';
	eppdstb <= '0';
	usbDB <= "00000111";
	wait for i_clk_period;
	usbmode <= '0';
	wait for i_clk_period;
	usbmode <= '1';
	eppdstb <= '0';
	eppastb <= '0';
	wait for i_clk_period;
	eppdstb <= '1';
	eppastb <= '1';
	wait for i_clk_period;
	eppdstb <= '0';
	eppastb <= '0';
	wait for i_clk_period;
	eppdstb <= '1';
	eppastb <= '1';
	WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
