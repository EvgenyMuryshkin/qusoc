create_clock -name Clock -period 20 [get_ports {Clock}]
derive_pll_clocks

# Constrain the input I/O path

set_input_delay -clock clk -max 3 [all_inputs]
set_input_delay -clock clk -min 2 [all_inputs]

# Constrain the output I/O path

set_output_delay -clock clk -max 3 [all_inputs]
set_output_delay -clock clk -min 2 [all_inputs]