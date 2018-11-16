library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity visualizacion is
		Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 0
		E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 1
		E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 2
		E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 3
		CLK : in STD_LOGIC; -- Entrada de reloj
		SEG7 : out STD_LOGIC_VECTOR (0 to 6); -- Salida para los displays
		AN : out STD_LOGIC_VECTOR (3 downto 0)); -- Activación individual
end visualizacion;

architecture a_visualizacion of visualizacion is


-------------------------------------------------------
-------------------------------------------------------
signal s: std_logic_vector(1 downto 0);  -- "s" minuscula
signal aux: std_logic_vector(3 downto 0); -- conectar mux con decod7s
-------------------------------------------------------
-------------------------------------------------------

component MUX4x4
		Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 0
		E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 1
		E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 2
		E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada 3
		S : in STD_LOGIC_VECTOR (1 downto 0); -- Señal de control
		Y : out STD_LOGIC_VECTOR (3 downto 0)); -- Salida
end component;

component decod7s
		Port ( D : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada BCD
		S : out STD_LOGIC_VECTOR (0 to 6)); -- Salida para excitar los
--displays
end component;

component refresco
		Port ( CLK : in STD_LOGIC; -- reloj
		S : out STD_LOGIC_VECTOR (1 downto 0); -- Control para el mux
		AN : out STD_LOGIC_VECTOR (3 downto 0)); -- Control displays
--individuales
end component;

begin


-------------------------------------------------------
-------------------------------------------------------
U1 : MUX4x4 port map (E0,E1,E2,E3,s,aux);
U2 : decod7s port map (aux,SEG7);
U3 : refresco port map (CLK,s, AN);
-------------------------------------------------------
-------------------------------------------------------


end a_visualizacion;
