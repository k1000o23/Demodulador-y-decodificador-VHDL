--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:02:16 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Camilo/IdeaProjects/CELT_17/gen_reloj_tb.vhd
-- Project Name:  CELT_17
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: gen_reloj
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
 
ENTITY gen_reloj_tb IS
END gen_reloj_tb;
 
ARCHITECTURE behavior OF gen_reloj_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT gen_reloj
    PORT(
         CLK : IN  std_logic;
         CLK_M : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';

 	--Outputs
   signal CLK_M : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: gen_reloj PORT MAP (
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK_M <= NOT CLK_M;
      wait for CLK_period*10;
		CLK <= NOT CLK;
      wait for CLK_period*10;

CLK <= NOT CLK;
      wait for CLK_period*10;

CLK <= NOT CLK;
      wait for CLK_period*10;

CLK <= NOT CLK;
      wait for CLK_period*10;



      -- insert stimulus here 

      wait;
   end process;

END;
