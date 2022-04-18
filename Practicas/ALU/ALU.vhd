LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY EntAlu3Bits IS 	
	PORT(A: IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Entradas para los valores de A.
		 B: IN STD_LOGIC_VECTOR(2 DOWNTO 0); -- Entradas para los valores de B.
 		 OPER : IN STD_LOGIC_VECTOR(1 DOWNTO 0); -- Selector que indicara a la ALU la operacion que debe realizar.
	     RESULT : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ); -- Salida para el resultado de las operaciones realizadas		 
END EntAlu3Bits;

ARCHITECTURE ArqAlu3Bits OF EntAlu3Bits IS 
BEGIN

	-- Procedimiento para cada una de las operaciones segun el valor del selector "oper"
	PROCESS (A, B, OPER)
	BEGIN
		CASE OPER IS
			WHEN "00" =>
				RESULT <= STD_LOGIC_VECTOR('0' & A + B); -- SUMA 

			WHEN "01" =>
				RESULT <= STD_LOGIC_VECTOR('0' & A - B); -- RESTA 
			
			-- NOTA: SE CONCATENA UN CERO PARA QUE LAS DIMENSIONES DE LA SUMA Y RESTA DE VECTORES COINCIDAN.

			WHEN "10" => -- Operacion Logica AND
				RESULT(0) <= A(0) AND B(0);
				RESULT(1) <= A(1) AND B(1);
				RESULT(2) <= A(2) AND B(2);
				RESULT(3) <= '0';

			WHEN OTHERS => -- Operacion Logica OR
				RESULT(0) <= A(0) OR B(0);
				RESULT(1) <= A(1) OR B(1);
				RESULT(2) <= A(2) OR B(2);
				RESULT(3) <= '0';

		END CASE;
	END PROCESS;		
END ArqAlu3Bits;