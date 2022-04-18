library ieee;
use ieee.std_logic_1164.all;
entity decod is
	port(i: in std_logic_vector(1 downto 0);
    	e: in std_logic;
		s: out std_logic_vector(3 downto 0)
		);
end entity;

architecture a_decod of decod is
begin
process(i,e)
	begin
	if(e='0') then
		s <= "0000";
	else
		case i is
			when "00" => s <= "0001";
			when "01" => s <= "0010";
			when "10" => s <= "0100";
			when "11" => s <= "1000";
			when others => s <= "0000";
		end case;
	end if;
end process;
end architecture;
