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
-- System configuration name is OverrideInputsComposition_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity OverrideInputsComposition_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		InOverride : in std_logic;
		InValue : in unsigned (7 downto 0);
		AutoOverrideValue : out unsigned (7 downto 0);
		GetValue : out unsigned (7 downto 0);
		L1Value : out unsigned (7 downto 0);
		L2Value : out unsigned (7 downto 0);
		L3Value : out unsigned (7 downto 0);
		NoOverrideValue : out unsigned (7 downto 0);
		OverrideInputs_InOverride : out std_logic;
		OverrideInputs_InValue : out unsigned (7 downto 0);
		RawInputs_InOverride : out std_logic;
		RawInputs_InValue : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of OverrideInputsComposition_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_InOverride : std_logic := '0';
	signal Inputs_InValue : unsigned(7 downto 0) := (others => '0');
	signal ModulesInputs_InOverride : std_logic := '0';
	signal ModulesInputs_InValue : unsigned(7 downto 0) := (others => '0');
	signal InvertedInput : unsigned(7 downto 0) := (others => '0');
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
	signal NoOverride_InOverride : std_logic := '0';
	signal NoOverride_InValue : unsigned(7 downto 0) := (others => '0');
	signal NoOverride_OutValue : unsigned(7 downto 0) := (others => '0');
	signal AutoOverride_InOverride_AutoOverride_InOverride_HardLink : std_logic := '0';
	signal AutoOverride_InValue_AutoOverride_InValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal AutoOverride_OutValue_AutoOverride_OutValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal GetOverride_InOverride_GetOverride_InOverride_HardLink : std_logic := '0';
	signal GetOverride_InValue_GetOverride_InValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal GetOverride_OutValue_GetOverride_OutValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal L1Override_InOverride_L1Override_InOverride_HardLink : std_logic := '0';
	signal L1Override_InValue_L1Override_InValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal L1Override_OutValue_L1Override_OutValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal L2Override_InOverride_L2Override_InOverride_HardLink : std_logic := '0';
	signal L2Override_InValue_L2Override_InValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal L2Override_OutValue_L2Override_OutValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal L3Override_InOverride_L3Override_InOverride_HardLink : std_logic := '0';
	signal L3Override_InValue_L3Override_InValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal L3Override_OutValue_L3Override_OutValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal NoOverride_InOverride_NoOverride_InOverride_HardLink : std_logic := '0';
	signal NoOverride_InValue_NoOverride_InValue_HardLink : unsigned(7 downto 0) := "00000000";
	signal NoOverride_OutValue_NoOverride_OutValue_HardLink : unsigned(7 downto 0) := "00000000";
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
	OverrideInputsComposition_TopLevel_AutoOverride : entity work.OverrideInputsComposition_TopLevel_AutoOverride
	port map
	(
		-- [BEGIN USER MAP FOR AutoOverride]
		-- [END USER MAP FOR AutoOverride]
		InOverride => AutoOverride_InOverride_AutoOverride_InOverride_HardLink,
		InValue => AutoOverride_InValue_AutoOverride_InValue_HardLink,
		OutValue => AutoOverride_OutValue_AutoOverride_OutValue_HardLink
	)
	;
	OverrideInputsComposition_TopLevel_GetOverride : entity work.OverrideInputsComposition_TopLevel_GetOverride
	port map
	(
		-- [BEGIN USER MAP FOR GetOverride]
		-- [END USER MAP FOR GetOverride]
		InOverride => GetOverride_InOverride_GetOverride_InOverride_HardLink,
		InValue => GetOverride_InValue_GetOverride_InValue_HardLink,
		OutValue => GetOverride_OutValue_GetOverride_OutValue_HardLink
	)
	;
	OverrideInputsComposition_TopLevel_L1Override : entity work.OverrideInputsComposition_TopLevel_L1Override
	port map
	(
		-- [BEGIN USER MAP FOR L1Override]
		-- [END USER MAP FOR L1Override]
		InOverride => L1Override_InOverride_L1Override_InOverride_HardLink,
		InValue => L1Override_InValue_L1Override_InValue_HardLink,
		OutValue => L1Override_OutValue_L1Override_OutValue_HardLink
	)
	;
	OverrideInputsComposition_TopLevel_L2Override : entity work.OverrideInputsComposition_TopLevel_L2Override
	port map
	(
		-- [BEGIN USER MAP FOR L2Override]
		-- [END USER MAP FOR L2Override]
		InOverride => L2Override_InOverride_L2Override_InOverride_HardLink,
		InValue => L2Override_InValue_L2Override_InValue_HardLink,
		OutValue => L2Override_OutValue_L2Override_OutValue_HardLink
	)
	;
	OverrideInputsComposition_TopLevel_L3Override : entity work.OverrideInputsComposition_TopLevel_L3Override
	port map
	(
		-- [BEGIN USER MAP FOR L3Override]
		-- [END USER MAP FOR L3Override]
		InOverride => L3Override_InOverride_L3Override_InOverride_HardLink,
		InValue => L3Override_InValue_L3Override_InValue_HardLink,
		OutValue => L3Override_OutValue_L3Override_OutValue_HardLink
	)
	;
	OverrideInputsComposition_TopLevel_NoOverride : entity work.OverrideInputsComposition_TopLevel_NoOverride
	port map
	(
		-- [BEGIN USER MAP FOR NoOverride]
		-- [END USER MAP FOR NoOverride]
		InOverride => NoOverride_InOverride_NoOverride_InOverride_HardLink,
		InValue => NoOverride_InValue_NoOverride_InValue_HardLink,
		OutValue => NoOverride_OutValue_NoOverride_OutValue_HardLink
	)
	;
	process (AutoOverride_InOverride, AutoOverride_InValue, AutoOverride_OutValue, AutoOverride_OutValue_AutoOverride_OutValue_HardLink, GetOverride_InOverride, GetOverride_InValue, GetOverride_OutValue, GetOverride_OutValue_GetOverride_OutValue_HardLink, InOverride, Inputs_InOverride, Inputs_InValue, InValue, InvertedInput, L1Override_InOverride, L1Override_InValue, L1Override_OutValue, L1Override_OutValue_L1Override_OutValue_HardLink, L2Override_InOverride, L2Override_InValue, L2Override_OutValue, L2Override_OutValue_L2Override_OutValue_HardLink, L3Override_InOverride, L3Override_InValue, L3Override_OutValue, L3Override_OutValue_L3Override_OutValue_HardLink, ModulesInputs_InOverride, ModulesInputs_InValue, NoOverride_InOverride, NoOverride_InValue, NoOverride_OutValue, NoOverride_OutValue_NoOverride_OutValue_HardLink, OverrideInputsComposition_L14F30T48_Expr, OverrideInputsComposition_L7F38T72_Expr)
	begin
		OverrideInputsComposition_L14F30T48_Expr_1 <= Inputs_InOverride;
		OverrideInputsComposition_L7F38T72_Expr_1 <= Inputs_InValue;
		Inputs_InOverride <= InOverride;
		Inputs_InValue <= InValue;
		ModulesInputs_InOverride <= OverrideInputsComposition_L14F30T48_Expr;
		ModulesInputs_InValue <= InvertedInput;
		InvertedInput <= OverrideInputsComposition_L7F38T72_Expr;
		NoOverride_InOverride <= ModulesInputs_InOverride;
		NoOverride_InValue <= ModulesInputs_InValue;
		AutoOverride_InOverride <= ModulesInputs_InOverride;
		AutoOverride_InValue <= ModulesInputs_InValue;
		L1Override_InOverride <= ModulesInputs_InOverride;
		L1Override_InValue <= ModulesInputs_InValue;
		L2Override_InOverride <= ModulesInputs_InOverride;
		L2Override_InValue <= ModulesInputs_InValue;
		L3Override_InOverride <= ModulesInputs_InOverride;
		L3Override_InValue <= ModulesInputs_InValue;
		GetOverride_InOverride <= ModulesInputs_InOverride;
		GetOverride_InValue <= ModulesInputs_InValue;
		AutoOverrideValue <= AutoOverride_OutValue;
		GetValue <= GetOverride_OutValue;
		L1Value <= L1Override_OutValue;
		L2Value <= L2Override_OutValue;
		L3Value <= L3Override_OutValue;
		NoOverrideValue <= NoOverride_OutValue;
		OverrideInputs_InOverride <= ModulesInputs_InOverride;
		OverrideInputs_InValue <= ModulesInputs_InValue;
		RawInputs_InOverride <= Inputs_InOverride;
		RawInputs_InValue <= Inputs_InValue;
		AutoOverride_InOverride_AutoOverride_InOverride_HardLink <= AutoOverride_InOverride;
		AutoOverride_InValue_AutoOverride_InValue_HardLink <= AutoOverride_InValue;
		AutoOverride_OutValue <= AutoOverride_OutValue_AutoOverride_OutValue_HardLink;
		GetOverride_InOverride_GetOverride_InOverride_HardLink <= GetOverride_InOverride;
		GetOverride_InValue_GetOverride_InValue_HardLink <= GetOverride_InValue;
		GetOverride_OutValue <= GetOverride_OutValue_GetOverride_OutValue_HardLink;
		L1Override_InOverride_L1Override_InOverride_HardLink <= L1Override_InOverride;
		L1Override_InValue_L1Override_InValue_HardLink <= L1Override_InValue;
		L1Override_OutValue <= L1Override_OutValue_L1Override_OutValue_HardLink;
		L2Override_InOverride_L2Override_InOverride_HardLink <= L2Override_InOverride;
		L2Override_InValue_L2Override_InValue_HardLink <= L2Override_InValue;
		L2Override_OutValue <= L2Override_OutValue_L2Override_OutValue_HardLink;
		L3Override_InOverride_L3Override_InOverride_HardLink <= L3Override_InOverride;
		L3Override_InValue_L3Override_InValue_HardLink <= L3Override_InValue;
		L3Override_OutValue <= L3Override_OutValue_L3Override_OutValue_HardLink;
		NoOverride_InOverride_NoOverride_InOverride_HardLink <= NoOverride_InOverride;
		NoOverride_InValue_NoOverride_InValue_HardLink <= NoOverride_InValue;
		NoOverride_OutValue <= NoOverride_OutValue_NoOverride_OutValue_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
