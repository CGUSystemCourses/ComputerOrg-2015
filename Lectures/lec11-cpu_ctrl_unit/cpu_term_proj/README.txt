/*******************************************************************************
 *
 * the single-cycle CPU demo with test environment
 *
 ******************************************************************************/

--- status ---

DONE with Tag [M01__sc_cpu]


/*******************************************************************************
 *
 * usage note
 *
 ******************************************************************************/

1. place Verilog files of your CPU in the sub-folder named "cpu"

2. modify the file "env_setup.mk" for your test inputs

3. modify the file "cpu_with_memory.v" to instance your own CPU in this test
   environment

4. commands:
	(1) "make run" to run the simulation.
		- The simulation result (dump of the data memory) will be in the file
		  "sim_cpu.out"
	(2) "make" to build the CPU simulator "sim_cpu"
	(3) "make clean" to remove all generated files for the simulation

5. command to assemble your own program:
	$> python ass.py "your_program.asm"



/*******************************************************************************
 *
 * development log
 *
 ******************************************************************************/

--- 2010-01-06 ---

Tag: M01__src_cpu

the 1st release to students












