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
-- System configuration name is OverrideScheduleComposition_TopLevel_GetOverride, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity OverrideScheduleComposition_TopLevel_GetOverride is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		InOverride : in std_logic;
		InValue : in unsigned (7 downto 0);
		OutValue : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of OverrideScheduleComposition_TopLevel_GetOverride is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant CombinationalOverridesBase_L16F50T51_Expr : std_logic := '1';
	constant CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F54T55_Expr : unsigned(1 downto 0) := "11";
	signal Inputs_InOverride : std_logic := '0';
	signal Inputs_InValue : unsigned(7 downto 0) := (others => '0');
	signal InternalOffset : unsigned(7 downto 0) := (others => '0');
	signal CombinationalGetValueOverride_L12F13L19T14_result : unsigned(7 downto 0) := "00000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast : unsigned(7 downto 0) := (others => '0');
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast : unsigned(7 downto 0) := (others => '0');
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_WhenTrue : unsigned(7 downto 0) := "00000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_WhenFalse : unsigned(7 downto 0) := "00000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Ternary : unsigned(7 downto 0) := "00000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast : unsigned(7 downto 0) := (others => '0');
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr : unsigned(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1 : signed(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2 : signed(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr : signed(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1 : signed(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2 : signed(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr : unsigned(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1 : signed(9 downto 0) := "0000000000";
	signal CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2 : signed(9 downto 0) := "0000000000";
begin
	process (CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2)
	begin
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr <= resize(unsigned(signed(resize(CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1'length + 1)) + signed(resize(CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2'length + 1))), CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr'length);
	end process;
	process (CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2)
	begin
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr <= resize(signed(signed(resize(CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1'length + 1)) - signed(resize(CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2'length + 1))), CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr'length);
	end process;
	process (CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1, CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2)
	begin
		CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr <= resize(unsigned(signed(resize(CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1, CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1'length + 1)) + signed(resize(CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2, CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2'length + 1))), CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr'length);
	end process;
	CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Ternary <= CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_WhenTrue when (Inputs_InOverride = '1') else CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_WhenFalse;
	process (CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Ternary, Inputs_InOverride)
	begin
		CombinationalGetValueOverride_L12F13L19T14_result <= CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_Ternary;
		if Inputs_InOverride = '1' then
			CombinationalGetValueOverride_L12F13L19T14_result <= CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast;
		end if;
	end process;
	process (CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast, CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr, CombinationalGetValueOverride_L12F13L19T14_result, InOverride, Inputs_InValue, InternalOffset, InValue)
	begin
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1(9 downto 8) <= (
			others => '0'
		)
		;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_1(7 downto 0) <= signed(Inputs_InValue);
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2(9 downto 8) <= (
			others => '0'
		)
		;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr_2(7 downto 0) <= signed(InternalOffset);
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1(9 downto 8) <= (
			others => '0'
		)
		;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_1(7 downto 0) <= signed(Inputs_InValue);
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2(9 downto 8) <= (
			others => '0'
		)
		;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr_2(7 downto 0) <= signed(InternalOffset);
		CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1(9 downto 8) <= (
			others => '0'
		)
		;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_1(7 downto 0) <= signed(Inputs_InValue);
		CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2(9 downto 2) <= (
			others => '0'
		)
		;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr_2(1 downto 0) <= signed(CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F54T55_Expr);
		Inputs_InOverride <= InOverride;
		Inputs_InValue <= InValue;
		InternalOffset(7 downto 1) <= (
			others => '0'
		)
		;
		InternalOffset(0) <= CombinationalOverridesBase_L16F50T51_Expr;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast <= CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F27T49_Expr(7 downto 0);
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast <= unsigned(CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F27T49_Expr(7 downto 0));
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_WhenTrue <= CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F61T77_CombinationalOverridesBase_L24F9L26T10_CombinationalOverridesBase_L25F20T50_CombinationalOverridesBase_L34F9L36T10_CombinationalOverridesBase_L35F20T50_Cast;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F41T96_WhenFalse <= CombinationalGetValueOverride_L12F13L19T14_CombinationalOverridesBase_L14F80T96_CombinationalOverridesBase_L19F9L21T10_CombinationalOverridesBase_L20F20T50_CombinationalOverridesBase_L29F9L31T10_CombinationalOverridesBase_L30F20T50_Cast;
		CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F30T56_Cast <= CombinationalGetValueOverride_L12F13L19T14_CombinationalGetValueOverride_L16F37T55_Expr(7 downto 0);
		OutValue <= CombinationalGetValueOverride_L12F13L19T14_result;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
