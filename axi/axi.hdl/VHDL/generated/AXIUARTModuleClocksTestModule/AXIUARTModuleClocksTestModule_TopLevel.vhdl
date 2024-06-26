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
-- System configuration name is AXIUARTModuleClocksTestModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXIUARTModuleClocksTestModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iRX : in std_logic;
		Master_ARADDR : in unsigned (31 downto 0);
		Master_ARUSER : in unsigned (7 downto 0);
		Master_AWADDR : in unsigned (31 downto 0);
		Master_BREADY : in std_logic;
		Master_RE : in std_logic;
		Master_RREADY : in std_logic;
		Master_WDATA0 : in unsigned (7 downto 0);
		Master_WDATA1 : in unsigned (7 downto 0);
		Master_WDATA2 : in unsigned (7 downto 0);
		Master_WDATA3 : in unsigned (7 downto 0);
		Master_WE : in std_logic;
		Master_WSTRB : in unsigned (3 downto 0);
		oCE : out std_logic;
		oRACK : out std_logic;
		oRData0 : out unsigned (7 downto 0);
		oRData1 : out unsigned (7 downto 0);
		oRData2 : out unsigned (7 downto 0);
		oRData3 : out unsigned (7 downto 0);
		oRXCounter : out signed (31 downto 0);
		oRXData : out unsigned (7 downto 0);
		oRXValid : out std_logic;
		oTransmitting : out std_logic;
		oTX : out std_logic;
		oTXCounter : out signed (31 downto 0);
		oWACK : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXIUARTModuleClocksTestModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_iRX : std_logic := '0';
	signal Inputs_Master_ARADDR : unsigned(31 downto 0) := (others => '0');
	signal Inputs_Master_ARUSER : unsigned(7 downto 0) := (others => '0');
	signal Inputs_Master_AWADDR : unsigned(31 downto 0) := (others => '0');
	signal Inputs_Master_BREADY : std_logic := '0';
	signal Inputs_Master_RE : std_logic := '0';
	signal Inputs_Master_RREADY : std_logic := '0';
	signal Inputs_Master_WE : std_logic := '0';
	signal Inputs_Master_WSTRB : unsigned(3 downto 0) := (others => '0');
	signal master_Master : unsigned(111 downto 0) := (others => '0');
	signal master_S2M : unsigned(73 downto 0) := (others => '0');
	signal master_M2S : unsigned(221 downto 0) := (others => '0');
	signal master_RACK : std_logic := '0';
	signal master_WACK : std_logic := '0';
	signal uart_iRX : std_logic := '0';
	signal uart_M2S : unsigned(221 downto 0) := (others => '0');
	signal uart_oCE : std_logic := '0';
	signal uart_oRXCounter : signed(31 downto 0) := (others => '0');
	signal uart_oRXData : unsigned(7 downto 0) := (others => '0');
	signal uart_oRXValid : std_logic := '0';
	signal uart_oS2M : unsigned(73 downto 0) := (others => '0');
	signal uart_oTransmitting : std_logic := '0';
	signal uart_oTX : std_logic := '0';
	signal uart_oTXCounter : signed(31 downto 0) := (others => '0');
	signal AXIUARTTestModule_L36F33L40T14_Object : unsigned(222 downto 0) := (others => '0');
	signal AXIUARTTestModule_L42F35L46T14_Object : unsigned(185 downto 0) := (others => '0');
	signal master_Master_master_Master_HardLink : unsigned(111 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal master_S2M_master_S2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal master_M2S_master_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal master_RACK_master_RACK_HardLink : std_logic := '0';
	signal master_RDATA0_master_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal master_RDATA1_master_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal master_RDATA2_master_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal master_RDATA3_master_RDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal master_WACK_master_WACK_HardLink : std_logic := '0';
	signal uart_iRX_uart_iRX_HardLink : std_logic := '0';
	signal uart_M2S_uart_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal uart_oCE_uart_oCE_HardLink : std_logic := '0';
	signal uart_oRXCounter_uart_oRXCounter_HardLink : signed(31 downto 0) := "00000000000000000000000000000000";
	signal uart_oRXData_uart_oRXData_HardLink : unsigned(7 downto 0) := "00000000";
	signal uart_oRXValid_uart_oRXValid_HardLink : std_logic := '0';
	signal uart_oS2M_uart_oS2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal uart_oTransmitting_uart_oTransmitting_HardLink : std_logic := '0';
	signal uart_oTX_uart_oTX_HardLink : std_logic := '0';
	signal uart_oTXCounter_uart_oTXCounter_HardLink : signed(31 downto 0) := "00000000000000000000000000000000";
	type Inputs_Master_WDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal Inputs_Master_WDATA : Inputs_Master_WDATAArray := (others => (others => '0'));
	type master_RDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal master_RDATA : master_RDATAArray := (others => (others => '0'));
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	AXIUARTModuleClocksTestModule_TopLevel_master : entity work.AXIUARTModuleClocksTestModule_TopLevel_master
	port map
	(
		-- [BEGIN USER MAP FOR master]
		-- [END USER MAP FOR master]
		BoardSignals => BoardSignals,
		Master => master_Master_master_Master_HardLink,
		S2M => master_S2M_master_S2M_HardLink,
		M2S => master_M2S_master_M2S_HardLink,
		RACK => master_RACK_master_RACK_HardLink,
		RDATA0 => master_RDATA0_master_RDATA_HardLink,
		RDATA1 => master_RDATA1_master_RDATA_HardLink,
		RDATA2 => master_RDATA2_master_RDATA_HardLink,
		RDATA3 => master_RDATA3_master_RDATA_HardLink,
		WACK => master_WACK_master_WACK_HardLink
	)
	;
	AXIUARTModuleClocksTestModule_TopLevel_uart : entity work.AXIUARTModuleClocksTestModule_TopLevel_uart
	port map
	(
		-- [BEGIN USER MAP FOR uart]
		-- [END USER MAP FOR uart]
		BoardSignals => BoardSignals,
		iRX => uart_iRX_uart_iRX_HardLink,
		M2S => uart_M2S_uart_M2S_HardLink,
		oCE => uart_oCE_uart_oCE_HardLink,
		oRXCounter => uart_oRXCounter_uart_oRXCounter_HardLink,
		oRXData => uart_oRXData_uart_oRXData_HardLink,
		oRXValid => uart_oRXValid_uart_oRXValid_HardLink,
		oS2M => uart_oS2M_uart_oS2M_HardLink,
		oTransmitting => uart_oTransmitting_uart_oTransmitting_HardLink,
		oTX => uart_oTX_uart_oTX_HardLink,
		oTXCounter => uart_oTXCounter_uart_oTXCounter_HardLink
	)
	;
	process (AXIUARTTestModule_L36F33L40T14_Object, AXIUARTTestModule_L42F35L46T14_Object, Inputs_iRX, Inputs_Master_ARADDR, Inputs_Master_ARUSER, Inputs_Master_AWADDR, Inputs_Master_BREADY, Inputs_Master_RE, Inputs_Master_RREADY, Inputs_Master_WDATA, Inputs_Master_WE, Inputs_Master_WSTRB, iRX, Master_ARADDR, Master_ARUSER, Master_AWADDR, Master_BREADY, master_M2S, master_M2S_master_M2S_HardLink, master_Master, master_RACK, master_RACK_master_RACK_HardLink, master_RDATA, master_RDATA0_master_RDATA_HardLink, master_RDATA1_master_RDATA_HardLink, master_RDATA2_master_RDATA_HardLink, master_RDATA3_master_RDATA_HardLink, Master_RE, Master_RREADY, master_S2M, master_WACK, master_WACK_master_WACK_HardLink, Master_WDATA0, Master_WDATA1, Master_WDATA2, Master_WDATA3, Master_WE, Master_WSTRB, uart_iRX, uart_M2S, uart_oCE, uart_oCE_uart_oCE_HardLink, uart_oRXCounter, uart_oRXCounter_uart_oRXCounter_HardLink, uart_oRXData, uart_oRXData_uart_oRXData_HardLink, uart_oRXValid, uart_oRXValid_uart_oRXValid_HardLink, uart_oS2M, uart_oS2M_uart_oS2M_HardLink, uart_oTransmitting, uart_oTransmitting_uart_oTransmitting_HardLink, uart_oTX, uart_oTX_uart_oTX_HardLink, uart_oTXCounter, uart_oTXCounter_uart_oTXCounter_HardLink)
	begin
		Inputs_iRX <= iRX;
		Inputs_Master_ARADDR <= Master_ARADDR;
		Inputs_Master_ARUSER <= Master_ARUSER;
		Inputs_Master_AWADDR <= Master_AWADDR;
		Inputs_Master_BREADY <= Master_BREADY;
		Inputs_Master_RE <= Master_RE;
		Inputs_Master_RREADY <= Master_RREADY;
		Inputs_Master_WDATA(0) <= Master_WDATA0;
		Inputs_Master_WDATA(1) <= Master_WDATA1;
		Inputs_Master_WDATA(2) <= Master_WDATA2;
		Inputs_Master_WDATA(3) <= Master_WDATA3;
		Inputs_Master_WE <= Master_WE;
		Inputs_Master_WSTRB <= Master_WSTRB;
		AXIUARTTestModule_L36F33L40T14_Object(0) <= Inputs_iRX;
		AXIUARTTestModule_L36F33L40T14_Object(8 downto 1) <= master_M2S(7 downto 0);
		AXIUARTTestModule_L36F33L40T14_Object(40 downto 9) <= master_M2S(39 downto 8);
		AXIUARTTestModule_L36F33L40T14_Object(48 downto 41) <= master_M2S(47 downto 40);
		AXIUARTTestModule_L36F33L40T14_Object(51 downto 49) <= master_M2S(50 downto 48);
		AXIUARTTestModule_L36F33L40T14_Object(53 downto 52) <= master_M2S(52 downto 51);
		AXIUARTTestModule_L36F33L40T14_Object(55 downto 54) <= master_M2S(54 downto 53);
		AXIUARTTestModule_L36F33L40T14_Object(59 downto 56) <= master_M2S(58 downto 55);
		AXIUARTTestModule_L36F33L40T14_Object(62 downto 60) <= master_M2S(61 downto 59);
		AXIUARTTestModule_L36F33L40T14_Object(66 downto 63) <= master_M2S(65 downto 62);
		AXIUARTTestModule_L36F33L40T14_Object(74 downto 67) <= master_M2S(73 downto 66);
		AXIUARTTestModule_L36F33L40T14_Object(82 downto 75) <= master_M2S(81 downto 74);
		AXIUARTTestModule_L36F33L40T14_Object(83) <= master_M2S(82);
		AXIUARTTestModule_L36F33L40T14_Object(84) <= master_M2S(83);
		AXIUARTTestModule_L36F33L40T14_Object(92 downto 85) <= master_M2S(91 downto 84);
		AXIUARTTestModule_L36F33L40T14_Object(124 downto 93) <= master_M2S(123 downto 92);
		AXIUARTTestModule_L36F33L40T14_Object(132 downto 125) <= master_M2S(131 downto 124);
		AXIUARTTestModule_L36F33L40T14_Object(135 downto 133) <= master_M2S(134 downto 132);
		AXIUARTTestModule_L36F33L40T14_Object(137 downto 136) <= master_M2S(136 downto 135);
		AXIUARTTestModule_L36F33L40T14_Object(139 downto 138) <= master_M2S(138 downto 137);
		AXIUARTTestModule_L36F33L40T14_Object(143 downto 140) <= master_M2S(142 downto 139);
		AXIUARTTestModule_L36F33L40T14_Object(146 downto 144) <= master_M2S(145 downto 143);
		AXIUARTTestModule_L36F33L40T14_Object(150 downto 147) <= master_M2S(149 downto 146);
		AXIUARTTestModule_L36F33L40T14_Object(158 downto 151) <= master_M2S(157 downto 150);
		AXIUARTTestModule_L36F33L40T14_Object(166 downto 159) <= master_M2S(165 downto 158);
		AXIUARTTestModule_L36F33L40T14_Object(167) <= master_M2S(166);
		AXIUARTTestModule_L36F33L40T14_Object(175 downto 168) <= master_M2S(174 downto 167);
		AXIUARTTestModule_L36F33L40T14_Object(207 downto 176) <= master_M2S(206 downto 175);
		AXIUARTTestModule_L36F33L40T14_Object(211 downto 208) <= master_M2S(210 downto 207);
		AXIUARTTestModule_L36F33L40T14_Object(212) <= master_M2S(211);
		AXIUARTTestModule_L36F33L40T14_Object(220 downto 213) <= master_M2S(219 downto 212);
		AXIUARTTestModule_L36F33L40T14_Object(221) <= master_M2S(220);
		AXIUARTTestModule_L36F33L40T14_Object(222) <= master_M2S(221);
		uart_M2S <= AXIUARTTestModule_L36F33L40T14_Object(222 downto 1);
		uart_iRX <= AXIUARTTestModule_L36F33L40T14_Object(0);
		AXIUARTTestModule_L42F35L46T14_Object(31 downto 0) <= Inputs_Master_ARADDR;
		AXIUARTTestModule_L42F35L46T14_Object(39 downto 32) <= Inputs_Master_ARUSER;
		AXIUARTTestModule_L42F35L46T14_Object(71 downto 40) <= Inputs_Master_AWADDR;
		AXIUARTTestModule_L42F35L46T14_Object(72) <= Inputs_Master_BREADY;
		AXIUARTTestModule_L42F35L46T14_Object(73) <= Inputs_Master_RE;
		AXIUARTTestModule_L42F35L46T14_Object(74) <= Inputs_Master_RREADY;
		AXIUARTTestModule_L42F35L46T14_Object(106 downto 99) <= Inputs_Master_WDATA(3);
		AXIUARTTestModule_L42F35L46T14_Object(98 downto 91) <= Inputs_Master_WDATA(2);
		AXIUARTTestModule_L42F35L46T14_Object(90 downto 83) <= Inputs_Master_WDATA(1);
		AXIUARTTestModule_L42F35L46T14_Object(82 downto 75) <= Inputs_Master_WDATA(0);
		AXIUARTTestModule_L42F35L46T14_Object(107) <= Inputs_Master_WE;
		AXIUARTTestModule_L42F35L46T14_Object(111 downto 108) <= Inputs_Master_WSTRB;
		AXIUARTTestModule_L42F35L46T14_Object(112) <= uart_oS2M(0);
		AXIUARTTestModule_L42F35L46T14_Object(120 downto 113) <= uart_oS2M(8 downto 1);
		AXIUARTTestModule_L42F35L46T14_Object(152 downto 121) <= uart_oS2M(40 downto 9);
		AXIUARTTestModule_L42F35L46T14_Object(154 downto 153) <= uart_oS2M(42 downto 41);
		AXIUARTTestModule_L42F35L46T14_Object(155) <= uart_oS2M(43);
		AXIUARTTestModule_L42F35L46T14_Object(163 downto 156) <= uart_oS2M(51 downto 44);
		AXIUARTTestModule_L42F35L46T14_Object(164) <= uart_oS2M(52);
		AXIUARTTestModule_L42F35L46T14_Object(165) <= uart_oS2M(53);
		AXIUARTTestModule_L42F35L46T14_Object(173 downto 166) <= uart_oS2M(61 downto 54);
		AXIUARTTestModule_L42F35L46T14_Object(175 downto 174) <= uart_oS2M(63 downto 62);
		AXIUARTTestModule_L42F35L46T14_Object(183 downto 176) <= uart_oS2M(71 downto 64);
		AXIUARTTestModule_L42F35L46T14_Object(184) <= uart_oS2M(72);
		AXIUARTTestModule_L42F35L46T14_Object(185) <= uart_oS2M(73);
		master_S2M <= AXIUARTTestModule_L42F35L46T14_Object(185 downto 112);
		master_Master <= AXIUARTTestModule_L42F35L46T14_Object(111 downto 0);
		oCE <= uart_oCE;
		oRACK <= master_RACK;
		oRData0 <= master_RDATA(0);
		oRData1 <= master_RDATA(1);
		oRData2 <= master_RDATA(2);
		oRData3 <= master_RDATA(3);
		oRXCounter <= uart_oRXCounter;
		oRXData <= uart_oRXData;
		oRXValid <= uart_oRXValid;
		oTransmitting <= uart_oTransmitting;
		oTX <= uart_oTX;
		oTXCounter <= uart_oTXCounter;
		oWACK <= master_WACK;
		master_Master_master_Master_HardLink <= master_Master;
		master_S2M_master_S2M_HardLink <= master_S2M;
		master_M2S <= master_M2S_master_M2S_HardLink;
		master_RACK <= master_RACK_master_RACK_HardLink;
		master_RDATA(0) <= master_RDATA0_master_RDATA_HardLink;
		master_RDATA(1) <= master_RDATA1_master_RDATA_HardLink;
		master_RDATA(2) <= master_RDATA2_master_RDATA_HardLink;
		master_RDATA(3) <= master_RDATA3_master_RDATA_HardLink;
		master_WACK <= master_WACK_master_WACK_HardLink;
		uart_iRX_uart_iRX_HardLink <= uart_iRX;
		uart_M2S_uart_M2S_HardLink <= uart_M2S;
		uart_oCE <= uart_oCE_uart_oCE_HardLink;
		uart_oRXCounter <= uart_oRXCounter_uart_oRXCounter_HardLink;
		uart_oRXData <= uart_oRXData_uart_oRXData_HardLink;
		uart_oRXValid <= uart_oRXValid_uart_oRXValid_HardLink;
		uart_oS2M <= uart_oS2M_uart_oS2M_HardLink;
		uart_oTransmitting <= uart_oTransmitting_uart_oTransmitting_HardLink;
		uart_oTX <= uart_oTX_uart_oTX_HardLink;
		uart_oTXCounter <= uart_oTXCounter_uart_oTXCounter_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
