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
-- System configuration name is SP_WF_WSTRB_RAMModule_TopLevel, clock frequency is 1Hz, Top-level
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.Quokka.all;

entity SP_WF_WSTRB_RAMModule_TopLevel is
    port
    (
-- [BEGIN USER PORTS]
-- [END USER PORTS]

Clock : in  std_logic;
Reset : in  std_logic;
ReadAddress : in  unsigned(7 downto 0);
WriteAddress : in  unsigned(7 downto 0);
WriteData0 : in  unsigned(7 downto 0);
WriteData1 : in  unsigned(7 downto 0);
WriteData2 : in  unsigned(7 downto 0);
WriteData3 : in  unsigned(7 downto 0);
WE : in  std_logic;
WSTRB : in  unsigned(3 downto 0);
Data : out  unsigned(31 downto 0)
    );
end entity;

-- FSM summary
-- Packages
architecture rtl of SP_WF_WSTRB_RAMModule_TopLevel is
-- [BEGIN USER SIGNALS]
-- [END USER SIGNALS]
constant HiSignal : std_logic := '1';
constant LoSignal : std_logic := '0';
constant Zero : std_logic := '0';
constant One : std_logic := '1';
constant true : std_logic := '1';
constant false : std_logic := '0';
constant SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w : std_logic := '0';
constant SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w : std_logic := '1';
constant SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w : unsigned(1 downto 0)  := "10";
constant SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w : unsigned(1 downto 0)  := "11";
signal Inputs_ReadAddress : unsigned(7 downto 0) := (others => '0');
signal Inputs_WriteAddress : unsigned(7 downto 0) := (others => '0');
signal Inputs_WriteData0 : unsigned(7 downto 0) := (others => '0');
signal Inputs_WriteData1 : unsigned(7 downto 0) := (others => '0');
signal Inputs_WriteData2 : unsigned(7 downto 0) := (others => '0');
signal Inputs_WriteData3 : unsigned(7 downto 0) := (others => '0');
signal Inputs_WE : std_logic := '0';
signal Inputs_WSTRB : unsigned(3 downto 0) := (others => '0');
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index : std_logic := '0';
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index : unsigned(31 downto 0) := (others => '0');
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index : std_logic := '0';
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index : unsigned(31 downto 0) := (others => '0');
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index : std_logic := '0';
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index : unsigned(31 downto 0) := (others => '0');
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index : std_logic := '0';
signal SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index : unsigned(31 downto 0) := (others => '0');
signal State_ReadDataDefault : unsigned(7 downto 0)  := "00000000";
signal State_BuffDefault : unsigned(31 downto 0)  := "00000000000000000000000000000000";
signal SP_WF_WSTRB_RAMModule_L28F36T67_Source : unsigned(31 downto 0) := (others => '0');
type State_ReadDataArray is array(0 to 3) of unsigned(7 downto 0);
signal State_ReadData : State_ReadDataArray := (others => (others => '0'));
type NextState_ReadDataArray is array(0 to 3) of unsigned(7 downto 0);
signal NextState_ReadData : NextState_ReadDataArray := (others => (others => '0'));
type State_BuffArray is array(0 to 255) of unsigned(31 downto 0);
constant State_BuffArrayInit: State_BuffArray:= (
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
type NextState_BuffArray is array(0 to 255) of unsigned(31 downto 0);
signal NextState_Buff : NextState_BuffArray := (others => (others => '0'));
begin
process (Clock, NextState_ReadData, Reset, State_ReadDataDefault)
begin
if rising_edge(Clock) then
if ( Reset = '1' ) then
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
if ( Reset = '1' ) then
for State_Buff_Iterator in 0 to 255 loop
State_Buff(State_Buff_Iterator) <= State_BuffDefault;
end loop;
else
for State_Buff_Iterator in 0 to 255 loop
State_Buff(State_Buff_Iterator) <= NextState_Buff(State_Buff_Iterator);
end loop;
end if;
end if;
end process;
process(Inputs_WE, Inputs_WriteData0, Inputs_WriteData1, Inputs_WriteData2, Inputs_WriteData3, NextState_Buff, SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index, SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index, SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index, SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index, State_Buff, State_ReadData)
begin
for NextState_Buff_Iterator in 0 to 255 loop
NextState_Buff(NextState_Buff_Iterator) <= State_Buff(NextState_Buff_Iterator);
end loop;
for NextState_ReadData_Iterator in 0 to 3 loop
NextState_ReadData(NextState_ReadData_Iterator) <= State_ReadData(NextState_ReadData_Iterator);
end loop;
if ( Inputs_WE = '1' ) then
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = '1' ) then
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index(bit_to_integer(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w)) <= Inputs_WriteData0(bit_to_integer(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w));
end if;
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = '1' ) then
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index(bit_to_integer(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w)) <= Inputs_WriteData1(bit_to_integer(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w));
end if;
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = '1' ) then
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index(TO_INTEGER(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w)) <= Inputs_WriteData2(TO_INTEGER(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w));
end if;
if ( SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index = '1' ) then
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index(TO_INTEGER(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w)) <= Inputs_WriteData3(TO_INTEGER(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w));
end if;
end if;
NextState_ReadData(0) <= unsigned(NextState_Buff(Inputs_ReadAddress)(6 downto -1));
NextState_ReadData(1) <= unsigned(NextState_Buff(Inputs_ReadAddress)(7 downto 0));
NextState_ReadData(2) <= unsigned(NextState_Buff(Inputs_ReadAddress)(8 downto 1));
NextState_ReadData(3) <= unsigned(NextState_Buff(Inputs_ReadAddress)(9 downto 2));
end process;
process(Inputs_WSTRB, NextState_Buff, ReadAddress, SP_WF_WSTRB_RAMModule_L28F36T67_Source, State_ReadData, WE, WriteAddress, WriteData0, WriteData1, WriteData2, WriteData3, WSTRB)
begin
Inputs_ReadAddress <= ReadAddress;
Inputs_WriteAddress <= WriteAddress;
Inputs_WriteData0 <= WriteData0;
Inputs_WriteData1 <= WriteData1;
Inputs_WriteData2 <= WriteData2;
Inputs_WriteData3 <= WriteData3;
Inputs_WE <= WE;
Inputs_WSTRB <= WSTRB;
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index <= Inputs_WSTRB(bit_to_integer(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_w));
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index <= Inputs_WSTRB(bit_to_integer(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_w));
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index <= Inputs_WSTRB(TO_INTEGER(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_w));
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L36F25T40_Index <= Inputs_WSTRB(TO_INTEGER(SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_w));
SP_WF_WSTRB_RAMModule_L28F36T67_Source <= State_ReadData-- logic memory marker;
Data <= SP_WF_WSTRB_RAMModule_L28F36T67_Source;
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_0_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index <= NextState_Buff(TO_INTEGER(UNSIGNED(Inputs_WriteAddress)));
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_1_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index <= NextState_Buff(TO_INTEGER(UNSIGNED(Inputs_WriteAddress)));
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_2_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index <= NextState_Buff(TO_INTEGER(UNSIGNED(Inputs_WriteAddress)));
SP_WF_WSTRB_RAMModule_L31F9L42T10_SP_WF_WSTRB_RAMModule_L33F13L39T14_SP_WF_WSTRB_RAMModule_L34F17L38T18_3_SP_WF_WSTRB_RAMModule_L35F17L38T18_SP_WF_WSTRB_RAMModule_L37F25T60_Index <= NextState_Buff(TO_INTEGER(UNSIGNED(Inputs_WriteAddress)));
end process;
-- [BEGIN USER ARCHITECTURE]
-- [END USER ARCHITECTURE]
end architecture;
