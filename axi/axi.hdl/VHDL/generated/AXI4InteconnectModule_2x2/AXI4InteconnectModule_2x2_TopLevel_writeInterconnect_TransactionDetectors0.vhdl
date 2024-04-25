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
-- System configuration name is AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_TransactionDetectors0, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_TransactionDetectors0 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		iRestart : in std_logic;
		iTXBegin : in std_logic;
		iTXEnd : in std_logic;
		oTransaction : out std_logic;
		oWaitForRestart : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4InteconnectModule_2x2_TopLevel_writeInterconnect_TransactionDetectors0 is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F22T46_Expr : unsigned(1 downto 0) := "00";
	constant TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L39F44T69_Expr : unsigned(1 downto 0) := "01";
	constant TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F22T47_Expr : unsigned(1 downto 0) := "01";
	constant TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L43F44T77_Expr : unsigned(1 downto 0) := "10";
	constant TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F22T55_Expr : unsigned(1 downto 0) := "10";
	constant TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L47F44T68_Expr : unsigned(1 downto 0) := "00";
	constant TransactionDetectorModule_L30F53T78_Expr : unsigned(1 downto 0) := "01";
	constant TransactionDetectorModule_L31F56T89_Expr : unsigned(1 downto 0) := "10";
	signal Inputs_iRestart : std_logic := '0';
	signal Inputs_iTXBegin : std_logic := '0';
	signal Inputs_iTXEnd : std_logic := '0';
	signal NextState_Status : unsigned(1 downto 0) := (others => '0');
	signal State_Status : unsigned(1 downto 0) := "00";
	constant State_StatusDefault : unsigned(1 downto 0) := "00";
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case : std_logic := '0';
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case : std_logic := '0';
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case : std_logic := '0';
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L30F37T78_Expr : std_logic := '0';
	signal TransactionDetectorModule_L30F37T78_ExprLhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L30F37T78_ExprRhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L31F40T89_Expr : std_logic := '0';
	signal TransactionDetectorModule_L31F40T89_ExprLhs : signed(2 downto 0) := "000";
	signal TransactionDetectorModule_L31F40T89_ExprRhs : signed(2 downto 0) := "000";
begin
	process (BoardSignals, NextState_Status)
	begin
		if rising_edge(BoardSignals.Clock) then
			if BoardSignals.Reset = '1' then
				State_Status <= State_StatusDefault;
			else
				State_Status <= NextState_Status;
			end if;
		end if;
	end process;
	TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case <= '1' when (signed(resize(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs'length + 1)) = signed(resize(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs'length + 1))) else '0';
	TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case <= '1' when (signed(resize(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs'length + 1)) = signed(resize(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs'length + 1))) else '0';
	TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case <= '1' when (signed(resize(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs'length + 1)) = signed(resize(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs'length + 1))) else '0';
	TransactionDetectorModule_L30F37T78_Expr <= '1' when (signed(resize(TransactionDetectorModule_L30F37T78_ExprLhs, TransactionDetectorModule_L30F37T78_ExprLhs'length + 1)) = signed(resize(TransactionDetectorModule_L30F37T78_ExprRhs, TransactionDetectorModule_L30F37T78_ExprRhs'length + 1))) else '0';
	TransactionDetectorModule_L31F40T89_Expr <= '1' when (signed(resize(TransactionDetectorModule_L31F40T89_ExprLhs, TransactionDetectorModule_L31F40T89_ExprLhs'length + 1)) = signed(resize(TransactionDetectorModule_L31F40T89_ExprRhs, TransactionDetectorModule_L31F40T89_ExprRhs'length + 1))) else '0';
	process (Inputs_iRestart, Inputs_iTXBegin, Inputs_iTXEnd, State_Status, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case, TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case)
	begin
		NextState_Status <= State_Status;
		if TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_Case = '1' then
			if Inputs_iTXBegin = '1' then
				NextState_Status <= TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L39F44T69_Expr;
			end if;
		elsif TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_Case = '1' then
			if Inputs_iTXEnd = '1' then
				NextState_Status <= TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L43F44T77_Expr;
			end if;
		elsif TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_Case = '1' then
			if Inputs_iRestart = '1' then
				NextState_Status <= TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L47F44T68_Expr;
			end if;
		end if;
	end process;
	process (iRestart, iTXBegin, iTXEnd, State_Status, TransactionDetectorModule_L30F37T78_Expr, TransactionDetectorModule_L31F40T89_Expr)
	begin
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs(2) <= '0';
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseLhs(1 downto 0) <= signed(State_Status);
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs(2) <= '0';
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F17L40T27_CaseRhs(1 downto 0) <= signed(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L37F22T46_Expr);
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs(2) <= '0';
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseLhs(1 downto 0) <= signed(State_Status);
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs(2) <= '0';
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F17L44T27_CaseRhs(1 downto 0) <= signed(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L41F22T47_Expr);
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs(2) <= '0';
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseLhs(1 downto 0) <= signed(State_Status);
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs(2) <= '0';
		TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F17L48T27_CaseRhs(1 downto 0) <= signed(TransactionDetectorModule_L34F9L50T10_TransactionDetectorModule_L35F13L49T14_TransactionDetectorModule_L45F22T55_Expr);
		TransactionDetectorModule_L30F37T78_ExprLhs(2) <= '0';
		TransactionDetectorModule_L30F37T78_ExprLhs(1 downto 0) <= signed(State_Status);
		TransactionDetectorModule_L30F37T78_ExprRhs(2) <= '0';
		TransactionDetectorModule_L30F37T78_ExprRhs(1 downto 0) <= signed(TransactionDetectorModule_L30F53T78_Expr);
		TransactionDetectorModule_L31F40T89_ExprLhs(2) <= '0';
		TransactionDetectorModule_L31F40T89_ExprLhs(1 downto 0) <= signed(State_Status);
		TransactionDetectorModule_L31F40T89_ExprRhs(2) <= '0';
		TransactionDetectorModule_L31F40T89_ExprRhs(1 downto 0) <= signed(TransactionDetectorModule_L31F56T89_Expr);
		Inputs_iRestart <= iRestart;
		Inputs_iTXBegin <= iTXBegin;
		Inputs_iTXEnd <= iTXEnd;
		oTransaction <= TransactionDetectorModule_L30F37T78_Expr;
		oWaitForRestart <= TransactionDetectorModule_L31F40T89_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
