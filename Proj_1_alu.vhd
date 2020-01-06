--a 4-bit ALU
--functions include transfer, increment, add, subtract, XOR among others
--refer to project pdf for control bits

LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
USE work.proj_1_package.all ;

entity Proj_1_alu is
port ( S: in std_logic_vector (1 downto 0);
       A, B: in std_logic_vector (3 downto 0);
       C_in, clk: in std_logic;
       W: out std_logic_vector (3 downto 0);
       Cout: out std_logic
		);
end Proj_1_alu;

architecture Structure of Proj_1_alu is
    
	--wires of all inputs and outputs (to set into registers)
	signal	S_w:  std_logic_vector (1 downto 0);
	signal   A_w, B_w:  std_logic_vector (3 downto 0);
	signal   C_in_w:  std_logic;
	signal  W_w:  std_logic_vector (3 downto 0);
	signal  Cout_w:  std_logic;

	--control signals decoded from select bits
	signal Add_Sub, B_en, C_en, Overflow: std_logic;
    
	begin
	
	--all inputs go through DFF's to wires
	incoming0: d_flip_flop PORT MAP (clk, S(1), S_w(1));
	incoming1: d_flip_flop PORT MAP (clk, S(0), S_w(0));
	incoming2: d_flip_flop PORT MAP (clk, A(0), A_w(0));
	incoming3: d_flip_flop PORT MAP (clk, A(1), A_w(1));
	incoming4: d_flip_flop PORT MAP (clk, A(2), A_w(2));
	incoming5: d_flip_flop PORT MAP (clk, A(3), A_w(3));
	incoming6: d_flip_flop PORT MAP (clk, B(0), B_w(0));
	incoming7: d_flip_flop PORT MAP (clk, B(1), B_w(1));
	incoming8: d_flip_flop PORT MAP (clk, B(2), B_w(2));
	incoming9: d_flip_flop PORT MAP (clk, B(3), B_w(3));
	incoming10: d_flip_flop PORT MAP (clk, C_in, C_in_w);


		--select bits converted to control 
		Add_Sub <=S_w(1) and not(S_w(0));
		B_en <= S_w(1) or S_w(0);
		C_en <= (S_w(1)) nand S_w(0);
		
		--mainn ALU logic
		logic_circuit: add_sub_en PORT MAP (not(C_in_w), B_en, Add_Sub, C_en, A_w, B_w, W_w, Cout_w, Overflow);
	
	--all output wires go through DFF's falling edge to outputs	
	outgoing0: d_flip_flop_fall_edge PORT MAP (clk, (W_w(0)), W(0));
	outgoing1: d_flip_flop_fall_edge PORT MAP (clk, (W_w(1)), W(1));
	outgoing2: d_flip_flop_fall_edge PORT MAP (clk, (W_w(2)), W(2));
	outgoing3: d_flip_flop_fall_edge PORT MAP (clk, (W_w(3)), W(3));
	outgoing4: d_flip_flop_fall_edge PORT MAP (clk, Cout_w, Cout);

	end Structure;