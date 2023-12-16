# stdcell power pins
add_global_connection -net {VDD} -pin_pattern {^VDD$} -power
add_global_connection -net {VDD} -pin_pattern {^VDDPE$}
add_global_connection -net {VDD} -pin_pattern {^VDDCE$}

add_global_connection -net {VSS} -pin_pattern {^VSS$} -ground
add_global_connection -net {VSS} -pin_pattern {^VSSE$}

# padframe core power pins
add_global_connection -net {VDD} -pin_pattern {^vdd$} -power
add_global_connection -net {VSS} -pin_pattern {^vss$} -ground

# SRAM power pins
add_global_connection -net {VDD} -pin_pattern {^VDD!$} -power
add_global_connection -net {VDD} -pin_pattern {^VDDARRAY!$}
add_global_connection -net {VSS} -pin_pattern {^VSS!$} -ground

global_connect

# core voltage domain
set_voltage_domain -name {CORE} -power {VDD} -ground {VSS}

# stdcell grid
define_pdn_grid -name {grid} -voltage_domains {CORE}
add_pdn_ring -grid {grid} -layers {Metal5 TopMetal1} -widths {30.0} -spacings {5.0} -core_offsets {4.5} -connect_to_pads
add_pdn_stripe -grid {grid} -layer {Metal1}     -width {0.44}  -pitch {7.56} -offset {0}      -followpins -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {Metal5}     -width {2.200} -pitch {75.6} -offset {13.600}             -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal1}  -width {2.200} -pitch {75.6} -offset {13.600}             -extend_to_core_ring
add_pdn_stripe -grid {grid} -layer {TopMetal2}  -width {2.200} -pitch {75.6} -offset {13.600}             -extend_to_core_ring
add_pdn_connect -grid {grid} -layers {Metal1 Metal5}
add_pdn_connect -grid {grid} -layers {Metal5 TopMetal1}
add_pdn_connect -grid {grid} -layers {Metal5 TopMetal2}
add_pdn_connect -grid {grid} -layers {TopMetal1 TopMetal2}

# SRAM grid
define_pdn_grid -name {macro} -voltage_domains {CORE} \
    -macro \
    -cells RM_IHPSG13_1P_8192x32_c4_bm_bist \
    -halo "40 40" \
    -grid_over_boundary

# power ring on Metal4 and Metal5 (the SRAM uses the layers up to Metal4)
add_pdn_ring -grid {macro} -layers {Metal4 Metal5} -widths {10.0} -spacings {5.0} -core_offsets {4.5}
add_pdn_stripe -grid {macro} -layer {Metal5} -width {2.200} -pitch {75.6} -offset {13.600} -extend_to_core_ring
add_pdn_connect -grid {macro} -layers {Metal4 Metal5}
add_pdn_connect -grid {macro} -layers {Metal5 TopMetal1}
add_pdn_connect -grid {macro} -layers {Metal4 TopMetal1}
