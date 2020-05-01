module instructions.flow;

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

	this() {
		cycles = 16;
		name = "JP";
	}

	override int execute(System s) {
		ubyte l = s.memMap.memory[++s.cpu.registers.pc];
		ubyte h = s.memMap.memory[++s.cpu.registers.pc];
		ushort address = (h << 8) | l;
		s.cpu.registers.pc = address;

		return cycles;
	}
}