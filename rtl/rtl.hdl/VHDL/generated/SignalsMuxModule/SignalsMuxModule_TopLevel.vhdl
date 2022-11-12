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
-- System configuration name is SignalsMuxModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity SignalsMuxModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Addr : in unsigned (1 downto 0);
		Sig0 : in unsigned (7 downto 0);
		Sig1 : in unsigned (7 downto 0);
		Sig2 : in unsigned (7 downto 0);
		Sig3 : in unsigned (7 downto 0);
		Value : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of SignalsMuxModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	signal Inputs_Addr : unsigned(1 downto 0) := (others => '0');
	signal Inputs_Sig0 : unsigned(7 downto 0) := (others => '0');
	signal Inputs_Sig1 : unsigned(7 downto 0) := (others => '0');
	signal Inputs_Sig2 : unsigned(7 downto 0) := (others => '0');
	signal Inputs_Sig3 : unsigned(7 downto 0) := (others => '0');
	signal SignalsMuxModule_L24F30T50_Index : unsigned(7 downto 0) := (others => '0');
	type signalsArray is array (0 to 3) of unsigned (7 downto 0);
	signal signals : signalsArray := (others => (others => '0'));
begin
	process (Addr, Inputs_Sig0, Inputs_Sig1, Inputs_Sig2, Inputs_Sig3, Sig0, Sig1, Sig2, Sig3, signals, SignalsMuxModule_L24F30T50_Index)
	begin
		Inputs_Addr <= Addr;
		Inputs_Sig0 <= Sig0;
		Inputs_Sig1 <= Sig1;
		Inputs_Sig2 <= Sig2;
		Inputs_Sig3 <= Sig3;
		signals(0) <= Inputs_Sig0;
		signals(1) <= Inputs_Sig1;
		signals(2) <= Inputs_Sig2;
		signals(3) <= Inputs_Sig3;
		Value <= SignalsMuxModule_L24F30T50_Index;
		SignalsMuxModule_L24F30T50_Index <= signals(TO_INTEGER(Inputs_Addr));
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
