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
-- System configuration name is AXI4RegisterModuleB4_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity AXI4RegisterModuleB4_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		M2S_R_AR_ARID : in unsigned (7 downto 0);
		M2S_R_AR_ARADDR : in unsigned (31 downto 0);
		M2S_R_AR_ARLEN : in unsigned (7 downto 0);
		M2S_R_AR_ARSIZE : in unsigned (2 downto 0);
		M2S_R_AR_ARBURST : in unsigned (1 downto 0);
		M2S_R_AR_ARLOCK : in unsigned (1 downto 0);
		M2S_R_AR_ARCACHE : in unsigned (3 downto 0);
		M2S_R_AR_ARPROT : in unsigned (2 downto 0);
		M2S_R_AR_ARQOS : in unsigned (3 downto 0);
		M2S_R_AR_ARREGION : in unsigned (7 downto 0);
		M2S_R_AR_ARUSER : in unsigned (7 downto 0);
		M2S_R_AR_ARVALID : in std_logic;
		M2S_R_R_RREADY : in std_logic;
		M2S_W_AW_AWID : in unsigned (7 downto 0);
		M2S_W_AW_AWADDR : in unsigned (31 downto 0);
		M2S_W_AW_AWLEN : in unsigned (7 downto 0);
		M2S_W_AW_AWSIZE : in unsigned (2 downto 0);
		M2S_W_AW_AWBURST : in unsigned (1 downto 0);
		M2S_W_AW_AWLOCK : in unsigned (1 downto 0);
		M2S_W_AW_AWCACHE : in unsigned (3 downto 0);
		M2S_W_AW_AWPROT : in unsigned (2 downto 0);
		M2S_W_AW_AWQOS : in unsigned (3 downto 0);
		M2S_W_AW_AWREGION : in unsigned (7 downto 0);
		M2S_W_AW_AWUSER : in unsigned (7 downto 0);
		M2S_W_AW_AWVALID : in std_logic;
		M2S_W_W_WID : in unsigned (7 downto 0);
		M2S_W_W_WDATA0 : in unsigned (7 downto 0);
		M2S_W_W_WDATA1 : in unsigned (7 downto 0);
		M2S_W_W_WDATA2 : in unsigned (7 downto 0);
		M2S_W_W_WDATA3 : in unsigned (7 downto 0);
		M2S_W_W_WSTRB : in unsigned (3 downto 0);
		M2S_W_W_WLAST : in std_logic;
		M2S_W_W_WUSER : in unsigned (7 downto 0);
		M2S_W_W_WVALID : in std_logic;
		M2S_W_B_BREADY : in std_logic;
		Reg_inWDATA0 : in unsigned (7 downto 0);
		Reg_inWDATA1 : in unsigned (7 downto 0);
		Reg_inWDATA2 : in unsigned (7 downto 0);
		Reg_inWDATA3 : in unsigned (7 downto 0);
		Reg_inWE : in std_logic;
		outACK : out std_logic;
		outData0 : out unsigned (7 downto 0);
		outData1 : out unsigned (7 downto 0);
		outData2 : out unsigned (7 downto 0);
		outData3 : out unsigned (7 downto 0);
		outWritten : out std_logic;
		S2M_R_AR_ARREADY : out std_logic;
		S2M_R_R_RID : out unsigned (7 downto 0);
		S2M_R_R_RDATA0 : out unsigned (7 downto 0);
		S2M_R_R_RDATA1 : out unsigned (7 downto 0);
		S2M_R_R_RDATA2 : out unsigned (7 downto 0);
		S2M_R_R_RDATA3 : out unsigned (7 downto 0);
		S2M_R_R_RRESP : out unsigned (1 downto 0);
		S2M_R_R_RLAST : out std_logic;
		S2M_R_R_RUSER : out unsigned (7 downto 0);
		S2M_R_R_RVALID : out std_logic;
		S2M_W_AW_AWREADY : out std_logic;
		S2M_W_B_BID : out unsigned (7 downto 0);
		S2M_W_B_BRESP : out unsigned (1 downto 0);
		S2M_W_B_BUSER : out unsigned (7 downto 0);
		S2M_W_B_BVALID : out std_logic;
		S2M_W_W_WREADY : out std_logic
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of AXI4RegisterModuleB4_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant State_bytesDefault : unsigned(7 downto 0) := "00000000";
	constant size : unsigned(1 downto 0) := "10";
	constant AXI4RegisterModule_L69F29T33_Expr : std_logic := '1';
	constant AXI4RegisterModule_L70F28T32_Expr : std_logic := '1';
	constant AXI4RegisterModule_L71F29T33_Expr : std_logic := '1';
	constant AXI4RegisterModule_L73F28T32_Expr : std_logic := '1';
	signal Inputs_M2S_R_AR_ARID : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARADDR : unsigned(31 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARLEN : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARSIZE : unsigned(2 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARBURST : unsigned(1 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARLOCK : unsigned(1 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARCACHE : unsigned(3 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARPROT : unsigned(2 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARQOS : unsigned(3 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARREGION : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARUSER : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_R_AR_ARVALID : std_logic := '0';
	signal Inputs_M2S_R_R_RREADY : std_logic := '0';
	signal Inputs_M2S_W_AW_AWID : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWADDR : unsigned(31 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWLEN : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWSIZE : unsigned(2 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWBURST : unsigned(1 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWLOCK : unsigned(1 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWCACHE : unsigned(3 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWPROT : unsigned(2 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWQOS : unsigned(3 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWREGION : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWUSER : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_W_AW_AWVALID : std_logic := '0';
	signal Inputs_M2S_W_W_WID : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_W_W_WSTRB : unsigned(3 downto 0) := (others => '0');
	signal Inputs_M2S_W_W_WLAST : std_logic := '0';
	signal Inputs_M2S_W_W_WUSER : unsigned(7 downto 0) := (others => '0');
	signal Inputs_M2S_W_W_WVALID : std_logic := '0';
	signal Inputs_M2S_W_B_BREADY : std_logic := '0';
	signal Inputs_Reg_inWE : std_logic := '0';
	signal NextState_Written : std_logic := '0';
	signal axiSlave_inARREADY : std_logic := '0';
	signal axiSlave_inAWREADY : std_logic := '0';
	signal axiSlave_inBVALID : std_logic := '0';
	signal axiSlave_inRVALID : std_logic := '0';
	signal axiSlave_inWREADY : std_logic := '0';
	signal axiSlave_M2S : unsigned(221 downto 0) := (others => '0');
	signal axiSlave_outARADDR : unsigned(31 downto 0) := (others => '0');
	signal axiSlave_outARREADYConfirming : std_logic := '0';
	signal axiSlave_outARVALID : std_logic := '0';
	signal axiSlave_outAWADDR : unsigned(31 downto 0) := (others => '0');
	signal axiSlave_outAWREADYConfirming : std_logic := '0';
	signal axiSlave_outAWVALID : std_logic := '0';
	signal axiSlave_outReadTXCompleting : std_logic := '0';
	signal axiSlave_outWREADYConfirming : std_logic := '0';
	signal axiSlave_outWriteTXCompleting : std_logic := '0';
	signal axiSlave_outWSTRB : unsigned(3 downto 0) := (others => '0');
	signal axiSlave_outWVALID : std_logic := '0';
	signal axiSlave_S2M : unsigned(73 downto 0) := (others => '0');
	signal axiSlave_inARREADY_axiSlave_inARREADY_HardLink : std_logic := '0';
	signal axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink : std_logic := '0';
	signal axiSlave_inBVALID_axiSlave_inBVALID_HardLink : std_logic := '0';
	signal axiSlave_inRDATA0_axiSlave_inRDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_inRDATA1_axiSlave_inRDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_inRDATA2_axiSlave_inRDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_inRDATA3_axiSlave_inRDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_inRVALID_axiSlave_inRVALID_HardLink : std_logic := '0';
	signal axiSlave_inWREADY_axiSlave_inWREADY_HardLink : std_logic := '0';
	signal axiSlave_M2S_axiSlave_M2S_HardLink : unsigned(221 downto 0) := "000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000";
	signal axiSlave_outARADDR_axiSlave_outARADDR_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink : std_logic := '0';
	signal axiSlave_outARVALID_axiSlave_outARVALID_HardLink : std_logic := '0';
	signal axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink : unsigned(31 downto 0) := "00000000000000000000000000000000";
	signal axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink : std_logic := '0';
	signal axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink : std_logic := '0';
	signal axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink : std_logic := '0';
	signal axiSlave_outWDATA0_axiSlave_outWDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_outWDATA1_axiSlave_outWDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_outWDATA2_axiSlave_outWDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_outWDATA3_axiSlave_outWDATA_HardLink : unsigned(7 downto 0) := "00000000";
	signal axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink : std_logic := '0';
	signal axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink : std_logic := '0';
	signal axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink : unsigned(3 downto 0) := "0000";
	signal axiSlave_outWVALID_axiSlave_outWVALID_HardLink : std_logic := '0';
	signal axiSlave_S2M_axiSlave_S2M_HardLink : unsigned(73 downto 0) := "00000000000000000000000000000000000000000000000000000000000000000000000000";
	signal State_Written : std_logic := '0';
	constant State_WrittenDefault : std_logic := '0';
	signal AXI4RegisterModule_L72F28T44_Expr : std_logic := '0';
	signal AXI4RegisterModule_L72F28T44_Expr_1 : std_logic := '0';
	signal AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr : std_logic := '0';
	signal AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_1 : std_logic := '0';
	signal AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_2 : std_logic := '0';
	type Inputs_M2S_W_W_WDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal Inputs_M2S_W_W_WDATA : Inputs_M2S_W_W_WDATAArray := (others => (others => '0'));
	type Inputs_Reg_inWDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal Inputs_Reg_inWDATA : Inputs_Reg_inWDATAArray := (others => (others => '0'));
	type State_bytesArray is array (0 to 3) of unsigned (7 downto 0);
	signal State_bytes : State_bytesArray := (others => (others => '0'));
	type NextState_bytesArray is array (0 to 3) of unsigned (7 downto 0);
	signal NextState_bytes : NextState_bytesArray := (others => (others => '0'));
	type axiSlave_inRDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal axiSlave_inRDATA : axiSlave_inRDATAArray := (others => (others => '0'));
	type axiSlave_outWDATAArray is array (0 to 3) of unsigned (7 downto 0);
	signal axiSlave_outWDATA : axiSlave_outWDATAArray := (others => (others => '0'));
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	process (Clock, NextState_Written, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_Written <= State_WrittenDefault;
			else
				State_Written <= NextState_Written;
			end if;
		end if;
	end process;
	process (Clock, NextState_bytes, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				for State_bytes_Iterator in 0 to 3 loop
					State_bytes(State_bytes_Iterator) <= State_bytesDefault;
				end loop;
			else
				for State_bytes_Iterator in 0 to 3 loop
					State_bytes(State_bytes_Iterator) <= NextState_bytes(State_bytes_Iterator);
				end loop;
			end if;
		end if;
	end process;
	process (AXI4RegisterModule_L72F28T44_Expr_1)
	begin
		AXI4RegisterModule_L72F28T44_Expr <= NOT AXI4RegisterModule_L72F28T44_Expr_1;
	end process;
	process (AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_1, AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_2)
	begin
		AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr <= AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_1 OR AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_2;
	end process;
	AXI4RegisterModuleB4_TopLevel_axiSlave : entity work.AXI4RegisterModuleB4_TopLevel_axiSlave
	port map
	(
		-- [BEGIN USER MAP FOR axiSlave]
		-- [END USER MAP FOR axiSlave]
		BoardSignals => BoardSignals,
		inARREADY => axiSlave_inARREADY_axiSlave_inARREADY_HardLink,
		inAWREADY => axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink,
		inBVALID => axiSlave_inBVALID_axiSlave_inBVALID_HardLink,
		inRDATA0 => axiSlave_inRDATA0_axiSlave_inRDATA_HardLink,
		inRDATA1 => axiSlave_inRDATA1_axiSlave_inRDATA_HardLink,
		inRDATA2 => axiSlave_inRDATA2_axiSlave_inRDATA_HardLink,
		inRDATA3 => axiSlave_inRDATA3_axiSlave_inRDATA_HardLink,
		inRVALID => axiSlave_inRVALID_axiSlave_inRVALID_HardLink,
		inWREADY => axiSlave_inWREADY_axiSlave_inWREADY_HardLink,
		M2S => axiSlave_M2S_axiSlave_M2S_HardLink,
		outARADDR => axiSlave_outARADDR_axiSlave_outARADDR_HardLink,
		outARREADYConfirming => axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink,
		outARVALID => axiSlave_outARVALID_axiSlave_outARVALID_HardLink,
		outAWADDR => axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink,
		outAWREADYConfirming => axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink,
		outAWVALID => axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink,
		outReadTXCompleting => axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink,
		outWDATA0 => axiSlave_outWDATA0_axiSlave_outWDATA_HardLink,
		outWDATA1 => axiSlave_outWDATA1_axiSlave_outWDATA_HardLink,
		outWDATA2 => axiSlave_outWDATA2_axiSlave_outWDATA_HardLink,
		outWDATA3 => axiSlave_outWDATA3_axiSlave_outWDATA_HardLink,
		outWREADYConfirming => axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink,
		outWriteTXCompleting => axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink,
		outWSTRB => axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink,
		outWVALID => axiSlave_outWVALID_axiSlave_outWVALID_HardLink,
		S2M => axiSlave_S2M_axiSlave_S2M_HardLink
	)
	;
	process (AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr, axiSlave_outWDATA, axiSlave_outWREADYConfirming, axiSlave_outWSTRB, Inputs_Reg_inWDATA, Inputs_Reg_inWE, State_bytes, State_Written)
	begin
		for NextState_bytes_Iterator in 0 to 3 loop
			NextState_bytes(NextState_bytes_Iterator) <= State_bytes(NextState_bytes_Iterator);
		end loop;
		NextState_Written <= State_Written;
		NextState_Written <= AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr;
		if Inputs_Reg_inWE = '1' then
			NextState_bytes(0) <= Inputs_Reg_inWDATA(0);
			NextState_bytes(1) <= Inputs_Reg_inWDATA(1);
			NextState_bytes(2) <= Inputs_Reg_inWDATA(2);
			NextState_bytes(3) <= Inputs_Reg_inWDATA(3);
		elsif axiSlave_outWREADYConfirming = '1' then
			if axiSlave_outWSTRB(0) = '1' then
				NextState_bytes(0) <= axiSlave_outWDATA(0);
			end if;
			if axiSlave_outWSTRB(1) = '1' then
				NextState_bytes(1) <= axiSlave_outWDATA(1);
			end if;
			if axiSlave_outWSTRB(2) = '1' then
				NextState_bytes(2) <= axiSlave_outWDATA(2);
			end if;
			if axiSlave_outWSTRB(3) = '1' then
				NextState_bytes(3) <= axiSlave_outWDATA(3);
			end if;
		end if;
	end process;
	process (AXI4RegisterModule_L72F28T44_Expr, axiSlave_inARREADY, axiSlave_inAWREADY, axiSlave_inBVALID, axiSlave_inRDATA, axiSlave_inRVALID, axiSlave_inWREADY, axiSlave_M2S, axiSlave_outARADDR_axiSlave_outARADDR_HardLink, axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink, axiSlave_outARVALID_axiSlave_outARVALID_HardLink, axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink, axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink, axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink, axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink, axiSlave_outWDATA0_axiSlave_outWDATA_HardLink, axiSlave_outWDATA1_axiSlave_outWDATA_HardLink, axiSlave_outWDATA2_axiSlave_outWDATA_HardLink, axiSlave_outWDATA3_axiSlave_outWDATA_HardLink, axiSlave_outWREADYConfirming, axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink, axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink, axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink, axiSlave_outWVALID_axiSlave_outWVALID_HardLink, axiSlave_S2M, axiSlave_S2M_axiSlave_S2M_HardLink, Inputs_M2S_R_AR_ARADDR, Inputs_M2S_R_AR_ARBURST, Inputs_M2S_R_AR_ARCACHE, Inputs_M2S_R_AR_ARID, Inputs_M2S_R_AR_ARLEN, Inputs_M2S_R_AR_ARLOCK, Inputs_M2S_R_AR_ARPROT, Inputs_M2S_R_AR_ARQOS, Inputs_M2S_R_AR_ARREGION, Inputs_M2S_R_AR_ARSIZE, Inputs_M2S_R_AR_ARUSER, Inputs_M2S_R_AR_ARVALID, Inputs_M2S_R_R_RREADY, Inputs_M2S_W_AW_AWADDR, Inputs_M2S_W_AW_AWBURST, Inputs_M2S_W_AW_AWCACHE, Inputs_M2S_W_AW_AWID, Inputs_M2S_W_AW_AWLEN, Inputs_M2S_W_AW_AWLOCK, Inputs_M2S_W_AW_AWPROT, Inputs_M2S_W_AW_AWQOS, Inputs_M2S_W_AW_AWREGION, Inputs_M2S_W_AW_AWSIZE, Inputs_M2S_W_AW_AWUSER, Inputs_M2S_W_AW_AWVALID, Inputs_M2S_W_B_BREADY, Inputs_M2S_W_W_WDATA, Inputs_M2S_W_W_WID, Inputs_M2S_W_W_WLAST, Inputs_M2S_W_W_WSTRB, Inputs_M2S_W_W_WUSER, Inputs_M2S_W_W_WVALID, Inputs_Reg_inWE, M2S_R_AR_ARADDR, M2S_R_AR_ARBURST, M2S_R_AR_ARCACHE, M2S_R_AR_ARID, M2S_R_AR_ARLEN, M2S_R_AR_ARLOCK, M2S_R_AR_ARPROT, M2S_R_AR_ARQOS, M2S_R_AR_ARREGION, M2S_R_AR_ARSIZE, M2S_R_AR_ARUSER, M2S_R_AR_ARVALID, M2S_R_R_RREADY, M2S_W_AW_AWADDR, M2S_W_AW_AWBURST, M2S_W_AW_AWCACHE, M2S_W_AW_AWID, M2S_W_AW_AWLEN, M2S_W_AW_AWLOCK, M2S_W_AW_AWPROT, M2S_W_AW_AWQOS, M2S_W_AW_AWREGION, M2S_W_AW_AWSIZE, M2S_W_AW_AWUSER, M2S_W_AW_AWVALID, M2S_W_B_BREADY, M2S_W_W_WDATA0, M2S_W_W_WDATA1, M2S_W_W_WDATA2, M2S_W_W_WDATA3, M2S_W_W_WID, M2S_W_W_WLAST, M2S_W_W_WSTRB, M2S_W_W_WUSER, M2S_W_W_WVALID, Reg_inWDATA0, Reg_inWDATA1, Reg_inWDATA2, Reg_inWDATA3, Reg_inWE, State_bytes, State_Written)
	begin
		AXI4RegisterModule_L72F28T44_Expr_1 <= Inputs_Reg_inWE;
		AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_1 <= Inputs_Reg_inWE;
		AXI4RegisterModule_L78F9L93T10_AXI4RegisterModule_L79F33T80_Expr_2 <= axiSlave_outWREADYConfirming;
		Inputs_M2S_R_AR_ARID <= M2S_R_AR_ARID;
		Inputs_M2S_R_AR_ARADDR <= M2S_R_AR_ARADDR;
		Inputs_M2S_R_AR_ARLEN <= M2S_R_AR_ARLEN;
		Inputs_M2S_R_AR_ARSIZE <= M2S_R_AR_ARSIZE;
		Inputs_M2S_R_AR_ARBURST <= M2S_R_AR_ARBURST;
		Inputs_M2S_R_AR_ARLOCK <= M2S_R_AR_ARLOCK;
		Inputs_M2S_R_AR_ARCACHE <= M2S_R_AR_ARCACHE;
		Inputs_M2S_R_AR_ARPROT <= M2S_R_AR_ARPROT;
		Inputs_M2S_R_AR_ARQOS <= M2S_R_AR_ARQOS;
		Inputs_M2S_R_AR_ARREGION <= M2S_R_AR_ARREGION;
		Inputs_M2S_R_AR_ARUSER <= M2S_R_AR_ARUSER;
		Inputs_M2S_R_AR_ARVALID <= M2S_R_AR_ARVALID;
		Inputs_M2S_R_R_RREADY <= M2S_R_R_RREADY;
		Inputs_M2S_W_AW_AWID <= M2S_W_AW_AWID;
		Inputs_M2S_W_AW_AWADDR <= M2S_W_AW_AWADDR;
		Inputs_M2S_W_AW_AWLEN <= M2S_W_AW_AWLEN;
		Inputs_M2S_W_AW_AWSIZE <= M2S_W_AW_AWSIZE;
		Inputs_M2S_W_AW_AWBURST <= M2S_W_AW_AWBURST;
		Inputs_M2S_W_AW_AWLOCK <= M2S_W_AW_AWLOCK;
		Inputs_M2S_W_AW_AWCACHE <= M2S_W_AW_AWCACHE;
		Inputs_M2S_W_AW_AWPROT <= M2S_W_AW_AWPROT;
		Inputs_M2S_W_AW_AWQOS <= M2S_W_AW_AWQOS;
		Inputs_M2S_W_AW_AWREGION <= M2S_W_AW_AWREGION;
		Inputs_M2S_W_AW_AWUSER <= M2S_W_AW_AWUSER;
		Inputs_M2S_W_AW_AWVALID <= M2S_W_AW_AWVALID;
		Inputs_M2S_W_W_WID <= M2S_W_W_WID;
		Inputs_M2S_W_W_WDATA(0) <= M2S_W_W_WDATA0;
		Inputs_M2S_W_W_WDATA(1) <= M2S_W_W_WDATA1;
		Inputs_M2S_W_W_WDATA(2) <= M2S_W_W_WDATA2;
		Inputs_M2S_W_W_WDATA(3) <= M2S_W_W_WDATA3;
		Inputs_M2S_W_W_WSTRB <= M2S_W_W_WSTRB;
		Inputs_M2S_W_W_WLAST <= M2S_W_W_WLAST;
		Inputs_M2S_W_W_WUSER <= M2S_W_W_WUSER;
		Inputs_M2S_W_W_WVALID <= M2S_W_W_WVALID;
		Inputs_M2S_W_B_BREADY <= M2S_W_B_BREADY;
		Inputs_Reg_inWDATA(0) <= Reg_inWDATA0;
		Inputs_Reg_inWDATA(1) <= Reg_inWDATA1;
		Inputs_Reg_inWDATA(2) <= Reg_inWDATA2;
		Inputs_Reg_inWDATA(3) <= Reg_inWDATA3;
		Inputs_Reg_inWE <= Reg_inWE;
		axiSlave_inARREADY <= AXI4RegisterModule_L69F29T33_Expr;
		axiSlave_inAWREADY <= AXI4RegisterModule_L71F29T33_Expr;
		axiSlave_inBVALID <= AXI4RegisterModule_L73F28T32_Expr;
		axiSlave_inRDATA(0) <= State_bytes(0);
		axiSlave_inRDATA(1) <= State_bytes(1);
		axiSlave_inRDATA(2) <= State_bytes(2);
		axiSlave_inRDATA(3) <= State_bytes(3);
		axiSlave_inRVALID <= AXI4RegisterModule_L70F28T32_Expr;
		axiSlave_inWREADY <= AXI4RegisterModule_L72F28T44_Expr;
		axiSlave_M2S(221) <= Inputs_M2S_W_B_BREADY;
		axiSlave_M2S(220) <= Inputs_M2S_W_W_WVALID;
		axiSlave_M2S(219 downto 212) <= Inputs_M2S_W_W_WUSER;
		axiSlave_M2S(211) <= Inputs_M2S_W_W_WLAST;
		axiSlave_M2S(210 downto 207) <= Inputs_M2S_W_W_WSTRB;
		axiSlave_M2S(206 downto 199) <= Inputs_M2S_W_W_WDATA(3);
		axiSlave_M2S(198 downto 191) <= Inputs_M2S_W_W_WDATA(2);
		axiSlave_M2S(190 downto 183) <= Inputs_M2S_W_W_WDATA(1);
		axiSlave_M2S(182 downto 175) <= Inputs_M2S_W_W_WDATA(0);
		axiSlave_M2S(174 downto 167) <= Inputs_M2S_W_W_WID;
		axiSlave_M2S(166) <= Inputs_M2S_W_AW_AWVALID;
		axiSlave_M2S(165 downto 158) <= Inputs_M2S_W_AW_AWUSER;
		axiSlave_M2S(157 downto 150) <= Inputs_M2S_W_AW_AWREGION;
		axiSlave_M2S(149 downto 146) <= Inputs_M2S_W_AW_AWQOS;
		axiSlave_M2S(145 downto 143) <= Inputs_M2S_W_AW_AWPROT;
		axiSlave_M2S(142 downto 139) <= Inputs_M2S_W_AW_AWCACHE;
		axiSlave_M2S(138 downto 137) <= Inputs_M2S_W_AW_AWLOCK;
		axiSlave_M2S(136 downto 135) <= Inputs_M2S_W_AW_AWBURST;
		axiSlave_M2S(134 downto 132) <= Inputs_M2S_W_AW_AWSIZE;
		axiSlave_M2S(131 downto 124) <= Inputs_M2S_W_AW_AWLEN;
		axiSlave_M2S(123 downto 92) <= Inputs_M2S_W_AW_AWADDR;
		axiSlave_M2S(91 downto 84) <= Inputs_M2S_W_AW_AWID;
		axiSlave_M2S(83) <= Inputs_M2S_R_R_RREADY;
		axiSlave_M2S(82) <= Inputs_M2S_R_AR_ARVALID;
		axiSlave_M2S(81 downto 74) <= Inputs_M2S_R_AR_ARUSER;
		axiSlave_M2S(73 downto 66) <= Inputs_M2S_R_AR_ARREGION;
		axiSlave_M2S(65 downto 62) <= Inputs_M2S_R_AR_ARQOS;
		axiSlave_M2S(61 downto 59) <= Inputs_M2S_R_AR_ARPROT;
		axiSlave_M2S(58 downto 55) <= Inputs_M2S_R_AR_ARCACHE;
		axiSlave_M2S(54 downto 53) <= Inputs_M2S_R_AR_ARLOCK;
		axiSlave_M2S(52 downto 51) <= Inputs_M2S_R_AR_ARBURST;
		axiSlave_M2S(50 downto 48) <= Inputs_M2S_R_AR_ARSIZE;
		axiSlave_M2S(47 downto 40) <= Inputs_M2S_R_AR_ARLEN;
		axiSlave_M2S(39 downto 8) <= Inputs_M2S_R_AR_ARADDR;
		axiSlave_M2S(7 downto 0) <= Inputs_M2S_R_AR_ARID;
		outACK <= Inputs_Reg_inWE;
		outData0 <= State_bytes(0);
		outData1 <= State_bytes(1);
		outData2 <= State_bytes(2);
		outData3 <= State_bytes(3);
		outWritten <= State_Written;
		S2M_W_W_WREADY <= axiSlave_S2M(73);
		S2M_W_B_BVALID <= axiSlave_S2M(72);
		S2M_W_B_BUSER <= axiSlave_S2M(71 downto 64);
		S2M_W_B_BRESP <= axiSlave_S2M(63 downto 62);
		S2M_W_B_BID <= axiSlave_S2M(61 downto 54);
		S2M_W_AW_AWREADY <= axiSlave_S2M(53);
		S2M_R_R_RVALID <= axiSlave_S2M(52);
		S2M_R_R_RUSER <= axiSlave_S2M(51 downto 44);
		S2M_R_R_RLAST <= axiSlave_S2M(43);
		S2M_R_R_RRESP <= axiSlave_S2M(42 downto 41);
		S2M_R_R_RDATA3 <= axiSlave_S2M(40 downto 33);
		S2M_R_R_RDATA2 <= axiSlave_S2M(32 downto 25);
		S2M_R_R_RDATA1 <= axiSlave_S2M(24 downto 17);
		S2M_R_R_RDATA0 <= axiSlave_S2M(16 downto 9);
		S2M_R_R_RID <= axiSlave_S2M(8 downto 1);
		S2M_R_AR_ARREADY <= axiSlave_S2M(0);
		axiSlave_inARREADY_axiSlave_inARREADY_HardLink <= axiSlave_inARREADY;
		axiSlave_inAWREADY_axiSlave_inAWREADY_HardLink <= axiSlave_inAWREADY;
		axiSlave_inBVALID_axiSlave_inBVALID_HardLink <= axiSlave_inBVALID;
		axiSlave_inRDATA0_axiSlave_inRDATA_HardLink <= axiSlave_inRDATA(0);
		axiSlave_inRDATA1_axiSlave_inRDATA_HardLink <= axiSlave_inRDATA(1);
		axiSlave_inRDATA2_axiSlave_inRDATA_HardLink <= axiSlave_inRDATA(2);
		axiSlave_inRDATA3_axiSlave_inRDATA_HardLink <= axiSlave_inRDATA(3);
		axiSlave_inRVALID_axiSlave_inRVALID_HardLink <= axiSlave_inRVALID;
		axiSlave_inWREADY_axiSlave_inWREADY_HardLink <= axiSlave_inWREADY;
		axiSlave_M2S_axiSlave_M2S_HardLink <= axiSlave_M2S;
		axiSlave_outARADDR <= axiSlave_outARADDR_axiSlave_outARADDR_HardLink;
		axiSlave_outARREADYConfirming <= axiSlave_outARREADYConfirming_axiSlave_outARREADYConfirming_HardLink;
		axiSlave_outARVALID <= axiSlave_outARVALID_axiSlave_outARVALID_HardLink;
		axiSlave_outAWADDR <= axiSlave_outAWADDR_axiSlave_outAWADDR_HardLink;
		axiSlave_outAWREADYConfirming <= axiSlave_outAWREADYConfirming_axiSlave_outAWREADYConfirming_HardLink;
		axiSlave_outAWVALID <= axiSlave_outAWVALID_axiSlave_outAWVALID_HardLink;
		axiSlave_outReadTXCompleting <= axiSlave_outReadTXCompleting_axiSlave_outReadTXCompleting_HardLink;
		axiSlave_outWDATA(0) <= axiSlave_outWDATA0_axiSlave_outWDATA_HardLink;
		axiSlave_outWDATA(1) <= axiSlave_outWDATA1_axiSlave_outWDATA_HardLink;
		axiSlave_outWDATA(2) <= axiSlave_outWDATA2_axiSlave_outWDATA_HardLink;
		axiSlave_outWDATA(3) <= axiSlave_outWDATA3_axiSlave_outWDATA_HardLink;
		axiSlave_outWREADYConfirming <= axiSlave_outWREADYConfirming_axiSlave_outWREADYConfirming_HardLink;
		axiSlave_outWriteTXCompleting <= axiSlave_outWriteTXCompleting_axiSlave_outWriteTXCompleting_HardLink;
		axiSlave_outWSTRB <= axiSlave_outWSTRB_axiSlave_outWSTRB_HardLink;
		axiSlave_outWVALID <= axiSlave_outWVALID_axiSlave_outWVALID_HardLink;
		axiSlave_S2M <= axiSlave_S2M_axiSlave_S2M_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
