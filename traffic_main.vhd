library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity recovery is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  x0,x1,x2,x3: in  STD_LOGIC;
			  seq0,seq1,seq2,seq3: out STD_LOGIC_VECTOR(3 downto 0);
			  signal timer:unsigned (16 downto 0);
			  signal tick: STD_LOGIC;
           r0: out  STD_LOGIC);
end recovery;

architecture RTL of recovery is
	TYPE STATE_TYPE IS (s0,s1,s2,s3,s0t,s1t,s2t,s3t);
	SIGNAL STATE:STATE_TYPE;
	signal countmain: integer range 0 to 16;
	signal count0t: integer range 0 to 4;
	signal tra: boolean:= false; 
begin
	process (clk,reset,x0,x1,x2,x3)
begin

if (reset = '1') then
	seq0 <= "1000";
	seq1 <= "1000";
	seq2 <= "1000";
	seq3 <= "1000";
	
elsif rising_edge(clk) then
	CASE state is
		when s0=>
			if x0='0'and tra = false then
				state <= s1 ;
			else
				seq0 <= "0101";
				seq1 <= "1000";
				seq2 <= "1001";
				seq3 <= "1000";
				countmain <=0;
				if countmain <= 13 then
					countmain <= countmain+1;
					tra <= true;
					state<=s0;
				else			
					countmain <= 0;
					tra <= false;
					count0t <=0;
					state<=s0t;
				end if;
			end if;


		when s0t=>
			seq0 <= "0011";
			seq1 <= "0010";
			seq2 <= "0001";
			seq3 <= "0000";
			if count0t <= 3 then
				count0t <= count0t+1;
				state <= s0t;
			else			
				count0t <=0;
				state<=s1;
			end if;
			
		When s1=>
			if x1='0' and tra = false then
				state<=s2;
			else
				seq0 <= "1000";
				seq1 <= "0101";
				seq2 <= "1000";
				seq3 <= "1001";
				countmain <=0;
				if countmain <= 6 then
					countmain <= countmain+1;
					tra <= true;
					state<=s1;
				else			
					countmain <=0;
					tra <= false;
					count0t <=0;
					state<=s1t;
				end if;
			end if;
	
		when s1t=>
			seq0 <= "0000";
			seq1 <= "0011";
			seq2 <= "0010";
			seq3 <= "0001";
			if count0t <= 3 then
				count0t <= count0t+1;
				state <= s1t;
			else			
				count0t <=0;
				state<=s2;
			end if;

		when s2=>
			if x2='0' and tra = false then
				state<=s3;
			else
				seq0 <= "1001";
				seq1 <= "1000";
				seq2 <= "0101";
				seq3 <= "1000";
				countmain <=0;
				if countmain <= 3 then
					countmain <= countmain+1;
					tra <= true;
					state<=s2;
				else			
					countmain <=0;
					tra <= false;
					count0t <=0;	
					state<=s2t;
				end if;
			end if;
	
		when s2t=>
			seq0 <= "0001";
			seq1 <= "0000";
			seq2 <= "0011";
			seq3 <= "0010";
			if count0t <= 3 then
				count0t <= count0t+1;
				state <= s2t;
			else			
				count0t <=0;
				state<=s3;
			end if;
	
		when s3=>
			if x3='0' and tra = false then
				state<=s0;
			else
				seq0 <= "1000";
				seq1 <= "1001";
				seq2 <= "1000";
				seq3 <= "0101";
				countmain <=0;
				if countmain <= 8 then
					countmain <= countmain+1;
					tra <= true;
					state<=s3;
				else			
					countmain <=0;
					tra <= false;
					count0t <=0;
					state<=s3t;
				end if;
			end if;			
		when s3t=>
			seq0 <= "0010";
			seq1 <= "0001";
			seq2 <= "0000";
			seq3 <= "0011";
			if count0t <= 3 then
				count0t <= count0t+1;
				state <= s3t;
			else			
				count0t <=0;
				tra <= false;
				state<=s0;
			end if;	
end case;
end if;
end process;

end RTL;

