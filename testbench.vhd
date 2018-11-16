--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:48:10 10/18/2017
-- Design Name:   
-- Module Name:   C:/Users/Camilo/IdeaProjects/CELT_17/testbench.vhd
-- Project Name:  CELT_17
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: principal
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
 
ENTITY testbench IS
END testbench;
 
ARCHITECTURE behavior OF testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT principal
    PORT(
         CLK : IN  std_logic;
         SIN : IN  std_logic;
         AN : OUT  std_logic_vector(3 downto 0);
         SEG7 : OUT  std_logic_vector(0 to 6)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal SIN : std_logic := '0';

 	--Outputs
   signal AN : std_logic_vector(3 downto 0);
   signal SEG7 : std_logic_vector(0 to 6);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: principal PORT MAP (
          CLK => CLK,
          SIN => SIN,
          AN => AN,
          SEG7 => SEG7
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
		AN <= "0000";
		SEG7 <= "0000000";
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;


		SIN <= not SIN;
		wait for CLK_period*10;
			SIN <= not SIN;
		wait for CLK_period*10;
			SIN <= not SIN;
		wait for CLK_period*10;
			SIN <= not SIN;
		wait for CLK_period*10;
			SIN <= not SIN;
		wait for CLK_period*10;
			SIN <= not SIN;
		wait for CLK_period*10;
			SIN <= not SIN;
		wait for CLK_period*10;
		
      -- insert stimulus here 

      wait;
   end process;

END;
