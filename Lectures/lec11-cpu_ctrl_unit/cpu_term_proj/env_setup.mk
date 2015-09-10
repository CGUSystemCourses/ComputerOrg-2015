################################################################################
#
# List all your CPU source files here
#
################################################################################

#list of all your RTL (Verilog) design files of the CPU
CPU_SRC_FILES += $(wildcard cpu/*.v)


################################################################################
#
# setup the simulator
#
################################################################################

#number of simulation cycles
SIM_CYCLE = 10

#the data memory size to be dumped when the simulation stops
DUMP_MEM_SIZE = 10

#initial content of the data memory
DMEM_INIT_FILE = init_dmem.hex

#your assembly program
ASM_SRC_FILE = test.asm














