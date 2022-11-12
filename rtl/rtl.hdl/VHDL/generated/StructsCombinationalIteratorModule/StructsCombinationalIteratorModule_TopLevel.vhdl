-- PLEASE READ THIS, IT MAY SAVE YOU SOME TIME AND MONEY, THANK YOU!
-- * This file was generated by Quokka FPGA Toolkit.
-- * Generated code is your property, do whatever you want with it
-- * Place custom code between [BEGIN USER ***] and [END USER ***].
-- * CAUTION: All code outside of [USER] scope is subject to regeneration.
-- * Bad things happen sometimes in developer's life,
--   it is recommended to use source control management software (e.g. git, bzr etc) to keep your custom code safe'n'sound.
-- * Internal structure of code is subject to change.
--   You can use some of signals in custom code, but most likely they will not exist in future (e.g. will get shorter or gone completely)
-- * Please send your feedback, comments, improvement ideas etc. to evmuryshkin@gmail.com
-- * Visit https://github.com/EvgenyMuryshkin/QuokkaEvaluation to access latest version of playground
--
-- DISCLAIMER:
--   Code comes AS-IS, it is your responsibility to make sure it is working as expected
--   no responsibility will be taken for any loss or damage caused by use of Quokka toolkit.
--
-- System configuration name is StructsCombinationalIteratorModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity StructsCombinationalIteratorModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		i1_a : in unsigned (3 downto 0);
		i1_b : in unsigned (3 downto 0);
		i2_a : in unsigned (3 downto 0);
		i2_b : in unsigned (3 downto 0);
		store : in std_logic;
		addr : in unsigned (1 downto 0);
		s1 : in signed (7 downto 0);
		s2 : in signed (7 downto 0);
		sOut : out signed (15 downto 0);
		sByte : out signed (7 downto 0);
		sStruct0_a : out unsigned (11 downto 0);
		sStruct0_b : out unsigned (11 downto 0);
		sStruct1_a : out unsigned (11 downto 0);
		sStruct1_b : out unsigned (11 downto 0);
		sStruct2_a : out unsigned (11 downto 0);
		sStruct2_b : out unsigned (11 downto 0);
		sStruct3_a : out unsigned (11 downto 0);
		sStruct3_b : out unsigned (11 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of StructsCombinationalIteratorModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	signal Inputs_i1_a : unsigned(3 downto 0) := (others => '0');
	signal Inputs_i1_b : unsigned(3 downto 0) := (others => '0');
	signal Inputs_i2_a : unsigned(3 downto 0) := (others => '0');
	signal Inputs_i2_b : unsigned(3 downto 0) := (others => '0');
	signal Inputs_store : std_logic := '0';
	signal Inputs_addr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_s1 : signed(7 downto 0) := (others => '0');
	signal Inputs_s2 : signed(7 downto 0) := (others => '0');
	signal State_i1Default : unsigned(7 downto 0) := "00000000";
	signal State_i2Default : unsigned(7 downto 0) := "00000000";
	signal State_oDefault : unsigned(23 downto 0) := "000000000000000000000000";
	signal StructsCombinationalIteratorModule_L64F30T60_Cast : signed(15 downto 0) := (others => '0');
	signal StructsCombinationalIteratorModule_L65F31T61_Cast : signed(7 downto 0) := (others => '0');
	signal StructsCombinationalIteratorModule_L64F38T59_Expr : signed(15 downto 0) := "0000000000000000";
	signal StructsCombinationalIteratorModule_L64F38T59_Expr_1 : signed(15 downto 0) := "0000000000000000";
	signal StructsCombinationalIteratorModule_L64F38T59_Expr_2 : signed(15 downto 0) := "0000000000000000";
	signal StructsCombinationalIteratorModule_L65F39T60_Expr : signed(15 downto 0) := "0000000000000000";
	signal StructsCombinationalIteratorModule_L65F39T60_Expr_1 : signed(15 downto 0) := "0000000000000000";
	signal StructsCombinationalIteratorModule_L65F39T60_Expr_2 : signed(15 downto 0) := "0000000000000000";
	type State_i1Array is array (0 to 3) of unsigned (7 downto 0);
	signal State_i1 : State_i1Array := (others => (others => '0'));
	type NextState_i1Array is array (0 to 3) of unsigned (7 downto 0);
	signal NextState_i1 : NextState_i1Array := (others => (others => '0'));
	type State_i2Array is array (0 to 3) of unsigned (7 downto 0);
	signal State_i2 : State_i2Array := (others => (others => '0'));
	type NextState_i2Array is array (0 to 3) of unsigned (7 downto 0);
	signal NextState_i2 : NextState_i2Array := (others => (others => '0'));
	type State_oArray is array (0 to 3) of unsigned (23 downto 0);
	signal State_o : State_oArray := (others => (others => '0'));
	type NextState_oArray is array (0 to 3) of unsigned (23 downto 0);
	signal NextState_o : NextState_oArray := (others => (others => '0'));
begin
	process (Clock, NextState_i1, Reset, State_i1Default)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for State_i1_Iterator in 0 to 3 loop
					State_i1(State_i1_Iterator) <= State_i1Default;
				end loop;
			else
				for State_i1_Iterator in 0 to 3 loop
					State_i1(State_i1_Iterator) <= NextState_i1(State_i1_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (Clock, NextState_i2, Reset, State_i2Default)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for State_i2_Iterator in 0 to 3 loop
					State_i2(State_i2_Iterator) <= State_i2Default;
				end loop;
			else
				for State_i2_Iterator in 0 to 3 loop
					State_i2(State_i2_Iterator) <= NextState_i2(State_i2_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (Clock, NextState_o, Reset, State_oDefault)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for State_o_Iterator in 0 to 3 loop
					State_o(State_o_Iterator) <= State_oDefault;
				end loop;
			else
				for State_o_Iterator in 0 to 3 loop
					State_o(State_o_Iterator) <= NextState_o(State_o_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (StructsCombinationalIteratorModule_L64F38T59_Expr_1, StructsCombinationalIteratorModule_L64F38T59_Expr_2)
	begin
		StructsCombinationalIteratorModule_L64F38T59_Expr <= resize(signed(signed(resize(StructsCombinationalIteratorModule_L64F38T59_Expr_1, StructsCombinationalIteratorModule_L64F38T59_Expr_1'length + 1)) * signed(resize(StructsCombinationalIteratorModule_L64F38T59_Expr_2, StructsCombinationalIteratorModule_L64F38T59_Expr_2'length + 1))), StructsCombinationalIteratorModule_L64F38T59_Expr'length);
	end process;
	process (StructsCombinationalIteratorModule_L65F39T60_Expr_1, StructsCombinationalIteratorModule_L65F39T60_Expr_2)
	begin
		StructsCombinationalIteratorModule_L65F39T60_Expr <= resize(signed(signed(resize(StructsCombinationalIteratorModule_L65F39T60_Expr_1, StructsCombinationalIteratorModule_L65F39T60_Expr_1'length + 1)) * signed(resize(StructsCombinationalIteratorModule_L65F39T60_Expr_2, StructsCombinationalIteratorModule_L65F39T60_Expr_2'length + 1))), StructsCombinationalIteratorModule_L65F39T60_Expr'length);
	end process;
	process (Inputs_i1_a, Inputs_i1_b, Inputs_i2_a, Inputs_i2_b, Inputs_store, State_i1, State_i2, State_o)
	begin
		for NextState_o_Iterator in 0 to 3 loop
			NextState_o(NextState_o_Iterator) <= State_o(NextState_o_Iterator);
		end loop;
		for NextState_i2_Iterator in 0 to 3 loop
			NextState_i2(NextState_i2_Iterator) <= State_i2(NextState_i2_Iterator);
		end loop;
		for NextState_i1_Iterator in 0 to 3 loop
			NextState_i1(NextState_i1_Iterator) <= State_i1(NextState_i1_Iterator);
		end loop;
		if Inputs_store = '1' then
			NextState_i1(TO_INTEGER(Inputs_addr))(7 downto 4) <= Inputs_i1_b;
			NextState_i1(TO_INTEGER(Inputs_addr))(3 downto 0) <= Inputs_i1_a;
			NextState_i2(TO_INTEGER(Inputs_addr))(7 downto 4) <= Inputs_i2_b;
			NextState_i2(TO_INTEGER(Inputs_addr))(3 downto 0) <= Inputs_i2_a;
		else
			for i in 0 to 3 loop
				NextState_o(i)(11 downto 0) <= unsigned(((resize(signed(State_i1(i)(3 downto 0)), 6)) * (resize(signed(State_i2(i)(3 downto 0)), 6))));
				NextState_o(i)(23 downto 12) <= unsigned(((resize(unsigned(State_i1(i)(7 downto 4)), 6)) * (resize(unsigned(State_i2(i)(7 downto 4)), 6))));
			end loop;
		end if;
	end process;
	process (addr, i1_a, i1_b, i2_a, i2_b, Inputs_s1, Inputs_s2, s1, s2, State_o, store, StructsCombinationalIteratorModule_L64F30T60_Cast, StructsCombinationalIteratorModule_L64F38T59_Expr, StructsCombinationalIteratorModule_L65F31T61_Cast, StructsCombinationalIteratorModule_L65F39T60_Expr)
	begin
		StructsCombinationalIteratorModule_L64F38T59_Expr_1(15 downto 8) <= (others => Inputs_s1(7));
		StructsCombinationalIteratorModule_L64F38T59_Expr_1(7 downto 0) <= Inputs_s1;
		StructsCombinationalIteratorModule_L64F38T59_Expr_2(15 downto 8) <= (others => Inputs_s2(7));
		StructsCombinationalIteratorModule_L64F38T59_Expr_2(7 downto 0) <= Inputs_s2;
		StructsCombinationalIteratorModule_L65F39T60_Expr_1(15 downto 8) <= (others => Inputs_s1(7));
		StructsCombinationalIteratorModule_L65F39T60_Expr_1(7 downto 0) <= Inputs_s1;
		StructsCombinationalIteratorModule_L65F39T60_Expr_2(15 downto 8) <= (others => Inputs_s2(7));
		StructsCombinationalIteratorModule_L65F39T60_Expr_2(7 downto 0) <= Inputs_s2;
		Inputs_i1_a <= i1_a;
		Inputs_i1_b <= i1_b;
		Inputs_i2_a <= i2_a;
		Inputs_i2_b <= i2_b;
		Inputs_store <= store;
		Inputs_addr <= addr;
		Inputs_s1 <= s1;
		Inputs_s2 <= s2;
		StructsCombinationalIteratorModule_L64F30T60_Cast <= StructsCombinationalIteratorModule_L64F38T59_Expr;
		sOut <= StructsCombinationalIteratorModule_L64F30T60_Cast;
		StructsCombinationalIteratorModule_L65F31T61_Cast <= StructsCombinationalIteratorModule_L65F39T60_Expr(7 downto 0);
		sByte <= StructsCombinationalIteratorModule_L65F31T61_Cast;
		sStruct0_a <= State_o(0)(11 downto 0);
		sStruct0_b <= State_o(0)(23 downto 12);
		sStruct1_a <= State_o(1)(11 downto 0);
		sStruct1_b <= State_o(1)(23 downto 12);
		sStruct2_a <= State_o(2)(11 downto 0);
		sStruct2_b <= State_o(2)(23 downto 12);
		sStruct3_a <= State_o(3)(11 downto 0);
		sStruct3_b <= State_o(3)(23 downto 12);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
