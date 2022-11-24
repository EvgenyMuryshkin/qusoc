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
-- System configuration name is FIRModule4x16_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRModule4x16_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iIQ : in unsigned (15 downto 0);
		iDO : in unsigned (3 downto 0);
		iInternalFeedbackSelector : in std_logic;
		iCoeffReadAddr : in unsigned (1 downto 0);
		iCoeffWE : in std_logic;
		iCoeffWriteAddr : in unsigned (1 downto 0);
		iCoeffData : in unsigned (15 downto 0);
		iDataReadAddr : in unsigned (7 downto 0);
		iDataWE : in std_logic;
		iData : in unsigned (15 downto 0);
		iDataWriteAddr : in unsigned (7 downto 0);
		oAccum : out unsigned (32 downto 0);
		oData : out unsigned (15 downto 0);
		oIQ : out unsigned (15 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRModule4x16_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	constant firParams_Order : unsigned(2 downto 0) := "100";
	constant firParams_DOSize : unsigned(2 downto 0) := "100";
	constant firParams_IQSize : unsigned(4 downto 0) := "10000";
	constant firParams_CoeffSize : unsigned(4 downto 0) := "10000";
	constant firParams_SumSize : unsigned(4 downto 0) := "10001";
	constant firParams_MultSize : unsigned(5 downto 0) := "100001";
	constant firParams_AccumSize : unsigned(5 downto 0) := "100001";
	constant firParams_CoeffRamAddrBits : unsigned(1 downto 0) := "10";
	constant firParams_DataRamAddrBits : unsigned(3 downto 0) := "1000";
	constant FIRModule_L66F27T28_Expr : std_logic := '0';
	constant FIRModule_L75F23T24_Expr : std_logic := '0';
	constant FIRModule_L76F42T47_Expr : std_logic := '0';
	constant FIRModule_L90F13L108T14_1_idx : std_logic := '1';
	constant FIRModule_L90F13L108T14_2_idx : unsigned(1 downto 0) := "10";
	constant FIRModule_L90F13L108T14_3_idx : unsigned(1 downto 0) := "11";
	signal Inputs_iIQ : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDO : unsigned(3 downto 0) := (others => '0');
	signal Inputs_iInternalFeedbackSelector : std_logic := '0';
	signal Inputs_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_iCoeffWE : std_logic := '0';
	signal Inputs_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iDataWE : std_logic := '0';
	signal Inputs_iData : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal internalFILO : unsigned(15 downto 0) := (others => '0');
	signal stages0_iIQ : unsigned(15 downto 0) := (others => '0');
	signal stages0_iDO : unsigned(3 downto 0) := (others => '0');
	signal stages0_iFILO : unsigned(15 downto 0) := (others => '0');
	signal stages0_iAccum : unsigned(32 downto 0) := (others => '0');
	signal stages0_iInternalFeedbackSelector : std_logic := '0';
	signal stages0_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal stages0_iCoeffWE : std_logic := '0';
	signal stages0_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal stages0_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal stages0_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal stages0_iDataWE : std_logic := '0';
	signal stages0_iData : unsigned(15 downto 0) := (others => '0');
	signal stages0_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal stages0_oIQ : unsigned(15 downto 0) := (others => '0');
	signal stages0_oData : unsigned(15 downto 0) := (others => '0');
	signal stages0_oAccum : unsigned(32 downto 0) := (others => '0');
	signal stages1_iIQ : unsigned(15 downto 0) := (others => '0');
	signal stages1_iDO : unsigned(3 downto 0) := (others => '0');
	signal stages1_iFILO : unsigned(15 downto 0) := (others => '0');
	signal stages1_iAccum : unsigned(32 downto 0) := (others => '0');
	signal stages1_iInternalFeedbackSelector : std_logic := '0';
	signal stages1_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal stages1_iCoeffWE : std_logic := '0';
	signal stages1_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal stages1_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal stages1_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal stages1_iDataWE : std_logic := '0';
	signal stages1_iData : unsigned(15 downto 0) := (others => '0');
	signal stages1_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal stages1_oIQ : unsigned(15 downto 0) := (others => '0');
	signal stages1_oData : unsigned(15 downto 0) := (others => '0');
	signal stages1_oAccum : unsigned(32 downto 0) := (others => '0');
	signal stages2_iIQ : unsigned(15 downto 0) := (others => '0');
	signal stages2_iDO : unsigned(3 downto 0) := (others => '0');
	signal stages2_iFILO : unsigned(15 downto 0) := (others => '0');
	signal stages2_iAccum : unsigned(32 downto 0) := (others => '0');
	signal stages2_iInternalFeedbackSelector : std_logic := '0';
	signal stages2_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal stages2_iCoeffWE : std_logic := '0';
	signal stages2_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal stages2_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal stages2_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal stages2_iDataWE : std_logic := '0';
	signal stages2_iData : unsigned(15 downto 0) := (others => '0');
	signal stages2_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal stages2_oIQ : unsigned(15 downto 0) := (others => '0');
	signal stages2_oData : unsigned(15 downto 0) := (others => '0');
	signal stages2_oAccum : unsigned(32 downto 0) := (others => '0');
	signal stages3_iIQ : unsigned(15 downto 0) := (others => '0');
	signal stages3_iDO : unsigned(3 downto 0) := (others => '0');
	signal stages3_iFILO : unsigned(15 downto 0) := (others => '0');
	signal stages3_iAccum : unsigned(32 downto 0) := (others => '0');
	signal stages3_iInternalFeedbackSelector : std_logic := '0';
	signal stages3_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal stages3_iCoeffWE : std_logic := '0';
	signal stages3_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal stages3_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal stages3_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal stages3_iDataWE : std_logic := '0';
	signal stages3_iData : unsigned(15 downto 0) := (others => '0');
	signal stages3_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal stages3_oIQ : unsigned(15 downto 0) := (others => '0');
	signal stages3_oData : unsigned(15 downto 0) := (others => '0');
	signal stages3_oAccum : unsigned(32 downto 0) := (others => '0');
	signal FIRModule_L76F26T77_Resize : unsigned(32 downto 0) := (others => '0');
	signal stages0iIQstages0_iIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages0iDOstages0_iDOHardLink : unsigned(3 downto 0) := "0000";
	signal stages0iFILOstages0_iFILOHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages0iAccumstages0_iAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages0iInternalFeedbackSelectorstages0_iInternalFeedbackSelectorHardLink : std_logic := '0';
	signal stages0iCoeffReadAddrstages0_iCoeffReadAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages0iCoeffWEstages0_iCoeffWEHardLink : std_logic := '0';
	signal stages0iCoeffWriteAddrstages0_iCoeffWriteAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages0iCoeffDatastages0_iCoeffDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages0iDataReadAddrstages0_iDataReadAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages0iDataWEstages0_iDataWEHardLink : std_logic := '0';
	signal stages0iDatastages0_iDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages0iDataWriteAddrstages0_iDataWriteAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages0oIQstages0_oIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages0oDatastages0_oDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages0oAccumstages0_oAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages1iIQstages1_iIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages1iDOstages1_iDOHardLink : unsigned(3 downto 0) := "0000";
	signal stages1iFILOstages1_iFILOHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages1iAccumstages1_iAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages1iInternalFeedbackSelectorstages1_iInternalFeedbackSelectorHardLink : std_logic := '0';
	signal stages1iCoeffReadAddrstages1_iCoeffReadAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages1iCoeffWEstages1_iCoeffWEHardLink : std_logic := '0';
	signal stages1iCoeffWriteAddrstages1_iCoeffWriteAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages1iCoeffDatastages1_iCoeffDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages1iDataReadAddrstages1_iDataReadAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages1iDataWEstages1_iDataWEHardLink : std_logic := '0';
	signal stages1iDatastages1_iDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages1iDataWriteAddrstages1_iDataWriteAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages1oIQstages1_oIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages1oDatastages1_oDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages1oAccumstages1_oAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages2iIQstages2_iIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages2iDOstages2_iDOHardLink : unsigned(3 downto 0) := "0000";
	signal stages2iFILOstages2_iFILOHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages2iAccumstages2_iAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages2iInternalFeedbackSelectorstages2_iInternalFeedbackSelectorHardLink : std_logic := '0';
	signal stages2iCoeffReadAddrstages2_iCoeffReadAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages2iCoeffWEstages2_iCoeffWEHardLink : std_logic := '0';
	signal stages2iCoeffWriteAddrstages2_iCoeffWriteAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages2iCoeffDatastages2_iCoeffDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages2iDataReadAddrstages2_iDataReadAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages2iDataWEstages2_iDataWEHardLink : std_logic := '0';
	signal stages2iDatastages2_iDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages2iDataWriteAddrstages2_iDataWriteAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages2oIQstages2_oIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages2oDatastages2_oDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages2oAccumstages2_oAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages3iIQstages3_iIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages3iDOstages3_iDOHardLink : unsigned(3 downto 0) := "0000";
	signal stages3iFILOstages3_iFILOHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages3iAccumstages3_iAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal stages3iInternalFeedbackSelectorstages3_iInternalFeedbackSelectorHardLink : std_logic := '0';
	signal stages3iCoeffReadAddrstages3_iCoeffReadAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages3iCoeffWEstages3_iCoeffWEHardLink : std_logic := '0';
	signal stages3iCoeffWriteAddrstages3_iCoeffWriteAddrHardLink : unsigned(1 downto 0) := "00";
	signal stages3iCoeffDatastages3_iCoeffDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages3iDataReadAddrstages3_iDataReadAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages3iDataWEstages3_iDataWEHardLink : std_logic := '0';
	signal stages3iDatastages3_iDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages3iDataWriteAddrstages3_iDataWriteAddrHardLink : unsigned(7 downto 0) := "00000000";
	signal stages3oIQstages3_oIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages3oDatastages3_oDataHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal stages3oAccumstages3_oAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal FIRModule_L66F13T28_Expr : std_logic := '0';
	signal FIRModule_L66F13T28_ExprLhs : signed(4 downto 0) := "00000";
	signal FIRModule_L66F13T28_ExprRhs : signed(4 downto 0) := "00000";
	signal FIRModule_L66F13L68T46_Lookup : unsigned(15 downto 0) := "0000000000000000";
	signal FIRModule_L66F13L68T46_LookupMultiplexerAddress : std_logic := '0';
	signal FIRModule_L66F13L68T46_Lookup1 : unsigned(15 downto 0) := "0000000000000000";
	signal FIRModule_L66F13L68T46_Lookup2 : unsigned(15 downto 0) := "0000000000000000";
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	FIRModule_L66F13T28_Expr <= '1' when (signed(resize(FIRModule_L66F13T28_ExprLhs, FIRModule_L66F13T28_ExprLhs'length + 1)) = signed(resize(FIRModule_L66F13T28_ExprRhs, FIRModule_L66F13T28_ExprRhs'length + 1))) else '0';
	FIRModule4x16_TopLevel_stages0 : entity work.FIRModule4x16_TopLevel_stages0
	port map
	(
		-- [BEGIN USER MAP FOR stages0]
		-- [END USER MAP FOR stages0]
BoardSignals => BoardSignals,
iIQ => stages0iIQstages0_iIQHardLink,
iDO => stages0iDOstages0_iDOHardLink,
iFILO => stages0iFILOstages0_iFILOHardLink,
iAccum => stages0iAccumstages0_iAccumHardLink,
iInternalFeedbackSelector => stages0iInternalFeedbackSelectorstages0_iInternalFeedbackSelectorHardLink,
iCoeffReadAddr => stages0iCoeffReadAddrstages0_iCoeffReadAddrHardLink,
iCoeffWE => stages0iCoeffWEstages0_iCoeffWEHardLink,
iCoeffWriteAddr => stages0iCoeffWriteAddrstages0_iCoeffWriteAddrHardLink,
iCoeffData => stages0iCoeffDatastages0_iCoeffDataHardLink,
iDataReadAddr => stages0iDataReadAddrstages0_iDataReadAddrHardLink,
iDataWE => stages0iDataWEstages0_iDataWEHardLink,
iData => stages0iDatastages0_iDataHardLink,
iDataWriteAddr => stages0iDataWriteAddrstages0_iDataWriteAddrHardLink,
oIQ => stages0oIQstages0_oIQHardLink,
oData => stages0oDatastages0_oDataHardLink,
oAccum => stages0oAccumstages0_oAccumHardLink
	);
	FIRModule4x16_TopLevel_stages1 : entity work.FIRModule4x16_TopLevel_stages1
	port map
	(
		-- [BEGIN USER MAP FOR stages1]
		-- [END USER MAP FOR stages1]
BoardSignals => BoardSignals,
iIQ => stages1iIQstages1_iIQHardLink,
iDO => stages1iDOstages1_iDOHardLink,
iFILO => stages1iFILOstages1_iFILOHardLink,
iAccum => stages1iAccumstages1_iAccumHardLink,
iInternalFeedbackSelector => stages1iInternalFeedbackSelectorstages1_iInternalFeedbackSelectorHardLink,
iCoeffReadAddr => stages1iCoeffReadAddrstages1_iCoeffReadAddrHardLink,
iCoeffWE => stages1iCoeffWEstages1_iCoeffWEHardLink,
iCoeffWriteAddr => stages1iCoeffWriteAddrstages1_iCoeffWriteAddrHardLink,
iCoeffData => stages1iCoeffDatastages1_iCoeffDataHardLink,
iDataReadAddr => stages1iDataReadAddrstages1_iDataReadAddrHardLink,
iDataWE => stages1iDataWEstages1_iDataWEHardLink,
iData => stages1iDatastages1_iDataHardLink,
iDataWriteAddr => stages1iDataWriteAddrstages1_iDataWriteAddrHardLink,
oIQ => stages1oIQstages1_oIQHardLink,
oData => stages1oDatastages1_oDataHardLink,
oAccum => stages1oAccumstages1_oAccumHardLink
	);
	FIRModule4x16_TopLevel_stages2 : entity work.FIRModule4x16_TopLevel_stages2
	port map
	(
		-- [BEGIN USER MAP FOR stages2]
		-- [END USER MAP FOR stages2]
BoardSignals => BoardSignals,
iIQ => stages2iIQstages2_iIQHardLink,
iDO => stages2iDOstages2_iDOHardLink,
iFILO => stages2iFILOstages2_iFILOHardLink,
iAccum => stages2iAccumstages2_iAccumHardLink,
iInternalFeedbackSelector => stages2iInternalFeedbackSelectorstages2_iInternalFeedbackSelectorHardLink,
iCoeffReadAddr => stages2iCoeffReadAddrstages2_iCoeffReadAddrHardLink,
iCoeffWE => stages2iCoeffWEstages2_iCoeffWEHardLink,
iCoeffWriteAddr => stages2iCoeffWriteAddrstages2_iCoeffWriteAddrHardLink,
iCoeffData => stages2iCoeffDatastages2_iCoeffDataHardLink,
iDataReadAddr => stages2iDataReadAddrstages2_iDataReadAddrHardLink,
iDataWE => stages2iDataWEstages2_iDataWEHardLink,
iData => stages2iDatastages2_iDataHardLink,
iDataWriteAddr => stages2iDataWriteAddrstages2_iDataWriteAddrHardLink,
oIQ => stages2oIQstages2_oIQHardLink,
oData => stages2oDatastages2_oDataHardLink,
oAccum => stages2oAccumstages2_oAccumHardLink
	);
	FIRModule4x16_TopLevel_stages3 : entity work.FIRModule4x16_TopLevel_stages3
	port map
	(
		-- [BEGIN USER MAP FOR stages3]
		-- [END USER MAP FOR stages3]
BoardSignals => BoardSignals,
iIQ => stages3iIQstages3_iIQHardLink,
iDO => stages3iDOstages3_iDOHardLink,
iFILO => stages3iFILOstages3_iFILOHardLink,
iAccum => stages3iAccumstages3_iAccumHardLink,
iInternalFeedbackSelector => stages3iInternalFeedbackSelectorstages3_iInternalFeedbackSelectorHardLink,
iCoeffReadAddr => stages3iCoeffReadAddrstages3_iCoeffReadAddrHardLink,
iCoeffWE => stages3iCoeffWEstages3_iCoeffWEHardLink,
iCoeffWriteAddr => stages3iCoeffWriteAddrstages3_iCoeffWriteAddrHardLink,
iCoeffData => stages3iCoeffDatastages3_iCoeffDataHardLink,
iDataReadAddr => stages3iDataReadAddrstages3_iDataReadAddrHardLink,
iDataWE => stages3iDataWEstages3_iDataWEHardLink,
iData => stages3iDatastages3_iDataHardLink,
iDataWriteAddr => stages3iDataWriteAddrstages3_iDataWriteAddrHardLink,
oIQ => stages3oIQstages3_oIQHardLink,
oData => stages3oDatastages3_oDataHardLink,
oAccum => stages3oAccumstages3_oAccumHardLink
	);
	process (FIRModule_L66F13L68T46_Lookup1, FIRModule_L66F13L68T46_Lookup2, FIRModule_L66F13L68T46_LookupMultiplexerAddress)
	begin
		case FIRModule_L66F13L68T46_LookupMultiplexerAddress is
			when '0' =>
				FIRModule_L66F13L68T46_Lookup <= FIRModule_L66F13L68T46_Lookup1;
			when '1' =>
				FIRModule_L66F13L68T46_Lookup <= FIRModule_L66F13L68T46_Lookup2;
			when others =>
				FIRModule_L66F13L68T46_Lookup <= "0000000000000000";
		end case;
	end process;
	process (FIRModule_L66F13L68T46_Lookup, FIRModule_L66F13T28_Expr, FIRModule_L76F26T77_Resize, iCoeffData, iCoeffReadAddr, iCoeffWE, iCoeffWriteAddr, iData, iDataReadAddr, iDataWE, iDataWriteAddr, iDO, iInternalFeedbackSelector, iIQ, Inputs_iCoeffData, Inputs_iCoeffReadAddr, Inputs_iCoeffWE, Inputs_iCoeffWriteAddr, Inputs_iData, Inputs_iDataReadAddr, Inputs_iDataWE, Inputs_iDataWriteAddr, Inputs_iDO, Inputs_iInternalFeedbackSelector, Inputs_iIQ, internalFILO, stages0_iAccum, stages0_iCoeffData, stages0_iCoeffReadAddr, stages0_iCoeffWE, stages0_iCoeffWriteAddr, stages0_iData, stages0_iDataReadAddr, stages0_iDataWE, stages0_iDataWriteAddr, stages0_iDO, stages0_iFILO, stages0_iInternalFeedbackSelector, stages0_iIQ, stages0_oAccum, stages0_oData, stages0_oIQ, stages0oAccumstages0_oAccumHardLink, stages0oDatastages0_oDataHardLink, stages0oIQstages0_oIQHardLink, stages1_iAccum, stages1_iCoeffData, stages1_iCoeffReadAddr, stages1_iCoeffWE, stages1_iCoeffWriteAddr, stages1_iData, stages1_iDataReadAddr, stages1_iDataWE, stages1_iDataWriteAddr, stages1_iDO, stages1_iFILO, stages1_iInternalFeedbackSelector, stages1_iIQ, stages1_oAccum, stages1_oData, stages1_oIQ, stages1oAccumstages1_oAccumHardLink, stages1oDatastages1_oDataHardLink, stages1oIQstages1_oIQHardLink, stages2_iAccum, stages2_iCoeffData, stages2_iCoeffReadAddr, stages2_iCoeffWE, stages2_iCoeffWriteAddr, stages2_iData, stages2_iDataReadAddr, stages2_iDataWE, stages2_iDataWriteAddr, stages2_iDO, stages2_iFILO, stages2_iInternalFeedbackSelector, stages2_iIQ, stages2_oAccum, stages2_oData, stages2_oIQ, stages2oAccumstages2_oAccumHardLink, stages2oDatastages2_oDataHardLink, stages2oIQstages2_oIQHardLink, stages3_iAccum, stages3_iCoeffData, stages3_iCoeffReadAddr, stages3_iCoeffWE, stages3_iCoeffWriteAddr, stages3_iData, stages3_iDataReadAddr, stages3_iDataWE, stages3_iDataWriteAddr, stages3_iDO, stages3_iFILO, stages3_iInternalFeedbackSelector, stages3_iIQ, stages3_oAccum, stages3_oData, stages3_oIQ, stages3oAccumstages3_oAccumHardLink, stages3oDatastages3_oDataHardLink, stages3oIQstages3_oIQHardLink)
	begin
		FIRModule_L66F13T28_ExprLhs(4) <= '0';
		FIRModule_L66F13T28_ExprLhs(3 downto 0) <= signed(Inputs_iDO);
		FIRModule_L66F13T28_ExprRhs(4 downto 1) <= (others => '0');
		FIRModule_L66F13T28_ExprRhs(0) <= FIRModule_L66F27T28_Expr;
		Inputs_iIQ <= iIQ;
		Inputs_iDO <= iDO;
		Inputs_iInternalFeedbackSelector <= iInternalFeedbackSelector;
		Inputs_iCoeffReadAddr <= iCoeffReadAddr;
		Inputs_iCoeffWE <= iCoeffWE;
		Inputs_iCoeffWriteAddr <= iCoeffWriteAddr;
		Inputs_iCoeffData <= iCoeffData;
		Inputs_iDataReadAddr <= iDataReadAddr;
		Inputs_iDataWE <= iDataWE;
		Inputs_iData <= iData;
		Inputs_iDataWriteAddr <= iDataWriteAddr;
		internalFILO <= FIRModule_L66F13L68T46_Lookup;
		FIRModule_L76F26T77_Resize(32 downto 1) <= (others => '0');
		FIRModule_L76F26T77_Resize(0) <= FIRModule_L76F42T47_Expr;
		stages0_iIQ <= Inputs_iIQ;
		stages0_iDO(3 downto 1) <= (others => '0');
		stages0_iDO(0) <= FIRModule_L75F23T24_Expr;
		stages0_iFILO <= internalFILO;
		stages0_iAccum <= FIRModule_L76F26T77_Resize;
		stages0_iInternalFeedbackSelector <= Inputs_iInternalFeedbackSelector;
		stages0_iCoeffReadAddr <= Inputs_iCoeffReadAddr;
		stages0_iCoeffWE <= Inputs_iCoeffWE;
		stages0_iCoeffWriteAddr <= Inputs_iCoeffWriteAddr;
		stages0_iCoeffData <= Inputs_iCoeffData;
		stages0_iDataReadAddr <= Inputs_iDataReadAddr;
		stages0_iDataWE <= Inputs_iDataWE;
		stages0_iData <= Inputs_iData;
		stages0_iDataWriteAddr <= Inputs_iDataWriteAddr;
		stages1_iIQ <= stages0_oIQ;
		stages1_iDO <= Inputs_iDO;
		stages1_iFILO <= internalFILO;
		stages1_iAccum <= stages0_oAccum;
		stages1_iInternalFeedbackSelector <= Inputs_iInternalFeedbackSelector;
		stages1_iCoeffReadAddr <= Inputs_iCoeffReadAddr;
		stages1_iCoeffWE <= Inputs_iCoeffWE;
		stages1_iCoeffWriteAddr <= Inputs_iCoeffWriteAddr;
		stages1_iCoeffData <= Inputs_iCoeffData;
		stages1_iDataReadAddr <= Inputs_iDataReadAddr;
		stages1_iDataWE <= Inputs_iDataWE;
		stages1_iData <= stages0_oData;
		stages1_iDataWriteAddr <= Inputs_iDataWriteAddr;
		stages2_iIQ <= stages1_oIQ;
		stages2_iDO <= Inputs_iDO;
		stages2_iFILO <= internalFILO;
		stages2_iAccum <= stages1_oAccum;
		stages2_iInternalFeedbackSelector <= Inputs_iInternalFeedbackSelector;
		stages2_iCoeffReadAddr <= Inputs_iCoeffReadAddr;
		stages2_iCoeffWE <= Inputs_iCoeffWE;
		stages2_iCoeffWriteAddr <= Inputs_iCoeffWriteAddr;
		stages2_iCoeffData <= Inputs_iCoeffData;
		stages2_iDataReadAddr <= Inputs_iDataReadAddr;
		stages2_iDataWE <= Inputs_iDataWE;
		stages2_iData <= stages1_oData;
		stages2_iDataWriteAddr <= Inputs_iDataWriteAddr;
		stages3_iIQ <= stages2_oIQ;
		stages3_iDO <= Inputs_iDO;
		stages3_iFILO <= internalFILO;
		stages3_iAccum <= stages2_oAccum;
		stages3_iInternalFeedbackSelector <= Inputs_iInternalFeedbackSelector;
		stages3_iCoeffReadAddr <= Inputs_iCoeffReadAddr;
		stages3_iCoeffWE <= Inputs_iCoeffWE;
		stages3_iCoeffWriteAddr <= Inputs_iCoeffWriteAddr;
		stages3_iCoeffData <= Inputs_iCoeffData;
		stages3_iDataReadAddr <= Inputs_iDataReadAddr;
		stages3_iDataWE <= Inputs_iDataWE;
		stages3_iData <= stages2_oData;
		stages3_iDataWriteAddr <= Inputs_iDataWriteAddr;
		oAccum <= stages3_oAccum;
		oData <= stages3_oData;
		oIQ <= stages3_oIQ;
		stages0iIQstages0_iIQHardLink <= stages0_iIQ;
		stages0iDOstages0_iDOHardLink <= stages0_iDO;
		stages0iFILOstages0_iFILOHardLink <= stages0_iFILO;
		stages0iAccumstages0_iAccumHardLink <= stages0_iAccum;
		stages0iInternalFeedbackSelectorstages0_iInternalFeedbackSelectorHardLink <= stages0_iInternalFeedbackSelector;
		stages0iCoeffReadAddrstages0_iCoeffReadAddrHardLink <= stages0_iCoeffReadAddr;
		stages0iCoeffWEstages0_iCoeffWEHardLink <= stages0_iCoeffWE;
		stages0iCoeffWriteAddrstages0_iCoeffWriteAddrHardLink <= stages0_iCoeffWriteAddr;
		stages0iCoeffDatastages0_iCoeffDataHardLink <= stages0_iCoeffData;
		stages0iDataReadAddrstages0_iDataReadAddrHardLink <= stages0_iDataReadAddr;
		stages0iDataWEstages0_iDataWEHardLink <= stages0_iDataWE;
		stages0iDatastages0_iDataHardLink <= stages0_iData;
		stages0iDataWriteAddrstages0_iDataWriteAddrHardLink <= stages0_iDataWriteAddr;
		stages0_oIQ <= stages0oIQstages0_oIQHardLink;
		stages0_oData <= stages0oDatastages0_oDataHardLink;
		stages0_oAccum <= stages0oAccumstages0_oAccumHardLink;
		stages1iIQstages1_iIQHardLink <= stages1_iIQ;
		stages1iDOstages1_iDOHardLink <= stages1_iDO;
		stages1iFILOstages1_iFILOHardLink <= stages1_iFILO;
		stages1iAccumstages1_iAccumHardLink <= stages1_iAccum;
		stages1iInternalFeedbackSelectorstages1_iInternalFeedbackSelectorHardLink <= stages1_iInternalFeedbackSelector;
		stages1iCoeffReadAddrstages1_iCoeffReadAddrHardLink <= stages1_iCoeffReadAddr;
		stages1iCoeffWEstages1_iCoeffWEHardLink <= stages1_iCoeffWE;
		stages1iCoeffWriteAddrstages1_iCoeffWriteAddrHardLink <= stages1_iCoeffWriteAddr;
		stages1iCoeffDatastages1_iCoeffDataHardLink <= stages1_iCoeffData;
		stages1iDataReadAddrstages1_iDataReadAddrHardLink <= stages1_iDataReadAddr;
		stages1iDataWEstages1_iDataWEHardLink <= stages1_iDataWE;
		stages1iDatastages1_iDataHardLink <= stages1_iData;
		stages1iDataWriteAddrstages1_iDataWriteAddrHardLink <= stages1_iDataWriteAddr;
		stages1_oIQ <= stages1oIQstages1_oIQHardLink;
		stages1_oData <= stages1oDatastages1_oDataHardLink;
		stages1_oAccum <= stages1oAccumstages1_oAccumHardLink;
		stages2iIQstages2_iIQHardLink <= stages2_iIQ;
		stages2iDOstages2_iDOHardLink <= stages2_iDO;
		stages2iFILOstages2_iFILOHardLink <= stages2_iFILO;
		stages2iAccumstages2_iAccumHardLink <= stages2_iAccum;
		stages2iInternalFeedbackSelectorstages2_iInternalFeedbackSelectorHardLink <= stages2_iInternalFeedbackSelector;
		stages2iCoeffReadAddrstages2_iCoeffReadAddrHardLink <= stages2_iCoeffReadAddr;
		stages2iCoeffWEstages2_iCoeffWEHardLink <= stages2_iCoeffWE;
		stages2iCoeffWriteAddrstages2_iCoeffWriteAddrHardLink <= stages2_iCoeffWriteAddr;
		stages2iCoeffDatastages2_iCoeffDataHardLink <= stages2_iCoeffData;
		stages2iDataReadAddrstages2_iDataReadAddrHardLink <= stages2_iDataReadAddr;
		stages2iDataWEstages2_iDataWEHardLink <= stages2_iDataWE;
		stages2iDatastages2_iDataHardLink <= stages2_iData;
		stages2iDataWriteAddrstages2_iDataWriteAddrHardLink <= stages2_iDataWriteAddr;
		stages2_oIQ <= stages2oIQstages2_oIQHardLink;
		stages2_oData <= stages2oDatastages2_oDataHardLink;
		stages2_oAccum <= stages2oAccumstages2_oAccumHardLink;
		stages3iIQstages3_iIQHardLink <= stages3_iIQ;
		stages3iDOstages3_iDOHardLink <= stages3_iDO;
		stages3iFILOstages3_iFILOHardLink <= stages3_iFILO;
		stages3iAccumstages3_iAccumHardLink <= stages3_iAccum;
		stages3iInternalFeedbackSelectorstages3_iInternalFeedbackSelectorHardLink <= stages3_iInternalFeedbackSelector;
		stages3iCoeffReadAddrstages3_iCoeffReadAddrHardLink <= stages3_iCoeffReadAddr;
		stages3iCoeffWEstages3_iCoeffWEHardLink <= stages3_iCoeffWE;
		stages3iCoeffWriteAddrstages3_iCoeffWriteAddrHardLink <= stages3_iCoeffWriteAddr;
		stages3iCoeffDatastages3_iCoeffDataHardLink <= stages3_iCoeffData;
		stages3iDataReadAddrstages3_iDataReadAddrHardLink <= stages3_iDataReadAddr;
		stages3iDataWEstages3_iDataWEHardLink <= stages3_iDataWE;
		stages3iDatastages3_iDataHardLink <= stages3_iData;
		stages3iDataWriteAddrstages3_iDataWriteAddrHardLink <= stages3_iDataWriteAddr;
		stages3_oIQ <= stages3oIQstages3_oIQHardLink;
		stages3_oData <= stages3oDatastages3_oDataHardLink;
		stages3_oAccum <= stages3oAccumstages3_oAccumHardLink;
		FIRModule_L66F13L68T46_Lookup1 <= stages2_oIQ;
		FIRModule_L66F13L68T46_Lookup2 <= stages2_oData;
		FIRModule_L66F13L68T46_LookupMultiplexerAddress <= FIRModule_L66F13T28_Expr;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;