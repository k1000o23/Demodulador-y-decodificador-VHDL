library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity registro is
 Port ( ENTRADA : in STD_LOGIC_VECTOR (13 downto 0); -- Entradas
 SALIDA : out STD_LOGIC_VECTOR (13 downto 0); -- Salidas
 EN : in STD_LOGIC; -- Enable
 CLK : in STD_LOGIC); -- Reloj
end registro;
architecture a_registro of registro is

--signal q : std_logic_vector(13 downto 0);

begin
process(CLK)
begin

if CLK'event and CLK='1' then
	if EN = '1' then
		SALIDA <= ENTRADA;
	end if;
end if;
end process;
end a_registro;

