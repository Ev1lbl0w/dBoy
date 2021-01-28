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

/** The DI/EI (Disable/Enable Interrupts) instruction.
	This instruction constrols whether hardware interrupts are enabled or not
*/
class INT : Instruction {

	this(bool value) {
		this.value = value;

		cycles = 1;
		name = "INT";
	}

	override int execute(System s) {
		++s.cpu.registers.pc;

		s.cpu.ime = value;

		return cycles;
	}

	bool value;
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

@("[Instructions - Miscellaneous] DI (F3) operation")
unittest {
	System system = new System();
	Flags flags = system.cpu.registers.f;

	Instruction di = new INT(false);
	int cycles = di.execute(system);

	assertEquals(1, cycles);
	assertEquals(1, system.cpu.registers.pc);
	assertEquals(false, system.cpu.ime);
}