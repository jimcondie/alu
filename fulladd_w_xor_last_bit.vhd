--last bit uses processed cin (c_in_p) for last carry out,
-- so that if carry in is disabled there won't be a carry out.
--This is only done for last bit, as it adds propogation delay


LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

entity fulladd_w_xor_last_bit is
PORT ( Cin, x, y , c_in_en: IN STD_LOGIC ;
		s,Cout: OUT STD_LOGIC ) ;
end fulladd_w_xor_last_bit;
	


ARCHITECTURE LogicFunc OF fulladd_w_xor_last_bit IS
signal c_in_p:  std_logic;
BEGIN

c_in_p<=Cin AND c_in_en;
s <= x XOR y XOR c_in_p;
Cout <= ((x AND y) OR (Cin AND x) OR (Cin AND y)) AND c_in_en ;

END LogicFunc ;