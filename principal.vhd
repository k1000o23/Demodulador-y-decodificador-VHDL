library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity principal is
 Port ( CLK : in STD_LOGIC; -- entrada de reloj
 SIN : in STD_LOGIC; -- entrada de datos
 AN : out STD_LOGIC_VECTOR (3 downto 0); -- control de displays
 SEG7 : out STD_LOGIC_VECTOR (0 to 6)); -- segmentos de displays
end principal;

architecture a_principal of principal is
-- Constantes del circuito (umbrales de decisión)
constant UMBRAL1 : STD_LOGIC_VECTOR (5 downto 0) := "100010"; -- 34
constant UMBRAL2 : STD_LOGIC_VECTOR (5 downto 0) := "100110"; -- 38

-------------------------------------------------------------
-----------------GEN_RELOJ-----------------------------------
signal clk_m : std_logic;
 signal clk_vis : std_logic;
------------------------------------------------------------
--------------------reg_desp40------------------------------
signal reg40: std_logic_vector(39 downto 0); 
------------------------------------------------------------
------------------SUMADOR-----------------------------------
 signal sal: std_logic_vector(5 downto 0); 
 signal mayor1 : std_logic;
 signal menor1 : std_logic;
 signal mayor2 : std_logic;
 signal menor2 : std_logic;
 -----------------------------------------------------------
-----------------------AND_2--------------------------------
 signal suma : std_logic;
------------------------------------------------------------
-----------------------SUMADOR------------------------------
 signal dato : std_logic;
 signal captura : std_logic;
 signal validar : std_logic;
 ------------------------------------------------------------
------------------reg_desp-----------------------------------
 signal reg_out: std_logic_vector(13 downto 0);
-------------------------------------------------------------
--------------------registro---------------------------------
signal registro_out: std_logic_vector(13 downto 0);
-------------------------------------------------------------
--------------------visualizacion----------------------------
signal display: STD_LOGIC_VECTOR (6 downto 0); -- Salida para los displays
signal activa: STD_LOGIC_VECTOR (3 downto 0); -- Activación
-------------------------------------------------------------
-------------------------U1 y U2-----------------------------

signal registro4_out: std_logic_vector(3 downto 0):= "00" & registro_out(13 downto 12);---SOBRA

-------------------------------------------------------------
-------------------------------------------------------------

-------------------------------------------------------------
-------------------------------------------------------------
component gen_signal is							-------------------------------------------------------------
    Port ( clk : in  STD_LOGIC;
           sal_dig : out  STD_LOGIC);     -------------------------------------------------------------
end component;
-------------------------------------------------------------
-------------------------------------------------------------
signal prueba : std_logic;



component gen_reloj
		Port ( CLK : in STD_LOGIC; -- Reloj de la FPGA
		CLK_M : out STD_LOGIC ); -- Reloj de frecuencia dividida para
--visualización
end component;

component reg_desp40  --FOUND
		Port ( SIN : in STD_LOGIC; -- Datos de entrada serie
		CLK : in STD_LOGIC; -- Reloj
		Q : out STD_LOGIC_VECTOR (39 downto 0)); -- Salida paralelo
end component;

component sumador40  --FOUND
		Port ( ENT : in STD_LOGIC_VECTOR (39 downto 0);
		SAL : out STD_LOGIC_VECTOR (5 downto 0));
end component;

component comparador   -- ¿HAY 2?
		Port ( P : in STD_LOGIC_VECTOR (5 downto 0);
		Q : in STD_LOGIC_VECTOR (5 downto 0);
		PGTQ : out STD_LOGIC;
		PLEQ : out STD_LOGIC);
end component;

component AND_2  --FOUND
		Port ( A : in STD_LOGIC;
		B : in STD_LOGIC;
		S : out STD_LOGIC);
end component;

component reg_desp  --FOUND
		Port ( SIN : in STD_LOGIC; -- Datos de entrada serie
		CLK : in STD_LOGIC; -- Reloj
		EN : in STD_LOGIC; -- Enable
		Q : out STD_LOGIC_VECTOR (13 downto 0)); -- Salida paralelo
 end component;
 
component registro   --FOUND
		 Port ( ENTRADA : in STD_LOGIC_VECTOR (13 downto 0); -- Entradas
		SALIDA : out STD_LOGIC_VECTOR (13 downto 0); -- Salidas
		EN : in STD_LOGIC; -- Enable
		CLK : in STD_LOGIC); -- Reloj
end component;

component automata   --FOUND
		Port ( CLK : in STD_LOGIC; -- Reloj del autómata
		C0 : in STD_LOGIC; -- Condición de decision para "0"
		C1 : in STD_LOGIC; -- Condición de decisión para "1"
		DATO : out STD_LOGIC; -- Datos a cargar
		CAPTUR : out STD_LOGIC; -- Enable del reg. de desplaz.
		VALID : out STD_LOGIC); -- Activación registro
end component;

component visualizacion   --FOUND
		Port ( E0 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 0
		E1 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 1
		E2 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 2
		E3 : in STD_LOGIC_VECTOR (3 downto 0); -- Entrada MUX 3
		CLK : in STD_LOGIC; -- Entrada de reloj de refresco
		SEG7 : out STD_LOGIC_VECTOR (0 to 6); -- Salida para los displays
		AN : out STD_LOGIC_VECTOR (3 downto 0)); -- Activación
--individual
end component;

begin
U11 : gen_signal port map(clk_m, prueba); -- este lo dieron en moodle 18/10/17
U1 : gen_reloj port map(CLK, clk_m);
U2 : reg_desp40 port map(prueba, clk_m, reg40 );   -- LA ENTRADA ES SIM, "prueba" es para probar gen_signal
U3 : sumador40 port map(reg40,sal);
U4 : comparador port map(sal,UMBRAL1,mayor1,menor1);    -- U1??? 
U5 : comparador port map(sal,UMBRAL2,mayor2,menor2);    -- U2???
U6 : AND_2 port map(mayor1,menor2,suma);
U7 : reg_desp port map(dato, clk_m, captura, reg_out);
U8 : registro port map(reg_out, registro_out, validar, clk_m);
U9 : automata port map(clk_m, menor1,suma,dato,captura,validar);
U10 : visualizacion port map( registro4_out,
										registro_out(11 downto 8),
										registro_out(7 downto 4),
										registro_out(3 downto 0),
										clk_m, SEG7, AN);  -- 3 ultimpas, clk_vis, display, activa
										-- CLK por clk_m en U10????

end a_principal;
