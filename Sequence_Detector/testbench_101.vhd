LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Trial_Run IS
END Trial_Run;
 
ARCHITECTURE behavior OF Trial_Run IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Trial
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         x : IN  std_logic;
         z : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal x : std_logic := '0';

 	--Outputs
   signal z : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Trial PORT MAP (
          clk => clk,
          reset => reset,
          x => x,
          z => z
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
