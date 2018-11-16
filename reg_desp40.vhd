library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reg_desp40 is
 Port ( SIN : in STD_LOGIC; -- Datos de entrada serie
 CLK : in STD_LOGIC; -- Reloj
 Q : out STD_LOGIC_VECTOR (39 downto 0)); -- Salida paralelo
end reg_desp40;

architecture a_reg_desp40 of reg_desp40 is
signal content: std_logic_vector(39 downto 0);
begin
process(CLK)
begin
if (rising_edge(CLK)) then

content <= SIN & content(39 downto 1);-- desplazamiento derecha    ¿¿ DOWONTO 1 o 0 ??
--y rellena a la izqda con bits
--entrada Serial_in
-----------------------------------ver pagina 15 manual tarjeta basy ----------------
----------------------------------- como usar las señales auxiliares-----------------
end if;
end process;
Q <= content;

end a_reg_desp40;
