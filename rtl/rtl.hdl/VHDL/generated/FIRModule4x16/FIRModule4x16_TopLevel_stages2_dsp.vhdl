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
-- System configuration name is FIRModule4x16_TopLevel_stages2_dsp, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRModule4x16_TopLevel_stages2_dsp is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		iIQ : in unsigned (15 downto 0);
		iFILO : in unsigned (15 downto 0);
		iCoeff : in unsigned (15 downto 0);
		iAccum : in unsigned (32 downto 0);
		iInternalFeedbackSelector : in std_logic;
		oAccum : out unsigned (32 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRModule4x16_TopLevel_stages2_dsp is
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
	signal Inputs_iIQ : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iFILO : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iCoeff : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iAccum : unsigned(32 downto 0) := (others => '0');
	signal Inputs_iInternalFeedbackSelector : std_logic := '0';
	signal NextState_IQ1 : unsigned(15 downto 0) := (others => '0');
	signal NextState_IQ2 : unsigned(15 downto 0) := (others => '0');
	signal NextState_coeff : unsigned(15 downto 0) := (others => '0');
	signal NextState_sum : unsigned(16 downto 0) := (others => '0');
	signal NextState_mult : unsigned(32 downto 0) := (others => '0');
	signal NextState_accum : unsigned(32 downto 0) := (others => '0');
	signal internalAccumInputData : unsigned(32 downto 0) := (others => '0');
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index : unsigned(16 downto 0) := (others => '0');
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index : unsigned(32 downto 0) := (others => '0');
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index : unsigned(32 downto 0) := (others => '0');
	signal State_IQ1 : unsigned(15 downto 0) := "0000000000000000";
	constant State_IQ1Default : unsigned(15 downto 0) := "0000000000000000";
	signal State_IQ2 : unsigned(15 downto 0) := "0000000000000000";
	constant State_IQ2Default : unsigned(15 downto 0) := "0000000000000000";
	signal State_coeff : unsigned(15 downto 0) := "0000000000000000";
	constant State_coeffDefault : unsigned(15 downto 0) := "0000000000000000";
	signal State_sum : unsigned(16 downto 0) := "00000000000000000";
	constant State_sumDefault : unsigned(16 downto 0) := "00000000000000000";
	signal State_mult : unsigned(32 downto 0) := "000000000000000000000000000000000";
	constant State_multDefault : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal State_accum : unsigned(32 downto 0) := "000000000000000000000000000000000";
	constant State_accumDefault : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr : unsigned(17 downto 0) := "000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1 : signed(17 downto 0) := "000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2 : signed(17 downto 0) := "000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr : unsigned(33 downto 0) := "0000000000000000000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1 : signed(33 downto 0) := "0000000000000000000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2 : signed(33 downto 0) := "0000000000000000000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr : unsigned(34 downto 0) := "00000000000000000000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1 : signed(34 downto 0) := "00000000000000000000000000000000000";
	signal FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2 : signed(34 downto 0) := "00000000000000000000000000000000000";
	signal FIRStageDSPModule_L59F13L61T30_Lookup : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress : std_logic := '0';
	signal FIRStageDSPModule_L59F13L61T30_Lookup1 : unsigned(32 downto 0) := "000000000000000000000000000000000";
	signal FIRStageDSPModule_L59F13L61T30_Lookup2 : unsigned(32 downto 0) := "000000000000000000000000000000000";
begin
	process (BoardSignals, NextState_accum, NextState_coeff, NextState_IQ1, NextState_IQ2, NextState_mult, NextState_sum)
	begin
		if rising_edge(BoardSignals.Clock) then
			if BoardSignals.Reset = '1' then
				State_IQ1 <= State_IQ1Default;
				State_IQ2 <= State_IQ2Default;
				State_coeff <= State_coeffDefault;
				State_sum <= State_sumDefault;
				State_mult <= State_multDefault;
				State_accum <= State_accumDefault;
			else
				State_IQ1 <= NextState_IQ1;
				State_IQ2 <= NextState_IQ2;
				State_coeff <= NextState_coeff;
				State_sum <= NextState_sum;
				State_mult <= NextState_mult;
				State_accum <= NextState_accum;
			end if;
		end if;
	end process;
	process (FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2)
	begin
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr <= resize(unsigned(signed(resize(FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1'length + 1)) + signed(resize(FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2'length + 1))), FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr'length);
	end process;
	process (FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2)
	begin
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr <= resize(unsigned(signed(resize(FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1'length + 1)) * signed(resize(FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2'length + 1))), FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr'length);
	end process;
	process (FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2)
	begin
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr <= resize(unsigned(signed(resize(FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1'length + 1)) + signed(resize(FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2'length + 1))), FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr'length);
	end process;
	process (FIRStageDSPModule_L59F13L61T30_Lookup1, FIRStageDSPModule_L59F13L61T30_Lookup2, FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress)
	begin
		case FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress is
			when '0' =>
				FIRStageDSPModule_L59F13L61T30_Lookup <= FIRStageDSPModule_L59F13L61T30_Lookup1;
			when '1' =>
				FIRStageDSPModule_L59F13L61T30_Lookup <= FIRStageDSPModule_L59F13L61T30_Lookup2;
			when others =>
				FIRStageDSPModule_L59F13L61T30_Lookup <= "000000000000000000000000000000000";
		end case;
	end process;
	process (FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index, Inputs_iCoeff, Inputs_iIQ, State_accum, State_coeff, State_IQ1, State_IQ2, State_mult, State_sum)
	begin
		NextState_IQ1 <= State_IQ1;
		NextState_IQ2 <= State_IQ2;
		NextState_coeff <= State_coeff;
		NextState_sum <= State_sum;
		NextState_mult <= State_mult;
		NextState_accum <= State_accum;
		NextState_IQ1 <= Inputs_iIQ;
		NextState_IQ2 <= State_IQ1;
		NextState_coeff <= Inputs_iCoeff;
		NextState_sum <= FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index;
		NextState_mult <= FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index;
		NextState_accum <= FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index;
	end process;
	process (FIRStageDSPModule_L59F13L61T30_Lookup, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr, FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr, iAccum, iCoeff, iFILO, iInternalFeedbackSelector, iIQ, Inputs_iAccum, Inputs_iFILO, Inputs_iInternalFeedbackSelector, internalAccumInputData, State_accum, State_coeff, State_IQ2, State_mult, State_sum)
	begin
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1(17 downto 16) <= (others => '0');
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_1(15 downto 0) <= signed(State_IQ2);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2(17 downto 16) <= (others => '0');
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr_2(15 downto 0) <= signed(Inputs_iFILO);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1(33 downto 17) <= (others => '0');
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_1(16 downto 0) <= signed(State_sum);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2(33 downto 16) <= (others => '0');
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr_2(15 downto 0) <= signed(State_coeff);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1(34 downto 33) <= (others => '0');
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_1(32 downto 0) <= signed(State_mult);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2(34 downto 33) <= (others => '0');
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr_2(32 downto 0) <= signed(internalAccumInputData);
		Inputs_iIQ <= iIQ;
		Inputs_iFILO <= iFILO;
		Inputs_iCoeff <= iCoeff;
		Inputs_iAccum <= iAccum;
		Inputs_iInternalFeedbackSelector <= iInternalFeedbackSelector;
		internalAccumInputData <= FIRStageDSPModule_L59F13L61T30_Lookup;
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F29T81_Index <= FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L72F30T54_Expr(16 downto 0);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F30T82_Index <= FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L73F31T54_Expr(32 downto 0);
		FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F31T96_Index <= FIRStageDSPModule_L66F9L76T10_FIRStageDSPModule_L75F32T67_Expr(32 downto 0);
		oAccum <= State_accum;
		FIRStageDSPModule_L59F13L61T30_Lookup1 <= State_accum;
		FIRStageDSPModule_L59F13L61T30_Lookup2 <= Inputs_iAccum;
		FIRStageDSPModule_L59F13L61T30_LookupMultiplexerAddress <= Inputs_iInternalFeedbackSelector;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
