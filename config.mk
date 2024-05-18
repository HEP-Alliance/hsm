export DESIGN_NICKNAME = hsm
export DESIGN_NAME = HEPv3
export PLATFORM = ihp-sg13g2

export SRAM_NAME = RM_IHPSG13_1P_8192x32_c4_bm_bist
export IO_NAME = IOLib
export BONDPAD_NAME = bondpad_70x70

export VERILOG_FILES = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/src/HEPv3.v \
                       ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/src/PQVexRiscvVEHEP.v \
                       ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/src/AES_Masked.v

export SDC_FILE = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/constraint.sdc

export ADDITIONAL_LIBS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macros/$(SRAM_NAME)/lib/$(SRAM_NAME)_tc_1d20V_25C.lib \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(IO_NAME)/$(IO_NAME)_dummy.lib
export ADDITIONAL_LEFS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macros/$(SRAM_NAME)/lef/$(SRAM_NAME).lef \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(IO_NAME)/$(IO_NAME).lef \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(BONDPAD_NAME)/$(BONDPAD_NAME).lef
export ADDITIONAL_GDS  = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macros/$(SRAM_NAME)/gds/$(SRAM_NAME).gds \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(IO_NAME)/$(IO_NAME).gds \
                         ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/iocells/$(BONDPAD_NAME)/$(BONDPAD_NAME).gds

export SEAL_GDS = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macros/sealring_4540x4540.gds

export FOOTPRINT_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/footprint.tcl
export PDN_TCL = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/pdn.tcl

export MACRO_PLACEMENT = ./designs/$(PLATFORM)/$(DESIGN_NICKNAME)/macro_placement.cfg

# Available area: 4540um x 4540um
# Sealring: roughly 60um
# Remaining chip area: 4420um x 4420um
# I/O pads: 180um
# Bondpads: 70um
# Margin for core power ring: 80um
# Total margin to core area: 330um
# Core site: 0.48 x 3.78
export DIE_AREA = 0 0 4419.84 4418.82
export CORE_AREA = 330.24 328.86 4089.6 4089.96

# Allow routing on the TopMetal layers
export MAX_ROUTING_LAYER = TopMetal2

export USE_FILL = 1

# The SRAM cell GDS contains a bunch of empty instances
export GDS_ALLOW_EMPTY = RM_IHPSG13_1P_BITKIT_16x2_LE_con_edge_lr|RM_IHPSG13_1P_BITKIT_16x2_LE_con_tap_lr|RM_IHPSG13_1P_BITKIT_16x2_TAP_LR|RM_IHPSG13_1P_BITKIT_16x2_POWER_ramtap|RM_IHPSG13_1P_BITKIT_16x2_LE_con_corner|RM_IHPSG13_1P_BITKIT_16x2_CORNER|RM_IHPSG13_1P_BITKIT_16x2_TAP|RM_IHPSG13_1P_BITKIT_16x2_EDGE_TB
