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
-- System configuration name is FIRModule4x16_TopLevel_stages0, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRModule4x16_TopLevel_stages0 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		iIQ : in unsigned (15 downto 0);
		iDO : in unsigned (3 downto 0);
		iFILO : in unsigned (15 downto 0);
		iAccum : in unsigned (32 downto 0);
		iInternalFeedbackSelector : in std_logic;
		iCoeffReadAddr : in unsigned (1 downto 0);
		iCoeffWE : in std_logic;
		iCoeffWriteAddr : in unsigned (1 downto 0);
		iCoeffData : in unsigned (15 downto 0);
		iDataReadAddr : in unsigned (7 downto 0);
		iDataWE : in std_logic;
		iData : in unsigned (15 downto 0);
		iDataWriteAddr : in unsigned (7 downto 0);
		oIQ : out unsigned (15 downto 0);
		oData : out unsigned (15 downto 0);
		oAccum : out unsigned (32 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRModule4x16_TopLevel_stages0 is
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
	constant FIRStageModule_L104F49T50_Expr : std_logic := '0';
	signal Inputs_iIQ : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDO : unsigned(3 downto 0) := (others => '0');
	signal Inputs_iFILO : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iAccum : unsigned(32 downto 0) := (others => '0');
	signal Inputs_iInternalFeedbackSelector : std_logic := '0';
	signal Inputs_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_iCoeffWE : std_logic := '0';
	signal Inputs_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iDataWE : std_logic := '0';
	signal Inputs_iData : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal NextState_IQ1 : unsigned(15 downto 0) := (others => '0');
	signal NextState_IQ2 : unsigned(15 downto 0) := (others => '0');
	signal internalIQ : unsigned(15 downto 0) := (others => '0');
	signal dsp_iIQ : unsigned(15 downto 0) := (others => '0');
	signal dsp_iFILO : unsigned(15 downto 0) := (others => '0');
	signal dsp_iCoeff : unsigned(15 downto 0) := (others => '0');
	signal dsp_iAccum : unsigned(32 downto 0) := (others => '0');
	signal dsp_iInternalFeedbackSelector : std_logic := '0';
	signal dsp_oAccum : unsigned(32 downto 0) := (others => '0');
	signal dspiIQdsp_iIQHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal dspiFILOdsp_iFILOHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal dspiCoeffdsp_iCoeffHardLink : unsigned(15 downto 0) := "0000000000000000";
	signal dspiAccumdsp_iAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal dspiInternalFeedbackSelectordsp_iInternalFeedbackSelectorHardLink : std_logic := '0';
	signal dspoAccumdsp_oAccumHardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal State_IQ1 : unsigned(15 downto 0) := "0000000000000000";
	constant State_IQ1Default : unsigned(15 downto 0) := "0000000000000000";
	signal State_IQ2 : unsigned(15 downto 0) := "0000000000000000";
	constant State_IQ2Default : unsigned(15 downto 0) := "0000000000000000";
	signal State_coeff : unsigned(15 downto 0) := (others => '0');
	signal State_data : unsigned(15 downto 0) := (others => '0');
	signal FIRStageModule_L104F35T50_Expr : std_logic := '0';
	signal FIRStageModule_L104F35T50_ExprLhs : signed(4 downto 0) := "00000";
	signal FIRStageModule_L104F35T50_ExprRhs : signed(4 downto 0) := "00000";
	signal FIRStageModule_L104F35L106T27_Lookup : unsigned(15 downto 0) := "0000000000000000";
	signal FIRStageModule_L104F35L106T27_LookupMultiplexerAddress : std_logic := '0';
	signal FIRStageModule_L104F35L106T27_Lookup1 : unsigned(15 downto 0) := "0000000000000000";
	signal FIRStageModule_L104F35L106T27_Lookup2 : unsigned(15 downto 0) := "0000000000000000";
	type State_coeffRAMArray is array (0 to 1) of unsigned (15 downto 0);
	constant State_coeffRAMArrayInit : State_coeffRAMArray := (
		"0000000000000000",
		"0000000000000000"
	);
	signal State_coeffRAM : State_coeffRAMArray := State_coeffRAMArrayInit;
	type State_dataRAMArray is array (0 to 127) of unsigned (15 downto 0);
	constant State_dataRAMArrayInit : State_dataRAMArray := (
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000",
		"0000000000000000"
	);
	signal State_dataRAM : State_dataRAMArray := State_dataRAMArrayInit;
begin
	process (BoardSignals, NextState_IQ1, NextState_IQ2)
	begin
		if rising_edge(BoardSignals.Clock) then
			if BoardSignals.Reset = '1' then
				State_IQ1 <= State_IQ1Default;
				State_IQ2 <= State_IQ2Default;
			else
				State_IQ1 <= NextState_IQ1;
				State_IQ2 <= NextState_IQ2;
			end if;
		end if;
	end process;
	FIRStageModule_L104F35T50_Expr <= '1' when (signed(resize(FIRStageModule_L104F35T50_ExprLhs, FIRStageModule_L104F35T50_ExprLhs'length + 1)) = signed(resize(FIRStageModule_L104F35T50_ExprRhs, FIRStageModule_L104F35T50_ExprRhs'length + 1))) else '0';
	FIRModule4x16_TopLevel_stages0_dsp : entity work.FIRModule4x16_TopLevel_stages0_dsp
	port map
	(
		-- [BEGIN USER MAP FOR dsp]
		-- [END USER MAP FOR dsp]
BoardSignals => BoardSignals,
iIQ => dspiIQdsp_iIQHardLink,
iFILO => dspiFILOdsp_iFILOHardLink,
iCoeff => dspiCoeffdsp_iCoeffHardLink,
iAccum => dspiAccumdsp_iAccumHardLink,
iInternalFeedbackSelector => dspiInternalFeedbackSelectordsp_iInternalFeedbackSelectorHardLink,
oAccum => dspoAccumdsp_oAccumHardLink
	);
	process (FIRStageModule_L104F35L106T27_Lookup1, FIRStageModule_L104F35L106T27_Lookup2, FIRStageModule_L104F35L106T27_LookupMultiplexerAddress)
	begin
		case FIRStageModule_L104F35L106T27_LookupMultiplexerAddress is
			when '0' =>
				FIRStageModule_L104F35L106T27_Lookup <= FIRStageModule_L104F35L106T27_Lookup1;
			when '1' =>
				FIRStageModule_L104F35L106T27_Lookup <= FIRStageModule_L104F35L106T27_Lookup2;
			when others =>
				FIRStageModule_L104F35L106T27_Lookup <= "0000000000000000";
		end case;
	end process;
	process (Inputs_iIQ, State_IQ1, State_IQ2)
	begin
		NextState_IQ1 <= State_IQ1;
		NextState_IQ2 <= State_IQ2;
		NextState_IQ1 <= Inputs_iIQ;
		NextState_IQ2 <= State_IQ1;
	end process;
	process (dsp_iAccum, dsp_iCoeff, dsp_iFILO, dsp_iInternalFeedbackSelector, dsp_iIQ, dsp_oAccum, dspoAccumdsp_oAccumHardLink, FIRStageModule_L104F35L106T27_Lookup, FIRStageModule_L104F35T50_Expr, iAccum, iCoeffData, iCoeffReadAddr, iCoeffWE, iCoeffWriteAddr, iData, iDataReadAddr, iDataWE, iDataWriteAddr, iDO, iFILO, iInternalFeedbackSelector, iIQ, Inputs_iAccum, Inputs_iData, Inputs_iDO, Inputs_iFILO, Inputs_iInternalFeedbackSelector, Inputs_iIQ, internalIQ, State_coeff, State_data, State_IQ2)
	begin
		FIRStageModule_L104F35T50_ExprLhs(4) <= '0';
		FIRStageModule_L104F35T50_ExprLhs(3 downto 0) <= signed(Inputs_iDO);
		FIRStageModule_L104F35T50_ExprRhs(4 downto 1) <= (others => '0');
		FIRStageModule_L104F35T50_ExprRhs(0) <= FIRStageModule_L104F49T50_Expr;
		Inputs_iIQ <= iIQ;
		Inputs_iDO <= iDO;
		Inputs_iFILO <= iFILO;
		Inputs_iAccum <= iAccum;
		Inputs_iInternalFeedbackSelector <= iInternalFeedbackSelector;
		Inputs_iCoeffReadAddr <= iCoeffReadAddr;
		Inputs_iCoeffWE <= iCoeffWE;
		Inputs_iCoeffWriteAddr <= iCoeffWriteAddr;
		Inputs_iCoeffData <= iCoeffData;
		Inputs_iDataReadAddr <= iDataReadAddr;
		Inputs_iDataWE <= iDataWE;
		Inputs_iData <= iData;
		Inputs_iDataWriteAddr <= iDataWriteAddr;
		internalIQ <= FIRStageModule_L104F35L106T27_Lookup;
		dsp_iIQ <= internalIQ;
		dsp_iFILO <= Inputs_iFILO;
		dsp_iCoeff <= State_coeff;
		dsp_iAccum <= Inputs_iAccum;
		dsp_iInternalFeedbackSelector <= Inputs_iInternalFeedbackSelector;
		oIQ <= State_IQ2;
		oData <= State_data;
		oAccum <= dsp_oAccum;
		dspiIQdsp_iIQHardLink <= dsp_iIQ;
		dspiFILOdsp_iFILOHardLink <= dsp_iFILO;
		dspiCoeffdsp_iCoeffHardLink <= dsp_iCoeff;
		dspiAccumdsp_iAccumHardLink <= dsp_iAccum;
		dspiInternalFeedbackSelectordsp_iInternalFeedbackSelectorHardLink <= dsp_iInternalFeedbackSelector;
		dsp_oAccum <= dspoAccumdsp_oAccumHardLink;
		FIRStageModule_L104F35L106T27_Lookup1 <= Inputs_iData;
		FIRStageModule_L104F35L106T27_Lookup2 <= Inputs_iIQ;
		FIRStageModule_L104F35L106T27_LookupMultiplexerAddress <= FIRStageModule_L104F35T50_Expr;
	end process;
	-- inferred simple dual port RAM with read-first behaviour
	process (BoardSignals.Clock, Inputs_iCoeffWE, Inputs_iCoeffWriteAddr, Inputs_iCoeffData, State_coeffRAM, Inputs_iCoeffReadAddr)
	begin
		if rising_edge(BoardSignals.Clock) then
			if Inputs_iCoeffWE = '1' then
				State_coeffRAM(TO_INTEGER(Inputs_iCoeffWriteAddr)) <= Inputs_iCoeffData;
			end if;
			State_coeff <= State_coeffRAM(TO_INTEGER(Inputs_iCoeffReadAddr));
		end if;
	end process;
	-- inferred simple dual port RAM with read-first behaviour
	process (BoardSignals.Clock, Inputs_iDataWE, Inputs_iDataWriteAddr, Inputs_iData, State_dataRAM, Inputs_iDataReadAddr)
	begin
		if rising_edge(BoardSignals.Clock) then
			if Inputs_iDataWE = '1' then
				State_dataRAM(TO_INTEGER(Inputs_iDataWriteAddr)) <= Inputs_iData;
			end if;
			State_data <= State_dataRAM(TO_INTEGER(Inputs_iDataReadAddr));
		end if;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
