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
-- System configuration name is StageStatePipelineModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity StageStatePipelineModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		inReady : in std_logic;
		inData0 : in unsigned (7 downto 0);
		inData1 : in unsigned (7 downto 0);
		inData2 : in unsigned (7 downto 0);
		inData3 : in unsigned (7 downto 0);
		inData4 : in unsigned (7 downto 0);
		inData5 : in unsigned (7 downto 0);
		inData6 : in unsigned (7 downto 0);
		inData7 : in unsigned (7 downto 0);
		outReady : out std_logic;
		outResult : out unsigned (15 downto 0);
		outS0Counter : out unsigned (15 downto 0);
		outS1Counter : out unsigned (15 downto 0);
		outS2Counter : out unsigned (15 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of StageStatePipelineModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant Pipeline_stage0_State_sumsDefault : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage1_State_sumsDefault : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_StageStatePipelineModule_L92F60T61_Expr : std_logic := '1';
	constant Pipeline_StageStatePipelineModule_L97F64T65_Expr : std_logic := '1';
	constant Pipeline_StageStatePipelineModule_L108F59T60_Expr : std_logic := '1';
	signal Inputs_inReady : std_logic := '0';
	signal Pipeline_stage0_NextState_S0Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_stage0_NextState_IsReady : std_logic := '0';
	signal Pipeline_stage1_NextState_S0Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_stage1_NextState_S1Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_stage1_NextState_IsReady : std_logic := '0';
	signal Pipeline_stage2_NextState_IsReady : std_logic := '0';
	signal Pipeline_stage2_NextState_result : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_stage2_NextState_S0Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_stage2_NextState_S1Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_stage2_NextState_S2Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_Inputs_inReady : std_logic := '0';
	signal Pipeline_State_IsReady : std_logic := '0';
	signal Pipeline_State_result : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_State_S0Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_State_S1Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_State_S2Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_NextState_IsReady : std_logic := '0';
	signal Pipeline_NextState_result : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_NextState_S0Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_NextState_S1Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_NextState_S2Counter : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L87F25T60_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L88F25T60_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L89F25T60_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L90F25T60_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L92F33T62_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L97F33T66_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L100F25T58_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L101F25T58_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L105F30T63_Cast : unsigned(15 downto 0) := (others => '0');
	signal Pipeline_StageStatePipelineModule_L108F33T61_Cast : unsigned(15 downto 0) := (others => '0');
	signal StageStatePipelineModule_L39F33T61_Cast : std_logic := '0';
	signal Pipeline_stage0_State_S0Counter : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage0_State_S0CounterDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_stage0_State_IsReady : std_logic := '0';
	constant Pipeline_stage0_State_IsReadyDefault : std_logic := '0';
	signal Pipeline_stage1_State_S0Counter : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage1_State_S0CounterDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_stage1_State_S1Counter : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage1_State_S1CounterDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_stage1_State_IsReady : std_logic := '0';
	constant Pipeline_stage1_State_IsReadyDefault : std_logic := '0';
	signal Pipeline_stage2_State_IsReady : std_logic := '0';
	constant Pipeline_stage2_State_IsReadyDefault : std_logic := '0';
	signal Pipeline_stage2_State_result : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage2_State_resultDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_stage2_State_S0Counter : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage2_State_S0CounterDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_stage2_State_S1Counter : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage2_State_S1CounterDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_stage2_State_S2Counter : unsigned(15 downto 0) := "0000000000000000";
	constant Pipeline_stage2_State_S2CounterDefault : unsigned(15 downto 0) := "0000000000000000";
	signal Pipeline_StageStatePipelineModule_L87F34T59_Expr : unsigned(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L87F34T59_Expr_1 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L87F34T59_Expr_2 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L88F34T59_Expr : unsigned(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L88F34T59_Expr_1 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L88F34T59_Expr_2 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L89F34T59_Expr : unsigned(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L89F34T59_Expr_1 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L89F34T59_Expr_2 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L90F34T59_Expr : unsigned(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L90F34T59_Expr_1 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L90F34T59_Expr_2 : signed(9 downto 0) := "0000000000";
	signal Pipeline_StageStatePipelineModule_L92F42T61_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L92F42T61_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L92F42T61_Expr_2 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L97F42T65_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L97F42T65_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L97F42T65_Expr_2 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L100F34T57_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L100F34T57_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L100F34T57_Expr_2 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L101F34T57_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L101F34T57_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L101F34T57_Expr_2 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L105F39T62_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L105F39T62_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L105F39T62_Expr_2 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L108F42T60_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L108F42T60_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal Pipeline_StageStatePipelineModule_L108F42T60_Expr_2 : signed(17 downto 0) := "000000000000000000";
	type Inputs_inDataArray is array (0 to 7) of unsigned (7 downto 0);
	signal Inputs_inData : Inputs_inDataArray := (others => (others => '0'));
	type Pipeline_stage0_State_sumsArray is array (0 to 3) of unsigned (15 downto 0);
	signal Pipeline_stage0_State_sums : Pipeline_stage0_State_sumsArray := (others => (others => '0'));
	type Pipeline_stage0_NextState_sumsArray is array (0 to 3) of unsigned (15 downto 0);
	signal Pipeline_stage0_NextState_sums : Pipeline_stage0_NextState_sumsArray := (others => (others => '0'));
	type Pipeline_stage1_State_sumsArray is array (0 to 1) of unsigned (15 downto 0);
	signal Pipeline_stage1_State_sums : Pipeline_stage1_State_sumsArray := (others => (others => '0'));
	type Pipeline_stage1_NextState_sumsArray is array (0 to 1) of unsigned (15 downto 0);
	signal Pipeline_stage1_NextState_sums : Pipeline_stage1_NextState_sumsArray := (others => (others => '0'));
	type Pipeline_Inputs_inDataArray is array (0 to 7) of unsigned (7 downto 0);
	signal Pipeline_Inputs_inData : Pipeline_Inputs_inDataArray := (others => (others => '0'));
begin
	process (Clock, Pipeline_stage0_NextState_IsReady, Pipeline_stage0_NextState_S0Counter, Pipeline_stage1_NextState_IsReady, Pipeline_stage1_NextState_S0Counter, Pipeline_stage1_NextState_S1Counter, Pipeline_stage2_NextState_IsReady, Pipeline_stage2_NextState_result, Pipeline_stage2_NextState_S0Counter, Pipeline_stage2_NextState_S1Counter, Pipeline_stage2_NextState_S2Counter, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				Pipeline_stage0_State_S0Counter <= Pipeline_stage0_State_S0CounterDefault;
				Pipeline_stage0_State_IsReady <= Pipeline_stage0_State_IsReadyDefault;
				Pipeline_stage1_State_S0Counter <= Pipeline_stage1_State_S0CounterDefault;
				Pipeline_stage1_State_S1Counter <= Pipeline_stage1_State_S1CounterDefault;
				Pipeline_stage1_State_IsReady <= Pipeline_stage1_State_IsReadyDefault;
				Pipeline_stage2_State_IsReady <= Pipeline_stage2_State_IsReadyDefault;
				Pipeline_stage2_State_result <= Pipeline_stage2_State_resultDefault;
				Pipeline_stage2_State_S0Counter <= Pipeline_stage2_State_S0CounterDefault;
				Pipeline_stage2_State_S1Counter <= Pipeline_stage2_State_S1CounterDefault;
				Pipeline_stage2_State_S2Counter <= Pipeline_stage2_State_S2CounterDefault;
			else
				Pipeline_stage0_State_S0Counter <= Pipeline_stage0_NextState_S0Counter;
				Pipeline_stage0_State_IsReady <= Pipeline_stage0_NextState_IsReady;
				Pipeline_stage1_State_S0Counter <= Pipeline_stage1_NextState_S0Counter;
				Pipeline_stage1_State_S1Counter <= Pipeline_stage1_NextState_S1Counter;
				Pipeline_stage1_State_IsReady <= Pipeline_stage1_NextState_IsReady;
				Pipeline_stage2_State_IsReady <= Pipeline_stage2_NextState_IsReady;
				Pipeline_stage2_State_result <= Pipeline_stage2_NextState_result;
				Pipeline_stage2_State_S0Counter <= Pipeline_stage2_NextState_S0Counter;
				Pipeline_stage2_State_S1Counter <= Pipeline_stage2_NextState_S1Counter;
				Pipeline_stage2_State_S2Counter <= Pipeline_stage2_NextState_S2Counter;
			end if;
		end if;
	end process;
	process (Clock, Pipeline_stage0_NextState_sums, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for Pipeline_stage0_State_sums_Iterator in 0 to 3 loop
					Pipeline_stage0_State_sums(Pipeline_stage0_State_sums_Iterator) <= Pipeline_stage0_State_sumsDefault;
				end loop;
			else
				for Pipeline_stage0_State_sums_Iterator in 0 to 3 loop
					Pipeline_stage0_State_sums(Pipeline_stage0_State_sums_Iterator) <= Pipeline_stage0_NextState_sums(Pipeline_stage0_State_sums_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (Clock, Pipeline_stage1_NextState_sums, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for Pipeline_stage1_State_sums_Iterator in 0 to 1 loop
					Pipeline_stage1_State_sums(Pipeline_stage1_State_sums_Iterator) <= Pipeline_stage1_State_sumsDefault;
				end loop;
			else
				for Pipeline_stage1_State_sums_Iterator in 0 to 1 loop
					Pipeline_stage1_State_sums(Pipeline_stage1_State_sums_Iterator) <= Pipeline_stage1_NextState_sums(Pipeline_stage1_State_sums_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (Pipeline_StageStatePipelineModule_L87F34T59_Expr_1, Pipeline_StageStatePipelineModule_L87F34T59_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L87F34T59_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L87F34T59_Expr_1, Pipeline_StageStatePipelineModule_L87F34T59_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L87F34T59_Expr_2, Pipeline_StageStatePipelineModule_L87F34T59_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L87F34T59_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L88F34T59_Expr_1, Pipeline_StageStatePipelineModule_L88F34T59_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L88F34T59_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L88F34T59_Expr_1, Pipeline_StageStatePipelineModule_L88F34T59_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L88F34T59_Expr_2, Pipeline_StageStatePipelineModule_L88F34T59_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L88F34T59_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L89F34T59_Expr_1, Pipeline_StageStatePipelineModule_L89F34T59_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L89F34T59_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L89F34T59_Expr_1, Pipeline_StageStatePipelineModule_L89F34T59_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L89F34T59_Expr_2, Pipeline_StageStatePipelineModule_L89F34T59_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L89F34T59_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L90F34T59_Expr_1, Pipeline_StageStatePipelineModule_L90F34T59_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L90F34T59_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L90F34T59_Expr_1, Pipeline_StageStatePipelineModule_L90F34T59_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L90F34T59_Expr_2, Pipeline_StageStatePipelineModule_L90F34T59_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L90F34T59_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L92F42T61_Expr_1, Pipeline_StageStatePipelineModule_L92F42T61_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L92F42T61_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L92F42T61_Expr_1, Pipeline_StageStatePipelineModule_L92F42T61_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L92F42T61_Expr_2, Pipeline_StageStatePipelineModule_L92F42T61_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L92F42T61_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L97F42T65_Expr_1, Pipeline_StageStatePipelineModule_L97F42T65_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L97F42T65_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L97F42T65_Expr_1, Pipeline_StageStatePipelineModule_L97F42T65_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L97F42T65_Expr_2, Pipeline_StageStatePipelineModule_L97F42T65_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L97F42T65_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L100F34T57_Expr_1, Pipeline_StageStatePipelineModule_L100F34T57_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L100F34T57_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L100F34T57_Expr_1, Pipeline_StageStatePipelineModule_L100F34T57_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L100F34T57_Expr_2, Pipeline_StageStatePipelineModule_L100F34T57_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L100F34T57_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L101F34T57_Expr_1, Pipeline_StageStatePipelineModule_L101F34T57_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L101F34T57_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L101F34T57_Expr_1, Pipeline_StageStatePipelineModule_L101F34T57_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L101F34T57_Expr_2, Pipeline_StageStatePipelineModule_L101F34T57_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L101F34T57_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L105F39T62_Expr_1, Pipeline_StageStatePipelineModule_L105F39T62_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L105F39T62_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L105F39T62_Expr_1, Pipeline_StageStatePipelineModule_L105F39T62_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L105F39T62_Expr_2, Pipeline_StageStatePipelineModule_L105F39T62_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L105F39T62_Expr'length);
	end process;
	process (Pipeline_StageStatePipelineModule_L108F42T60_Expr_1, Pipeline_StageStatePipelineModule_L108F42T60_Expr_2)
	begin
		Pipeline_StageStatePipelineModule_L108F42T60_Expr <= resize(unsigned(signed(resize(Pipeline_StageStatePipelineModule_L108F42T60_Expr_1, Pipeline_StageStatePipelineModule_L108F42T60_Expr_1'length + 1)) + signed(resize(Pipeline_StageStatePipelineModule_L108F42T60_Expr_2, Pipeline_StageStatePipelineModule_L108F42T60_Expr_2'length + 1))), Pipeline_StageStatePipelineModule_L108F42T60_Expr'length);
	end process;
	process (Pipeline_Inputs_inReady, Pipeline_stage0_State_IsReady, Pipeline_stage0_State_S0Counter, Pipeline_stage0_State_sums, Pipeline_stage1_State_IsReady, Pipeline_stage1_State_S0Counter, Pipeline_stage1_State_S1Counter, Pipeline_stage1_State_sums, Pipeline_stage2_State_IsReady, Pipeline_stage2_State_result, Pipeline_stage2_State_S0Counter, Pipeline_stage2_State_S1Counter, Pipeline_stage2_State_S2Counter, Pipeline_StageStatePipelineModule_L100F25T58_Cast, Pipeline_StageStatePipelineModule_L101F25T58_Cast, Pipeline_StageStatePipelineModule_L105F30T63_Cast, Pipeline_StageStatePipelineModule_L108F33T61_Cast, Pipeline_StageStatePipelineModule_L87F25T60_Cast, Pipeline_StageStatePipelineModule_L88F25T60_Cast, Pipeline_StageStatePipelineModule_L89F25T60_Cast, Pipeline_StageStatePipelineModule_L90F25T60_Cast, Pipeline_StageStatePipelineModule_L92F33T62_Cast, Pipeline_StageStatePipelineModule_L97F33T66_Cast)
	begin
		Pipeline_stage0_NextState_sums(0) <= Pipeline_stage0_State_sums(0);
		Pipeline_stage0_NextState_sums(1) <= Pipeline_stage0_State_sums(1);
		Pipeline_stage0_NextState_sums(2) <= Pipeline_stage0_State_sums(2);
		Pipeline_stage0_NextState_sums(3) <= Pipeline_stage0_State_sums(3);
		Pipeline_stage0_NextState_S0Counter <= Pipeline_stage0_State_S0Counter;
		Pipeline_stage0_NextState_IsReady <= Pipeline_stage0_State_IsReady;
		Pipeline_stage1_NextState_sums(0) <= Pipeline_stage1_State_sums(0);
		Pipeline_stage1_NextState_sums(1) <= Pipeline_stage1_State_sums(1);
		Pipeline_stage1_NextState_S0Counter <= Pipeline_stage1_State_S0Counter;
		Pipeline_stage1_NextState_S1Counter <= Pipeline_stage1_State_S1Counter;
		Pipeline_stage1_NextState_IsReady <= Pipeline_stage1_State_IsReady;
		Pipeline_stage2_NextState_IsReady <= Pipeline_stage2_State_IsReady;
		Pipeline_stage2_NextState_result <= Pipeline_stage2_State_result;
		Pipeline_stage2_NextState_S0Counter <= Pipeline_stage2_State_S0Counter;
		Pipeline_stage2_NextState_S1Counter <= Pipeline_stage2_State_S1Counter;
		Pipeline_stage2_NextState_S2Counter <= Pipeline_stage2_State_S2Counter;
		Pipeline_stage0_NextState_sums(0) <= Pipeline_StageStatePipelineModule_L87F25T60_Cast;
		Pipeline_stage0_NextState_sums(1) <= Pipeline_StageStatePipelineModule_L88F25T60_Cast;
		Pipeline_stage0_NextState_sums(2) <= Pipeline_StageStatePipelineModule_L89F25T60_Cast;
		Pipeline_stage0_NextState_sums(3) <= Pipeline_StageStatePipelineModule_L90F25T60_Cast;
		Pipeline_stage0_NextState_S0Counter <= Pipeline_StageStatePipelineModule_L92F33T62_Cast;
		Pipeline_stage0_NextState_IsReady <= Pipeline_Inputs_inReady;
		Pipeline_stage1_NextState_sums(0) <= Pipeline_StageStatePipelineModule_L100F25T58_Cast;
		Pipeline_stage1_NextState_sums(1) <= Pipeline_StageStatePipelineModule_L101F25T58_Cast;
		Pipeline_stage1_NextState_S0Counter <= Pipeline_stage0_State_S0Counter;
		Pipeline_stage1_NextState_S1Counter <= Pipeline_StageStatePipelineModule_L97F33T66_Cast;
		Pipeline_stage1_NextState_IsReady <= Pipeline_stage0_State_IsReady;
		Pipeline_stage2_NextState_IsReady <= Pipeline_stage1_State_IsReady;
		Pipeline_stage2_NextState_result <= Pipeline_StageStatePipelineModule_L105F30T63_Cast;
		Pipeline_stage2_NextState_S0Counter <= Pipeline_stage1_State_S0Counter;
		Pipeline_stage2_NextState_S1Counter <= Pipeline_stage1_State_S1Counter;
		Pipeline_stage2_NextState_S2Counter <= Pipeline_StageStatePipelineModule_L108F33T61_Cast;
	end process;
	process (inData0, inData1, inData2, inData3, inData4, inData5, inData6, inData7, Inputs_inData, Inputs_inReady, inReady, Pipeline_Inputs_inData, Pipeline_stage0_State_S0Counter, Pipeline_stage0_State_sums, Pipeline_stage1_State_S1Counter, Pipeline_stage1_State_sums, Pipeline_stage2_NextState_IsReady, Pipeline_stage2_NextState_result, Pipeline_stage2_NextState_S0Counter, Pipeline_stage2_NextState_S1Counter, Pipeline_stage2_NextState_S2Counter, Pipeline_stage2_State_IsReady, Pipeline_stage2_State_result, Pipeline_stage2_State_S0Counter, Pipeline_stage2_State_S1Counter, Pipeline_stage2_State_S2Counter, Pipeline_StageStatePipelineModule_L100F34T57_Expr, Pipeline_StageStatePipelineModule_L101F34T57_Expr, Pipeline_StageStatePipelineModule_L105F39T62_Expr, Pipeline_StageStatePipelineModule_L108F42T60_Expr, Pipeline_StageStatePipelineModule_L87F34T59_Expr, Pipeline_StageStatePipelineModule_L88F34T59_Expr, Pipeline_StageStatePipelineModule_L89F34T59_Expr, Pipeline_StageStatePipelineModule_L90F34T59_Expr, Pipeline_StageStatePipelineModule_L92F42T61_Expr, Pipeline_StageStatePipelineModule_L97F42T65_Expr, Pipeline_State_IsReady, Pipeline_State_result, Pipeline_State_S0Counter, Pipeline_State_S1Counter, Pipeline_State_S2Counter, StageStatePipelineModule_L39F33T61_Cast)
	begin
		Pipeline_StageStatePipelineModule_L87F34T59_Expr_1(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L87F34T59_Expr_1(7 downto 0) <= signed(Pipeline_Inputs_inData(2));
		Pipeline_StageStatePipelineModule_L87F34T59_Expr_2(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L87F34T59_Expr_2(7 downto 0) <= signed(Pipeline_Inputs_inData(3));
		Pipeline_StageStatePipelineModule_L88F34T59_Expr_1(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L88F34T59_Expr_1(7 downto 0) <= signed(Pipeline_Inputs_inData(4));
		Pipeline_StageStatePipelineModule_L88F34T59_Expr_2(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L88F34T59_Expr_2(7 downto 0) <= signed(Pipeline_Inputs_inData(5));
		Pipeline_StageStatePipelineModule_L89F34T59_Expr_1(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L89F34T59_Expr_1(7 downto 0) <= signed(Pipeline_Inputs_inData(0));
		Pipeline_StageStatePipelineModule_L89F34T59_Expr_2(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L89F34T59_Expr_2(7 downto 0) <= signed(Pipeline_Inputs_inData(1));
		Pipeline_StageStatePipelineModule_L90F34T59_Expr_1(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L90F34T59_Expr_1(7 downto 0) <= signed(Pipeline_Inputs_inData(6));
		Pipeline_StageStatePipelineModule_L90F34T59_Expr_2(9 downto 8) <= (others => '0');
		Pipeline_StageStatePipelineModule_L90F34T59_Expr_2(7 downto 0) <= signed(Pipeline_Inputs_inData(7));
		Pipeline_StageStatePipelineModule_L92F42T61_Expr_1(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L92F42T61_Expr_1(15 downto 0) <= signed(Pipeline_stage0_State_S0Counter);
		Pipeline_StageStatePipelineModule_L92F42T61_Expr_2(17 downto 1) <= (others => '0');
		Pipeline_StageStatePipelineModule_L92F42T61_Expr_2(0) <= Pipeline_StageStatePipelineModule_L92F60T61_Expr;
		Pipeline_StageStatePipelineModule_L97F42T65_Expr_1(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L97F42T65_Expr_1(15 downto 0) <= signed(Pipeline_stage1_State_S1Counter);
		Pipeline_StageStatePipelineModule_L97F42T65_Expr_2(17 downto 1) <= (others => '0');
		Pipeline_StageStatePipelineModule_L97F42T65_Expr_2(0) <= Pipeline_StageStatePipelineModule_L97F64T65_Expr;
		Pipeline_StageStatePipelineModule_L100F34T57_Expr_1(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L100F34T57_Expr_1(15 downto 0) <= signed(Pipeline_stage0_State_sums(0));
		Pipeline_StageStatePipelineModule_L100F34T57_Expr_2(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L100F34T57_Expr_2(15 downto 0) <= signed(Pipeline_stage0_State_sums(1));
		Pipeline_StageStatePipelineModule_L101F34T57_Expr_1(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L101F34T57_Expr_1(15 downto 0) <= signed(Pipeline_stage0_State_sums(2));
		Pipeline_StageStatePipelineModule_L101F34T57_Expr_2(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L101F34T57_Expr_2(15 downto 0) <= signed(Pipeline_stage0_State_sums(3));
		Pipeline_StageStatePipelineModule_L105F39T62_Expr_1(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L105F39T62_Expr_1(15 downto 0) <= signed(Pipeline_stage1_State_sums(0));
		Pipeline_StageStatePipelineModule_L105F39T62_Expr_2(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L105F39T62_Expr_2(15 downto 0) <= signed(Pipeline_stage1_State_sums(1));
		Pipeline_StageStatePipelineModule_L108F42T60_Expr_1(17 downto 16) <= (others => '0');
		Pipeline_StageStatePipelineModule_L108F42T60_Expr_1(15 downto 0) <= signed(Pipeline_stage2_State_S2Counter);
		Pipeline_StageStatePipelineModule_L108F42T60_Expr_2(17 downto 1) <= (others => '0');
		Pipeline_StageStatePipelineModule_L108F42T60_Expr_2(0) <= Pipeline_StageStatePipelineModule_L108F59T60_Expr;
		Inputs_inReady <= inReady;
		Inputs_inData(0) <= inData0;
		Inputs_inData(1) <= inData1;
		Inputs_inData(2) <= inData2;
		Inputs_inData(3) <= inData3;
		Inputs_inData(4) <= inData4;
		Inputs_inData(5) <= inData5;
		Inputs_inData(6) <= inData6;
		Inputs_inData(7) <= inData7;
		Pipeline_State_IsReady <= Pipeline_stage2_State_IsReady;
		Pipeline_State_result <= Pipeline_stage2_State_result;
		Pipeline_State_S0Counter <= Pipeline_stage2_State_S0Counter;
		Pipeline_State_S1Counter <= Pipeline_stage2_State_S1Counter;
		Pipeline_State_S2Counter <= Pipeline_stage2_State_S2Counter;
		Pipeline_NextState_IsReady <= Pipeline_stage2_NextState_IsReady;
		Pipeline_NextState_result <= Pipeline_stage2_NextState_result;
		Pipeline_NextState_S0Counter <= Pipeline_stage2_NextState_S0Counter;
		Pipeline_NextState_S1Counter <= Pipeline_stage2_NextState_S1Counter;
		Pipeline_NextState_S2Counter <= Pipeline_stage2_NextState_S2Counter;
		Pipeline_StageStatePipelineModule_L87F25T60_Cast(15 downto 10) <= (others => '0');
		Pipeline_StageStatePipelineModule_L87F25T60_Cast(9 downto 0) <= Pipeline_StageStatePipelineModule_L87F34T59_Expr;
		Pipeline_StageStatePipelineModule_L88F25T60_Cast(15 downto 10) <= (others => '0');
		Pipeline_StageStatePipelineModule_L88F25T60_Cast(9 downto 0) <= Pipeline_StageStatePipelineModule_L88F34T59_Expr;
		Pipeline_StageStatePipelineModule_L89F25T60_Cast(15 downto 10) <= (others => '0');
		Pipeline_StageStatePipelineModule_L89F25T60_Cast(9 downto 0) <= Pipeline_StageStatePipelineModule_L89F34T59_Expr;
		Pipeline_StageStatePipelineModule_L90F25T60_Cast(15 downto 10) <= (others => '0');
		Pipeline_StageStatePipelineModule_L90F25T60_Cast(9 downto 0) <= Pipeline_StageStatePipelineModule_L90F34T59_Expr;
		Pipeline_StageStatePipelineModule_L92F33T62_Cast <= Pipeline_StageStatePipelineModule_L92F42T61_Expr(15 downto 0);
		Pipeline_StageStatePipelineModule_L97F33T66_Cast <= Pipeline_StageStatePipelineModule_L97F42T65_Expr(15 downto 0);
		Pipeline_StageStatePipelineModule_L100F25T58_Cast <= Pipeline_StageStatePipelineModule_L100F34T57_Expr(15 downto 0);
		Pipeline_StageStatePipelineModule_L101F25T58_Cast <= Pipeline_StageStatePipelineModule_L101F34T57_Expr(15 downto 0);
		Pipeline_StageStatePipelineModule_L105F30T63_Cast <= Pipeline_StageStatePipelineModule_L105F39T62_Expr(15 downto 0);
		Pipeline_StageStatePipelineModule_L108F33T61_Cast <= Pipeline_StageStatePipelineModule_L108F42T60_Expr(15 downto 0);
		StageStatePipelineModule_L39F33T61_Cast <= Pipeline_State_IsReady;
		outReady <= StageStatePipelineModule_L39F33T61_Cast;
		outResult <= Pipeline_State_result;
		outS0Counter <= Pipeline_State_S0Counter;
		outS1Counter <= Pipeline_State_S1Counter;
		outS2Counter <= Pipeline_State_S2Counter;
		Pipeline_Inputs_inReady <= Inputs_inReady;
		Pipeline_Inputs_inData(0) <= Inputs_inData(0);
		Pipeline_Inputs_inData(1) <= Inputs_inData(1);
		Pipeline_Inputs_inData(2) <= Inputs_inData(2);
		Pipeline_Inputs_inData(3) <= Inputs_inData(3);
		Pipeline_Inputs_inData(4) <= Inputs_inData(4);
		Pipeline_Inputs_inData(5) <= Inputs_inData(5);
		Pipeline_Inputs_inData(6) <= Inputs_inData(6);
		Pipeline_Inputs_inData(7) <= Inputs_inData(7);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
