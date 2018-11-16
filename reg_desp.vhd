library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_desp is
 Port ( SIN : in STD_LOGIC; -- Datos de entrada serie
 CLK : in STD_LOGIC; -- Reloj
 EN : in STD_LOGIC; -- Enable
 Q : out STD_LOGIC_VECTOR (13 downto 0)); -- Salida paralelo
end reg_desp;

architecture a_reg_desp of reg_desp is   
signal content: std_logic_vector(13 downto 0);
begin
process(CLK)
begin
if (EN = '1') then
	if(rising_edge(CLK)) then
		content <= SIN & content(13 downto 1);-- desplazamiento derecha  REPASAR!!!
--y rellena a la izqda con bits
--entrada Serial_in
	end if;
end if;
end process;
Q <= content;
end a_reg_desp;