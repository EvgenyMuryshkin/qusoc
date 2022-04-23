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
-- System configuration name is LoopModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity LoopModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		InData : in unsigned (7 downto 0);
		OutOr : out std_logic;
		OutAnd : out std_logic;
		OutXor : out std_logic;
		Encode : out unsigned (7 downto 0);
		EncodeInv : out unsigned (7 downto 0);
		OutTupleAddress : out unsigned (7 downto 0);
		OutTupleIsValid : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of LoopModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	constant LoopModule_L85F13L96T14_LoopModule_L86F32T37_Expr : std_logic := '0';
	constant LoopModule_L85F13L96T14_LoopModule_L87F31T32_Expr : std_logic := '0';
	constant LoopModule_L85F13L96T14_Inputs_InData_Size : unsigned(3 downto 0) := "1000";
	constant LoopModule_L16F13L23T14_Inputs_InData_Size : unsigned(3 downto 0) := "1000";
	constant LoopModule_L29F13L36T14_LoopModule_L30F31T35_Expr : std_logic := '1';
	constant LoopModule_L29F13L36T14_Inputs_InData_Size : unsigned(3 downto 0) := "1000";
	constant LoopModule_L42F13L49T14_Inputs_InData_Size : unsigned(3 downto 0) := "1000";
	constant LoopModule_L55F13L64T14_LoopModule_L56F31T32_Expr : std_logic := '0';
	constant LoopModule_L55F13L64T14_Inputs_InData_Size : unsigned(3 downto 0) := "1000";
	constant LoopModule_L70F13L79T14_LoopModule_L71F30T31_Expr : std_logic := '0';
	constant LoopModule_L70F13L79T14_Inputs_InData_Size : unsigned(3 downto 0) := "1000";
	signal Inputs_InData : unsigned(7 downto 0) := (others => '0');
	signal Tuple_Item1 : unsigned(7 downto 0) := (others => '0');
	signal Tuple_Item2 : std_logic := '0';
	signal LoopModule_L85F13L96T14_isValid : std_logic := '0';
	signal LoopModule_L85F13L96T14_result : unsigned(7 downto 0) := "00000000";
	signal LoopModule_L16F13L23T14_result : std_logic := '0';
	signal LoopModule_L29F13L36T14_result : std_logic := '1';
	signal LoopModule_L42F13L49T14_result : std_logic := '0';
	signal LoopModule_L55F13L64T14_result : unsigned(7 downto 0) := "00000000";
	signal LoopModule_L70F13L79T14_result : signed(31 downto 0) := "00000000000000000000000000000000";
	signal LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast : unsigned(7 downto 0) := (others => '0');
begin
	process (Inputs_InData)
		variable tmp0 : std_logic;
		variable tmp1 : unsigned(7 downto 0);
	begin
		LoopModule_L85F13L96T14_isValid <= LoopModule_L85F13L96T14_LoopModule_L86F32T37_Expr;
		LoopModule_L85F13L96T14_result(7 downto 1) <= (others => '0');
		LoopModule_L85F13L96T14_result(0) <= LoopModule_L85F13L96T14_LoopModule_L87F31T32_Expr;
		tmp0 := LoopModule_L85F13L96T14_LoopModule_L86F32T37_Expr;
		tmp1 := (0 => LoopModule_L85F13L96T14_LoopModule_L87F31T32_Expr, others => '0');
		for LoopModule_L85F13L96T14_idx in 0 to 7 loop
			tmp0 := tmp0 OR Inputs_InData(LoopModule_L85F13L96T14_idx);
			if Inputs_InData(LoopModule_L85F13L96T14_idx) = '1' then
				tmp1 := to_unsigned(LoopModule_L85F13L96T14_idx, 8);
			end if;
		end loop;
		LoopModule_L85F13L96T14_isValid <= tmp0;
		LoopModule_L85F13L96T14_result <= tmp1;
	end process;
	process (Inputs_InData)
		variable tmp0 : std_logic;
	begin
		LoopModule_L16F13L23T14_result <= Inputs_InData(0);
		tmp0 := Inputs_InData(0);
		for LoopModule_L16F13L23T14_idx in 1 to 7 loop
			tmp0 := tmp0 OR Inputs_InData(LoopModule_L16F13L23T14_idx);
		end loop;
		LoopModule_L16F13L23T14_result <= tmp0;
	end process;
	process (Inputs_InData)
		variable tmp0 : std_logic;
	begin
		LoopModule_L29F13L36T14_result <= LoopModule_L29F13L36T14_LoopModule_L30F31T35_Expr;
		tmp0 := LoopModule_L29F13L36T14_LoopModule_L30F31T35_Expr;
		for LoopModule_L29F13L36T14_idx in 0 to 7 loop
			tmp0 := tmp0 AND Inputs_InData(LoopModule_L29F13L36T14_idx);
		end loop;
		LoopModule_L29F13L36T14_result <= tmp0;
	end process;
	process (Inputs_InData)
		variable tmp0 : std_logic;
	begin
		LoopModule_L42F13L49T14_result <= Inputs_InData(0);
		tmp0 := Inputs_InData(0);
		for LoopModule_L42F13L49T14_idx in 1 to 7 loop
			tmp0 := tmp0 XOR Inputs_InData(LoopModule_L42F13L49T14_idx);
		end loop;
		LoopModule_L42F13L49T14_result <= tmp0;
	end process;
	process (Inputs_InData)
		variable tmp0 : unsigned(7 downto 0);
	begin
		LoopModule_L55F13L64T14_result(7 downto 1) <= (others => '0');
		LoopModule_L55F13L64T14_result(0) <= LoopModule_L55F13L64T14_LoopModule_L56F31T32_Expr;
		tmp0 := (0 => LoopModule_L55F13L64T14_LoopModule_L56F31T32_Expr, others => '0');
		for LoopModule_L55F13L64T14_idx in 0 to 7 loop
			if Inputs_InData(LoopModule_L55F13L64T14_idx) = '1' then
				tmp0 := to_unsigned(LoopModule_L55F13L64T14_idx, 8);
			end if;
		end loop;
		LoopModule_L55F13L64T14_result <= tmp0;
	end process;
	process (Inputs_InData)
		variable tmp0 : signed(31 downto 0);
	begin
		LoopModule_L70F13L79T14_result(31 downto 1) <= (others => '0');
		LoopModule_L70F13L79T14_result(0) <= LoopModule_L70F13L79T14_LoopModule_L71F30T31_Expr;
		tmp0 := (0 => LoopModule_L70F13L79T14_LoopModule_L71F30T31_Expr, others => '0');
		for LoopModule_L70F13L79T14_idx in 8 downto 1 loop
			if Inputs_InData(LoopModule_L70F13L79T14_idx - 1) = '1' then
				tmp0 := to_signed(LoopModule_L70F13L79T14_idx - 1, 32);
			end if;
		end loop;
		LoopModule_L70F13L79T14_result <= tmp0;
	end process;
	process (InData, LoopModule_L16F13L23T14_result, LoopModule_L29F13L36T14_result, LoopModule_L42F13L49T14_result, LoopModule_L55F13L64T14_result, LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast, LoopModule_L70F13L79T14_result, LoopModule_L85F13L96T14_isValid, LoopModule_L85F13L96T14_result, Tuple_Item1, Tuple_Item2)
	begin
		Inputs_InData <= InData;
		Tuple_Item1 <= LoopModule_L85F13L96T14_result;
		Tuple_Item2 <= LoopModule_L85F13L96T14_isValid;
		OutOr <= LoopModule_L16F13L23T14_result;
		OutAnd <= LoopModule_L29F13L36T14_result;
		OutXor <= LoopModule_L42F13L49T14_result;
		Encode <= LoopModule_L55F13L64T14_result;
		LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast <= unsigned(LoopModule_L70F13L79T14_result(7 downto 0));
		EncodeInv <= LoopModule_L70F13L79T14_LoopModule_L78F24T36_Cast;
		OutTupleAddress <= Tuple_Item1;
		OutTupleIsValid <= Tuple_Item2;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
