--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:44:24 12/05/2020
-- Design Name:   
-- Module Name:   /home/user/workspace/nexys2bist1200/tb_mem_test.vhd
-- Project Name:  nexys2bist1200
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: NexysOnBoardMemTest
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_mem_test IS
END tb_mem_test;
 
ARCHITECTURE behavior OF tb_mem_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT NexysOnBoardMemTest
    PORT(
         clk : IN  std_logic;
         HandShakeReqOut : OUT  std_logic;
         ctlMsmStartIn : IN  std_logic;
         ctlMsmDoneOut : OUT  std_logic;
         ctlMsmDwrIn : IN  std_logic;
         ctlEppRdCycleIn : IN  std_logic;
         EppRdDataOut : OUT  std_logic_vector(7 downto 0);
         EppWrDataIn : IN  std_logic_vector(7 downto 0);
         regEppAdrIn : IN  std_logic_vector(7 downto 0);
         ComponentSelect : IN  std_logic;
         MemDB : INOUT  std_logic_vector(15 downto 0);
         MemAdr : OUT  std_logic_vector(23 downto 1);
         FlashByte : OUT  std_logic;
         RamCS : OUT  std_logic;
         FlashCS : OUT  std_logic;
         MemWR : OUT  std_logic;
         MemOE : OUT  std_logic;
         RamUB : OUT  std_logic;
         RamLB : OUT  std_logic;
         RamCre : OUT  std_logic;
         RamAdv : OUT  std_logic;
         RamClk : OUT  std_logic;
         RamWait : IN  std_logic;
         FlashRp : OUT  std_logic;
         FlashStSts : IN  std_logic;
         TestCtrlEnabled : OUT  std_logic;
         seg : OUT  std_logic_vector(6 downto 0);
         an : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal ctlMsmStartIn : std_logic := '0';
   signal ctlMsmDwrIn : std_logic := '0';
   signal ctlEppRdCycleIn : std_logic := '0';
   signal EppWrDataIn : std_logic_vector(7 downto 0) := (others => '0');
   signal regEppAdrIn : std_logic_vector(7 downto 0) := (others => '0');
   signal ComponentSelect : std_logic := '0';
   signal RamWait : std_logic := '0';
   signal FlashStSts : std_logic := '0';

	--BiDirs
   signal MemDB : std_logic_vector(15 downto 0);

 	--Outputs
   signal HandShakeReqOut : std_logic;
   signal ctlMsmDoneOut : std_logic;
   signal EppRdDataOut : std_logic_vector(7 downto 0);
   signal MemAdr : std_logic_vector(23 downto 1);
   signal FlashByte : std_logic;
   signal RamCS : std_logic;
   signal FlashCS : std_logic;
   signal MemWR : std_logic;
   signal MemOE : std_logic;
   signal RamUB : std_logic;
   signal RamLB : std_logic;
   signal RamCre : std_logic;
   signal RamAdv : std_logic;
   signal RamClk : std_logic;
   signal FlashRp : std_logic;
   signal TestCtrlEnabled : std_logic;
   signal seg : std_logic_vector(6 downto 0);
   signal an : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
   constant RamClk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: NexysOnBoardMemTest PORT MAP (
          clk => clk,
          HandShakeReqOut => HandShakeReqOut,
          ctlMsmStartIn => ctlMsmStartIn,
          ctlMsmDoneOut => ctlMsmDoneOut,
          ctlMsmDwrIn => ctlMsmDwrIn,
          ctlEppRdCycleIn => ctlEppRdCycleIn,
          EppRdDataOut => EppRdDataOut,
          EppWrDataIn => EppWrDataIn,
          regEppAdrIn => regEppAdrIn,
          ComponentSelect => ComponentSelect,
          MemDB => MemDB,
          MemAdr => MemAdr,
          FlashByte => FlashByte,
          RamCS => RamCS,
          FlashCS => FlashCS,
          MemWR => MemWR,
          MemOE => MemOE,
          RamUB => RamUB,
          RamLB => RamLB,
          RamCre => RamCre,
          RamAdv => RamAdv,
          RamClk => RamClk,
          RamWait => RamWait,
          FlashRp => FlashRp,
          FlashStSts => FlashStSts,
          TestCtrlEnabled => TestCtrlEnabled,
          seg => seg,
          an => an
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
   --RamClk_process :process
   --begin
		--RamClk <= '0';
		--wait for RamClk_period/2;
		--RamClk <= '1';
		--wait for RamClk_period/2;
   --end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
ComponentSelect <= '1';
--EppWrDataIn <= "00000111";
regEppAdrIn <= "11111111";
--ctlMsmStartIn <= '1';
--ctlMsmDwrIn <= '1';
--ctlEppRdCycleIn <= '1';

      -- insert stimulus here 

      wait;
   end process;

END;
