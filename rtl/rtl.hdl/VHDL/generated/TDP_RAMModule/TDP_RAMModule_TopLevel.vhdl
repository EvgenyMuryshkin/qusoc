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
-- System configuration name is TDP_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity TDP_RAMModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		Addr_A : in unsigned (7 downto 0);
		Addr_B : in unsigned (7 downto 0);
		WE_A : in std_logic;
		WE_B : in std_logic;
		WriteData_A : in unsigned (7 downto 0);
		WriteData_B : in unsigned (7 downto 0);
		OutCorrupted : out std_logic;
		OutDataA : out unsigned (7 downto 0);
		OutDataB : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of TDP_RAMModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_Addr_A : unsigned(7 downto 0) := (others => '0');
	signal Inputs_Addr_B : unsigned(7 downto 0) := (others => '0');
	signal Inputs_WE_A : std_logic := '0';
	signal Inputs_WE_B : std_logic := '0';
	signal Inputs_WriteData_A : unsigned(7 downto 0) := (others => '0');
	signal Inputs_WriteData_B : unsigned(7 downto 0) := (others => '0');
	signal NextState_SameAddressWrite : std_logic := '0';
	signal State_DataA : unsigned(7 downto 0) := (others => '0');
	signal State_DataB : unsigned(7 downto 0) := (others => '0');
	signal State_SameAddressWrite : std_logic := '0';
	constant State_SameAddressWriteDefault : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1 : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2 : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1 : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2 : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1 : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2 : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr : std_logic := '0';
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs : signed(8 downto 0) := "000000000";
	signal TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs : signed(8 downto 0) := "000000000";
	type State_BuffArray is array (0 to 255) of unsigned (7 downto 0);
	shared variable State_Buff : State_BuffArray := (others => (others => '0'));
begin
	process (Clock, NextState_SameAddressWrite, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_SameAddressWrite <= State_SameAddressWriteDefault;
			else
				State_SameAddressWrite <= NextState_SameAddressWrite;
			end if;
		end if;
	end process;
	TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr <= '1' when (signed(resize(TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs'length + 1)) = signed(resize(TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs'length + 1))) else '0';
	process (TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2)
	begin
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1 OR TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2;
	end process;
	process (TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2)
	begin
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1 AND TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2;
	end process;
	process (TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2)
	begin
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1 AND TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2;
	end process;
	process (State_SameAddressWrite, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr)
	begin
		NextState_SameAddressWrite <= State_SameAddressWrite;
		NextState_SameAddressWrite <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr;
	end process;
	process (Addr_A, Addr_B, Inputs_Addr_A, Inputs_Addr_B, Inputs_WE_A, Inputs_WE_B, State_DataA, State_DataB, State_SameAddressWrite, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr, TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr, WE_A, WE_B, WriteData_A, WriteData_B)
	begin
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs(8) <= '0';
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprLhs(7 downto 0) <= signed(Inputs_Addr_A);
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs(8) <= '0';
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_ExprRhs(7 downto 0) <= signed(Inputs_Addr_B);
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_1 <= State_SameAddressWrite;
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F42T130_Expr_2 <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr;
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_1 <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr;
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T129_Expr_2 <= TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F99T129_Expr;
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_1 <= Inputs_WE_A;
		TDP_RAMModule_L36F9L48T10_TDP_RAMModule_L37F69T95_Expr_2 <= Inputs_WE_B;
		Inputs_Addr_A <= Addr_A;
		Inputs_Addr_B <= Addr_B;
		Inputs_WE_A <= WE_A;
		Inputs_WE_B <= WE_B;
		Inputs_WriteData_A <= WriteData_A;
		Inputs_WriteData_B <= WriteData_B;
		OutCorrupted <= State_SameAddressWrite;
		OutDataA <= State_DataA;
		OutDataB <= State_DataB;
	end process;
	-- Port A
	process (Clock, Inputs_WE_A, Inputs_Addr_A)
	begin
		if rising_edge(Clock) then
			if Inputs_WE_A = '1' then
				State_Buff(TO_INTEGER(Inputs_Addr_A)) := Inputs_WriteData_A;
			end if;
			State_DataA <= State_Buff(TO_INTEGER(Inputs_Addr_A));
		end if;
	end process;
	-- Port B
	process (Clock, Inputs_WE_B, Inputs_Addr_B)
	begin
		if rising_edge(Clock) then
			if Inputs_WE_B = '1' then
				State_Buff(TO_INTEGER(Inputs_Addr_B)) := Inputs_WriteData_B;
			end if;
			State_DataB <= State_Buff(TO_INTEGER(Inputs_Addr_B));
		end if;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
