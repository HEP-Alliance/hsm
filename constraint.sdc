current_design HEPv3

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current uA
set_max_fanout 20 [current_design]
set_max_transition 3 [current_design]
set_max_area 0

set clock_ports [get_ports {\
    p_clk \
    p_jtag_tck \
}]

set clk_input_ports [get_ports {\
    p_uart_rxd \
    p_spi_sclk \
    p_spi_mosi \
    p_spi_ss \
    p_reset \
}]

set jtag_input_ports [get_ports {\
    p_jtag_tms \
    p_jtag_tdi \
}]

set clk_output_ports [get_ports {\
    p_uart_txd \
    p_spi_miso_write \
    p_spi_miso_writeEnable \
}]

set jtag_output_ports [get_ports {\
    p_jtag_tdo \
}]

set clk_inout_ports [get_ports {\
    p_gpio[0] \
    p_gpio[1] \
    p_gpio[2] \
    p_gpio[3] \
    p_gpio[4] \
    p_gpio[5] \
    p_gpio[6] \
    p_gpio[7] \
}]

set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clock_ports
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $clk_input_ports
set_driving_cell -lib_cell sg13g2_IOPadIn -pin pad $jtag_input_ports
set_driving_cell -lib_cell sg13g2_IOPadOut4mA -pin pad $clk_output_ports
set_driving_cell -lib_cell sg13g2_IOPadOut4mA -pin pad $jtag_output_ports
set_driving_cell -lib_cell sg13g2_IOPadInOut4mA -pin pad $clk_inout_ports

set_ideal_network [get_pins u_pad_jtag_tck/p2c]
set_ideal_network [get_pins u_pad_clk/p2c]
create_clock [get_pins u_pad_clk/p2c] -name p_clk -period 40 -waveform {0 20}
create_clock [get_pins u_pad_jtag_tck/p2c] -name p_jtag_tck -period 100 -waveform {0 50}
set_clock_uncertainty 0.15 [get_clocks p_clk]
set_clock_uncertainty 0.15 [get_clocks p_jtag_tck]
set_clock_transition 0.25 [get_clocks p_clk]
set_clock_transition 0.25 [get_clocks p_jtag_tck]

set_false_path -from [get_clocks p_clk] -to [get_clocks p_jtag_tck]
set_false_path -from [get_clocks p_jtag_tck] -to [get_clocks p_clk]

set_input_delay  8 -clock p_clk      [get_ports { p_clk }]
set_input_delay  8 -clock p_jtag_tck [get_ports { p_jtag_tck }]
set_input_delay  8 -clock p_clk      $clk_input_ports
set_input_delay  8 -clock p_jtag_tck $jtag_input_ports
set_input_delay  8 -clock p_clk      $clk_inout_ports
set_output_delay 8 -clock p_clk      $clk_output_ports
set_output_delay 8 -clock p_jtag_tck $jtag_output_ports
set_output_delay 8 -clock p_clk      $clk_inout_ports

set_load -pin_load 5 [all_inputs]
set_load -pin_load 5 [all_outputs]
