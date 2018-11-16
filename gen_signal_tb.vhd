--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:50:51 10/19/2017
-- Design Name:   
-- Module Name:   C:/Users/Camilo/IdeaProjects/CELT_17/gen_signal_tb.vhd
-- Project Name:  CELT_17
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gen_signal
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
 
ENTITY gen_signal_tb IS
END gen_signal_tb;
 
ARCHITECTURE behavior OF gen_signal_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gen_signal
    PORT(
         clk : IN  std_logic;
         sal_dig : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';

 	--Outputs
   signal sal_dig : std_logic;

   -- Clock period definitions
   constant clk_period : time := 200  ns ;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gen_signal PORT MAP (
          clk => clk,
          sal_dig => sal_dig
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
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
