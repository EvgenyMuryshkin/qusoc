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
-- System configuration name is CompositionModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity CompositionModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		IsEnabled : in std_logic;
		HasData : out std_logic;
		Data : out unsigned (7 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of CompositionModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant CompositionModule_L41F27T31_Expr : std_logic := '1';
	signal Inputs_IsEnabled : std_logic := '0';
	signal Emitter_IsEnabled : std_logic := '0';
	signal Emitter_Ack : std_logic := '0';
	signal Emitter_Data : unsigned(7 downto 0) := (others => '0');
	signal Emitter_HasData : std_logic := '0';
	signal Transmitter_Trigger : std_logic := '0';
	signal Transmitter_Ack : std_logic := '0';
	signal Transmitter_Data : unsigned(7 downto 0) := (others => '0');
	signal Transmitter_Bit : std_logic := '0';
	signal Transmitter_IsReady : std_logic := '0';
	signal Transmitter_IsTransmitting : std_logic := '0';
	signal Transmitter_IsTransmissionStarted : std_logic := '0';
	signal Receiver_IsValid : std_logic := '0';
	signal Receiver_Ack : std_logic := '0';
	signal Receiver_Bit : std_logic := '0';
	signal Receiver_HasData : std_logic := '0';
	signal Receiver_Data : unsigned(7 downto 0) := (others => '0');
	signal Emitter_IsEnabled_Emitter_IsEnabled_HardLink : std_logic := '0';
	signal Emitter_Ack_Emitter_Ack_HardLink : std_logic := '0';
	signal Emitter_Data_Emitter_Data_HardLink : unsigned(7 downto 0) := "00000000";
	signal Emitter_HasData_Emitter_HasData_HardLink : std_logic := '0';
	signal Transmitter_Trigger_Transmitter_Trigger_HardLink : std_logic := '0';
	signal Transmitter_Ack_Transmitter_Ack_HardLink : std_logic := '0';
	signal Transmitter_Data_Transmitter_Data_HardLink : unsigned(7 downto 0) := "00000000";
	signal Transmitter_Bit_Transmitter_Bit_HardLink : std_logic := '0';
	signal Transmitter_IsReady_Transmitter_IsReady_HardLink : std_logic := '0';
	signal Transmitter_IsTransmitting_Transmitter_IsTransmitting_HardLink : std_logic := '0';
	signal Transmitter_IsTransmissionStarted_Transmitter_IsTransmissionStarted_HardLink : std_logic := '0';
	signal Receiver_IsValid_Receiver_IsValid_HardLink : std_logic := '0';
	signal Receiver_Ack_Receiver_Ack_HardLink : std_logic := '0';
	signal Receiver_Bit_Receiver_Bit_HardLink : std_logic := '0';
	signal Receiver_HasData_Receiver_HasData_HardLink : std_logic := '0';
	signal Receiver_Data_Receiver_Data_HardLink : unsigned(7 downto 0) := "00000000";
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	CompositionModule_TopLevel_Emitter : entity work.CompositionModule_TopLevel_Emitter
	port map
	(
		-- [BEGIN USER MAP FOR Emitter]
		-- [END USER MAP FOR Emitter]
		BoardSignals => BoardSignals,
		IsEnabled => Emitter_IsEnabled_Emitter_IsEnabled_HardLink,
		Ack => Emitter_Ack_Emitter_Ack_HardLink,
		Data => Emitter_Data_Emitter_Data_HardLink,
		HasData => Emitter_HasData_Emitter_HasData_HardLink
	)
	;
	CompositionModule_TopLevel_Transmitter : entity work.CompositionModule_TopLevel_Transmitter
	port map
	(
		-- [BEGIN USER MAP FOR Transmitter]
		-- [END USER MAP FOR Transmitter]
		BoardSignals => BoardSignals,
		Trigger => Transmitter_Trigger_Transmitter_Trigger_HardLink,
		Ack => Transmitter_Ack_Transmitter_Ack_HardLink,
		Data => Transmitter_Data_Transmitter_Data_HardLink,
		Bit => Transmitter_Bit_Transmitter_Bit_HardLink,
		IsReady => Transmitter_IsReady_Transmitter_IsReady_HardLink,
		IsTransmitting => Transmitter_IsTransmitting_Transmitter_IsTransmitting_HardLink,
		IsTransmissionStarted => Transmitter_IsTransmissionStarted_Transmitter_IsTransmissionStarted_HardLink
	)
	;
	CompositionModule_TopLevel_Receiver : entity work.CompositionModule_TopLevel_Receiver
	port map
	(
		-- [BEGIN USER MAP FOR Receiver]
		-- [END USER MAP FOR Receiver]
		BoardSignals => BoardSignals,
		IsValid => Receiver_IsValid_Receiver_IsValid_HardLink,
		Ack => Receiver_Ack_Receiver_Ack_HardLink,
		Bit => Receiver_Bit_Receiver_Bit_HardLink,
		HasData => Receiver_HasData_Receiver_HasData_HardLink,
		Data => Receiver_Data_Receiver_Data_HardLink
	)
	;
	process (Emitter_Ack, Emitter_Data, Emitter_Data_Emitter_Data_HardLink, Emitter_HasData, Emitter_HasData_Emitter_HasData_HardLink, Emitter_IsEnabled, Inputs_IsEnabled, IsEnabled, Receiver_Ack, Receiver_Bit, Receiver_Data, Receiver_Data_Receiver_Data_HardLink, Receiver_HasData, Receiver_HasData_Receiver_HasData_HardLink, Receiver_IsValid, Transmitter_Ack, Transmitter_Bit, Transmitter_Bit_Transmitter_Bit_HardLink, Transmitter_Data, Transmitter_IsReady, Transmitter_IsReady_Transmitter_IsReady_HardLink, Transmitter_IsTransmissionStarted_Transmitter_IsTransmissionStarted_HardLink, Transmitter_IsTransmitting, Transmitter_IsTransmitting_Transmitter_IsTransmitting_HardLink, Transmitter_Trigger)
	begin
		Inputs_IsEnabled <= IsEnabled;
		Emitter_IsEnabled <= Inputs_IsEnabled;
		Emitter_Ack <= Transmitter_IsReady;
		Transmitter_Trigger <= Emitter_HasData;
		Transmitter_Ack <= Receiver_HasData;
		Transmitter_Data <= Emitter_Data;
		Receiver_IsValid <= Transmitter_IsTransmitting;
		Receiver_Ack <= CompositionModule_L41F27T31_Expr;
		Receiver_Bit <= Transmitter_Bit;
		HasData <= Receiver_HasData;
		Data <= Receiver_Data;
		Emitter_IsEnabled_Emitter_IsEnabled_HardLink <= Emitter_IsEnabled;
		Emitter_Ack_Emitter_Ack_HardLink <= Emitter_Ack;
		Emitter_Data <= Emitter_Data_Emitter_Data_HardLink;
		Emitter_HasData <= Emitter_HasData_Emitter_HasData_HardLink;
		Transmitter_Trigger_Transmitter_Trigger_HardLink <= Transmitter_Trigger;
		Transmitter_Ack_Transmitter_Ack_HardLink <= Transmitter_Ack;
		Transmitter_Data_Transmitter_Data_HardLink <= Transmitter_Data;
		Transmitter_Bit <= Transmitter_Bit_Transmitter_Bit_HardLink;
		Transmitter_IsReady <= Transmitter_IsReady_Transmitter_IsReady_HardLink;
		Transmitter_IsTransmitting <= Transmitter_IsTransmitting_Transmitter_IsTransmitting_HardLink;
		Transmitter_IsTransmissionStarted <= Transmitter_IsTransmissionStarted_Transmitter_IsTransmissionStarted_HardLink;
		Receiver_IsValid_Receiver_IsValid_HardLink <= Receiver_IsValid;
		Receiver_Ack_Receiver_Ack_HardLink <= Receiver_Ack;
		Receiver_Bit_Receiver_Bit_HardLink <= Receiver_Bit;
		Receiver_HasData <= Receiver_HasData_Receiver_HasData_HardLink;
		Receiver_Data <= Receiver_Data_Receiver_Data_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
