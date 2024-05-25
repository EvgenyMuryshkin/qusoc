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
-- System configuration name is FIRRAMDSPModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRRAMDSPModule_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iDSP_A : in unsigned (29 downto 0);
		iDSP_CE : in std_logic;
		iDSP_D : in unsigned (24 downto 0);
		iDSP_OPMODE : in unsigned (2 downto 0);
		iDSP_PCIN : in unsigned (47 downto 0);
		iRAM_RD : in std_logic;
		iRAM_RD_ADDR : in unsigned (7 downto 0);
		iRAM_WR : in std_logic;
		iRAM_WR_ADDR : in unsigned (7 downto 0);
		iRAM_WR_DATA : in unsigned (15 downto 0);
		oDSP_P : out unsigned (47 downto 0);
		oDSP_PCOUT : out unsigned (47 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRRAMDSPModule_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	constant FIRRAMDSPModule_L47F22T26_Expr : std_logic := '1';
	constant FIRRAMDSPModule_L58F23T28_Expr : std_logic := '0';
	signal Inputs_iDSP_A : unsigned(29 downto 0) := (others => '0');
	signal Inputs_iDSP_CE : std_logic := '0';
	signal Inputs_iDSP_D : unsigned(24 downto 0) := (others => '0');
	signal Inputs_iDSP_OPMODE : unsigned(2 downto 0) := (others => '0');
	signal Inputs_iDSP_PCIN : unsigned(47 downto 0) := (others => '0');
	signal Inputs_iRAM_RD : std_logic := '0';
	signal Inputs_iRAM_RD_ADDR : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iRAM_WR : std_logic := '0';
	signal Inputs_iRAM_WR_ADDR : unsigned(7 downto 0) := (others => '0');
	signal Inputs_iRAM_WR_DATA : unsigned(15 downto 0) := (others => '0');
	signal NextState_UnusedSignal : std_logic := '0';
	signal u_dsp_A : unsigned(29 downto 0) := (others => '0');
	signal u_dsp_B : unsigned(17 downto 0) := (others => '0');
	signal u_dsp_CE : std_logic := '0';
	signal u_dsp_D : unsigned(24 downto 0) := (others => '0');
	signal u_dsp_OPMODE : unsigned(2 downto 0) := (others => '0');
	signal u_dsp_PCIN : unsigned(47 downto 0) := (others => '0');
	signal u_dsp_RST : std_logic := '0';
	signal u_dsp_P : unsigned(47 downto 0) := (others => '0');
	signal u_dsp_PCOUT : unsigned(47 downto 0) := (others => '0');
	signal u_ram_CE : std_logic := '0';
	signal u_ram_DIN : unsigned(15 downto 0) := (others => '0');
	signal u_ram_RD : std_logic := '0';
	signal u_ram_RD_ADDR : unsigned(7 downto 0) := (others => '0');
	signal u_ram_WR : std_logic := '0';
	signal u_ram_WR_ADDR : unsigned(7 downto 0) := (others => '0');
	signal u_ram_DOUT : unsigned(15 downto 0) := (others => '0');
	signal FIRRAMDSPModule_L45F34L53T14_Object : unsigned(34 downto 0) := (others => '0');
	signal FIRRAMDSPModule_L55F34L64T14_Object : unsigned(125 downto 0) := (others => '0');
	signal FIRRAMDSPModule_L60F21T43_Resize : unsigned(17 downto 0) := (others => '0');
	signal u_dsp_A_u_dsp_A_HardLink : unsigned(29 downto 0) := "000000000000000000000000000000";
	signal u_dsp_B_u_dsp_B_HardLink : unsigned(17 downto 0) := "000000000000000000";
	signal u_dsp_CE_u_dsp_CE_HardLink : std_logic := '0';
	signal u_dsp_D_u_dsp_D_HardLink : unsigned(24 downto 0) := "0000000000000000000000000";
	signal u_dsp_OPMODE_u_dsp_OPMODE_HardLink : unsigned(2 downto 0) := "000";
	signal u_dsp_PCIN_u_dsp_PCIN_HardLink : unsigned(47 downto 0) := "000000000000000000000000000000000000000000000000";
	signal u_dsp_RST_u_dsp_RST_HardLink : std_logic := '0';
	signal u_dsp_P_u_dsp_P_HardLink : unsigned(47 downto 0) := "000000000000000000000000000000000000000000000000";
	signal u_dsp_PCOUT_u_dsp_PCOUT_HardLink : unsigned(47 downto 0) := "000000000000000000000000000000000000000000000000";
	signal u_ram_CE_u_ram_CE_HardLink : std_logic := '0';
	signal u_ram_DIN_u_ram_DIN_HardLink : unsigned(15 downto 0) := "0000000000000000";
	signal u_ram_RD_u_ram_RD_HardLink : std_logic := '0';
	signal u_ram_RD_ADDR_u_ram_RD_ADDR_HardLink : unsigned(7 downto 0) := "00000000";
	signal u_ram_WR_u_ram_WR_HardLink : std_logic := '0';
	signal u_ram_WR_ADDR_u_ram_WR_ADDR_HardLink : unsigned(7 downto 0) := "00000000";
	signal u_ram_DOUT_u_ram_DOUT_HardLink : unsigned(15 downto 0) := "0000000000000000";
	signal State_UnusedSignal : std_logic := '0';
	constant State_UnusedSignalDefault : std_logic := '0';
	signal BoardSignals : BoardSignalsType;
	signal InternalReset : std_logic := '0';
begin
	work.Quokka.BoardSignalsProc(BoardSignals, Clock, Reset, InternalReset);
	process (Clock, NextState_UnusedSignal, Reset)
	begin
		if rising_edge(Clock) then
			if Reset = '1' then
				State_UnusedSignal <= State_UnusedSignalDefault;
			else
				State_UnusedSignal <= NextState_UnusedSignal;
			end if;
		end if;
	end process;
	FIRRAMDSPModule_TopLevel_u_dsp : entity work.FIRRAMDSPModule_TopLevel_u_dsp
	port map
	(
		-- [BEGIN USER MAP FOR u_dsp]
		-- [END USER MAP FOR u_dsp]
		BoardSignals => BoardSignals,
		A => u_dsp_A_u_dsp_A_HardLink,
		B => u_dsp_B_u_dsp_B_HardLink,
		CE => u_dsp_CE_u_dsp_CE_HardLink,
		D => u_dsp_D_u_dsp_D_HardLink,
		OPMODE => u_dsp_OPMODE_u_dsp_OPMODE_HardLink,
		PCIN => u_dsp_PCIN_u_dsp_PCIN_HardLink,
		RST => u_dsp_RST_u_dsp_RST_HardLink,
		P => u_dsp_P_u_dsp_P_HardLink,
		PCOUT => u_dsp_PCOUT_u_dsp_PCOUT_HardLink
	)
	;
	FIRRAMDSPModule_TopLevel_u_ram : entity work.FIRRAMDSPModule_TopLevel_u_ram
	port map
	(
		-- [BEGIN USER MAP FOR u_ram]
		-- [END USER MAP FOR u_ram]
		BoardSignals => BoardSignals,
		CE => u_ram_CE_u_ram_CE_HardLink,
		DIN => u_ram_DIN_u_ram_DIN_HardLink,
		RD => u_ram_RD_u_ram_RD_HardLink,
		RD_ADDR => u_ram_RD_ADDR_u_ram_RD_ADDR_HardLink,
		WR => u_ram_WR_u_ram_WR_HardLink,
		WR_ADDR => u_ram_WR_ADDR_u_ram_WR_ADDR_HardLink,
		DOUT => u_ram_DOUT_u_ram_DOUT_HardLink
	)
	;
	process (State_UnusedSignal)
	begin
		NextState_UnusedSignal <= State_UnusedSignal;
	end process;
	process (FIRRAMDSPModule_L45F34L53T14_Object, FIRRAMDSPModule_L55F34L64T14_Object, FIRRAMDSPModule_L60F21T43_Resize, iDSP_A, iDSP_CE, iDSP_D, iDSP_OPMODE, iDSP_PCIN, Inputs_iDSP_A, Inputs_iDSP_CE, Inputs_iDSP_D, Inputs_iDSP_OPMODE, Inputs_iDSP_PCIN, Inputs_iRAM_RD, Inputs_iRAM_RD_ADDR, Inputs_iRAM_WR, Inputs_iRAM_WR_ADDR, Inputs_iRAM_WR_DATA, iRAM_RD, iRAM_RD_ADDR, iRAM_WR, iRAM_WR_ADDR, iRAM_WR_DATA, u_dsp_A, u_dsp_B, u_dsp_CE, u_dsp_D, u_dsp_OPMODE, u_dsp_P, u_dsp_P_u_dsp_P_HardLink, u_dsp_PCIN, u_dsp_PCOUT, u_dsp_PCOUT_u_dsp_PCOUT_HardLink, u_dsp_RST, u_ram_CE, u_ram_DIN, u_ram_DOUT, u_ram_DOUT_u_ram_DOUT_HardLink, u_ram_RD, u_ram_RD_ADDR, u_ram_WR, u_ram_WR_ADDR)
	begin
		Inputs_iDSP_A <= iDSP_A;
		Inputs_iDSP_CE <= iDSP_CE;
		Inputs_iDSP_D <= iDSP_D;
		Inputs_iDSP_OPMODE <= iDSP_OPMODE;
		Inputs_iDSP_PCIN <= iDSP_PCIN;
		Inputs_iRAM_RD <= iRAM_RD;
		Inputs_iRAM_RD_ADDR <= iRAM_RD_ADDR;
		Inputs_iRAM_WR <= iRAM_WR;
		Inputs_iRAM_WR_ADDR <= iRAM_WR_ADDR;
		Inputs_iRAM_WR_DATA <= iRAM_WR_DATA;
		FIRRAMDSPModule_L45F34L53T14_Object(0) <= FIRRAMDSPModule_L47F22T26_Expr;
		FIRRAMDSPModule_L45F34L53T14_Object(16 downto 1) <= Inputs_iRAM_WR_DATA;
		FIRRAMDSPModule_L45F34L53T14_Object(17) <= Inputs_iRAM_RD;
		FIRRAMDSPModule_L45F34L53T14_Object(25 downto 18) <= Inputs_iRAM_RD_ADDR;
		FIRRAMDSPModule_L45F34L53T14_Object(26) <= Inputs_iRAM_WR;
		FIRRAMDSPModule_L45F34L53T14_Object(34 downto 27) <= Inputs_iRAM_WR_ADDR;
		u_ram_WR_ADDR <= FIRRAMDSPModule_L45F34L53T14_Object(34 downto 27);
		u_ram_WR <= FIRRAMDSPModule_L45F34L53T14_Object(26);
		u_ram_RD_ADDR <= FIRRAMDSPModule_L45F34L53T14_Object(25 downto 18);
		u_ram_RD <= FIRRAMDSPModule_L45F34L53T14_Object(17);
		u_ram_DIN <= FIRRAMDSPModule_L45F34L53T14_Object(16 downto 1);
		u_ram_CE <= FIRRAMDSPModule_L45F34L53T14_Object(0);
		FIRRAMDSPModule_L55F34L64T14_Object(29 downto 0) <= Inputs_iDSP_A;
		FIRRAMDSPModule_L60F21T43_Resize(17 downto 16) <= (
			others => '0'
		)
		;
		FIRRAMDSPModule_L60F21T43_Resize(15 downto 0) <= u_ram_DOUT;
		FIRRAMDSPModule_L55F34L64T14_Object(47 downto 30) <= FIRRAMDSPModule_L60F21T43_Resize;
		FIRRAMDSPModule_L55F34L64T14_Object(48) <= Inputs_iDSP_CE;
		FIRRAMDSPModule_L55F34L64T14_Object(73 downto 49) <= Inputs_iDSP_D;
		FIRRAMDSPModule_L55F34L64T14_Object(76 downto 74) <= Inputs_iDSP_OPMODE;
		FIRRAMDSPModule_L55F34L64T14_Object(124 downto 77) <= Inputs_iDSP_PCIN;
		FIRRAMDSPModule_L55F34L64T14_Object(125) <= FIRRAMDSPModule_L58F23T28_Expr;
		u_dsp_RST <= FIRRAMDSPModule_L55F34L64T14_Object(125);
		u_dsp_PCIN <= FIRRAMDSPModule_L55F34L64T14_Object(124 downto 77);
		u_dsp_OPMODE <= FIRRAMDSPModule_L55F34L64T14_Object(76 downto 74);
		u_dsp_D <= FIRRAMDSPModule_L55F34L64T14_Object(73 downto 49);
		u_dsp_CE <= FIRRAMDSPModule_L55F34L64T14_Object(48);
		u_dsp_B <= FIRRAMDSPModule_L55F34L64T14_Object(47 downto 30);
		u_dsp_A <= FIRRAMDSPModule_L55F34L64T14_Object(29 downto 0);
		oDSP_P <= u_dsp_P;
		oDSP_PCOUT <= u_dsp_PCOUT;
		u_dsp_A_u_dsp_A_HardLink <= u_dsp_A;
		u_dsp_B_u_dsp_B_HardLink <= u_dsp_B;
		u_dsp_CE_u_dsp_CE_HardLink <= u_dsp_CE;
		u_dsp_D_u_dsp_D_HardLink <= u_dsp_D;
		u_dsp_OPMODE_u_dsp_OPMODE_HardLink <= u_dsp_OPMODE;
		u_dsp_PCIN_u_dsp_PCIN_HardLink <= u_dsp_PCIN;
		u_dsp_RST_u_dsp_RST_HardLink <= u_dsp_RST;
		u_dsp_P <= u_dsp_P_u_dsp_P_HardLink;
		u_dsp_PCOUT <= u_dsp_PCOUT_u_dsp_PCOUT_HardLink;
		u_ram_CE_u_ram_CE_HardLink <= u_ram_CE;
		u_ram_DIN_u_ram_DIN_HardLink <= u_ram_DIN;
		u_ram_RD_u_ram_RD_HardLink <= u_ram_RD;
		u_ram_RD_ADDR_u_ram_RD_ADDR_HardLink <= u_ram_RD_ADDR;
		u_ram_WR_u_ram_WR_HardLink <= u_ram_WR;
		u_ram_WR_ADDR_u_ram_WR_ADDR_HardLink <= u_ram_WR_ADDR;
		u_ram_DOUT <= u_ram_DOUT_u_ram_DOUT_HardLink;
	end process;
	-- [BEGIN USER ARCHITECTURE]
	-- [END USER ARCHITECTURE]
end architecture;
