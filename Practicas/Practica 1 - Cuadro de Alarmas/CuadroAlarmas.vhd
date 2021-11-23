library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity EntCuadroAlarmas is
	port(	a,b,c,d,sel,ref: in std_logic_vector(1 downto 0);
			z: out std_logic_vector (1 downto 0);
		display: out std_logic_vector(6 downto 0));
end;

architecture ArqCuadroAlarmas of EntCuadroAlarmas is
	
	signal dato: std_logic_vector (1 downto 0);

begin
	with sel select
		dato <= a when "00",		
				b when "01",	
				c when "10",	
				d when others;
	
		z <= dato;

	process (dato,ref)
	begin
		if (dato > ref)then display <= "0000111";
		elsif (dato < ref)then display <= "0110001";
		else display <= "0110111";
		end if;
	end process;

end ArqCuadroAlarmas;
