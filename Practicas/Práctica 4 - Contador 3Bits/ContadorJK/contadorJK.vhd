LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY ContadorJK IS 
 PORT(CLK, CLR, C: IN STD_LOGIC;
      Q: INOUT STD_LOGIC_VECTOR (2 DOWNTO 0));
END ENTITY;

ARCHITECTURE A_ContadorJK OF ContadorJK IS 
SIGNAL J: STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL K: STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN
     PROCESS(C,Q)
	 BEGIN
	             J(2) <= NOT C AND NOT Q(2) AND Q(1) AND Q(0);
                       K(2) <= NOT C AND Q(2) AND Q(1) AND Q(0);
		  J(1) <= NOT C AND NOT Q(1) AND Q(0);
		  K(1) <= NOT C AND Q(1)AND Q(0);
		  J(0) <= NOT C AND NOT Q(0);
		  K(0) <= NOT C AND Q(0);
	 END PROCESS;

	 PROCESS(CLK, CLR)
	 BEGIN 
	 IF (CLR = '0')THEN
	   Q <= "000";
	 ELSIF(CLK'EVENT AND CLK='1')THEN
	   Q <= (NOT K AND Q) OR (J AND NOT Q);
	   END IF;
	 END PROCESS;
 END A_ContadorJK;
