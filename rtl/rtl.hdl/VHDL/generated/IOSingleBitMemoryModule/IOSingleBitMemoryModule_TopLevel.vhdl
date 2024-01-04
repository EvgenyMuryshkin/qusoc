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
-- System configuration name is IOSingleBitMemoryModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity IOSingleBitMemoryModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iBit : in unsigned (0 downto 0);
		oBit : out unsigned (0 downto 0);
		oBit0 : out std_logic;
		oBitInternal : out unsigned (0 downto 0);
		oBitState : out unsigned (0 downto 0);
		oBitStateInternal : out unsigned (0 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of IOSingleBitMemoryModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_iBit : unsigned(0 downto 0) := (others => '0');
	signal NextState_bit : unsigned(0 downto 0) := (others => '0');
	signal NextState_bitInternal : unsigned(0 downto 0) := (others => '0');
	signal bit : unsigned(0 downto 0) := (others => '0');
	signal State_bit : unsigned(0 downto 0) := "0";
	constant State_bitDefault : unsigned(0 downto 0) := "0";
	signal State_bitInternal : unsigned(0 downto 0) := "0";
	constant State_bitInternalDefault : unsigned(0 downto 0) := "0";
begin
	process (Clock, NextState_bit, NextState_bitInternal, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_bit <= State_bitDefault;
				State_bitInternal <= State_bitInternalDefault;
			else
				State_bit <= NextState_bit;
				State_bitInternal <= NextState_bitInternal;
			end if;
		end if;
	end process;
	process (bit, Inputs_iBit, State_bit, State_bitInternal)
	begin
		NextState_bit <= State_bit;
		NextState_bitInternal <= State_bitInternal;
		NextState_bit <= Inputs_iBit;
		NextState_bitInternal <= bit;
	end process;
	process (bit, iBit, Inputs_iBit, State_bit, State_bitInternal)
	begin
		Inputs_iBit <= iBit;
		bit <= Inputs_iBit;
		oBit <= Inputs_iBit;
		oBit0 <= Inputs_iBit(0);
		oBitInternal <= bit;
		oBitState <= State_bit;
		oBitStateInternal <= State_bitInternal;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
