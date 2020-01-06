LIBRARY ieee ;
USE ieee.std_logic_1164.all ;
	

PACKAGE proj_1_package IS

	component multiplexor_2_to_1 is
		PORT ( i_0, i_1, s : IN STD_LOGIC ;
				m : OUT STD_LOGIC ) ;
	end component multiplexor_2_to_1;
	
	component comparator_gt_9 is
		port( V : in std_logic_vector (3 downto 0);
		z: out std_logic	);
	end component comparator_gt_9;
	
	
	component first_digit_decoder is
		port (z : in std_logic;
		led : out std_logic_vector(0 to 6)
		);
	end component first_digit_decoder;
	
	component adder3 IS
		PORT (
				V: IN STD_LOGIC_VECTOR(2 DOWNTO 0) ;
				S : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
				) ;
	END component adder3 ;
	
	component adder4 is
		port (
			 Cin : IN STD_LOGIC ;
			X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			Cout : OUT STD_LOGIC ) ;
	end component adder4;
	
	component zeroth_digit_decoder is
		port ( m: in STD_LOGIC_VECTOR (3 downto 0);
			   L: out STD_LOGIC_VECTOR (0 to 6)
			   );
	end component zeroth_digit_decoder;
	
	
	component fulladd is
		PORT ( Cin, x, y : IN STD_LOGIC ;
				s, Cout : OUT STD_LOGIC ) ;
	end component fulladd;
	
	component fulladd_w_xor is
		PORT ( Cin, x, y , c_in_en: IN STD_LOGIC ;
		s,Cout: OUT STD_LOGIC ) ;
	end component fulladd_w_xor;
	
	
	component fulladd_w_xor_last_bit is
		PORT ( Cin, x, y , c_in_en: IN STD_LOGIC ;
		s,Cout: OUT STD_LOGIC ) ;
	end component fulladd_w_xor_last_bit;
	
	
	component half_adder is
		PORT (a, b : in std_logic;
			  s, c_o: out std_logic
			  );
	end component half_adder;
	
	component bin_to_dec_4_bit_local_hex is
		port(V : IN std_logic_vector(3 downto 0);
			d_1, d_0 : OUT std_logic_vector(0 to 6)
			);
	end component bin_to_dec_4_bit_local_hex;
	
	
	component adder_4_w_xor IS
	PORT ( Cin : IN STD_LOGIC ;
			X, Y : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			S, Ex_Or: OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			Cout : OUT STD_LOGIC ) ;
	END component adder_4_w_xor ;
	
	
	component add_sub_en IS
	PORT ( Cin, B_En, Add_Sub, C_in_en : IN STD_LOGIC ;
			A, B : IN STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			S : OUT STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			Cout : OUT STD_LOGIC ;
			Overflow: out std_logic) ;
	END component add_sub_en ;
	
	component d_flip_flop is 
		port ( clk, D: in std_logic;
				Q: out std_logic
				);
	end component d_flip_flop;
	
	component d_flip_flop_fall_edge is 
		port ( clk, D: in std_logic;
			   Q: out std_logic
			   );
	end component d_flip_flop_fall_edge;
	
		
		
END proj_1_package ;