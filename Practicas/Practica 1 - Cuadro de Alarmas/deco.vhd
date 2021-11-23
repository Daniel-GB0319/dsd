library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity EntDeco is
	port(	entry: in std_logic_vector(1 downto 0);
		display: out std_logic_vector(6 downto 0));
end;

architecture ArqDeco of EntDeco is

begin
	with entry select
		display <= "0000001" when "00",		
				"1001111" when "01",	
				"0010010" when "10",
				"0000110" when "11",
				"1111111" when others;
end ArqDeco;
