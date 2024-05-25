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
-- System configuration name is FIRStageDSPModule16_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRStageDSPModule16_TopLevel is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		Clock : in std_logic;
		Reset : in std_logic;
		iAccum : in unsigned (32 downto 0);
		iCoeff : in unsigned (15 downto 0);
		iFILO : in unsigned (15 downto 0);
		iInternalFeedbackSelector : in std_logic;
		iIQ : in unsigned (15 downto 0);
		oAccum : out unsigned (32 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRStageDSPModule16_TopLevel is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	-- true is a reserved name, declaration skipped
	-- false is a reserved name, declaration skipped
	signal Inputs_iAccum : unsigned(32 downto 0) := (others => '0');
	signal Inputs_iCoeff : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iFILO : unsigned(15 downto 0) := (others => '0');
	signal Inputs_iInternalFeedbackSelector : std_logic := '0';
	signal Inputs_iIQ : unsigned(15 downto 0) := (others => '0');
begin
	u_dsp48e1 : entity DSP48E1
	generic map
	(
		B_INPUT => "DIRECT",
		USE_DPORT => TRUE,
		USE_MULT => "MULTIPLY",
		AUTORESET_PATDET => "NO_RESET",
		MASK => X"3fffffffffff",
		PATTERN => X"000000000000",
		SEL_MASK => "MASK",
		SEL_PATTERN => "PATTERN",
		USE_PATTERN_DETECT => "NO_PATDET",
		ACASCREG => 2,
		ADREG => 1,
		ALUMODEREG => 0,
		AREG => 2,
		BCASCREG => 1,
		BREG => 1,
		CARRYINREG => 0,
		CARRYINSELREG => 0,
		CREG => 0,
		DREG => 0,
		INMODEREG => 0,
		MREG => 1,
		OPMODEREG => 1,
		PREG => 1,
		USE_SIMD => "ONE48"
	)
	port map
	(
		BCOUT => open,
		CARRYCASCOUT => open,
		MULTSIGNOUT => open,
		PCOUT => PCOUT,
		OVERFLOW => open,
		PATTERNBDETECT => open,
		PATTERNDETECT => open,
		UNDERFLOW => open,
		CARRYOUT => open,
		P => P,
		ACIN => (others =>'0'),
		BCIN => (others =>'0'),
		CARRYCASCIN => '0',
		MULTSIGNIN => '0',
		PCIN => PCIN,
		ALUMODE => (others =>'0'),
		CARRYINSEL => (others =>'0'),
		CEINMODE => CE,
		CLK => CLK,
		INMODE => "10100",
		OPMODE(3 downto 0) => "0101",
		OPMODE(6 downto 4) => OPMODE,
		RSTINMODE => RST,
		A => A,
		B => B,
		C => (others =>'0'),
		CARRYIN => '0',
		D => D,
		CEA1 => CE,
		CEA2 => CE,
		CEAD => CE,
		CEALUMODE => '0',
		CEB1 => CE,
		CEB2 => '0',
		CEC => '0',
		CECARRYIN => '0',
		CECTRL => CE,
		CED => CE,
		CEM => CE,
		CEP => CE,
		RSTA => RST,
		RSTALLCARRYIN => RST,
		RSTALUMODE => RST,
		RSTB => RST,
		RSTC => RST,
		RSTCTRL => RST,
		RSTD => RST,
		RSTM => RST,
		RSTP => RST
	)
	;
end architecture;
