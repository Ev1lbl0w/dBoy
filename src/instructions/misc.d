module instructions.misc;

version(unittest) {
	import aurorafw.unit.assertion;
	import components.cpu;
}

import instructions.instruction;
import components.system;

/** This file contains all the instructions that handle miscellaneos operations.
	This includes:
	- No operations
	- Interrupt operations
	- CPU halt operations
*/

/** The NOP (No Operation) instruction.
	This instruction does nothing but consume CPU cycles and advance the PC.
*/
class NOP : Instruction {

	this() {
		cycles = 1;
		name = "NOP";
	}

	override int execute(System s) {
		++s.cpu.registers.pc;

		return cycles;
	}
}

@("[Instructions - Miscellaneous] NOP (00) operation")
unittest {
	System system = new System();
	Flags flags = system.cpu.registers.f;

	Instruction nop = new NOP();
	int cycles = nop.execute(system);

	assertEquals(1, cycles);
	assertEquals(1, system.cpu.registers.pc);
	assertEquals(flags, system.cpu.registers.f);
}
