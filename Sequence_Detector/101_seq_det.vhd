library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Trial is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           x : in  STD_LOGIC;
           z : out  STD_LOGIC);
end Trial;

architecture rtl of Trial is
TYPE state_type is (A,B,C,D);
SIGNAL STATE: STATE_TYPE;
begin
	process(clk, reset)
begin	
	if(reset='1') then
		state <= A;
	elsif rising_edge(clk) then
		CASE state is
		
		
			when A=>
				if x='1' then
					state<= B;
				else
					state<=A;
				end if;
		
		
			when B=>
				if x='0' then
					state<=C;
				end if;
			
		
		
			when C=>
				if x='1' then
					state<=D;
				else
					state<=A;
				end if;
		
		
		
			when D=>
				if x='1' then
					state<=B;
				else
					state<=A;
				end if;
		
		
		end case;
	end if;
end process;
z<='1' when state = D	else '0';
end rtl;
