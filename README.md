[OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts) design configuration for a fully open-source hardware security module ASIC with [IHP's open PDK](https://github.com/IHP-GmbH/IHP-Open-PDK).

## The Design

RISC-V core based on VexRiscv, extended with masked AES as well as a big number multiplication unit. Eight 32KiB SRAM cells to hold firmware, stack, heap etc. Refer to [the hardware/software repository](https://github.com/VE-HEP/VE-HEP-HW-SW) for details.

## The ASIC

To build the ASIC, set up OpenROAD-flow-scripts, clone this repository as `<ORFS-Root>/flow/designs/ihp-sg13g2/hsm` and run the build like any other ORFS design. A few local modifications to the ORFS installation are required and/or recommended until upstream fixes are available:

1. Apply `patches/final_report.tcl.patch` (to `<ORFS-Root>/flow/scripts/final_report.tcl`) as a workaround for https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/issues/1667
2. Apply `patches/sg13g2_tech.lef.patch` (to `<ORFS-Root>/flow/platforms/ihp-sg13g2/lef/sg13g2_tech.lef`) as a workaround for https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/issues/1681
3. Apply `patches/sg13g2_stdcell.lef.patch` (to `<ORFS-Root>/flow/platforms/ihp-sg13g2/lef/sg13g2_stdcell.lef`) as a workaround until https://github.com/IHP-GmbH/IHP-Open-PDK/commit/30e71efdab1399e49b4d7b6b63e85a1bca2bd46c makes it into ORFS
4. Apply https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/pull/1708 locally

To apply Git patches, use `git apply <file>.patch`.

### Caveats

- The resulting design will contain design rule violations as tracked in https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/issues/1677.
- The resulting design will not have metal density fill applied. We are currently working on that.

Other than that, the design is ready for tapeout.

## Taped-out Build

Find the build taped out on 11/12/2023 [in the releases]().
