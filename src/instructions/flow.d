module instructions.flow;

version(unittest) import aurorafw.unit.assertion;

import instructions.instruction;
import components.system;

/** This file contains all the instructions that handle flow operations.
	This includes:
	- Jump operations
	- Sub-routines operations
*/

/** The JP (Jump) instruction.
	This instruction jumps to the given address if it's condition evaluates to true.
*/
class JP : Instruction {

	this(bool condition) {
		this.condition = condition;

		cycles = condition ? 4 : 3;
		name = "JP";
	}

	override int execute(System s) {
		if(condition) {
			ubyte l = s.memMap.memory[++s.cpu.registers.pc];
			ubyte h = s.memMap.memory[++s.cpu.registers.pc];
			ushort address = (h << 8) | l;
			s.cpu.registers.pc = address;

			return cycles;
		} else {
			s.cpu.registers.pc += 3;

			return cycles;
		}
	}

	bool condition;
}

@("[Instructions - Flow Control] JP nn (C3) instruction")
unittest {
	System system = new System();
	system.memMap.memory[(system.cpu.registers.pc + 1) .. (system.cpu.registers.pc + 3)] = [ 0x34, 0x12 ];
	ubyte flags = system.cpu.registers.f;

	Instruction jp = new JP(true);

	int cycles = jp.execute(system);
	assertEquals(0x1234, system.cpu.registers.pc);

	assertEquals(4, cycles);
	assertEquals(flags, system.cpu.registers.f);
}
