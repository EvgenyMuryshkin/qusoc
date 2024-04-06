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
		iIsEnabled : in std_logic;
		oData : out unsigned (7 downto 0);
		oHasData : out std_logic
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
	constant CompositionModule_L42F28T32_Expr : std_logic := '1';
	signal Inputs_iIsEnabled : std_logic := '0';
	signal Emitter_iAck : std_logic := '0';
	signal Emitter_iIsEnabled : std_logic := '0';
	signal Emitter_oData : unsigned(7 downto 0) := (others => '0');
	signal Emitter_oHasData : std_logic := '0';
	signal Receiver_iAck : std_logic := '0';
	signal Receiver_iBit : std_logic := '0';
	signal Receiver_iIsValid : std_logic := '0';
	signal Receiver_oData : unsigned(7 downto 0) := (others => '0');
	signal Receiver_oHasData : std_logic := '0';
	signal Transmitter_iAck : std_logic := '0';
	signal Transmitter_iData : unsigned(7 downto 0) := (others => '0');
	signal Transmitter_iTrigger : std_logic := '0';
	signal Transmitter_oBit : std_logic := '0';
	signal Transmitter_oIsReady : std_logic := '0';
	signal Transmitter_oIsTransmissionStarted : std_logic := '0';
	signal Transmitter_oIsTransmitting : std_logic := '0';
	signal CompositionModule_L25F36L29T18_Object : unsigned(1 downto 0) := (others => '0');
	signal CompositionModule_L31F40L36T17_Object : unsigned(9 downto 0) := (others => '0');
	signal CompositionModule_L38F37L43T18_Object : unsigned(2 downto 0) := (others => '0');
	signal Emitter_iAck_Emitter_iAck_HardLink : std_logic := '0';
	signal Emitter_iIsEnabled_Emitter_iIsEnabled_HardLink : std_logic := '0';
	signal Emitter_oData_Emitter_oData_HardLink : unsigned(7 downto 0) := "00000000";
	signal Emitter_oHasData_Emitter_oHasData_HardLink : std_logic := '0';
	signal Receiver_iAck_Receiver_iAck_HardLink : std_logic := '0';
	signal Receiver_iBit_Receiver_iBit_HardLink : std_logic := '0';
	signal Receiver_iIsValid_Receiver_iIsValid_HardLink : std_logic := '0';
	signal Receiver_oData_Receiver_oData_HardLink : unsigned(7 downto 0) := "00000000";
	signal Receiver_oHasData_Receiver_oHasData_HardLink : std_logic := '0';
	signal Transmitter_iAck_Transmitter_iAck_HardLink : std_logic := '0';
	signal Transmitter_iData_Transmitter_iData_HardLink : unsigned(7 downto 0) := "00000000";
	signal Transmitter_iTrigger_Transmitter_iTrigger_HardLink : std_logic := '0';
	signal Transmitter_oBit_Transmitter_oBit_HardLink : std_logic := '0';
	signal Transmitter_oIsReady_Transmitter_oIsReady_HardLink : std_logic := '0';
	signal Transmitter_oIsTransmissionStarted_Transmitter_oIsTransmissionStarted_HardLink : std_logic := '0';
	signal Transmitter_oIsTransmitting_Transmitter_oIsTransmitting_HardLink : std_logic := '0';
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
		iAck => Emitter_iAck_Emitter_iAck_HardLink,
		iIsEnabled => Emitter_iIsEnabled_Emitter_iIsEnabled_HardLink,
		oData => Emitter_oData_Emitter_oData_HardLink,
		oHasData => Emitter_oHasData_Emitter_oHasData_HardLink
	)
	;
	CompositionModule_TopLevel_Receiver : entity work.CompositionModule_TopLevel_Receiver
	port map
	(
		-- [BEGIN USER MAP FOR Receiver]
		-- [END USER MAP FOR Receiver]
		BoardSignals => BoardSignals,
		iAck => Receiver_iAck_Receiver_iAck_HardLink,
		iBit => Receiver_iBit_Receiver_iBit_HardLink,
		iIsValid => Receiver_iIsValid_Receiver_iIsValid_HardLink,
		oData => Receiver_oData_Receiver_oData_HardLink,
		oHasData => Receiver_oHasData_Receiver_oHasData_HardLink
	)
	;
	CompositionModule_TopLevel_Transmitter : entity work.CompositionModule_TopLevel_Transmitter
	port map
	(
		-- [BEGIN USER MAP FOR Transmitter]
		-- [END USER MAP FOR Transmitter]
		BoardSignals => BoardSignals,
		iAck => Transmitter_iAck_Transmitter_iAck_HardLink,
		iData => Transmitter_iData_Transmitter_iData_HardLink,
		iTrigger => Transmitter_iTrigger_Transmitter_iTrigger_HardLink,
		oBit => Transmitter_oBit_Transmitter_oBit_HardLink,
		oIsReady => Transmitter_oIsReady_Transmitter_oIsReady_HardLink,
		oIsTransmissionStarted => Transmitter_oIsTransmissionStarted_Transmitter_oIsTransmissionStarted_HardLink,
		oIsTransmitting => Transmitter_oIsTransmitting_Transmitter_oIsTransmitting_HardLink
	)
	;
	process (CompositionModule_L25F36L29T18_Object, CompositionModule_L31F40L36T17_Object, CompositionModule_L38F37L43T18_Object, Emitter_iAck, Emitter_iIsEnabled, Emitter_oData, Emitter_oData_Emitter_oData_HardLink, Emitter_oHasData, Emitter_oHasData_Emitter_oHasData_HardLink, iIsEnabled, Inputs_iIsEnabled, Receiver_iAck, Receiver_iBit, Receiver_iIsValid, Receiver_oData, Receiver_oData_Receiver_oData_HardLink, Receiver_oHasData, Receiver_oHasData_Receiver_oHasData_HardLink, Transmitter_iAck, Transmitter_iData, Transmitter_iTrigger, Transmitter_oBit, Transmitter_oBit_Transmitter_oBit_HardLink, Transmitter_oIsReady, Transmitter_oIsReady_Transmitter_oIsReady_HardLink, Transmitter_oIsTransmissionStarted_Transmitter_oIsTransmissionStarted_HardLink, Transmitter_oIsTransmitting, Transmitter_oIsTransmitting_Transmitter_oIsTransmitting_HardLink)
	begin
		Inputs_iIsEnabled <= iIsEnabled;
		CompositionModule_L25F36L29T18_Object(0) <= Transmitter_oIsReady;
		CompositionModule_L25F36L29T18_Object(1) <= Inputs_iIsEnabled;
		Emitter_iIsEnabled <= CompositionModule_L25F36L29T18_Object(1);
		Emitter_iAck <= CompositionModule_L25F36L29T18_Object(0);
		CompositionModule_L31F40L36T17_Object(0) <= Receiver_oHasData;
		CompositionModule_L31F40L36T17_Object(8 downto 1) <= Emitter_oData;
		CompositionModule_L31F40L36T17_Object(9) <= Emitter_oHasData;
		Transmitter_iTrigger <= CompositionModule_L31F40L36T17_Object(9);
		Transmitter_iData <= CompositionModule_L31F40L36T17_Object(8 downto 1);
		Transmitter_iAck <= CompositionModule_L31F40L36T17_Object(0);
		CompositionModule_L38F37L43T18_Object(0) <= CompositionModule_L42F28T32_Expr;
		CompositionModule_L38F37L43T18_Object(1) <= Transmitter_oBit;
		CompositionModule_L38F37L43T18_Object(2) <= Transmitter_oIsTransmitting;
		Receiver_iIsValid <= CompositionModule_L38F37L43T18_Object(2);
		Receiver_iBit <= CompositionModule_L38F37L43T18_Object(1);
		Receiver_iAck <= CompositionModule_L38F37L43T18_Object(0);
		oData <= Receiver_oData;
		oHasData <= Receiver_oHasData;
		Emitter_iAck_Emitter_iAck_HardLink <= Emitter_iAck;
		Emitter_iIsEnabled_Emitter_iIsEnabled_HardLink <= Emitter_iIsEnabled;
		Emitter_oData <= Emitter_oData_Emitter_oData_HardLink;
		Emitter_oHasData <= Emitter_oHasData_Emitter_oHasData_HardLink;
		Receiver_iAck_Receiver_iAck_HardLink <= Receiver_iAck;
		Receiver_iBit_Receiver_iBit_HardLink <= Receiver_iBit;
		Receiver_iIsValid_Receiver_iIsValid_HardLink <= Receiver_iIsValid;
		Receiver_oData <= Receiver_oData_Receiver_oData_HardLink;
		Receiver_oHasData <= Receiver_oHasData_Receiver_oHasData_HardLink;
		Transmitter_iAck_Transmitter_iAck_HardLink <= Transmitter_iAck;
		Transmitter_iData_Transmitter_iData_HardLink <= Transmitter_iData;
		Transmitter_iTrigger_Transmitter_iTrigger_HardLink <= Transmitter_iTrigger;
		Transmitter_oBit <= Transmitter_oBit_Transmitter_oBit_HardLink;
		Transmitter_oIsReady <= Transmitter_oIsReady_Transmitter_oIsReady_HardLink;
		Transmitter_oIsTransmissionStarted <= Transmitter_oIsTransmissionStarted_Transmitter_oIsTransmissionStarted_HardLink;
		Transmitter_oIsTransmitting <= Transmitter_oIsTransmitting_Transmitter_oIsTransmitting_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
