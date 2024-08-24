--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:59 12/04/2020
-- Design Name:   
-- Module Name:   /home/user/workspace/nexys2bist1200/tb_demo.vhd
-- Project Name:  DemoWithMemTestMemCfgSyncVgaPs2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Demo
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
 
ENTITY tb_demo IS
END tb_demo;
 
ARCHITECTURE behavior OF tb_demo IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Demo
    PORT(
         ck : IN  std_logic;
         btn : IN  std_logic_vector(3 downto 0);
         sw : IN  std_logic_vector(7 downto 0);
         led : OUT  std_logic_vector(7 downto 0);
         seg : OUT  std_logic_vector(6 downto 0);
         dp : OUT  std_logic;
         an : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal ck : std_logic := '0';
   signal btn : std_logic_vector(3 downto 0) := (others => '0');
   signal sw : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal led : std_logic_vector(7 downto 0);
   signal seg : std_logic_vector(6 downto 0);
   signal dp : std_logic;
   signal an : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Demo PORT MAP (
          ck => ck,
          btn => btn,
          sw => sw,
          led => led,
          seg => seg,
          dp => dp,
          an => an
        );

   -- Clock process definitions
   clk_process :process
   begin
		ck <= '0';
		wait for clk_period/2;
		ck <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
