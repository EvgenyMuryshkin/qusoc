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
-- System configuration name is TypedPipelineModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Quokka.all;

entity TypedPipelineModule_TopLevel is
    port
    (
-- [BEGIN USER PORTS]
-- [END USER PORTS]

Clock : in  std_logic;
Reset : in  std_logic;
inReady : in  std_logic;
inData0 : in  unsigned(7 downto 0);
inData1 : in  unsigned(7 downto 0);
inData2 : in  unsigned(7 downto 0);
inData3 : in  unsigned(7 downto 0);
inData4 : in  unsigned(7 downto 0);
inData5 : in  unsigned(7 downto 0);
inData6 : in  unsigned(7 downto 0);
inData7 : in  unsigned(7 downto 0);
outReady : out  std_logic;
outResult : out  unsigned(15 downto 0)
    );
end entity;

-- FSM summary
-- Packages
architecture rtl of TypedPipelineModule_TopLevel is
-- [BEGIN USER SIGNALS]
-- [END USER SIGNALS]
constant HiSignal : std_logic := '1';
constant LoSignal : std_logic := '0';
constant Zero : std_logic := '0';
constant One : std_logic := '1';
constant true : std_logic := '1';
constant false : std_logic := '0';
constant Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L64F21T23_Expr : unsigned(5 downto 0)  := "101010";
signal Inputs_inReady : std_logic := '0';
signal Inputs_inData0 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData1 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData2 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData3 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData4 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData5 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData6 : unsigned(7 downto 0) := (others => '0');
signal Inputs_inData7 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_stage0_NextState_sums0 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage0_NextState_sums1 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage0_NextState_sums2 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage0_NextState_sums3 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage0_NextState_sums4 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage0_NextState_ready : std_logic := '0';
signal Pipeline_stage1_NextState_s0Sums0 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_s0Sums1 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_s0Sums2 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_s0Sums3 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_s0Sums4 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_sums0 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_sums1 : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage1_NextState_ready : std_logic := '0';
signal Pipeline_stage2_NextState_result : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage2_NextState_ready : std_logic := '0';
signal Pipeline_Inputs_inReady : std_logic := '0';
signal Pipeline_Inputs_inData0 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData1 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData2 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData3 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData4 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData5 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData6 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_Inputs_inData7 : unsigned(7 downto 0) := (others => '0');
signal Pipeline_State_result : unsigned(15 downto 0) := (others => '0');
signal Pipeline_State_ready : std_logic := '0';
signal Pipeline_NextState_result : unsigned(15 downto 0) := (others => '0');
signal Pipeline_NextState_ready : std_logic := '0';
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_sum0 : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F24T69_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F21T66_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F21T66_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F21T66_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F21T62_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F21T62_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F26T86_Cast : unsigned(15 downto 0) := (others => '0');
signal Pipeline_stage0_State_sums0 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage0_State_sums0Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage0_State_sums1 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage0_State_sums1Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage0_State_sums2 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage0_State_sums2Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage0_State_sums3 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage0_State_sums3Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage0_State_sums4 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage0_State_sums4Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage0_State_ready : std_logic := '0';
constant Pipeline_stage0_State_readyDefault : std_logic := '0';
signal Pipeline_stage1_State_s0Sums0 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_s0Sums0Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_s0Sums1 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_s0Sums1Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_s0Sums2 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_s0Sums2Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_s0Sums3 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_s0Sums3Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_s0Sums4 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_s0Sums4Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_sums0 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_sums0Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_sums1 : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage1_State_sums1Default : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage1_State_ready : std_logic := '0';
constant Pipeline_stage1_State_readyDefault : std_logic := '0';
signal Pipeline_stage2_State_result : unsigned(15 downto 0)  := "0000000000000000";
constant Pipeline_stage2_State_resultDefault : unsigned(15 downto 0)  := "0000000000000000";
signal Pipeline_stage2_State_ready : std_logic := '0';
constant Pipeline_stage2_State_readyDefault : std_logic := '0';
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr : unsigned(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_1 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_2 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr : unsigned(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_1 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_2 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr : unsigned(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_1 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_2 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr : unsigned(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_1 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_2 : signed(9 downto 0)  := "0000000000";
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr : unsigned(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_1 : signed(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_2 : signed(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr : unsigned(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_1 : signed(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_2 : signed(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr : unsigned(19 downto 0)  := "00000000000000000000";
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_1 : signed(19 downto 0)  := "00000000000000000000";
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_2 : signed(19 downto 0)  := "00000000000000000000";
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr : unsigned(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_1 : signed(17 downto 0)  := "000000000000000000";
signal Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_2 : signed(17 downto 0)  := "000000000000000000";
begin
process (Clock, Pipeline_stage0_NextState_ready, Pipeline_stage0_NextState_sums0, Pipeline_stage0_NextState_sums1, Pipeline_stage0_NextState_sums2, Pipeline_stage0_NextState_sums3, Pipeline_stage0_NextState_sums4, Pipeline_stage1_NextState_ready, Pipeline_stage1_NextState_s0Sums0, Pipeline_stage1_NextState_s0Sums1, Pipeline_stage1_NextState_s0Sums2, Pipeline_stage1_NextState_s0Sums3, Pipeline_stage1_NextState_s0Sums4, Pipeline_stage1_NextState_sums0, Pipeline_stage1_NextState_sums1, Pipeline_stage2_NextState_ready, Pipeline_stage2_NextState_result, Reset)
begin
if rising_edge(Clock) then
if ( Reset = '1' ) then
Pipeline_stage0_State_sums0 <= Pipeline_stage0_State_sums0Default;
Pipeline_stage0_State_sums1 <= Pipeline_stage0_State_sums1Default;
Pipeline_stage0_State_sums2 <= Pipeline_stage0_State_sums2Default;
Pipeline_stage0_State_sums3 <= Pipeline_stage0_State_sums3Default;
Pipeline_stage0_State_sums4 <= Pipeline_stage0_State_sums4Default;
Pipeline_stage0_State_ready <= Pipeline_stage0_State_readyDefault;
Pipeline_stage1_State_s0Sums0 <= Pipeline_stage1_State_s0Sums0Default;
Pipeline_stage1_State_s0Sums1 <= Pipeline_stage1_State_s0Sums1Default;
Pipeline_stage1_State_s0Sums2 <= Pipeline_stage1_State_s0Sums2Default;
Pipeline_stage1_State_s0Sums3 <= Pipeline_stage1_State_s0Sums3Default;
Pipeline_stage1_State_s0Sums4 <= Pipeline_stage1_State_s0Sums4Default;
Pipeline_stage1_State_sums0 <= Pipeline_stage1_State_sums0Default;
Pipeline_stage1_State_sums1 <= Pipeline_stage1_State_sums1Default;
Pipeline_stage1_State_ready <= Pipeline_stage1_State_readyDefault;
Pipeline_stage2_State_result <= Pipeline_stage2_State_resultDefault;
Pipeline_stage2_State_ready <= Pipeline_stage2_State_readyDefault;
else
Pipeline_stage0_State_sums0 <= Pipeline_stage0_NextState_sums0;
Pipeline_stage0_State_sums1 <= Pipeline_stage0_NextState_sums1;
Pipeline_stage0_State_sums2 <= Pipeline_stage0_NextState_sums2;
Pipeline_stage0_State_sums3 <= Pipeline_stage0_NextState_sums3;
Pipeline_stage0_State_sums4 <= Pipeline_stage0_NextState_sums4;
Pipeline_stage0_State_ready <= Pipeline_stage0_NextState_ready;
Pipeline_stage1_State_s0Sums0 <= Pipeline_stage1_NextState_s0Sums0;
Pipeline_stage1_State_s0Sums1 <= Pipeline_stage1_NextState_s0Sums1;
Pipeline_stage1_State_s0Sums2 <= Pipeline_stage1_NextState_s0Sums2;
Pipeline_stage1_State_s0Sums3 <= Pipeline_stage1_NextState_s0Sums3;
Pipeline_stage1_State_s0Sums4 <= Pipeline_stage1_NextState_s0Sums4;
Pipeline_stage1_State_sums0 <= Pipeline_stage1_NextState_sums0;
Pipeline_stage1_State_sums1 <= Pipeline_stage1_NextState_sums1;
Pipeline_stage1_State_ready <= Pipeline_stage1_NextState_ready;
Pipeline_stage2_State_result <= Pipeline_stage2_NextState_result;
Pipeline_stage2_State_ready <= Pipeline_stage2_NextState_ready;
end if;
end if;
end process;

process(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_2)
begin
    Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_2, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_2)
begin
    Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_2, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_2)
begin
    Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_2, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_2)
begin
    Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_1, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_2, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_1, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_2)
begin
    Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_1, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_2, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_1, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_2)
begin
    Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_1, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_2, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_1, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_2)
begin
    Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_1, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_2, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr'length);

end process;

process(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_1, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_2)
begin
    Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr <= resize(unsigned(signed(resize(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_1, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_1'length + 1)) + signed(resize(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_2, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_2'length + 1))), Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr'length);

end process;
process(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F24T69_Cast)
begin
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_sum0 <= Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F24T69_Cast;
end process;
process(Pipeline_Inputs_inReady, Pipeline_stage0_State_ready, Pipeline_stage0_State_sums0, Pipeline_stage0_State_sums1, Pipeline_stage0_State_sums2, Pipeline_stage0_State_sums3, Pipeline_stage0_State_sums4, Pipeline_stage1_State_ready, Pipeline_stage1_State_s0Sums0, Pipeline_stage1_State_s0Sums1, Pipeline_stage1_State_s0Sums2, Pipeline_stage1_State_s0Sums3, Pipeline_stage1_State_s0Sums4, Pipeline_stage1_State_sums0, Pipeline_stage1_State_sums1, Pipeline_stage2_State_ready, Pipeline_stage2_State_result, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_sum0, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F21T66_Cast, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F21T66_Cast, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F21T66_Cast, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F21T62_Cast, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F21T62_Cast, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F26T86_Cast)
begin
Pipeline_stage0_NextState_sums0 <= Pipeline_stage0_State_sums0;
Pipeline_stage0_NextState_sums1 <= Pipeline_stage0_State_sums1;
Pipeline_stage0_NextState_sums2 <= Pipeline_stage0_State_sums2;
Pipeline_stage0_NextState_sums3 <= Pipeline_stage0_State_sums3;
Pipeline_stage0_NextState_sums4 <= Pipeline_stage0_State_sums4;
Pipeline_stage0_NextState_ready <= Pipeline_stage0_State_ready;
Pipeline_stage1_NextState_s0Sums0 <= Pipeline_stage1_State_s0Sums0;
Pipeline_stage1_NextState_s0Sums1 <= Pipeline_stage1_State_s0Sums1;
Pipeline_stage1_NextState_s0Sums2 <= Pipeline_stage1_State_s0Sums2;
Pipeline_stage1_NextState_s0Sums3 <= Pipeline_stage1_State_s0Sums3;
Pipeline_stage1_NextState_s0Sums4 <= Pipeline_stage1_State_s0Sums4;
Pipeline_stage1_NextState_sums0 <= Pipeline_stage1_State_sums0;
Pipeline_stage1_NextState_sums1 <= Pipeline_stage1_State_sums1;
Pipeline_stage1_NextState_ready <= Pipeline_stage1_State_ready;
Pipeline_stage2_NextState_result <= Pipeline_stage2_State_result;
Pipeline_stage2_NextState_ready <= Pipeline_stage2_State_ready;
Pipeline_stage0_NextState_sums0 <= Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_sum0;
Pipeline_stage0_NextState_sums1 <= Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F21T66_Cast;
Pipeline_stage0_NextState_sums2 <= Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F21T66_Cast;
Pipeline_stage0_NextState_sums3 <= Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F21T66_Cast;
Pipeline_stage0_NextState_sums4 <= unsigned(resize(unsigned(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L64F21T23_Expr), Pipeline_stage0_NextState_sums4'length));
Pipeline_stage1_NextState_s0Sums0 <= Pipeline_stage0_State_sums0;
Pipeline_stage1_NextState_s0Sums1 <= Pipeline_stage0_State_sums1;
Pipeline_stage1_NextState_s0Sums2 <= Pipeline_stage0_State_sums2;
Pipeline_stage1_NextState_s0Sums3 <= Pipeline_stage0_State_sums3;
Pipeline_stage1_NextState_s0Sums4 <= Pipeline_stage0_State_sums4;
Pipeline_stage1_NextState_sums0 <= Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F21T62_Cast;
Pipeline_stage1_NextState_sums1 <= Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F21T62_Cast;
Pipeline_stage0_NextState_ready <= Pipeline_Inputs_inReady;
Pipeline_stage1_NextState_ready <= Pipeline_stage0_State_ready;
Pipeline_stage2_NextState_result <= Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F26T86_Cast;
Pipeline_stage2_NextState_ready <= Pipeline_stage1_State_ready;
end process;
process(inData0, inData1, inData2, inData3, inData4, inData5, inData6, inData7, Inputs_inData0, Inputs_inData1, Inputs_inData2, Inputs_inData3, Inputs_inData4, Inputs_inData5, Inputs_inData6, Inputs_inData7, Inputs_inReady, inReady, Pipeline_Inputs_inData0, Pipeline_Inputs_inData1, Pipeline_Inputs_inData2, Pipeline_Inputs_inData3, Pipeline_Inputs_inData4, Pipeline_Inputs_inData5, Pipeline_Inputs_inData6, Pipeline_Inputs_inData7, Pipeline_stage0_State_sums0, Pipeline_stage0_State_sums1, Pipeline_stage0_State_sums2, Pipeline_stage0_State_sums3, Pipeline_stage1_State_s0Sums4, Pipeline_stage1_State_sums0, Pipeline_stage2_NextState_ready, Pipeline_stage2_NextState_result, Pipeline_stage2_State_ready, Pipeline_stage2_State_result, Pipeline_State_ready, Pipeline_State_result, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr, Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr, Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr, Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr)
begin
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_1 <= signed(resize(unsigned(Pipeline_Inputs_inData0), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_1'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_2 <= signed(resize(unsigned(Pipeline_Inputs_inData1), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr_2'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_1 <= signed(resize(unsigned(Pipeline_Inputs_inData2), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_1'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_2 <= signed(resize(unsigned(Pipeline_Inputs_inData3), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr_2'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_1 <= signed(resize(unsigned(Pipeline_Inputs_inData4), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_1'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_2 <= signed(resize(unsigned(Pipeline_Inputs_inData5), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr_2'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_1 <= signed(resize(unsigned(Pipeline_Inputs_inData6), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_1'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_2 <= signed(resize(unsigned(Pipeline_Inputs_inData7), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr_2'length));
Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_1 <= signed(resize(unsigned(Pipeline_stage0_State_sums0), Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_1'length));
Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_2 <= signed(resize(unsigned(Pipeline_stage0_State_sums1), Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr_2'length));
Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_1 <= signed(resize(unsigned(Pipeline_stage0_State_sums2), Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_1'length));
Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_2 <= signed(resize(unsigned(Pipeline_stage0_State_sums3), Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr_2'length));
Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_1 <= signed(resize(unsigned(Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr), Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_1'length));
Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_2 <= signed(resize(unsigned(Pipeline_stage1_State_s0Sums4), Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr_2'length));
Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_1 <= signed(resize(unsigned(Pipeline_stage1_State_sums0), Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_1'length));
Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_2 <= signed(resize(unsigned(Pipeline_stage1_State_sums0), Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T66_Expr_2'length));
Inputs_inReady <= inReady;
Inputs_inData0 <= inData0;
Inputs_inData1 <= inData1;
Inputs_inData2 <= inData2;
Inputs_inData3 <= inData3;
Inputs_inData4 <= inData4;
Inputs_inData5 <= inData5;
Inputs_inData6 <= inData6;
Inputs_inData7 <= inData7;
Pipeline_State_result <= Pipeline_stage2_State_result;
Pipeline_State_ready <= Pipeline_stage2_State_ready;
Pipeline_NextState_result <= Pipeline_stage2_NextState_result;
Pipeline_NextState_ready <= Pipeline_stage2_NextState_ready;
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F24T69_Cast <= unsigned(resize(unsigned(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F33T68_Expr), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L54F24T69_Cast'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F21T66_Cast <= unsigned(resize(unsigned(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F30T65_Expr), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L61F21T66_Cast'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F21T66_Cast <= unsigned(resize(unsigned(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F30T65_Expr), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L62F21T66_Cast'length));
Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F21T66_Cast <= unsigned(resize(unsigned(Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F30T65_Expr), Pipeline_TypedPipelineModule_L86F29T43_TypedPipelineModule_L53F9L67T10_TypedPipelineModule_L63F21T66_Cast'length));
Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F21T62_Cast <= Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L77F30T61_Expr(15 downto 0);
Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F21T62_Cast <= Pipeline_TypedPipelineModule_L87F30T45_TypedPipelineModule_L70F9L81T10_TypedPipelineModule_L78F30T61_Expr(15 downto 0);
Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F26T86_Cast <= Pipeline_TypedPipelineModule_L88F30T70_TypedPipelineModule_L31F9L37T10_TypedPipelineModule_L35F35T85_Expr(15 downto 0);
outReady <= Pipeline_State_ready;
outResult <= Pipeline_State_result;
Pipeline_Inputs_inReady <= Inputs_inReady;
Pipeline_Inputs_inData0 <= Inputs_inData0;
Pipeline_Inputs_inData1 <= Inputs_inData1;
Pipeline_Inputs_inData2 <= Inputs_inData2;
Pipeline_Inputs_inData3 <= Inputs_inData3;
Pipeline_Inputs_inData4 <= Inputs_inData4;
Pipeline_Inputs_inData5 <= Inputs_inData5;
Pipeline_Inputs_inData6 <= Inputs_inData6;
Pipeline_Inputs_inData7 <= Inputs_inData7;
end process;
-- [BEGIN USER ARCHITECTURE]
-- [END USER ARCHITECTURE]
end architecture;
