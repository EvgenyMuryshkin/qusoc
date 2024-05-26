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
-- System configuration name is FIRStageModule16_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRStageModule16_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iAccum : in unsigned (32 downto 0);
		iCoeffData : in unsigned (15 downto 0);
		iCoeffReadAddr : in unsigned (1 downto 0);
		iCoeffWE : in std_logic;
		iCoeffWriteAddr : in unsigned (1 downto 0);
		iData : in unsigned (15 downto 0);
		iDataReadAddr : in unsigned (7 downto 0);
		iDataWE : in std_logic;
		iDataWriteAddr : in unsigned (7 downto 0);
		iDO : in unsigned (3 downto 0);
		iFILO : in unsigned (15 downto 0);
		iInternalFeedbackSelector : in std_logic;
		iIQ : in unsigned (15 downto 0);
		oAccum : out unsigned (32 downto 0);
		oData : out unsigned (15 downto 0);
		oIQ : out unsigned (15 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRStageModule16_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant firParams_AccumSize : signed(6 downto 0) := "0100001";
	constant firParams_CoeffRamAddrBits : signed(2 downto 0) := "010";
	constant firParams_CoeffSize : signed(5 downto 0) := "010000";
	constant firParams_DataRamAddrBits : signed(4 downto 0) := "01000";
	constant firParams_DOSize : signed(3 downto 0) := "0100";
	constant firParams_IQSizeIn : signed(5 downto 0) := "010000";
	constant firParams_IQSizeOut : signed(5 downto 0) := "010000";
	constant firParams_MultSize : signed(6 downto 0) := "0100001";
	constant firParams_Order : signed(3 downto 0) := "0100";
	constant firParams_SumSize : signed(5 downto 0) := "010001";
	constant FIRStageModule_L104F49T50_Expr : std_logic := '0';
	signal Inputs_iAccum : unsigned(32 downto 0) := (others => '0');
	signal Inputs_iCoeffData : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iCoeffReadAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_iCoeffWE : std_logic := '0';
	signal Inputs_iCoeffWriteAddr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_iData : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iDataReadAddr : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iDataWE : std_logic := '0';
	signal Inputs_iDataWriteAddr : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iDO : unsigned(3 downto 0) := (others => '0');
	signal Inputs_iFILO : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iInternalFeedbackSelector : std_logic := '0';
	signal Inputs_iIQ : unsigned(15 downto 0) := (others => '0');
	signal NextState_IQ1 : unsigned(15 downto 0) := (others => '0');
	signal NextState_IQ2 : unsigned(15 downto 0) := (others => '0');
	signal internalIQ : unsigned(15 downto 0) := (others => '0');
	signal dsp_iAccum : unsigned(32 downto 0) := (others => '0');
	signal dsp_iCoeff : unsigned(15 downto 0) := (others => '0');
	signal dsp_iFILO : unsigned(15 downto 0) := (others => '0');
	signal dsp_iInternalFeedbackSelector : std_logic := '0';
	signal dsp_iIQ : unsigned(15 downto 0) := (others => '0');
	signal dsp_oAccum : unsigned(32 downto 0) := (others => '0');
	signal FIRStageModule_L104F35L106T27_WhenTrue : unsigned(15 downto 0) := "0000000000000000";
	signal FIRStageModule_L104F35L106T27_WhenFalse : unsigned(15 downto 0) := "0000000000000000";
	signal FIRStageModule_L104F35L106T27_Ternary : unsigned(15 downto 0) := "0000000000000000";
	signal FIRStageModule_L93F32L100T14_Object : unsigned(81 downto 0) := (others => '0');
	signal dsp_iAccum_dsp_iAccum_HardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal dsp_iCoeff_dsp_iCoeff_HardLink : unsigned(15 downto 0) := "0000000000000000";
	signal dsp_iFILO_dsp_iFILO_HardLink : unsigned(15 downto 0) := "0000000000000000";
	signal dsp_iInternalFeedbackSelector_dsp_iInternalFeedbackSelector_HardLink : std_logic := '0';
	signal dsp_iIQ_dsp_iIQ_HardLink : unsigned(15 downto 0) := "0000000000000000";
	signal dsp_oAccum_dsp_oAccum_HardLink : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal State_coeff : unsigned(15 downto 0) := (others => '0');
	signal State_data : unsigned(15 downto 0) := (others => '0');
	signal State_IQ1 : unsigned(15 downto 0) := "0000000000000000";
	constant State_IQ1Default : unsigned(15 downto 0) := "0000000000000000";
	signal State_IQ2 : unsigned(15 downto 0) := "0000000000000000";
	constant State_IQ2Default : unsigned(15 downto 0) := "0000000000000000";
	signal FIRStageModule_L104F35T50_Expr : std_logic := '0';
	signal FIRStageModule_L104F35T50_ExprLhs : signed(4 downto 0) := "00000";
	signal FIRStageModule_L104F35T50_ExprRhs : signed(4 downto 0) := "00000";
	type State_coeffRAMArray is array (0 to 1) of unsigned (15 downto 0);
	signal State_coeffRAM : State_coeffRAMArray := (others => (others => '0'));
	type State_dataRAMArray is array (0 to 127) of unsigned (15 downto 0);
	signal State_dataRAM : State_dataRAMArray := (others => (others => '0'));
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	process (Clock, NextState_IQ1, NextState_IQ2, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_IQ1 <= State_IQ1Default;
				State_IQ2 <= State_IQ2Default;
			else
				State_IQ1 <= NextState_IQ1;
				State_IQ2 <= NextState_IQ2;
			end if;
		end if;
	end process;
	FIRStageModule_L104F35T50_Expr <= '1' when (signed(resize(FIRStageModule_L104F35T50_ExprLhs, FIRStageModule_L104F35T50_ExprLhs'length + 1)) = signed(resize(FIRStageModule_L104F35T50_ExprRhs, FIRStageModule_L104F35T50_ExprRhs'length + 1))) else '0';
	FIRStageModule16_TopLevel_dsp : entity work.FIRStageModule16_TopLevel_dsp
	port map
	(
		-- [BEGIN USER MAP FOR dsp]
		-- [END USER MAP FOR dsp]
		BoardSignals => BoardSignals,
		iAccum => dsp_iAccum_dsp_iAccum_HardLink,
		iCoeff => dsp_iCoeff_dsp_iCoeff_HardLink,
		iFILO => dsp_iFILO_dsp_iFILO_HardLink,
		iInternalFeedbackSelector => dsp_iInternalFeedbackSelector_dsp_iInternalFeedbackSelector_HardLink,
		iIQ => dsp_iIQ_dsp_iIQ_HardLink,
		oAccum => dsp_oAccum_dsp_oAccum_HardLink
	)
	;
	FIRStageModule_L104F35L106T27_Ternary <= FIRStageModule_L104F35L106T27_WhenTrue when (FIRStageModule_L104F35T50_Expr = '1') else FIRStageModule_L104F35L106T27_WhenFalse;
	process (Inputs_iIQ, State_IQ1, State_IQ2)
	begin
		NextState_IQ1 <= State_IQ1;
		NextState_IQ2 <= State_IQ2;
		NextState_IQ1 <= Inputs_iIQ;
		NextState_IQ2 <= State_IQ1;
	end process;
	process (dsp_iAccum, dsp_iCoeff, dsp_iFILO, dsp_iInternalFeedbackSelector, dsp_iIQ, dsp_oAccum, dsp_oAccum_dsp_oAccum_HardLink, FIRStageModule_L104F35L106T27_Ternary, FIRStageModule_L93F32L100T14_Object, iAccum, iCoeffData, iCoeffReadAddr, iCoeffWE, iCoeffWriteAddr, iData, iDataReadAddr, iDataWE, iDataWriteAddr, iDO, iFILO, iInternalFeedbackSelector, iIQ, Inputs_iAccum, Inputs_iData, Inputs_iDO, Inputs_iFILO, Inputs_iInternalFeedbackSelector, Inputs_iIQ, internalIQ, State_coeff, State_data, State_IQ2)
	begin
		FIRStageModule_L104F35T50_ExprLhs(4) <= '0';
		FIRStageModule_L104F35T50_ExprLhs(3 downto 0) <= signed(Inputs_iDO);
		FIRStageModule_L104F35T50_ExprRhs(4 downto 1) <= (
			others => '0'
		)
		;
		FIRStageModule_L104F35T50_ExprRhs(0) <= FIRStageModule_L104F49T50_Expr;
		Inputs_iAccum <= iAccum;
		Inputs_iCoeffData <= iCoeffData;
		Inputs_iCoeffReadAddr <= iCoeffReadAddr;
		Inputs_iCoeffWE <= iCoeffWE;
		Inputs_iCoeffWriteAddr <= iCoeffWriteAddr;
		Inputs_iData <= iData;
		Inputs_iDataReadAddr <= iDataReadAddr;
		Inputs_iDataWE <= iDataWE;
		Inputs_iDataWriteAddr <= iDataWriteAddr;
		Inputs_iDO <= iDO;
		Inputs_iFILO <= iFILO;
		Inputs_iInternalFeedbackSelector <= iInternalFeedbackSelector;
		Inputs_iIQ <= iIQ;
		FIRStageModule_L104F35L106T27_WhenTrue <= Inputs_iIQ;
		FIRStageModule_L104F35L106T27_WhenFalse <= Inputs_iData;
		internalIQ <= FIRStageModule_L104F35L106T27_Ternary;
		FIRStageModule_L93F32L100T14_Object(32 downto 0) <= Inputs_iAccum;
		FIRStageModule_L93F32L100T14_Object(48 downto 33) <= State_coeff;
		FIRStageModule_L93F32L100T14_Object(64 downto 49) <= Inputs_iFILO;
		FIRStageModule_L93F32L100T14_Object(65) <= Inputs_iInternalFeedbackSelector;
		FIRStageModule_L93F32L100T14_Object(81 downto 66) <= internalIQ;
		dsp_iIQ <= FIRStageModule_L93F32L100T14_Object(81 downto 66);
		dsp_iInternalFeedbackSelector <= FIRStageModule_L93F32L100T14_Object(65);
		dsp_iFILO <= FIRStageModule_L93F32L100T14_Object(64 downto 49);
		dsp_iCoeff <= FIRStageModule_L93F32L100T14_Object(48 downto 33);
		dsp_iAccum <= FIRStageModule_L93F32L100T14_Object(32 downto 0);
		oAccum <= dsp_oAccum;
		oData <= State_data;
		oIQ <= State_IQ2;
		dsp_iAccum_dsp_iAccum_HardLink <= dsp_iAccum;
		dsp_iCoeff_dsp_iCoeff_HardLink <= dsp_iCoeff;
		dsp_iFILO_dsp_iFILO_HardLink <= dsp_iFILO;
		dsp_iInternalFeedbackSelector_dsp_iInternalFeedbackSelector_HardLink <= dsp_iInternalFeedbackSelector;
		dsp_iIQ_dsp_iIQ_HardLink <= dsp_iIQ;
		dsp_oAccum <= dsp_oAccum_dsp_oAccum_HardLink;
	end process;
	-- inferred simple dual port RAM with read-first behaviour
	process (Clock, Inputs_iCoeffWE, Inputs_iCoeffWriteAddr, Inputs_iCoeffData, State_coeffRAM, Inputs_iCoeffReadAddr)
	begin
		if rising_edge(Clock) then
			if Inputs_iCoeffWE = '1' then
				State_coeffRAM(TO_INTEGER(Inputs_iCoeffWriteAddr)) <= Inputs_iCoeffData;
			end if;
			State_coeff <= State_coeffRAM(TO_INTEGER(Inputs_iCoeffReadAddr));
		end if;
	end process;
	-- inferred simple dual port RAM with read-first behaviour
	process (Clock, Inputs_iDataWE, Inputs_iDataWriteAddr, Inputs_iData, State_dataRAM, Inputs_iDataReadAddr)
	begin
		if rising_edge(Clock) then
			if Inputs_iDataWE = '1' then
				State_dataRAM(TO_INTEGER(Inputs_iDataWriteAddr)) <= Inputs_iData;
			end if;
			State_data <= State_dataRAM(TO_INTEGER(Inputs_iDataReadAddr));
		end if;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;