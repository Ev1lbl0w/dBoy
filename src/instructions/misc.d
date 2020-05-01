module instructions.misc;

/** This file contains all the instructions that handle miscellaneos operations.
	This includes:
	- No operations
	- Interrupt operations
	- CPU halt operations
*/

version(unittest) import aurorafw.unit.assertion;

import instructions.instruction;
import components.system;

/** The NOP (No Operation) instruction.
	This instruction does nothing but consume CPU cycles and advance the PC.
*/
class NOP : Instruction {

	this() {
		cycles = 4;
		name = "NOP";
	}

	override int execute(System s) {
		s.cpu.registers.pc += 1;

		return cycles;
	}
}

@("[Instructions - Miscellaneous] NOP operation")
unittest {
	System system = new System();
	Instruction nop = new NOP();

	int cycles = nop.execute(system);
	assertEquals(4, cycles);
	assertEquals(1, system.cpu.registers.pc);

	assertEquals(cycles, nop.cycles);
	assertEquals("NOP", nop.name);
}
