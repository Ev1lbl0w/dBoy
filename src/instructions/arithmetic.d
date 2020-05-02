module instructions.arithmetic;

version(unittest) import aurorafw.unit.assertion;

import instructions.instruction;
import components.system;

/** This file contains all the instructions that handle arithmetic operations.
	This includes:
	- Math operations
	- Bit operations
*/

/** The XOR (eXclusive OR) instruction.
	This instruction performs a XOR operation between register A and the supplied value.
*/
class XOR : Instruction {

	this(short value = -1) {
		this.value = value;

		cycles = (value == -1) ? 2 : 1;
		name = "XOR";
	}

	override int execute(System s) {
		// If no value was supplied in the constructor, it means we have to get it
		// from the next address.
		if(value == -1)
			value = s.memMap.memory[++s.cpu.registers.pc];
		s.cpu.registers.a ^= value;

		s.cpu.registers.f.zero = s.cpu.registers.a == 0 ? true : false;
		s.cpu.registers.f.subtract = false;
		s.cpu.registers.f.halfCarry = false;
		s.cpu.registers.f.carry = false;

		++s.cpu.registers.pc;

		return cycles;
	}

	short value;
}

@("[Instructions - Arithmetic] XOR A (AF) operation")
unittest {
	System system = new System();
	system.cpu.registers.a = 0b00100101;

	Instruction xor = new XOR(system.cpu.registers.a);
	ubyte flags = system.cpu.registers.f;

	int cycles = xor.execute(system);
	assertEquals(0, system.cpu.registers.a);

	assertEquals(1, cycles);
	assertEquals(1, system.cpu.registers.pc);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b10000000, system.cpu.registers.f);

	assertEquals(cycles, xor.cycles);
	assertEquals("XOR", xor.name);
}
