[OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts) design configuration for a fully open-source hardware security module ASIC with [IHP's open PDK](https://github.com/IHP-GmbH/IHP-Open-PDK).

## The Design

RISC-V core based on VexRiscv, extended with masked AES as well as a big number multiplication unit. Eight 32KiB SRAM cells to hold firmware, stack, heap etc. Refer to [the hardware/software repository](https://github.com/VE-HEP/VE-HEP-HW-SW) for details.

## The ASIC

To build the ASIC, set up OpenROAD-flow-scripts, clone this repository as `<ORFS-Root>/flow/designs/ihp-sg13g2/hsm` and run the build like any other ORFS design.

## Taped-out Build

Find the build taped out on 11/12/2023 [in the releases](https://github.com/VE-HEP/hsm/releases/tag/tapeout-dec-23).
