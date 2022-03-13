`timescale 1ns/1ps
`default_nettype none
// PLEASE READ THIS, IT MAY SAVE YOU SOME TIME AND MONEY, THANK YOU!
// * This file was generated by Quokka FPGA Toolkit.
// * Generated code is your property, do whatever you want with it
// * Place custom code between [BEGIN USER ***] and [END USER ***].
// * CAUTION: All code outside of [USER] scope is subject to regeneration.
// * Bad things happen sometimes in developer's life,
//   it is recommended to use source control management software (e.g. git, bzr etc) to keep your custom code safe'n'sound.
// * Internal structure of code is subject to change.
//   You can use some of signals in custom code, but most likely they will not exist in future (e.g. will get shorter or gone completely)
// * Please send your feedback, comments, improvement ideas etc. to evmuryshkin@gmail.com
// * Visit https://github.com/EvgenyMuryshkin/QuokkaEvaluation to access latest version of playground
//
// DISCLAIMER:
//   Code comes AS-IS, it is your responsibility to make sure it is working as expected
//   no responsibility will be taken for any loss or damage caused by use of Quokka toolkit.
//
// System configuration name is CompositionModule_TopLevel, clock frequency is 1Hz, Top-level
// FSM summary
// -- Packages
module CompositionModule_TopLevel
(
	// [BEGIN USER PORTS]
	// [END USER PORTS]
	input wire Clock,
	input wire Reset,
	input wire IsEnabled,
	output wire HasData,
	output wire [7:0] Data
);
	// [BEGIN USER SIGNALS]
	// [END USER SIGNALS]
	localparam HiSignal = 1'b1;
	localparam LoSignal = 1'b0;
	wire Zero = 1'b0;
	wire One = 1'b1;
	wire true = 1'b1;
	wire false = 1'b0;
	wire CompositionModule_L41F27T31_Expr = 1'b1;
	wire Inputs_IsEnabled;
	wire Emitter_IsEnabled;
	wire Emitter_Ack;
	wire [7: 0] Emitter_Data;
	wire Emitter_HasData;
	wire Transmitter_Trigger;
	wire Transmitter_Ack;
	wire [7: 0] Transmitter_Data;
	wire Transmitter_Bit;
	wire Transmitter_IsReady;
	wire Transmitter_IsTransmitting;
	wire Transmitter_IsTransmissionStarted;
	wire Receiver_IsValid;
	wire Receiver_Ack;
	wire Receiver_Bit;
	wire Receiver_HasData;
	wire [7: 0] Receiver_Data;
	wire EmitterIsEnabledEmitter_IsEnabledHardLink;
	wire EmitterAckEmitter_AckHardLink;
	wire [7: 0] EmitterDataEmitter_DataHardLink;
	wire EmitterHasDataEmitter_HasDataHardLink;
	wire TransmitterTriggerTransmitter_TriggerHardLink;
	wire TransmitterAckTransmitter_AckHardLink;
	wire [7: 0] TransmitterDataTransmitter_DataHardLink;
	wire TransmitterBitTransmitter_BitHardLink;
	wire TransmitterIsReadyTransmitter_IsReadyHardLink;
	wire TransmitterIsTransmittingTransmitter_IsTransmittingHardLink;
	wire TransmitterIsTransmissionStartedTransmitter_IsTransmissionStartedHardLink;
	wire ReceiverIsValidReceiver_IsValidHardLink;
	wire ReceiverAckReceiver_AckHardLink;
	wire ReceiverBitReceiver_BitHardLink;
	wire ReceiverHasDataReceiver_HasDataHardLink;
	wire [7: 0] ReceiverDataReceiver_DataHardLink;
	wire BoardSignals_Clock;
	wire BoardSignals_Reset;
	wire BoardSignals_Running;
	wire BoardSignals_Starting;
	wire BoardSignals_Started;
	reg InternalReset = 1'b0;
	work_Quokka_BoardSignalsProc BoardSignalsConnection(BoardSignals_Clock, BoardSignals_Reset, BoardSignals_Running, BoardSignals_Starting, BoardSignals_Started, Clock, Reset, InternalReset);
	CompositionModule_TopLevel_CompositionModule_Emitter
	CompositionModule_TopLevel_CompositionModule_Emitter
	(
		// [BEGIN USER MAP FOR Emitter]
		// [END USER MAP FOR Emitter]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.IsEnabled (EmitterIsEnabledEmitter_IsEnabledHardLink),
		.Ack (EmitterAckEmitter_AckHardLink),
		.Data (EmitterDataEmitter_DataHardLink),
		.HasData (EmitterHasDataEmitter_HasDataHardLink)
	);
	CompositionModule_TopLevel_CompositionModule_Transmitter
	CompositionModule_TopLevel_CompositionModule_Transmitter
	(
		// [BEGIN USER MAP FOR Transmitter]
		// [END USER MAP FOR Transmitter]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.Trigger (TransmitterTriggerTransmitter_TriggerHardLink),
		.Ack (TransmitterAckTransmitter_AckHardLink),
		.Data (TransmitterDataTransmitter_DataHardLink),
		.Bit (TransmitterBitTransmitter_BitHardLink),
		.IsReady (TransmitterIsReadyTransmitter_IsReadyHardLink),
		.IsTransmitting (TransmitterIsTransmittingTransmitter_IsTransmittingHardLink),
		.IsTransmissionStarted (TransmitterIsTransmissionStartedTransmitter_IsTransmissionStartedHardLink)
	);
	CompositionModule_TopLevel_CompositionModule_Receiver
	CompositionModule_TopLevel_CompositionModule_Receiver
	(
		// [BEGIN USER MAP FOR Receiver]
		// [END USER MAP FOR Receiver]
		.BoardSignals_Clock (BoardSignals_Clock),
		.BoardSignals_Reset (BoardSignals_Reset),
		.BoardSignals_Running (BoardSignals_Running),
		.BoardSignals_Starting (BoardSignals_Starting),
		.BoardSignals_Started (BoardSignals_Started),
		.IsValid (ReceiverIsValidReceiver_IsValidHardLink),
		.Ack (ReceiverAckReceiver_AckHardLink),
		.Bit (ReceiverBitReceiver_BitHardLink),
		.HasData (ReceiverHasDataReceiver_HasDataHardLink),
		.Data (ReceiverDataReceiver_DataHardLink)
	);
	assign Inputs_IsEnabled = IsEnabled;
	assign Emitter_IsEnabled = Inputs_IsEnabled;
	assign Emitter_Ack = Transmitter_IsReady;
	assign Transmitter_Trigger = Emitter_HasData;
	assign Transmitter_Ack = Receiver_HasData;
	assign Transmitter_Data = Emitter_Data;
	assign Receiver_IsValid = Transmitter_IsTransmitting;
	assign Receiver_Ack = CompositionModule_L41F27T31_Expr;
	assign Receiver_Bit = Transmitter_Bit;
	assign HasData = Receiver_HasData;
	assign Data = Receiver_Data;
	assign EmitterIsEnabledEmitter_IsEnabledHardLink = Emitter_IsEnabled;
	assign EmitterAckEmitter_AckHardLink = Emitter_Ack;
	assign Emitter_Data = EmitterDataEmitter_DataHardLink;
	assign Emitter_HasData = EmitterHasDataEmitter_HasDataHardLink;
	assign TransmitterTriggerTransmitter_TriggerHardLink = Transmitter_Trigger;
	assign TransmitterAckTransmitter_AckHardLink = Transmitter_Ack;
	assign TransmitterDataTransmitter_DataHardLink = Transmitter_Data;
	assign Transmitter_Bit = TransmitterBitTransmitter_BitHardLink;
	assign Transmitter_IsReady = TransmitterIsReadyTransmitter_IsReadyHardLink;
	assign Transmitter_IsTransmitting = TransmitterIsTransmittingTransmitter_IsTransmittingHardLink;
	assign Transmitter_IsTransmissionStarted = TransmitterIsTransmissionStartedTransmitter_IsTransmissionStartedHardLink;
	assign ReceiverIsValidReceiver_IsValidHardLink = Receiver_IsValid;
	assign ReceiverAckReceiver_AckHardLink = Receiver_Ack;
	assign ReceiverBitReceiver_BitHardLink = Receiver_Bit;
	assign Receiver_HasData = ReceiverHasDataReceiver_HasDataHardLink;
	assign Receiver_Data = ReceiverDataReceiver_DataHardLink;
	// [BEGIN USER ARCHITECTURE]
	// [END USER ARCHITECTURE]
endmodule
