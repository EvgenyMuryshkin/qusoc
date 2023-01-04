----------------------------------------------------------------------------------------------------------------------------------
-- Author : Vitaly Lotnik
-- Name : pkg_demodulators_types
-- Created : 24/10/2019
-- v. 3.1.3
----------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------
-- libraries
----------------------------------------------------------------------------------------------------------------------------------
library ieee;
    use ieee.std_logic_1164.all;
    use ieee.numeric_std.all;

----------------------------------------------------------------------------------------------------------------------------------
--package declaration
----------------------------------------------------------------------------------------------------------------------------------
package pkg_demodulators_types is
----------------------------------------------------------------------------------------------------------------------------------
-- constants declaration
----------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------
-- components declaration
----------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------
-- types declaration
----------------------------------------------------------------------------------------------------------------------------------
-- t_iq records
--    type t_iq%x% is record
--        i,
--        q
--            : std_logic_vector(x - 1 downto 0);
--    end record;
    type t_iq1 is record i, q : std_logic_vector(0 downto 0); end record;
    type t_iq1array is array (natural range <>) of t_iq1;
    type t_iq2 is record i, q : std_logic_vector(1 downto 0); end record;
    type t_iq2array is array (natural range <>) of t_iq2;
    type t_iq3 is record i, q : std_logic_vector(2 downto 0); end record;
    type t_iq3array is array (natural range <>) of t_iq3;
    type t_iq4 is record i, q : std_logic_vector(3 downto 0); end record;
    type t_iq4array is array (natural range <>) of t_iq4;
    type t_iq5 is record i, q : std_logic_vector(4 downto 0); end record;
    type t_iq5array is array (natural range <>) of t_iq5;
    type t_iq6 is record i, q : std_logic_vector(5 downto 0); end record;
    type t_iq6array is array (natural range <>) of t_iq6;
    type t_iq7 is record i, q : std_logic_vector(6 downto 0); end record;
    type t_iq7array is array (natural range <>) of t_iq7;
    type t_iq8 is record i, q : std_logic_vector(7 downto 0); end record;
    type t_iq8array is array (natural range <>) of t_iq8;
    type t_iq9 is record i, q : std_logic_vector(8 downto 0); end record;
    type t_iq9array is array (natural range <>) of t_iq9;
    type t_iq10 is record i, q : std_logic_vector(9 downto 0); end record;
    type t_iq10array is array (natural range <>) of t_iq10;
    type t_iq11 is record i, q : std_logic_vector(10 downto 0); end record;
    type t_iq11array is array (natural range <>) of t_iq11;
    type t_iq12 is record i, q : std_logic_vector(11 downto 0); end record;
    type t_iq12array is array (natural range <>) of t_iq12;
    type t_iq13 is record i, q : std_logic_vector(12 downto 0); end record;
    type t_iq13array is array (natural range <>) of t_iq13;
    type t_iq14 is record i, q : std_logic_vector(13 downto 0); end record;
    type t_iq14array is array (natural range <>) of t_iq14;
    type t_iq15 is record i, q : std_logic_vector(14 downto 0); end record;
    type t_iq15array is array (natural range <>) of t_iq15;
    type t_iq16 is record i, q : std_logic_vector(15 downto 0); end record;
    type t_iq16array is array (natural range <>) of t_iq16;
    type t_iq17 is record i, q : std_logic_vector(16 downto 0); end record;
    type t_iq17array is array (natural range <>) of t_iq17;
    type t_iq18 is record i, q : std_logic_vector(17 downto 0); end record;
    type t_iq18array is array (natural range <>) of t_iq18;
    type t_iq19 is record i, q : std_logic_vector(18 downto 0); end record;
    type t_iq19array is array (natural range <>) of t_iq19;
    type t_iq20 is record i, q : std_logic_vector(19 downto 0); end record;
    type t_iq20array is array (natural range <>) of t_iq20;
    type t_iq21 is record i, q : std_logic_vector(20 downto 0); end record;
    type t_iq21array is array (natural range <>) of t_iq21;
    type t_iq22 is record i, q : std_logic_vector(21 downto 0); end record;
    type t_iq22array is array (natural range <>) of t_iq22;
    type t_iq23 is record i, q : std_logic_vector(22 downto 0); end record;
    type t_iq23array is array (natural range <>) of t_iq23;
    type t_iq24 is record i, q : std_logic_vector(23 downto 0); end record;
    type t_iq24array is array (natural range <>) of t_iq24;
    type t_iq25 is record i, q : std_logic_vector(24 downto 0); end record;
    type t_iq25array is array (natural range <>) of t_iq25;
    type t_iq26 is record i, q : std_logic_vector(25 downto 0); end record;
    type t_iq26array is array (natural range <>) of t_iq26;
    type t_iq27 is record i, q : std_logic_vector(26 downto 0); end record;
    type t_iq27array is array (natural range <>) of t_iq27;
    type t_iq28 is record i, q : std_logic_vector(27 downto 0); end record;
    type t_iq28array is array (natural range <>) of t_iq28;
    type t_iq29 is record i, q : std_logic_vector(28 downto 0); end record;
    type t_iq29array is array (natural range <>) of t_iq29;
    type t_iq30 is record i, q : std_logic_vector(29 downto 0); end record;
    type t_iq30array is array (natural range <>) of t_iq30;
    type t_iq31 is record i, q : std_logic_vector(30 downto 0); end record;
    type t_iq31array is array (natural range <>) of t_iq31;
    type t_iq32 is record i, q : std_logic_vector(31 downto 0); end record;
    type t_iq32array is array (natural range <>) of t_iq32;
    type t_iq33 is record i, q : std_logic_vector(32 downto 0); end record;
    type t_iq33array is array (natural range <>) of t_iq33;
    type t_iq34 is record i, q : std_logic_vector(33 downto 0); end record;
    type t_iq34array is array (natural range <>) of t_iq34;
    type t_iq35 is record i, q : std_logic_vector(34 downto 0); end record;
    type t_iq35array is array (natural range <>) of t_iq35;
    type t_iq36 is record i, q : std_logic_vector(35 downto 0); end record;
    type t_iq36array is array (natural range <>) of t_iq36;
    type t_iq37 is record i, q : std_logic_vector(36 downto 0); end record;
    type t_iq37array is array (natural range <>) of t_iq37;
    type t_iq38 is record i, q : std_logic_vector(37 downto 0); end record;
    type t_iq38array is array (natural range <>) of t_iq38;
    type t_iq39 is record i, q : std_logic_vector(38 downto 0); end record;
    type t_iq39array is array (natural range <>) of t_iq39;
    type t_iq40 is record i, q : std_logic_vector(39 downto 0); end record;
    type t_iq40array is array (natural range <>) of t_iq40;
    type t_iq41 is record i, q : std_logic_vector(40 downto 0); end record;
    type t_iq41array is array (natural range <>) of t_iq41;
    type t_iq42 is record i, q : std_logic_vector(41 downto 0); end record;
    type t_iq42array is array (natural range <>) of t_iq42;
    type t_iq43 is record i, q : std_logic_vector(42 downto 0); end record;
    type t_iq43array is array (natural range <>) of t_iq43;
    type t_iq44 is record i, q : std_logic_vector(43 downto 0); end record;
    type t_iq44array is array (natural range <>) of t_iq44;
    type t_iq45 is record i, q : std_logic_vector(44 downto 0); end record;
    type t_iq45array is array (natural range <>) of t_iq45;
    type t_iq46 is record i, q : std_logic_vector(45 downto 0); end record;
    type t_iq46array is array (natural range <>) of t_iq46;
    type t_iq47 is record i, q : std_logic_vector(46 downto 0); end record;
    type t_iq47array is array (natural range <>) of t_iq47;
    type t_iq48 is record i, q : std_logic_vector(47 downto 0); end record;
    type t_iq48array is array (natural range <>) of t_iq48;
    type t_iq49 is record i, q : std_logic_vector(48 downto 0); end record;
    type t_iq49array is array (natural range <>) of t_iq49;
    type t_iq50 is record i, q : std_logic_vector(49 downto 0); end record;
    type t_iq50array is array (natural range <>) of t_iq50;
    type t_iq51 is record i, q : std_logic_vector(50 downto 0); end record;
    type t_iq51array is array (natural range <>) of t_iq51;
    type t_iq52 is record i, q : std_logic_vector(51 downto 0); end record;
    type t_iq52array is array (natural range <>) of t_iq52;
    type t_iq53 is record i, q : std_logic_vector(52 downto 0); end record;
    type t_iq53array is array (natural range <>) of t_iq53;
    type t_iq54 is record i, q : std_logic_vector(53 downto 0); end record;
    type t_iq54array is array (natural range <>) of t_iq54;
    type t_iq55 is record i, q : std_logic_vector(54 downto 0); end record;
    type t_iq55array is array (natural range <>) of t_iq55;
    type t_iq56 is record i, q : std_logic_vector(55 downto 0); end record;
    type t_iq56array is array (natural range <>) of t_iq56;
    type t_iq57 is record i, q : std_logic_vector(56 downto 0); end record;
    type t_iq57array is array (natural range <>) of t_iq57;
    type t_iq58 is record i, q : std_logic_vector(57 downto 0); end record;
    type t_iq58array is array (natural range <>) of t_iq58;
    type t_iq59 is record i, q : std_logic_vector(58 downto 0); end record;
    type t_iq59array is array (natural range <>) of t_iq59;
    type t_iq60 is record i, q : std_logic_vector(59 downto 0); end record;
    type t_iq60array is array (natural range <>) of t_iq60;
    type t_iq61 is record i, q : std_logic_vector(60 downto 0); end record;
    type t_iq61array is array (natural range <>) of t_iq61;
    type t_iq62 is record i, q : std_logic_vector(61 downto 0); end record;
    type t_iq62array is array (natural range <>) of t_iq62;
    type t_iq63 is record i, q : std_logic_vector(62 downto 0); end record;
    type t_iq63array is array (natural range <>) of t_iq63;
    type t_iq64 is record i, q : std_logic_vector(63 downto 0); end record;
    type t_iq64array is array (natural range <>) of t_iq64;
    type t_iq128 is record i, q : std_logic_vector(127 downto 0); end record;
    type t_iq128array is array (natural range <>) of t_iq128;

    function f_slv24_to_iq12(din : in std_logic_vector(23 downto 0); swap : in boolean := false) return t_iq12;
    function f_iq12_to_slv24(din : in t_iq12; swap : in boolean := false) return std_logic_vector;
    function f_slv32_to_iq16(din : in std_logic_vector(31 downto 0); swap : in boolean := false) return t_iq16;
    function f_iq16_to_slv32(din : in t_iq16; swap : in boolean := false) return std_logic_vector;

-- t_iq records
--    type t_siq%x% is record
--        i,
--        q
--            : signed(x - 1 downto 0);
--    end record;

    type t_siq1 is record i, q : signed(0 downto 0); end record;
    type t_siq1array is array (natural range <>) of t_siq1;
    type t_siq2 is record i, q : signed(1 downto 0); end record;
    type t_siq2array is array (natural range <>) of t_siq2;
    type t_siq3 is record i, q : signed(2 downto 0); end record;
    type t_siq3array is array (natural range <>) of t_siq3;
    type t_siq4 is record i, q : signed(3 downto 0); end record;
    type t_siq4array is array (natural range <>) of t_siq4;
    type t_siq5 is record i, q : signed(4 downto 0); end record;
    type t_siq5array is array (natural range <>) of t_siq5;
    type t_siq6 is record i, q : signed(5 downto 0); end record;
    type t_siq6array is array (natural range <>) of t_siq6;
    type t_siq7 is record i, q : signed(6 downto 0); end record;
    type t_siq7array is array (natural range <>) of t_siq7;
    type t_siq8 is record i, q : signed(7 downto 0); end record;
    type t_siq8array is array (natural range <>) of t_siq8;
    type t_siq9 is record i, q : signed(8 downto 0); end record;
    type t_siq9array is array (natural range <>) of t_siq9;
    type t_siq10 is record i, q : signed(9 downto 0); end record;
    type t_siq10array is array (natural range <>) of t_siq10;
    type t_siq11 is record i, q : signed(10 downto 0); end record;
    type t_siq11array is array (natural range <>) of t_siq11;
    type t_siq12 is record i, q : signed(11 downto 0); end record;
    type t_siq12array is array (natural range <>) of t_siq12;
    type t_siq13 is record i, q : signed(12 downto 0); end record;
    type t_siq13array is array (natural range <>) of t_siq13;
    type t_siq14 is record i, q : signed(13 downto 0); end record;
    type t_siq14array is array (natural range <>) of t_siq14;
    type t_siq15 is record i, q : signed(14 downto 0); end record;
    type t_siq15array is array (natural range <>) of t_siq15;
    type t_siq16 is record i, q : signed(15 downto 0); end record;
    type t_siq16array is array (natural range <>) of t_siq16;
    type t_siq17 is record i, q : signed(16 downto 0); end record;
    type t_siq17array is array (natural range <>) of t_siq17;
    type t_siq18 is record i, q : signed(17 downto 0); end record;
    type t_siq18array is array (natural range <>) of t_siq18;
    type t_siq19 is record i, q : signed(18 downto 0); end record;
    type t_siq19array is array (natural range <>) of t_siq19;
    type t_siq20 is record i, q : signed(19 downto 0); end record;
    type t_siq20array is array (natural range <>) of t_siq20;
    type t_siq21 is record i, q : signed(20 downto 0); end record;
    type t_siq21array is array (natural range <>) of t_siq21;
    type t_siq22 is record i, q : signed(21 downto 0); end record;
    type t_siq22array is array (natural range <>) of t_siq22;
    type t_siq23 is record i, q : signed(22 downto 0); end record;
    type t_siq23array is array (natural range <>) of t_siq23;
    type t_siq24 is record i, q : signed(23 downto 0); end record;
    type t_siq24array is array (natural range <>) of t_siq24;
    type t_siq25 is record i, q : signed(24 downto 0); end record;
    type t_siq25array is array (natural range <>) of t_siq25;
    type t_siq26 is record i, q : signed(25 downto 0); end record;
    type t_siq26array is array (natural range <>) of t_siq26;
    type t_siq27 is record i, q : signed(26 downto 0); end record;
    type t_siq27array is array (natural range <>) of t_siq27;
    type t_siq28 is record i, q : signed(27 downto 0); end record;
    type t_siq28array is array (natural range <>) of t_siq28;
    type t_siq29 is record i, q : signed(28 downto 0); end record;
    type t_siq29array is array (natural range <>) of t_siq29;
    type t_siq30 is record i, q : signed(29 downto 0); end record;
    type t_siq30array is array (natural range <>) of t_siq30;
    type t_siq31 is record i, q : signed(30 downto 0); end record;
    type t_siq31array is array (natural range <>) of t_siq31;
    type t_siq32 is record i, q : signed(31 downto 0); end record;
    type t_siq32array is array (natural range <>) of t_siq32;
    type t_siq33 is record i, q : signed(32 downto 0); end record;
    type t_siq33array is array (natural range <>) of t_siq33;
    type t_siq34 is record i, q : signed(33 downto 0); end record;
    type t_siq34array is array (natural range <>) of t_siq34;
    type t_siq35 is record i, q : signed(34 downto 0); end record;
    type t_siq35array is array (natural range <>) of t_siq35;
    type t_siq36 is record i, q : signed(35 downto 0); end record;
    type t_siq36array is array (natural range <>) of t_siq36;
    type t_siq37 is record i, q : signed(36 downto 0); end record;
    type t_siq37array is array (natural range <>) of t_siq37;
    type t_siq38 is record i, q : signed(37 downto 0); end record;
    type t_siq38array is array (natural range <>) of t_siq38;
    type t_siq39 is record i, q : signed(38 downto 0); end record;
    type t_siq39array is array (natural range <>) of t_siq39;
    type t_siq40 is record i, q : signed(39 downto 0); end record;
    type t_siq40array is array (natural range <>) of t_siq40;
    type t_siq41 is record i, q : signed(40 downto 0); end record;
    type t_siq41array is array (natural range <>) of t_siq41;
    type t_siq42 is record i, q : signed(41 downto 0); end record;
    type t_siq42array is array (natural range <>) of t_siq42;
    type t_siq43 is record i, q : signed(42 downto 0); end record;
    type t_siq43array is array (natural range <>) of t_siq43;
    type t_siq44 is record i, q : signed(43 downto 0); end record;
    type t_siq44array is array (natural range <>) of t_siq44;
    type t_siq45 is record i, q : signed(44 downto 0); end record;
    type t_siq45array is array (natural range <>) of t_siq45;
    type t_siq46 is record i, q : signed(45 downto 0); end record;
    type t_siq46array is array (natural range <>) of t_siq46;
    type t_siq47 is record i, q : signed(46 downto 0); end record;
    type t_siq47array is array (natural range <>) of t_siq47;
    type t_siq48 is record i, q : signed(47 downto 0); end record;
    type t_siq48array is array (natural range <>) of t_siq48;
    type t_siq49 is record i, q : signed(48 downto 0); end record;
    type t_siq49array is array (natural range <>) of t_siq49;
    type t_siq50 is record i, q : signed(49 downto 0); end record;
    type t_siq50array is array (natural range <>) of t_siq50;
    type t_siq51 is record i, q : signed(50 downto 0); end record;
    type t_siq51array is array (natural range <>) of t_siq51;
    type t_siq52 is record i, q : signed(51 downto 0); end record;
    type t_siq52array is array (natural range <>) of t_siq52;
    type t_siq53 is record i, q : signed(52 downto 0); end record;
    type t_siq53array is array (natural range <>) of t_siq53;
    type t_siq54 is record i, q : signed(53 downto 0); end record;
    type t_siq54array is array (natural range <>) of t_siq54;
    type t_siq55 is record i, q : signed(54 downto 0); end record;
    type t_siq55array is array (natural range <>) of t_siq55;
    type t_siq56 is record i, q : signed(55 downto 0); end record;
    type t_siq56array is array (natural range <>) of t_siq56;
    type t_siq57 is record i, q : signed(56 downto 0); end record;
    type t_siq57array is array (natural range <>) of t_siq57;
    type t_siq58 is record i, q : signed(57 downto 0); end record;
    type t_siq58array is array (natural range <>) of t_siq58;
    type t_siq59 is record i, q : signed(58 downto 0); end record;
    type t_siq59array is array (natural range <>) of t_siq59;
    type t_siq60 is record i, q : signed(59 downto 0); end record;
    type t_siq60array is array (natural range <>) of t_siq60;
    type t_siq61 is record i, q : signed(60 downto 0); end record;
    type t_siq61array is array (natural range <>) of t_siq61;
    type t_siq62 is record i, q : signed(61 downto 0); end record;
    type t_siq62array is array (natural range <>) of t_siq62;
    type t_siq63 is record i, q : signed(62 downto 0); end record;
    type t_siq63array is array (natural range <>) of t_siq63;
    type t_siq64 is record i, q : signed(63 downto 0); end record;
    type t_siq64array is array (natural range <>) of t_siq64;

    type t_usiq1 is record i, q : unsigned(0 downto 0); end record;
    type t_usiq1array is array (natural range <>) of t_usiq1;
    type t_usiq2 is record i, q : unsigned(1 downto 0); end record;
    type t_usiq2array is array (natural range <>) of t_usiq2;
    type t_usiq3 is record i, q : unsigned(2 downto 0); end record;
    type t_usiq3array is array (natural range <>) of t_usiq3;
    type t_usiq4 is record i, q : unsigned(3 downto 0); end record;
    type t_usiq4array is array (natural range <>) of t_usiq4;
    type t_usiq5 is record i, q : unsigned(4 downto 0); end record;
    type t_usiq5array is array (natural range <>) of t_usiq5;
    type t_usiq6 is record i, q : unsigned(5 downto 0); end record;
    type t_usiq6array is array (natural range <>) of t_usiq6;
    type t_usiq7 is record i, q : unsigned(6 downto 0); end record;
    type t_usiq7array is array (natural range <>) of t_usiq7;
    type t_usiq8 is record i, q : unsigned(7 downto 0); end record;
    type t_usiq8array is array (natural range <>) of t_usiq8;
    type t_usiq9 is record i, q : unsigned(8 downto 0); end record;
    type t_usiq9array is array (natural range <>) of t_usiq9;
    type t_usiq10 is record i, q : unsigned(9 downto 0); end record;
    type t_usiq10array is array (natural range <>) of t_usiq10;
    type t_usiq11 is record i, q : unsigned(10 downto 0); end record;
    type t_usiq11array is array (natural range <>) of t_usiq11;
    type t_usiq12 is record i, q : unsigned(11 downto 0); end record;
    type t_usiq12array is array (natural range <>) of t_usiq12;
    type t_usiq13 is record i, q : unsigned(12 downto 0); end record;
    type t_usiq13array is array (natural range <>) of t_usiq13;
    type t_usiq14 is record i, q : unsigned(13 downto 0); end record;
    type t_usiq14array is array (natural range <>) of t_usiq14;
    type t_usiq15 is record i, q : unsigned(14 downto 0); end record;
    type t_usiq15array is array (natural range <>) of t_usiq15;
    type t_usiq16 is record i, q : unsigned(15 downto 0); end record;
    type t_usiq16array is array (natural range <>) of t_usiq16;
    type t_usiq17 is record i, q : unsigned(16 downto 0); end record;
    type t_usiq17array is array (natural range <>) of t_usiq17;
    type t_usiq18 is record i, q : unsigned(17 downto 0); end record;
    type t_usiq18array is array (natural range <>) of t_usiq18;
    type t_usiq19 is record i, q : unsigned(18 downto 0); end record;
    type t_usiq19array is array (natural range <>) of t_usiq19;
    type t_usiq20 is record i, q : unsigned(19 downto 0); end record;
    type t_usiq20array is array (natural range <>) of t_usiq20;
    type t_usiq21 is record i, q : unsigned(20 downto 0); end record;
    type t_usiq21array is array (natural range <>) of t_usiq21;
    type t_usiq22 is record i, q : unsigned(21 downto 0); end record;
    type t_usiq22array is array (natural range <>) of t_usiq22;
    type t_usiq23 is record i, q : unsigned(22 downto 0); end record;
    type t_usiq23array is array (natural range <>) of t_usiq23;
    type t_usiq24 is record i, q : unsigned(23 downto 0); end record;
    type t_usiq24array is array (natural range <>) of t_usiq24;
    type t_usiq25 is record i, q : unsigned(24 downto 0); end record;
    type t_usiq25array is array (natural range <>) of t_usiq25;
    type t_usiq26 is record i, q : unsigned(25 downto 0); end record;
    type t_usiq26array is array (natural range <>) of t_usiq26;
    type t_usiq27 is record i, q : unsigned(26 downto 0); end record;
    type t_usiq27array is array (natural range <>) of t_usiq27;
    type t_usiq28 is record i, q : unsigned(27 downto 0); end record;
    type t_usiq28array is array (natural range <>) of t_usiq28;
    type t_usiq29 is record i, q : unsigned(28 downto 0); end record;
    type t_usiq29array is array (natural range <>) of t_usiq29;
    type t_usiq30 is record i, q : unsigned(29 downto 0); end record;
    type t_usiq30array is array (natural range <>) of t_usiq30;
    type t_usiq31 is record i, q : unsigned(30 downto 0); end record;
    type t_usiq31array is array (natural range <>) of t_usiq31;
    type t_usiq32 is record i, q : unsigned(31 downto 0); end record;
    type t_usiq32array is array (natural range <>) of t_usiq32;
    type t_usiq33 is record i, q : unsigned(32 downto 0); end record;
    type t_usiq33array is array (natural range <>) of t_usiq33;
    type t_usiq34 is record i, q : unsigned(33 downto 0); end record;
    type t_usiq34array is array (natural range <>) of t_usiq34;
    type t_usiq35 is record i, q : unsigned(34 downto 0); end record;
    type t_usiq35array is array (natural range <>) of t_usiq35;
    type t_usiq36 is record i, q : unsigned(35 downto 0); end record;
    type t_usiq36array is array (natural range <>) of t_usiq36;
    type t_usiq37 is record i, q : unsigned(36 downto 0); end record;
    type t_usiq37array is array (natural range <>) of t_usiq37;
    type t_usiq38 is record i, q : unsigned(37 downto 0); end record;
    type t_usiq38array is array (natural range <>) of t_usiq38;
    type t_usiq39 is record i, q : unsigned(38 downto 0); end record;
    type t_usiq39array is array (natural range <>) of t_usiq39;
    type t_usiq40 is record i, q : unsigned(39 downto 0); end record;
    type t_usiq40array is array (natural range <>) of t_usiq40;
    type t_usiq41 is record i, q : unsigned(40 downto 0); end record;
    type t_usiq41array is array (natural range <>) of t_usiq41;
    type t_usiq42 is record i, q : unsigned(41 downto 0); end record;
    type t_usiq42array is array (natural range <>) of t_usiq42;
    type t_usiq43 is record i, q : unsigned(42 downto 0); end record;
    type t_usiq43array is array (natural range <>) of t_usiq43;
    type t_usiq44 is record i, q : unsigned(43 downto 0); end record;
    type t_usiq44array is array (natural range <>) of t_usiq44;
    type t_usiq45 is record i, q : unsigned(44 downto 0); end record;
    type t_usiq45array is array (natural range <>) of t_usiq45;
    type t_usiq46 is record i, q : unsigned(45 downto 0); end record;
    type t_usiq46array is array (natural range <>) of t_usiq46;
    type t_usiq47 is record i, q : unsigned(46 downto 0); end record;
    type t_usiq47array is array (natural range <>) of t_usiq47;
    type t_usiq48 is record i, q : unsigned(47 downto 0); end record;
    type t_usiq48array is array (natural range <>) of t_usiq48;
    type t_usiq49 is record i, q : unsigned(48 downto 0); end record;
    type t_usiq49array is array (natural range <>) of t_usiq49;
    type t_usiq50 is record i, q : unsigned(49 downto 0); end record;
    type t_usiq50array is array (natural range <>) of t_usiq50;
    type t_usiq51 is record i, q : unsigned(50 downto 0); end record;
    type t_usiq51array is array (natural range <>) of t_usiq51;
    type t_usiq52 is record i, q : unsigned(51 downto 0); end record;
    type t_usiq52array is array (natural range <>) of t_usiq52;
    type t_usiq53 is record i, q : unsigned(52 downto 0); end record;
    type t_usiq53array is array (natural range <>) of t_usiq53;
    type t_usiq54 is record i, q : unsigned(53 downto 0); end record;
    type t_usiq54array is array (natural range <>) of t_usiq54;
    type t_usiq55 is record i, q : unsigned(54 downto 0); end record;
    type t_usiq55array is array (natural range <>) of t_usiq55;
    type t_usiq56 is record i, q : unsigned(55 downto 0); end record;
    type t_usiq56array is array (natural range <>) of t_usiq56;
    type t_usiq57 is record i, q : unsigned(56 downto 0); end record;
    type t_usiq57array is array (natural range <>) of t_usiq57;
    type t_usiq58 is record i, q : unsigned(57 downto 0); end record;
    type t_usiq58array is array (natural range <>) of t_usiq58;
    type t_usiq59 is record i, q : unsigned(58 downto 0); end record;
    type t_usiq59array is array (natural range <>) of t_usiq59;
    type t_usiq60 is record i, q : unsigned(59 downto 0); end record;
    type t_usiq60array is array (natural range <>) of t_usiq60;
    type t_usiq61 is record i, q : unsigned(60 downto 0); end record;
    type t_usiq61array is array (natural range <>) of t_usiq61;
    type t_usiq62 is record i, q : unsigned(61 downto 0); end record;
    type t_usiq62array is array (natural range <>) of t_usiq62;
    type t_usiq63 is record i, q : unsigned(62 downto 0); end record;
    type t_usiq63array is array (natural range <>) of t_usiq63;
    type t_usiq64 is record i, q : unsigned(63 downto 0); end record;
    type t_usiq64array is array (natural range <>) of t_usiq64;

    type t_signed1array is array (natural range <>) of signed(0 downto 0);
    type t_signed2array is array (natural range <>) of signed(1 downto 0);
    type t_signed3array is array (natural range <>) of signed(2 downto 0);
    type t_signed4array is array (natural range <>) of signed(3 downto 0);
    type t_signed5array is array (natural range <>) of signed(4 downto 0);
    type t_signed6array is array (natural range <>) of signed(5 downto 0);
    type t_signed7array is array (natural range <>) of signed(6 downto 0);
    type t_signed8array is array (natural range <>) of signed(7 downto 0);
    type t_signed9array is array (natural range <>) of signed(8 downto 0);
    type t_signed10array is array (natural range <>) of signed(9 downto 0);
    type t_signed11array is array (natural range <>) of signed(10 downto 0);
    type t_signed12array is array (natural range <>) of signed(11 downto 0);
    type t_signed13array is array (natural range <>) of signed(12 downto 0);
    type t_signed14array is array (natural range <>) of signed(13 downto 0);
    type t_signed15array is array (natural range <>) of signed(14 downto 0);
    type t_signed16array is array (natural range <>) of signed(15 downto 0);
    type t_signed17array is array (natural range <>) of signed(16 downto 0);
    type t_signed18array is array (natural range <>) of signed(17 downto 0);
    type t_signed19array is array (natural range <>) of signed(18 downto 0);
    type t_signed20array is array (natural range <>) of signed(19 downto 0);
    type t_signed21array is array (natural range <>) of signed(20 downto 0);
    type t_signed22array is array (natural range <>) of signed(21 downto 0);
    type t_signed23array is array (natural range <>) of signed(22 downto 0);
    type t_signed24array is array (natural range <>) of signed(23 downto 0);
    type t_signed25array is array (natural range <>) of signed(24 downto 0);
    type t_signed26array is array (natural range <>) of signed(25 downto 0);
    type t_signed27array is array (natural range <>) of signed(26 downto 0);
    type t_signed28array is array (natural range <>) of signed(27 downto 0);
    type t_signed29array is array (natural range <>) of signed(28 downto 0);
    type t_signed30array is array (natural range <>) of signed(29 downto 0);
    type t_signed31array is array (natural range <>) of signed(30 downto 0);
    type t_signed32array is array (natural range <>) of signed(31 downto 0);
    type t_signed33array is array (natural range <>) of signed(32 downto 0);
    type t_signed34array is array (natural range <>) of signed(33 downto 0);
    type t_signed35array is array (natural range <>) of signed(34 downto 0);
    type t_signed36array is array (natural range <>) of signed(35 downto 0);
    type t_signed37array is array (natural range <>) of signed(36 downto 0);
    type t_signed38array is array (natural range <>) of signed(37 downto 0);
    type t_signed39array is array (natural range <>) of signed(38 downto 0);
    type t_signed40array is array (natural range <>) of signed(39 downto 0);
    type t_signed41array is array (natural range <>) of signed(40 downto 0);
    type t_signed42array is array (natural range <>) of signed(41 downto 0);
    type t_signed43array is array (natural range <>) of signed(42 downto 0);
    type t_signed44array is array (natural range <>) of signed(43 downto 0);
    type t_signed45array is array (natural range <>) of signed(44 downto 0);
    type t_signed46array is array (natural range <>) of signed(45 downto 0);
    type t_signed47array is array (natural range <>) of signed(46 downto 0);
    type t_signed48array is array (natural range <>) of signed(47 downto 0);
    type t_signed49array is array (natural range <>) of signed(48 downto 0);
    type t_signed50array is array (natural range <>) of signed(49 downto 0);
    type t_signed51array is array (natural range <>) of signed(50 downto 0);
    type t_signed52array is array (natural range <>) of signed(51 downto 0);
    type t_signed53array is array (natural range <>) of signed(52 downto 0);
    type t_signed54array is array (natural range <>) of signed(53 downto 0);
    type t_signed55array is array (natural range <>) of signed(54 downto 0);
    type t_signed56array is array (natural range <>) of signed(55 downto 0);
    type t_signed57array is array (natural range <>) of signed(56 downto 0);
    type t_signed58array is array (natural range <>) of signed(57 downto 0);
    type t_signed59array is array (natural range <>) of signed(58 downto 0);
    type t_signed60array is array (natural range <>) of signed(59 downto 0);
    type t_signed61array is array (natural range <>) of signed(60 downto 0);
    type t_signed62array is array (natural range <>) of signed(61 downto 0);
    type t_signed63array is array (natural range <>) of signed(62 downto 0);
    type t_signed64array is array (natural range <>) of signed(63 downto 0);

    type t_unsigned1array is array (natural range <>) of unsigned(0 downto 0);
    type t_unsigned2array is array (natural range <>) of unsigned(1 downto 0);
    type t_unsigned3array is array (natural range <>) of unsigned(2 downto 0);
    type t_unsigned4array is array (natural range <>) of unsigned(3 downto 0);
    type t_unsigned5array is array (natural range <>) of unsigned(4 downto 0);
    type t_unsigned6array is array (natural range <>) of unsigned(5 downto 0);
    type t_unsigned7array is array (natural range <>) of unsigned(6 downto 0);
    type t_unsigned8array is array (natural range <>) of unsigned(7 downto 0);
    type t_unsigned9array is array (natural range <>) of unsigned(8 downto 0);
    type t_unsigned10array is array (natural range <>) of unsigned(9 downto 0);
    type t_unsigned11array is array (natural range <>) of unsigned(10 downto 0);
    type t_unsigned12array is array (natural range <>) of unsigned(11 downto 0);
    type t_unsigned13array is array (natural range <>) of unsigned(12 downto 0);
    type t_unsigned14array is array (natural range <>) of unsigned(13 downto 0);
    type t_unsigned15array is array (natural range <>) of unsigned(14 downto 0);
    type t_unsigned16array is array (natural range <>) of unsigned(15 downto 0);
    type t_unsigned17array is array (natural range <>) of unsigned(16 downto 0);
    type t_unsigned18array is array (natural range <>) of unsigned(17 downto 0);
    type t_unsigned19array is array (natural range <>) of unsigned(18 downto 0);
    type t_unsigned20array is array (natural range <>) of unsigned(19 downto 0);
    type t_unsigned21array is array (natural range <>) of unsigned(20 downto 0);
    type t_unsigned22array is array (natural range <>) of unsigned(21 downto 0);
    type t_unsigned23array is array (natural range <>) of unsigned(22 downto 0);
    type t_unsigned24array is array (natural range <>) of unsigned(23 downto 0);
    type t_unsigned25array is array (natural range <>) of unsigned(24 downto 0);
    type t_unsigned26array is array (natural range <>) of unsigned(25 downto 0);
    type t_unsigned27array is array (natural range <>) of unsigned(26 downto 0);
    type t_unsigned28array is array (natural range <>) of unsigned(27 downto 0);
    type t_unsigned29array is array (natural range <>) of unsigned(28 downto 0);
    type t_unsigned30array is array (natural range <>) of unsigned(29 downto 0);
    type t_unsigned31array is array (natural range <>) of unsigned(30 downto 0);
    type t_unsigned32array is array (natural range <>) of unsigned(31 downto 0);
    type t_unsigned33array is array (natural range <>) of unsigned(32 downto 0);
    type t_unsigned34array is array (natural range <>) of unsigned(33 downto 0);
    type t_unsigned35array is array (natural range <>) of unsigned(34 downto 0);
    type t_unsigned36array is array (natural range <>) of unsigned(35 downto 0);
    type t_unsigned37array is array (natural range <>) of unsigned(36 downto 0);
    type t_unsigned38array is array (natural range <>) of unsigned(37 downto 0);
    type t_unsigned39array is array (natural range <>) of unsigned(38 downto 0);
    type t_unsigned40array is array (natural range <>) of unsigned(39 downto 0);
    type t_unsigned41array is array (natural range <>) of unsigned(40 downto 0);
    type t_unsigned42array is array (natural range <>) of unsigned(41 downto 0);
    type t_unsigned43array is array (natural range <>) of unsigned(42 downto 0);
    type t_unsigned44array is array (natural range <>) of unsigned(43 downto 0);
    type t_unsigned45array is array (natural range <>) of unsigned(44 downto 0);
    type t_unsigned46array is array (natural range <>) of unsigned(45 downto 0);
    type t_unsigned47array is array (natural range <>) of unsigned(46 downto 0);
    type t_unsigned48array is array (natural range <>) of unsigned(47 downto 0);
    type t_unsigned49array is array (natural range <>) of unsigned(48 downto 0);
    type t_unsigned50array is array (natural range <>) of unsigned(49 downto 0);
    type t_unsigned51array is array (natural range <>) of unsigned(50 downto 0);
    type t_unsigned52array is array (natural range <>) of unsigned(51 downto 0);
    type t_unsigned53array is array (natural range <>) of unsigned(52 downto 0);
    type t_unsigned54array is array (natural range <>) of unsigned(53 downto 0);
    type t_unsigned55array is array (natural range <>) of unsigned(54 downto 0);
    type t_unsigned56array is array (natural range <>) of unsigned(55 downto 0);
    type t_unsigned57array is array (natural range <>) of unsigned(56 downto 0);
    type t_unsigned58array is array (natural range <>) of unsigned(57 downto 0);
    type t_unsigned59array is array (natural range <>) of unsigned(58 downto 0);
    type t_unsigned60array is array (natural range <>) of unsigned(59 downto 0);
    type t_unsigned61array is array (natural range <>) of unsigned(60 downto 0);
    type t_unsigned62array is array (natural range <>) of unsigned(61 downto 0);
    type t_unsigned63array is array (natural range <>) of unsigned(62 downto 0);
    type t_unsigned64array is array (natural range <>) of unsigned(63 downto 0);

    type t_star12 is record i, q, r, a : std_logic_vector(11 downto 0); end record;
    type t_star12_array is array (natural range <>) of t_star12;
    type t_star16 is record i, q, r, a : std_logic_vector(15 downto 0); end record;
    type t_star16_array is array (natural range <>) of t_star16;

    constant c_star12_default : t_star12 := ((others => '0'), (others => '0'), (others => '0'), (others => '0'));
    constant c_star16_default : t_star16 := ((others => '0'), (others => '0'), (others => '0'), (others => '0'));

    type t_dump24 is record
        v : std_logic;
        m : std_logic;
        d : std_logic_vector(23 downto 0);
    end record;

    type t_dump24array is array (natural range <>) of t_dump24;

    type t_dump32 is record
        v : std_logic;
        m : std_logic;
        d : std_logic_vector(31 downto 0);
    end record;

    type t_dump32array is array (natural range <>) of t_dump32;

    type t_dump48 is record
        v : std_logic;
        m : std_logic;
        d : std_logic_vector(47 downto 0);
    end record;

    type t_dump48array is array (natural range <>) of t_dump48;

    type t_dump64 is record
        v : std_logic;
        m : std_logic;
        d : std_logic_vector(63 downto 0);
    end record;

    type t_dump64array is array (natural range <>) of t_dump64;

    type t_dump96 is record
        v : std_logic;
        m : std_logic;
        d : std_logic_vector(95 downto 0);
    end record;

    type t_dump96array is array (natural range <>) of t_dump96;

    type t_dump_iq16 is record
        v : std_logic;
        m : std_logic;
        iq : t_iq16;
    end record;

    type t_dump_iq16_array is array (natural range <>) of t_dump_iq16;

    constant c_dump_iq16_default : t_dump_iq16 := (
          v => '0'
        , m => '0'
        , iq => ((others => '0'), (others => '0'))
    );

    type t_dump_iq16x2 is record
        v : std_logic;
        m : std_logic;
        iq : t_iq16array(0 to 1);
    end record;

    type t_dump_iq16x2_array is array (natural range <>) of t_dump_iq16x2;

    constant c_dump_iq16x2_default : t_dump_iq16x2 := (
          v => '0'
        , m => '0'
        , iq => (others => ((others => '0'), (others => '0')))
    );

    type t_iq_solver_ram is record
        clk : std_logic;
        sel : std_logic_vector(1 downto 0);
        rst : std_logic;
        wr : std_logic;
        d : std_logic_vector(31 downto 0);
    end record;

    type t_iq_solver_ram_array is array (natural range <>) of t_iq_solver_ram;

    constant c_iq_solver_ram_default : t_iq_solver_ram := (
          clk => '0'
        , sel => (others => '0')
        , rst => '0'
        , wr => '0'
        , d => (others => '0')
    );

----------------------------------------------------------------------------------------------------------------------------------
-- demodulator interface
----------------------------------------------------------------------------------------------------------------------------------
    type t_dem_if is record
        i : signed(15 downto 0);
        q : signed(15 downto 0);
        r : unsigned(15 downto 0);
        a : signed(15 downto 0);
        sym : std_logic;
        sof : std_logic;
        eof : std_logic;
        m : std_logic_vector(15 downto 0);
        ch : unsigned(7 downto 0);
        modcod : std_logic_vector(15 downto 0);
        ts : unsigned(31 downto 0);
        nofs : unsigned(15 downto 0);
        power : unsigned(11 downto 0);
    end record;

    type t_dem_if_array is array (natural range <>) of t_dem_if;

    constant c_dem_if_default : t_dem_if := (
          i => (others => '0')
        , q => (others => '0')
        , r => (others => '0')
        , a => (others => '0')
        , sym => '0'
        , sof => '0'
        , eof => '0'
        , m => (others => '0')
        , ch => (others => '0')
        , modcod => (others => '0')
        , ts => (others => '0')
        , nofs => (others => '0')
        , power => (others => '0')
    );

    function f_dem_if_to_slv(din : t_dem_if; size : integer := 128) return std_logic_vector;
    function f_slv_to_dem_if(din : std_logic_vector; size : integer := 128) return t_dem_if;

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
end package;

----------------------------------------------------------------------------------------------------------------------------------
-- package body declaration
----------------------------------------------------------------------------------------------------------------------------------
package body pkg_demodulators_types is
----------------------------------------------------------------------------------------------------------------------------------
-- functions
----------------------------------------------------------------------------------------------------------------------------------
    -- convert std_logic_vector(23 downto 0) to t_iq12
    function f_slv24_to_iq12(
        din : in std_logic_vector(23 downto 0);
        swap : in boolean := false
    ) return t_iq12 is
        variable v_result : t_iq12 := ((others => '0'), (others => '0'));
    begin
        if swap then
            v_result.i := din(23 downto 12);
            v_result.q := din(11 downto 0);
        else
            v_result.i := din(11 downto 0);
            v_result.q := din(23 downto 12);
        end if;
        return v_result;
    end function;

    -- convert t_iq12 to std_logic_vector(23 downto 0);
    function f_iq12_to_slv24(
        din : in t_iq12;
        swap : in boolean := false
    ) return std_logic_vector is
        variable v_result : std_logic_vector(23 downto 0) := (others => '0');
    begin
        if swap then
            v_result(23 downto 12) := din.i;
            v_result(11 downto 0)  := din.q;
        else
            v_result(11 downto 0)  := din.i;
            v_result(23 downto 12) := din.q;
        end if;
        return v_result;
    end function;

    -- convert std_logic_vector(31 downto 0) to t_iq16
    function f_slv32_to_iq16(
        din : in std_logic_vector(31 downto 0);
        swap : in boolean := false
    ) return t_iq16 is
        variable v_result : t_iq16 := ((others => '0'), (others => '0'));
    begin
        if swap then
            v_result.i := din(31 downto 16);
            v_result.q := din(15 downto 0);
        else
            v_result.i := din(15 downto 0);
            v_result.q := din(31 downto 16);
        end if;
        return v_result;
    end function;

    -- convert t_iq16 to std_logic_vector(31 downto 0);
    function f_iq16_to_slv32(
        din : in t_iq16;
        swap : in boolean := false
    ) return std_logic_vector is
        variable v_result : std_logic_vector(31 downto 0) := (others => '0');
    begin
        if swap then
            v_result(31 downto 16) := din.i;
            v_result(15 downto 0)  := din.q;
        else
            v_result(15 downto 0)  := din.i;
            v_result(31 downto 16) := din.q;
        end if;
        return v_result;
    end function;

    function f_dem_if_to_slv(
          din : t_dem_if
        ; size : integer := 128
    ) return std_logic_vector is
        variable v_result : std_logic_vector(size - 1 downto 0) := (others => '0');
    begin
        v_result(15 downto 0) := std_logic_vector(din.i);
        v_result(31 downto 16) := std_logic_vector(din.q);
        v_result(47 downto 32) := std_logic_vector(din.r);
        v_result(63 downto 48) := std_logic_vector(din.a);
        v_result(79 downto 64) := std_logic_vector(din.m);
        v_result(95 downto 80) := std_logic_vector(din.modcod);
        v_result(103 downto 96) := std_logic_vector(din.ch);
        v_result(104) := din.sof;
        v_result(105) := din.eof;
        v_result(106) := din.sym;
        if size >= 160 then
            v_result(159 downto 128) := std_logic_vector(din.ts);
        end if;
        if size >= 176 then
            v_result(175 downto 160) := std_logic_vector(din.nofs);
        end if;
        if size >= 188 then
            v_result(187 downto 176) := std_logic_vector(din.power);
        end if;
        return v_result;
    end function;

    function f_slv_to_dem_if(
          din : std_logic_vector
        ; size : integer := 128
    ) return t_dem_if is
        variable v_result : t_dem_if := c_dem_if_default;
    begin
        v_result.i := signed(din(15 downto 0));
        v_result.q := signed(din(31 downto 16));
        v_result.r := unsigned(din(47 downto 32));
        v_result.a := signed(din(63 downto 48));
        v_result.m := din(79 downto 64);
        v_result.modcod := din(95 downto 80);
        v_result.ch := unsigned(din(103 downto 96));
        v_result.sof := din(104);
        v_result.eof := din(105);
        v_result.sym := din(106);
        if size >= 160 then
            v_result.ts := unsigned(din(159 downto 128));
        end if;
        if size >= 176 then
            v_result.nofs := unsigned(din(175 downto 160));
        end if;
        if size >= 188 then
            v_result.power := unsigned(din(187 downto 176));
        end if;
        return v_result;
    end function;

----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------
end;