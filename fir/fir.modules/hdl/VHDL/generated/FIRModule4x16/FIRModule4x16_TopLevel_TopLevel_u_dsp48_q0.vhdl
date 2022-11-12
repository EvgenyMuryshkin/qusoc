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
-- System configuration name is FIRModule4x16_TopLevel_TopLevel_u_dsp48_q0, clock frequency is 1Hz, Embedded
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.Quokka.all;
entity FIRModule4x16_TopLevel_TopLevel_u_dsp48_q0 is
	port
	(
		-- [BEGIN USER PORTS]
		-- [END USER PORTS]
		BoardSignals : in BoardSignalsType;
		CE : in std_logic;
		A : in unsigned (29 downto 0);
		B : in unsigned (17 downto 0);
		D : in unsigned (24 downto 0);
		PCIN : in unsigned (47 downto 0);
		OPMODE : in unsigned (2 downto 0);
		PCOUT : out unsigned (47 downto 0);
		P : out unsigned (47 downto 0)
	);
end entity;
-- FSM summary
-- Packages
architecture rtl of FIRModule4x16_TopLevel_TopLevel_u_dsp48_q0 is
	-- [BEGIN USER SIGNALS]
	-- [END USER SIGNALS]
	constant HiSignal : std_logic := '1';
	constant LoSignal : std_logic := '0';
	constant Zero : std_logic := '0';
	constant One : std_logic := '1';
	constant true : std_logic := '1';
	constant false : std_logic := '0';
	signal Inputs_CE : std_logic := '0';
	signal Inputs_A : unsigned(29 downto 0) := (others => '0');
	signal Inputs_B : unsigned(17 downto 0) := (others => '0');
	signal Inputs_D : unsigned(24 downto 0) := (others => '0');
	signal Inputs_PCIN : unsigned(47 downto 0) := (others => '0');
	signal Inputs_OPMODE : unsigned(2 downto 0) := (others => '0');
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
