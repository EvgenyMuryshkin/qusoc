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
-- System configuration name is SDP_WF_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity SDP_WF_RAMModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		ReadAddress : in unsigned (7 downto 0);
		WE : in std_logic;
		WriteAddress : in unsigned (7 downto 0);
		WriteData : in unsigned (7 downto 0);
		Data : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of SDP_WF_RAMModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_ReadAddress : unsigned(7 downto 0) := (others => '0');
	signal Inputs_WE : std_logic := '0';
	signal Inputs_WriteAddress : unsigned(7 downto 0) := (others => '0');
	signal Inputs_WriteData : unsigned(7 downto 0) := (others => '0');
	signal State_ReadData : unsigned(7 downto 0) := (others => '0');
	type State_BuffArray is array (0 to 255) of unsigned (7 downto 0);
	signal State_Buff : State_BuffArray := (others => (others => '0'));
	signal Inputs_ReadAddress_reg : unsigned(7 downto 0);
begin
	process (ReadAddress, State_ReadData, WE, WriteAddress, WriteData)
	begin
		Inputs_ReadAddress <= ReadAddress;
		Inputs_WE <= WE;
		Inputs_WriteAddress <= WriteAddress;
		Inputs_WriteData <= WriteData;
		Data <= State_ReadData;
	end process;
	-- inferred simple dual port RAM with write-first behaviour
	process (Clock, Inputs_WE, Inputs_WriteAddress, Inputs_WriteData, Inputs_ReadAddress_reg, State_Buff, Inputs_ReadAddress)
	begin
		if rising_edge(Clock) then
			if Inputs_WE = '1' then
				State_Buff(TO_INTEGER(Inputs_WriteAddress)) <= Inputs_WriteData;
			end if;
			Inputs_ReadAddress_reg <= Inputs_ReadAddress(7 downto 0);
		end if;
		State_ReadData <= State_Buff(TO_INTEGER(Inputs_ReadAddress_reg));
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
