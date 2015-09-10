################################################################################
#
# Makefile to build the CPU simulator
#
################################################################################

include env_setup.mk
IMEM_IMAGE = $(ASM_SRC_FILE:.asm=.mem)

################################################################################
#
# Files setup
#
################################################################################

MEM_SRC_FILES += $(wildcard memory/*.v)
TB_SRC_FILES += testbench_cpu.v cpu_with_memory.v

RTL_SRC_FILES += $(TB_SRC_FILES) $(CPU_SRC_FILES) $(MEM_SRC_FILES)

################################################################################
#
# User Interface
#
################################################################################

TARGET = sim_cpu

all: $(TARGET)

run: sim_cpu.out

clean:
	rm -f $(TARGET)
	-rm -rf *.daidir
	-rm -rf csrc
	-rm -rf *.vpd
	-rm -rf *.vcd
	-rm -rf DVEfiles
	-rm -rf *.log
	-rm -rf .vcsmx_rebuild
	-rm -rf alib-52 
	-rm -rf default.svf
	-rm -rf ~/synopsys_cache_B*
	-rm -rf tags
	rm -f instr.mem
	rm -f data.mem
	rm -f $(IMEM_IMAGE)
	rm -f sim_cpu.out

################################################################################
#
# Rules to build the CPU simulator
#
################################################################################

VCS=vcs

MACROS += +define+SIM_CYCLE=$(SIM_CYCLE)
MACROS += +define+DUMP_MEM_SIZE=$(DUMP_MEM_SIZE)

VCS_FLAGS += +v2k -debug_pp $(MACROS)

sim_cpu: $(RTL_SRC_FILES)
	$(VCS) $(VCS_FLAGS) -o $@ $^

################################################################################
#
# Rules to run the simulation
#
################################################################################

%.mem: %.asm
	python ass.py $^

instr.mem: $(IMEM_IMAGE)
	cp $^ $@

data.mem: $(DMEM_INIT_FILE)
	cp $^ $@

sim_cpu.out: sim_cpu data.mem instr.mem
	./sim_cpu -q > $@








