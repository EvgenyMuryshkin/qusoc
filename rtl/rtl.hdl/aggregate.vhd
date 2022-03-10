-- Quartus II VHDL Template
-- Signed Adder

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aggregate is

	generic
	(
		DATA_WIDTH : natural := 8
	);

	port 
	(
		a	   : in signed	((DATA_WIDTH-1) downto 0);
		b	   : in signed	((DATA_WIDTH-1) downto 0);
		result : out signed ((DATA_WIDTH-1) downto 0)
	);

end entity;

architecture rtl of aggregate is
begin

	result <= a;
	result(6 downto 4) <= (0 => '1', 2 => '1', others => '0');

end rtl;