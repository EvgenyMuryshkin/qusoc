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
-- System configuration name is CompositionModule_TopLevel_CompositionModule_Transmitter, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity CompositionModule_TopLevel_CompositionModule_Transmitter is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		Trigger : in std_logic;
		Ack : in std_logic;
		Data : in unsigned (7 downto 0);
		Bit : out std_logic;
		IsReady : out std_logic;
		IsTransmitting : out std_logic;
		IsTransmissionStarted : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of CompositionModule_TopLevel_CompositionModule_Transmitter is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F22T41_Expr : std_logic := '0';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L19F45T46_Expr : std_logic := '0';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L21F41T68_Expr : std_logic := '1';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F22T49_Expr : std_logic := '1';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F42T43_Expr : unsigned(2 downto 0) := "111";
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L26F21L28T22_TransmitterModule_L27F41T69_Expr : unsigned(1 downto 0) := "10";
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F68T69_Expr : std_logic := '1';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F52T53_Expr : std_logic := '1';
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F22T50_Expr : unsigned(1 downto 0) := "10";
	constant TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L37F41T60_Expr : std_logic := '0';
	constant TransmitterModule_L9F46T65_Expr : std_logic := '0';
	constant TransmitterModule_L10F52T79_Expr : std_logic := '1';
	constant TransmitterModule_L11F59T78_Expr : std_logic := '0';
	constant TransmitterModule_L11F99T126_Expr : std_logic := '1';
	signal Inputs_Trigger : std_logic := '0';
	signal Inputs_Ack : std_logic := '0';
	signal Inputs_Data : unsigned(7 downto 0) := (others => '0');
	signal NextState_FSM : unsigned(1 downto 0) := (others => '0');
	signal NextState_Data : unsigned(7 downto 0) := (others => '0');
	signal NextState_Counter : unsigned(7 downto 0) := (others => '0');
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast : unsigned(7 downto 0) := (others => '0');
	signal State_FSM : unsigned(1 downto 0) := "00";
	constant State_FSMDefault : unsigned(1 downto 0) := "00";
	signal State_Data : unsigned(7 downto 0) := "00000000";
	constant State_DataDefault : unsigned(7 downto 0) := "00000000";
	signal State_Counter : unsigned(7 downto 0) := "00000000";
	constant State_CounterDefault : unsigned(7 downto 0) := "00000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr : unsigned(7 downto 0) := "00000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1 : unsigned(7 downto 0) := "00000000";
	signal TransmitterModule_L11F46T126_Expr : std_logic := '0';
	signal TransmitterModule_L11F46T126_Expr_1 : std_logic := '0';
	signal TransmitterModule_L11F46T126_Expr_2 : std_logic := '0';
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr : unsigned(9 downto 0) := "0000000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1 : signed(9 downto 0) := "0000000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2 : signed(9 downto 0) := "0000000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case : std_logic := '0';
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case : std_logic := '0';
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr : std_logic := '0';
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs : signed(8 downto 0) := "000000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs : signed(8 downto 0) := "000000000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case : std_logic := '0';
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L9F32T65_Expr : std_logic := '0';
	signal TransmitterModule_L9F32T65_ExprLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L9F32T65_ExprRhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L10F39T79_Expr : std_logic := '0';
	signal TransmitterModule_L10F39T79_ExprLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L10F39T79_ExprRhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L11F46T78_Expr : std_logic := '0';
	signal TransmitterModule_L11F46T78_ExprLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L11F46T78_ExprRhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L11F82T126_Expr : std_logic := '0';
	signal TransmitterModule_L11F82T126_ExprLhs : signed(2 downto 0) := "000";
	signal TransmitterModule_L11F82T126_ExprRhs : signed(2 downto 0) := "000";
begin
	process (BoardSignals, NextState_Counter, NextState_Data, NextState_FSM)
	begin
		if rising_edge(BoardSignals.Clock) then
			if BoardSignals.Reset = '1' then
				State_FSM <= State_FSMDefault;
				State_Data <= State_DataDefault;
				State_Counter <= State_CounterDefault;
			else
				State_FSM <= NextState_FSM;
				State_Data <= NextState_Data;
				State_Counter <= NextState_Counter;
			end if;
		end if;
	end process;
	TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case <= '1' when (signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs'length + 1)) = signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs'length + 1))) else '0';
	TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case <= '1' when (signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs'length + 1)) = signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs'length + 1))) else '0';
	TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr <= '1' when (signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs'length + 1)) = signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs'length + 1))) else '0';
	TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case <= '1' when (signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs'length + 1)) = signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs'length + 1))) else '0';
	TransmitterModule_L9F32T65_Expr <= '1' when (signed(resize(TransmitterModule_L9F32T65_ExprLhs, TransmitterModule_L9F32T65_ExprLhs'length + 1)) = signed(resize(TransmitterModule_L9F32T65_ExprRhs, TransmitterModule_L9F32T65_ExprRhs'length + 1))) else '0';
	TransmitterModule_L10F39T79_Expr <= '1' when (signed(resize(TransmitterModule_L10F39T79_ExprLhs, TransmitterModule_L10F39T79_ExprLhs'length + 1)) = signed(resize(TransmitterModule_L10F39T79_ExprRhs, TransmitterModule_L10F39T79_ExprRhs'length + 1))) else '0';
	TransmitterModule_L11F46T78_Expr <= '1' when (signed(resize(TransmitterModule_L11F46T78_ExprLhs, TransmitterModule_L11F46T78_ExprLhs'length + 1)) = signed(resize(TransmitterModule_L11F46T78_ExprRhs, TransmitterModule_L11F46T78_ExprRhs'length + 1))) else '0';
	TransmitterModule_L11F82T126_Expr <= '1' when (signed(resize(TransmitterModule_L11F82T126_ExprLhs, TransmitterModule_L11F82T126_ExprLhs'length + 1)) = signed(resize(TransmitterModule_L11F82T126_ExprRhs, TransmitterModule_L11F82T126_ExprRhs'length + 1))) else '0';
	process (TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1)
		alias output is TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr;
		alias source0 is TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1;
	begin
		-- Output: TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr, Width: 8, ShiftBy: 1, Sources: 1
		output(0) <= source0(1);
		output(1) <= source0(2);
		output(2) <= source0(3);
		output(3) <= source0(4);
		output(4) <= source0(5);
		output(5) <= source0(6);
		output(6) <= source0(7);
		output(7) <= '0';
	end process;
	process (TransmitterModule_L11F46T126_Expr_1, TransmitterModule_L11F46T126_Expr_2)
	begin
		TransmitterModule_L11F46T126_Expr <= TransmitterModule_L11F46T126_Expr_1 AND TransmitterModule_L11F46T126_Expr_2;
	end process;
	process (TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2)
	begin
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr <= resize(unsigned(signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1'length + 1)) + signed(resize(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2'length + 1))), TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr'length);
	end process;
	process (Inputs_Ack, Inputs_Data, Inputs_Trigger, State_Counter, State_Data, State_FSM, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case)
	begin
		NextState_FSM <= State_FSM;
		NextState_Data <= State_Data;
		NextState_Counter <= State_Counter;
		if TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_Case = '1' then
			if Inputs_Trigger = '1' then
				NextState_Counter(7 downto 1) <= (others => '0');
				NextState_Counter(0) <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L19F45T46_Expr;
				NextState_Data <= Inputs_Data;
				NextState_FSM(1) <= '0';
				NextState_FSM(0) <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L18F21L22T22_TransmitterModule_L21F41T68_Expr;
			end if;
		elsif TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_Case = '1' then
			if TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_Expr = '1' then
				NextState_FSM <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L26F21L28T22_TransmitterModule_L27F41T69_Expr;
			else
				NextState_Counter <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast;
			end if;
			NextState_Data <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr;
		elsif TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_Case = '1' then
			if Inputs_Ack = '1' then
				NextState_FSM(1) <= '0';
				NextState_FSM(0) <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L37F41T60_Expr;
			end if;
		end if;
	end process;
	process (Ack, Data, NextState_FSM, State_Counter, State_Data, State_FSM, TransmitterModule_L10F39T79_Expr, TransmitterModule_L11F46T126_Expr, TransmitterModule_L11F46T78_Expr, TransmitterModule_L11F82T126_Expr, TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr, TransmitterModule_L9F32T65_Expr, Trigger)
	begin
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs(2) <= '0';
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseLhs(1 downto 0) <= signed(State_FSM);
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs(2 downto 1) <= (others => '0');
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F17L23T27_CaseRhs(0) <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L16F22T41_Expr;
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs(2) <= '0';
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseLhs(1 downto 0) <= signed(State_FSM);
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs(2 downto 1) <= (others => '0');
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F17L34T27_CaseRhs(0) <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L24F22T49_Expr;
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs(8) <= '0';
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprLhs(7 downto 0) <= signed(State_Counter);
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs(8 downto 3) <= (others => '0');
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F25T43_ExprRhs(2 downto 0) <= signed(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L25F42T43_Expr);
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs(2) <= '0';
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseLhs(1 downto 0) <= signed(State_FSM);
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs(2) <= '0';
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F17L38T27_CaseRhs(1 downto 0) <= signed(TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L35F22T50_Expr);
		TransmitterModule_L9F32T65_ExprLhs(2) <= '0';
		TransmitterModule_L9F32T65_ExprLhs(1 downto 0) <= signed(State_FSM);
		TransmitterModule_L9F32T65_ExprRhs(2 downto 1) <= (others => '0');
		TransmitterModule_L9F32T65_ExprRhs(0) <= TransmitterModule_L9F46T65_Expr;
		TransmitterModule_L10F39T79_ExprLhs(2) <= '0';
		TransmitterModule_L10F39T79_ExprLhs(1 downto 0) <= signed(State_FSM);
		TransmitterModule_L10F39T79_ExprRhs(2 downto 1) <= (others => '0');
		TransmitterModule_L10F39T79_ExprRhs(0) <= TransmitterModule_L10F52T79_Expr;
		TransmitterModule_L11F46T78_ExprLhs(2) <= '0';
		TransmitterModule_L11F46T78_ExprLhs(1 downto 0) <= signed(State_FSM);
		TransmitterModule_L11F46T78_ExprRhs(2 downto 1) <= (others => '0');
		TransmitterModule_L11F46T78_ExprRhs(0) <= TransmitterModule_L11F59T78_Expr;
		TransmitterModule_L11F82T126_ExprLhs(2) <= '0';
		TransmitterModule_L11F82T126_ExprLhs(1 downto 0) <= signed(NextState_FSM);
		TransmitterModule_L11F82T126_ExprRhs(2 downto 1) <= (others => '0');
		TransmitterModule_L11F82T126_ExprRhs(0) <= TransmitterModule_L11F99T126_Expr;
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L33F38T53_Expr_1 <= State_Data;
		TransmitterModule_L11F46T126_Expr_1 <= TransmitterModule_L11F46T78_Expr;
		TransmitterModule_L11F46T126_Expr_2 <= TransmitterModule_L11F82T126_Expr;
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1(9 downto 8) <= (others => '0');
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_1(7 downto 0) <= signed(State_Counter);
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2(9 downto 1) <= (others => '0');
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr_2(0) <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F68T69_Expr;
		Inputs_Trigger <= Trigger;
		Inputs_Ack <= Ack;
		Inputs_Data <= Data;
		TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F45T70_Cast <= TransmitterModule_L13F9L40T10_TransmitterModule_L14F13L39T14_TransmitterModule_L30F21L32T22_TransmitterModule_L31F52T69_Expr(7 downto 0);
		Bit <= State_Data(0);
		IsReady <= TransmitterModule_L9F32T65_Expr;
		IsTransmitting <= TransmitterModule_L10F39T79_Expr;
		IsTransmissionStarted <= TransmitterModule_L11F46T126_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
