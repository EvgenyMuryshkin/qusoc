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
-- System configuration name is OverrideScheduleComposition_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity OverrideScheduleComposition_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		InOverride : in std_logic;
		InValue : in unsigned (7 downto 0);
		NoOverrideValue : out unsigned (7 downto 0);
		AutoOverrideValue : out unsigned (7 downto 0);
		L1Value : out unsigned (7 downto 0);
		L2Value : out unsigned (7 downto 0);
		L3Value : out unsigned (7 downto 0);
		GetValue : out unsigned (7 downto 0);
		RawInputs_InOverride : out std_logic;
		RawInputs_InValue : out unsigned (7 downto 0);
		OverrideInputs_InOverride : out std_logic;
		OverrideInputs_InValue : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of OverrideScheduleComposition_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	signal Inputs_InOverride : std_logic := '0';
	signal Inputs_InValue : unsigned(7 downto 0) := (others => '0');
	signal ModulesInputs_InOverride : std_logic := '0';
	signal ModulesInputs_InValue : unsigned(7 downto 0) := (others => '0');
	signal InvertedInput : unsigned(7 downto 0) := (others => '0');
	signal NoOverride_InOverride : std_logic := '0';
	signal NoOverride_InValue : unsigned(7 downto 0) := (others => '0');
	signal NoOverride_OutValue : unsigned(7 downto 0) := (others => '0');
	signal AutoOverride_InOverride : std_logic := '0';
	signal AutoOverride_InValue : unsigned(7 downto 0) := (others => '0');
	signal AutoOverride_OutValue : unsigned(7 downto 0) := (others => '0');
	signal GetOverride_InOverride : std_logic := '0';
	signal GetOverride_InValue : unsigned(7 downto 0) := (others => '0');
	signal GetOverride_OutValue : unsigned(7 downto 0) := (others => '0');
	signal L1Override_InOverride : std_logic := '0';
	signal L1Override_InValue : unsigned(7 downto 0) := (others => '0');
	signal L1Override_OutValue : unsigned(7 downto 0) := (others => '0');
	signal L2Override_InOverride : std_logic := '0';
	signal L2Override_InValue : unsigned(7 downto 0) := (others => '0');
	signal L2Override_OutValue : unsigned(7 downto 0) := (others => '0');
	signal L3Override_InOverride : std_logic := '0';
	signal L3Override_InValue : unsigned(7 downto 0) := (others => '0');
	signal L3Override_OutValue : unsigned(7 downto 0) := (others => '0');
	signal NoOverrideInOverrideNoOverride_InOverrideHardLink : std_logic := '0';
	signal NoOverrideInValueNoOverride_InValueHardLink : unsigned(7 downto 0) := "00000000";
	signal NoOverrideOutValueNoOverride_OutValueHardLink : unsigned(7 downto 0) := "00000000";
	signal AutoOverrideInOverrideAutoOverride_InOverrideHardLink : std_logic := '0';
	signal AutoOverrideInValueAutoOverride_InValueHardLink : unsigned(7 downto 0) := "00000000";
	signal AutoOverrideOutValueAutoOverride_OutValueHardLink : unsigned(7 downto 0) := "00000000";
	signal GetOverrideInOverrideGetOverride_InOverrideHardLink : std_logic := '0';
	signal GetOverrideInValueGetOverride_InValueHardLink : unsigned(7 downto 0) := "00000000";
	signal GetOverrideOutValueGetOverride_OutValueHardLink : unsigned(7 downto 0) := "00000000";
	signal L1OverrideInOverrideL1Override_InOverrideHardLink : std_logic := '0';
	signal L1OverrideInValueL1Override_InValueHardLink : unsigned(7 downto 0) := "00000000";
	signal L1OverrideOutValueL1Override_OutValueHardLink : unsigned(7 downto 0) := "00000000";
	signal L2OverrideInOverrideL2Override_InOverrideHardLink : std_logic := '0';
	signal L2OverrideInValueL2Override_InValueHardLink : unsigned(7 downto 0) := "00000000";
	signal L2OverrideOutValueL2Override_OutValueHardLink : unsigned(7 downto 0) := "00000000";
	signal L3OverrideInOverrideL3Override_InOverrideHardLink : std_logic := '0';
	signal L3OverrideInValueL3Override_InValueHardLink : unsigned(7 downto 0) := "00000000";
	signal L3OverrideOutValueL3Override_OutValueHardLink : unsigned(7 downto 0) := "00000000";
	signal OverrideInputsComposition_L14F30T48_Expr : std_logic := '0';
	signal OverrideInputsComposition_L14F30T48_Expr_1 : std_logic := '0';
	signal OverrideInputsComposition_L7F38T72_Expr : unsigned(7 downto 0) := "00000000";
	signal OverrideInputsComposition_L7F38T72_Expr_1 : unsigned(7 downto 0) := "00000000";
begin
	process (OverrideInputsComposition_L14F30T48_Expr_1)
	begin
		OverrideInputsComposition_L14F30T48_Expr <= NOT OverrideInputsComposition_L14F30T48_Expr_1;
	end process;
	process (OverrideInputsComposition_L7F38T72_Expr_1)
	begin
		OverrideInputsComposition_L7F38T72_Expr <= NOT OverrideInputsComposition_L7F38T72_Expr_1;
	end process;
	OverrideScheduleComposition_TopLevel_NoOverride : entity work.OverrideScheduleComposition_TopLevel_NoOverride
	port map
	(
		-- [BEGIN USER MAP FOR NoOverride]
		-- [END USER MAP FOR NoOverride]
		InOverride => NoOverrideInOverrideNoOverride_InOverrideHardLink,
		InValue => NoOverrideInValueNoOverride_InValueHardLink,
		OutValue => NoOverrideOutValueNoOverride_OutValueHardLink
	)
	;
	OverrideScheduleComposition_TopLevel_AutoOverride : entity work.OverrideScheduleComposition_TopLevel_AutoOverride
	port map
	(
		-- [BEGIN USER MAP FOR AutoOverride]
		-- [END USER MAP FOR AutoOverride]
		InOverride => AutoOverrideInOverrideAutoOverride_InOverrideHardLink,
		InValue => AutoOverrideInValueAutoOverride_InValueHardLink,
		OutValue => AutoOverrideOutValueAutoOverride_OutValueHardLink
	)
	;
	OverrideScheduleComposition_TopLevel_GetOverride : entity work.OverrideScheduleComposition_TopLevel_GetOverride
	port map
	(
		-- [BEGIN USER MAP FOR GetOverride]
		-- [END USER MAP FOR GetOverride]
		InOverride => GetOverrideInOverrideGetOverride_InOverrideHardLink,
		InValue => GetOverrideInValueGetOverride_InValueHardLink,
		OutValue => GetOverrideOutValueGetOverride_OutValueHardLink
	)
	;
	OverrideScheduleComposition_TopLevel_L1Override : entity work.OverrideScheduleComposition_TopLevel_L1Override
	port map
	(
		-- [BEGIN USER MAP FOR L1Override]
		-- [END USER MAP FOR L1Override]
		InOverride => L1OverrideInOverrideL1Override_InOverrideHardLink,
		InValue => L1OverrideInValueL1Override_InValueHardLink,
		OutValue => L1OverrideOutValueL1Override_OutValueHardLink
	)
	;
	OverrideScheduleComposition_TopLevel_L2Override : entity work.OverrideScheduleComposition_TopLevel_L2Override
	port map
	(
		-- [BEGIN USER MAP FOR L2Override]
		-- [END USER MAP FOR L2Override]
		InOverride => L2OverrideInOverrideL2Override_InOverrideHardLink,
		InValue => L2OverrideInValueL2Override_InValueHardLink,
		OutValue => L2OverrideOutValueL2Override_OutValueHardLink
	)
	;
	OverrideScheduleComposition_TopLevel_L3Override : entity work.OverrideScheduleComposition_TopLevel_L3Override
	port map
	(
		-- [BEGIN USER MAP FOR L3Override]
		-- [END USER MAP FOR L3Override]
		InOverride => L3OverrideInOverrideL3Override_InOverrideHardLink,
		InValue => L3OverrideInValueL3Override_InValueHardLink,
		OutValue => L3OverrideOutValueL3Override_OutValueHardLink
	)
	;
	process (AutoOverride_InOverride, AutoOverride_InValue, AutoOverride_OutValue, AutoOverrideOutValueAutoOverride_OutValueHardLink, GetOverride_InOverride, GetOverride_InValue, GetOverride_OutValue, GetOverrideOutValueGetOverride_OutValueHardLink, InOverride, Inputs_InOverride, Inputs_InValue, InValue, InvertedInput, L1Override_InOverride, L1Override_InValue, L1Override_OutValue, L1OverrideOutValueL1Override_OutValueHardLink, L2Override_InOverride, L2Override_InValue, L2Override_OutValue, L2OverrideOutValueL2Override_OutValueHardLink, L3Override_InOverride, L3Override_InValue, L3Override_OutValue, L3OverrideOutValueL3Override_OutValueHardLink, ModulesInputs_InOverride, ModulesInputs_InValue, NoOverride_InOverride, NoOverride_InValue, NoOverride_OutValue, NoOverrideOutValueNoOverride_OutValueHardLink, OverrideInputsComposition_L14F30T48_Expr, OverrideInputsComposition_L7F38T72_Expr)
	begin
		OverrideInputsComposition_L14F30T48_Expr_1 <= Inputs_InOverride;
		OverrideInputsComposition_L7F38T72_Expr_1 <= Inputs_InValue;
		Inputs_InOverride <= InOverride;
		Inputs_InValue <= InValue;
		ModulesInputs_InOverride <= OverrideInputsComposition_L14F30T48_Expr;
		ModulesInputs_InValue <= InvertedInput;
		InvertedInput <= OverrideInputsComposition_L7F38T72_Expr;
		L1Override_InOverride <= ModulesInputs_InOverride;
		L1Override_InValue <= ModulesInputs_InValue;
		L2Override_InOverride <= ModulesInputs_InOverride;
		L2Override_InValue <= ModulesInputs_InValue;
		L3Override_InOverride <= ModulesInputs_InOverride;
		L3Override_InValue <= ModulesInputs_InValue;
		GetOverride_InOverride <= ModulesInputs_InOverride;
		GetOverride_InValue <= ModulesInputs_InValue;
		NoOverride_InOverride <= Inputs_InOverride;
		NoOverride_InValue <= Inputs_InValue;
		AutoOverride_InOverride <= Inputs_InOverride;
		AutoOverride_InValue <= Inputs_InValue;
		NoOverrideValue <= NoOverride_OutValue;
		AutoOverrideValue <= AutoOverride_OutValue;
		L1Value <= L1Override_OutValue;
		L2Value <= L2Override_OutValue;
		L3Value <= L3Override_OutValue;
		GetValue <= GetOverride_OutValue;
		RawInputs_InOverride <= Inputs_InOverride;
		RawInputs_InValue <= Inputs_InValue;
		OverrideInputs_InOverride <= ModulesInputs_InOverride;
		OverrideInputs_InValue <= ModulesInputs_InValue;
		NoOverrideInOverrideNoOverride_InOverrideHardLink <= NoOverride_InOverride;
		NoOverrideInValueNoOverride_InValueHardLink <= NoOverride_InValue;
		NoOverride_OutValue <= NoOverrideOutValueNoOverride_OutValueHardLink;
		AutoOverrideInOverrideAutoOverride_InOverrideHardLink <= AutoOverride_InOverride;
		AutoOverrideInValueAutoOverride_InValueHardLink <= AutoOverride_InValue;
		AutoOverride_OutValue <= AutoOverrideOutValueAutoOverride_OutValueHardLink;
		GetOverrideInOverrideGetOverride_InOverrideHardLink <= GetOverride_InOverride;
		GetOverrideInValueGetOverride_InValueHardLink <= GetOverride_InValue;
		GetOverride_OutValue <= GetOverrideOutValueGetOverride_OutValueHardLink;
		L1OverrideInOverrideL1Override_InOverrideHardLink <= L1Override_InOverride;
		L1OverrideInValueL1Override_InValueHardLink <= L1Override_InValue;
		L1Override_OutValue <= L1OverrideOutValueL1Override_OutValueHardLink;
		L2OverrideInOverrideL2Override_InOverrideHardLink <= L2Override_InOverride;
		L2OverrideInValueL2Override_InValueHardLink <= L2Override_InValue;
		L2Override_OutValue <= L2OverrideOutValueL2Override_OutValueHardLink;
		L3OverrideInOverrideL3Override_InOverrideHardLink <= L3Override_InOverride;
		L3OverrideInValueL3Override_InValueHardLink <= L3Override_InValue;
		L3Override_OutValue <= L3OverrideOutValueL3Override_OutValueHardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
