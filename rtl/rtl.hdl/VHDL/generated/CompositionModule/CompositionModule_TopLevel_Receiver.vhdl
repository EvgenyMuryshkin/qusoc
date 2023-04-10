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
-- System configuration name is CompositionModule_TopLevel_Receiver, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity CompositionModule_TopLevel_Receiver is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		Ack : in std_logic;
		Bit : in std_logic;
		IsValid : in std_logic;
		Data : out unsigned (7 downto 0);
		HasData : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of CompositionModule_TopLevel_Receiver is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant ReceiverModule_L10F49T53_Expr : unsigned(7 downto 0) := "10000000";
	constant ReceiverModule_L10F56T57_Expr : std_logic := '0';
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F22T38_Expr : std_logic := '0';
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L18F21L21T22_ReceiverModule_L20F41T62_Expr : std_logic := '1';
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F22T43_Expr : std_logic := '1';
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F64T65_Expr : std_logic := '1';
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L29F21L31T22_ReceiverModule_L30F41T66_Expr : unsigned(1 downto 0) := "10";
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F22T47_Expr : unsigned(1 downto 0) := "10";
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L36F41T57_Expr : std_logic := '0';
	constant ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L37F42T43_Expr : std_logic := '0';
	constant ReceiverModule_L8F46T71_Expr : unsigned(1 downto 0) := "10";
	signal Inputs_Ack : std_logic := '0';
	signal Inputs_Bit : std_logic := '0';
	signal Inputs_IsValid : std_logic := '0';
	signal NextState_Data : unsigned(7 downto 0) := (others => '0');
	signal NextState_FSM : unsigned(1 downto 0) := (others => '0');
	signal PartialData : unsigned(7 downto 0) := (others => '0');
	signal ReceiverModule_L10F36T57_WhenTrue : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L10F36T57_WhenFalse : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L10F36T57_Ternary : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L10F29T58_Cast : unsigned(7 downto 0) := (others => '0');
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast : unsigned(7 downto 0) := (others => '0');
	signal State_Data : unsigned(7 downto 0) := "00000000";
	constant State_DataDefault : unsigned(7 downto 0) := "00000000";
	signal State_FSM : unsigned(1 downto 0) := "00";
	constant State_FSMDefault : unsigned(1 downto 0) := "00";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1 : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2 : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1 : unsigned(7 downto 0) := "00000000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case : std_logic := '0';
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case : std_logic := '0';
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case : std_logic := '0';
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L8F32T71_Expr : std_logic := '0';
	signal ReceiverModule_L8F32T71_ExprLhs : signed(2 downto 0) := "000";
	signal ReceiverModule_L8F32T71_ExprRhs : signed(2 downto 0) := "000";
begin
	process (BoardSignals, NextState_Data, NextState_FSM)
	begin
		if rising_edge(BoardSignals.Clock) then
			if BoardSignals.Reset = '1' then
				State_Data <= State_DataDefault;
				State_FSM <= State_FSMDefault;
			else
				State_Data <= NextState_Data;
				State_FSM <= NextState_FSM;
			end if;
		end if;
	end process;
	ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case <= '1' when (signed(resize(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs'length + 1)) = signed(resize(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs'length + 1))) else '0';
	ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case <= '1' when (signed(resize(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs'length + 1)) = signed(resize(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs'length + 1))) else '0';
	ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case <= '1' when (signed(resize(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs'length + 1)) = signed(resize(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs'length + 1))) else '0';
	ReceiverModule_L8F32T71_Expr <= '1' when (signed(resize(ReceiverModule_L8F32T71_ExprLhs, ReceiverModule_L8F32T71_ExprLhs'length + 1)) = signed(resize(ReceiverModule_L8F32T71_ExprRhs, ReceiverModule_L8F32T71_ExprRhs'length + 1))) else '0';
	process (ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2)
	begin
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1 OR ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2;
	end process;
	process (ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1)
		alias output is ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr;
		alias source0 is ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1;
	begin
		-- Output: ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr, Width: 8, ShiftBy: 1, Sources: 1
		output(0) <= source0(1);
		output(1) <= source0(2);
		output(2) <= source0(3);
		output(3) <= source0(4);
		output(4) <= source0(5);
		output(5) <= source0(6);
		output(6) <= source0(7);
		output(7) <= '0';
	end process;
	ReceiverModule_L10F36T57_Ternary <= ReceiverModule_L10F36T57_WhenTrue when (Inputs_Bit = '1') else ReceiverModule_L10F36T57_WhenFalse;
	process (Inputs_Ack, Inputs_IsValid, PartialData, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case, State_Data, State_FSM)
	begin
		NextState_Data <= State_Data;
		NextState_FSM <= State_FSM;
		if ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_Case = '1' then
			if Inputs_IsValid = '1' then
				NextState_Data <= PartialData;
				NextState_FSM(1) <= '0';
				NextState_FSM(0) <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L18F21L21T22_ReceiverModule_L20F41T62_Expr;
			end if;
		elsif ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_Case = '1' then
			if Inputs_IsValid = '1' then
				NextState_Data <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast;
			else
				NextState_FSM <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L29F21L31T22_ReceiverModule_L30F41T66_Expr;
			end if;
		elsif ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_Case = '1' then
			if Inputs_Ack = '1' then
				NextState_FSM(1) <= '0';
				NextState_FSM(0) <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L36F41T57_Expr;
				NextState_Data(7 downto 1) <= (others => '0');
				NextState_Data(0) <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L35F21L38T22_ReceiverModule_L37F42T43_Expr;
			end if;
		end if;
	end process;
	process (Ack, Bit, IsValid, PartialData, ReceiverModule_L10F29T58_Cast, ReceiverModule_L10F36T57_Ternary, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr, ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr, ReceiverModule_L8F32T71_Expr, State_Data, State_FSM)
	begin
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs(2) <= '0';
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseLhs(1 downto 0) <= signed(State_FSM);
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs(2 downto 1) <= (others => '0');
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F17L22T27_CaseRhs(0) <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L16F22T38_Expr;
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs(2) <= '0';
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseLhs(1 downto 0) <= signed(State_FSM);
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs(2 downto 1) <= (others => '0');
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F17L32T27_CaseRhs(0) <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L23F22T43_Expr;
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs(2) <= '0';
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseLhs(1 downto 0) <= signed(State_FSM);
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs(2) <= '0';
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F17L39T27_CaseRhs(1 downto 0) <= signed(ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L33F22T47_Expr);
		ReceiverModule_L8F32T71_ExprLhs(2) <= '0';
		ReceiverModule_L8F32T71_ExprLhs(1 downto 0) <= signed(State_FSM);
		ReceiverModule_L8F32T71_ExprRhs(2) <= '0';
		ReceiverModule_L8F32T71_ExprRhs(1 downto 0) <= signed(ReceiverModule_L8F46T71_Expr);
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_1 <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr;
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr_2 <= PartialData;
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F50T65_Expr_1 <= State_Data;
		Inputs_Ack <= Ack;
		Inputs_Bit <= Bit;
		Inputs_IsValid <= IsValid;
		ReceiverModule_L10F36T57_WhenTrue <= ReceiverModule_L10F49T53_Expr;
		ReceiverModule_L10F36T57_WhenFalse(7 downto 1) <= (others => '0');
		ReceiverModule_L10F36T57_WhenFalse(0) <= ReceiverModule_L10F56T57_Expr;
		ReceiverModule_L10F29T58_Cast <= ReceiverModule_L10F36T57_Ternary;
		PartialData <= ReceiverModule_L10F29T58_Cast;
		ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F42T81_Cast <= ReceiverModule_L13F9L41T10_ReceiverModule_L14F13L40T14_ReceiverModule_L25F21L27T22_ReceiverModule_L26F49T80_Expr;
		Data <= State_Data;
		HasData <= ReceiverModule_L8F32T71_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
