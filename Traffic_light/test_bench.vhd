LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY bench IS
END bench;
 
ARCHITECTURE behavior OF bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT recovery
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         x0 : IN  std_logic;
         x1 : IN  std_logic;
         x2 : IN  std_logic;
         x3 : IN  std_logic;
         seq0 : OUT  std_logic_vector(3 downto 0);
         seq1 : OUT  std_logic_vector(3 downto 0);
         seq2 : OUT  std_logic_vector(3 downto 0);
         seq3 : OUT  std_logic_vector(3 downto 0);
         r0 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal x0 : std_logic := '0';
   signal x1 : std_logic := '0';
   signal x2 : std_logic := '0';
   signal x3 : std_logic := '0';

 	--Outputs
   signal seq0 : std_logic_vector(3 downto 0);
   signal seq1 : std_logic_vector(3 downto 0);
   signal seq2 : std_logic_vector(3 downto 0);
   signal seq3 : std_logic_vector(3 downto 0);
   signal r0 : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: recovery PORT MAP (
          clk => clk,
          reset => reset,
          x0 => x0,
          x1 => x1,
          x2 => x2,
          x3 => x3,
          seq0 => seq0,
          seq1 => seq1,
          seq2 => seq2,
          seq3 => seq3,
          r0 => r0
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
