set IO_LENGTH 180
set IO_WIDTH 80
set BONDPAD_SIZE 70
set MAX_NUM_HPADS 15
set MAX_NUM_VPADS 15

proc calc_horizontal_pad_location {index} {
    global IO_LENGTH
    global IO_WIDTH
    global MAX_NUM_HPADS

    set DIE_WIDTH [expr {[lindex $::env(DIE_AREA) 2] - [lindex $::env(DIE_AREA) 0]}]
    set PAD_AREA_WIDTH [expr {$DIE_WIDTH - $IO_LENGTH - $IO_LENGTH}]
    set HORIZONTAL_PAD_DISTANCE [expr {$PAD_AREA_WIDTH / ( $MAX_NUM_HPADS + 1 )}]

    return [expr {$IO_LENGTH - ( $IO_WIDTH / 2 ) + $HORIZONTAL_PAD_DISTANCE * ( $index + 1 )}]
}

proc calc_vertical_pad_location {index} {
    global IO_LENGTH
    global IO_WIDTH
    global MAX_NUM_VPADS

    set DIE_HEIGHT [expr {[lindex $::env(DIE_AREA) 3] - [lindex $::env(DIE_AREA) 1]}]
    set PAD_AREA_HEIGHT [expr {$DIE_HEIGHT - $IO_LENGTH - $IO_LENGTH}]
    set VERTICAL_PAD_DISTANCE [expr {$PAD_AREA_HEIGHT / ( $MAX_NUM_VPADS + 1 )}]

    return [expr {$IO_LENGTH - ( $IO_WIDTH / 2 ) + $VERTICAL_PAD_DISTANCE * ( $index + 1 )}]
}

# IOLib.lef defines sg13g2_ioSite for the sides, but no corner site
make_fake_io_site -name sg13g2_ioCSite -width $IO_LENGTH -height $IO_LENGTH

# Create IO Rows
make_io_sites \
    -horizontal_site sg13g2_ioSite \
    -vertical_site sg13g2_ioSite \
    -corner_site sg13g2_ioCSite \
    -offset $BONDPAD_SIZE

######## Place Pads ########
place_pad -row IO_EAST -location [calc_vertical_pad_location  0] {u_pad_vddpad_e0}
place_pad -row IO_EAST -location [calc_vertical_pad_location  1] {u_pad_gndpad_e0}
place_pad -row IO_EAST -location [calc_vertical_pad_location  2] {u_pad_vddcore_e0}
place_pad -row IO_EAST -location [calc_vertical_pad_location  3] {u_pad_gndcore_e0}
place_pad -row IO_EAST -location [calc_vertical_pad_location  5] {u_pad_jtag_tms}
place_pad -row IO_EAST -location [calc_vertical_pad_location  6] {u_pad_jtag_tdi}
place_pad -row IO_EAST -location [calc_vertical_pad_location  7] {u_pad_jtag_tdo}
place_pad -row IO_EAST -location [calc_vertical_pad_location  8] {u_pad_jtag_tck}
place_pad -row IO_EAST -location [calc_vertical_pad_location  9] {u_pad_clk}
place_pad -row IO_EAST -location [calc_vertical_pad_location 11] {u_pad_vddpad_e1}
place_pad -row IO_EAST -location [calc_vertical_pad_location 12] {u_pad_gndpad_e1}
place_pad -row IO_EAST -location [calc_vertical_pad_location 13] {u_pad_vddcore_e1}
place_pad -row IO_EAST -location [calc_vertical_pad_location 14] {u_pad_gndcore_e1}

place_pad -row IO_WEST -location [calc_vertical_pad_location  0] {u_pad_vddpad_w0}
place_pad -row IO_WEST -location [calc_vertical_pad_location  1] {u_pad_gndpad_w0}
place_pad -row IO_WEST -location [calc_vertical_pad_location  2] {u_pad_vddcore_w0}
place_pad -row IO_WEST -location [calc_vertical_pad_location  3] {u_pad_gndcore_w0}
place_pad -row IO_WEST -location [calc_vertical_pad_location  4] {u_pad_reset}
place_pad -row IO_WEST -location [calc_vertical_pad_location  5] {u_pad_uart_txd}
place_pad -row IO_WEST -location [calc_vertical_pad_location  6] {u_pad_uart_rxd}
place_pad -row IO_WEST -location [calc_vertical_pad_location  7] {u_pad_gpio0}
place_pad -row IO_WEST -location [calc_vertical_pad_location  8] {u_pad_gpio1}
place_pad -row IO_WEST -location [calc_vertical_pad_location  9] {u_pad_gpio2}
place_pad -row IO_WEST -location [calc_vertical_pad_location 10] {u_pad_gpio3}
place_pad -row IO_WEST -location [calc_vertical_pad_location 11] {u_pad_vddpad_w1}
place_pad -row IO_WEST -location [calc_vertical_pad_location 12] {u_pad_gndpad_w1}
place_pad -row IO_WEST -location [calc_vertical_pad_location 13] {u_pad_vddcore_w1}
place_pad -row IO_WEST -location [calc_vertical_pad_location 14] {u_pad_gndcore_w1}

place_pad -row IO_NORTH -location [calc_horizontal_pad_location  0] {u_pad_vddpad_n0}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  1] {u_pad_gndpad_n0}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  2] {u_pad_vddcore_n0}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  3] {u_pad_gndcore_n0}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  4] {u_pad_spi_sclk}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  5] {u_pad_spi_mosi}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  6] {u_pad_spi_miso_write}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  7] {u_pad_spi_miso_writeEnable}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  8] {u_pad_spi_ss}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location  9] {u_pad_gpio4}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 10] {u_pad_gpio5}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 11] {u_pad_vddpad_n1}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 12] {u_pad_gndpad_n1}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 13] {u_pad_vddcore_n1}
place_pad -row IO_NORTH -location [calc_horizontal_pad_location 14] {u_pad_gndcore_n1}

place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  0] {u_pad_vddpad_s0}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  1] {u_pad_gndpad_s0}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  2] {u_pad_vddcore_s0}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  3] {u_pad_gndcore_s0}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  6] {u_pad_gpio6}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location  8] {u_pad_gpio7}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 11] {u_pad_vddpad_s1}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 12] {u_pad_gndpad_s1}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 13] {u_pad_vddcore_s1}
place_pad -row IO_SOUTH -location [calc_horizontal_pad_location 14] {u_pad_gndcore_s1}

# Place corners
place_corners sg13g2_Corner

# Place IO fill
set iofill {sg13g2_Filler10000
            sg13g2_Filler4000
            sg13g2_Filler2000
            sg13g2_Filler1000
            sg13g2_Filler400
            sg13g2_Filler200} ;
place_io_fill -row IO_NORTH {*}$iofill
place_io_fill -row IO_SOUTH {*}$iofill
place_io_fill -row IO_WEST {*}$iofill
place_io_fill -row IO_EAST {*}$iofill

# Place the bondpads
place_bondpad -bond bondpad_70x70 u_pad_* -offset {5.0 -70.0}

# Connect ring signals
connect_by_abutment

remove_io_rows
