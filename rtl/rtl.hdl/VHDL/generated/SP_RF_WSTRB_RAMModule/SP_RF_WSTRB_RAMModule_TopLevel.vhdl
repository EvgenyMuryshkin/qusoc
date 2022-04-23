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
-- System configuration name is SP_RF_WSTRB_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity SP_RF_WSTRB_RAMModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		Address : in unsigned (7 downto 0);
		WriteData0 : in unsigned (7 downto 0);
		WriteData1 : in unsigned (7 downto 0);
		WriteData2 : in unsigned (7 downto 0);
		WriteData3 : in unsigned (7 downto 0);
		WE : in std_logic;
		WSTRB : in unsigned (3 downto 0);
		Data0 : out unsigned (7 downto 0);
		Data1 : out unsigned (7 downto 0);
		Data2 : out unsigned (7 downto 0);
		Data3 : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of SP_RF_WSTRB_RAMModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	constant SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_0_w : std_logic := '0';
	constant SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_1_w : std_logic := '1';
	constant SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_2_w : unsigned(1 downto 0) := "10";
	constant SP_RF_WSTRB_RAMModule_L30F9L38T10_SP_RF_WSTRB_RAMModule_L31F13L35T14_3_w : unsigned(1 downto 0) := "11";
	signal Inputs_Address : unsigned(7 downto 0) := (others => '0');
	signal Inputs_WE : std_logic := '0';
	signal Inputs_WSTRB : unsigned(3 downto 0) := (others => '0');
	signal State_ReadDataDefault : unsigned(7 downto 0) := "00000000";
	signal State_BuffDefault : unsigned(31 downto 0) := "00000000000000000000000000000000";
	type Inputs_WriteDataArray is array (0 to 3) of unsigned (7 downto 0);
	signal Inputs_WriteData : Inputs_WriteDataArray := (others => (others => '0'));
	type State_ReadDataArray is array (0 to 3) of unsigned (7 downto 0);
	signal State_ReadData : State_ReadDataArray := (others => (others => '0'));
	type NextState_ReadDataArray is array (0 to 3) of unsigned (7 downto 0);
	signal NextState_ReadData : NextState_ReadDataArray := (others => (others => '0'));
	type State_BuffArray is array (0 to 31) of unsigned (31 downto 0);
	constant State_BuffArrayInit : State_BuffArray := (
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000",
		"00000000000000000000000000000000"
	);
	signal State_Buff : State_BuffArray := State_BuffArrayInit;
	type NextState_BuffArray is array (0 to 31) of unsigned (31 downto 0);
	signal NextState_Buff : NextState_BuffArray := (others => (others => '0'));
begin
	process (Clock, NextState_ReadData, Reset, State_ReadDataDefault)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for State_ReadData_Iterator in 0 to 3 loop
					State_ReadData(State_ReadData_Iterator) <= State_ReadDataDefault;
				end loop;
			else
				for State_ReadData_Iterator in 0 to 3 loop
					State_ReadData(State_ReadData_Iterator) <= NextState_ReadData(State_ReadData_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (Clock, NextState_Buff, Reset, State_BuffDefault)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for State_Buff_Iterator in 0 to 31 loop
					State_Buff(State_Buff_Iterator) <= State_BuffDefault;
				end loop;
			else
				for State_Buff_Iterator in 0 to 31 loop
					State_Buff(State_Buff_Iterator) <= NextState_Buff(State_Buff_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (Inputs_WriteData, Inputs_WSTRB, State_Buff, State_ReadData)
	begin
		for NextState_Buff_Iterator in 0 to 31 loop
			NextState_Buff(NextState_Buff_Iterator) <= State_Buff(NextState_Buff_Iterator);
		end loop;
		for NextState_ReadData_Iterator in 0 to 3 loop
			NextState_ReadData(NextState_ReadData_Iterator) <= State_ReadData(NextState_ReadData_Iterator);
		end loop;
		if Inputs_WSTRB(0) = '1' then
			NextState_Buff(TO_INTEGER(Inputs_Address))(7 downto 0) <= Inputs_WriteData(0);
		end if;
		if Inputs_WSTRB(1) = '1' then
			NextState_Buff(TO_INTEGER(Inputs_Address))(15 downto 8) <= Inputs_WriteData(1);
		end if;
		if Inputs_WSTRB(2) = '1' then
			NextState_Buff(TO_INTEGER(Inputs_Address))(23 downto 16) <= Inputs_WriteData(2);
		end if;
		if Inputs_WSTRB(3) = '1' then
			NextState_Buff(TO_INTEGER(Inputs_Address))(31 downto 24) <= Inputs_WriteData(3);
		end if;
		NextState_ReadData(0) <= State_Buff(TO_INTEGER(Inputs_Address))(7 downto 0);
		NextState_ReadData(1) <= State_Buff(TO_INTEGER(Inputs_Address))(15 downto 8);
		NextState_ReadData(2) <= State_Buff(TO_INTEGER(Inputs_Address))(23 downto 16);
		NextState_ReadData(3) <= State_Buff(TO_INTEGER(Inputs_Address))(31 downto 24);
	end process;
	process (Address, State_ReadData, WE, WriteData0, WriteData1, WriteData2, WriteData3, WSTRB)
	begin
		Inputs_Address <= Address;
		Inputs_WriteData(0) <= WriteData0;
		Inputs_WriteData(1) <= WriteData1;
		Inputs_WriteData(2) <= WriteData2;
		Inputs_WriteData(3) <= WriteData3;
		Inputs_WE <= WE;
		Inputs_WSTRB <= WSTRB;
		Data0 <= State_ReadData(0);
		Data1 <= State_ReadData(1);
		Data2 <= State_ReadData(2);
		Data3 <= State_ReadData(3);
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
