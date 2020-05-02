module instructions.arithmetic;

version(unittest) {
	import aurorafw.unit.assertion;
	import components.cpu;
}

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

/** The DEC (DECrement) instruction.
	This instruction decrements it's register or memory.
*/
class DEC : Instruction {

	this(ubyte* value, bool isHL) {
		this.value = value;

		cycles = isHL ? 3 : 1;
		name = "DEC";
	}

	override int execute(System s) {
		(*value)--;

		s.cpu.registers.f.zero = (*value) == 0;
		s.cpu.registers.f.subtract = true;
		s.cpu.registers.f.halfCarry = (*value & 0x0F) == 0x0F;

		++s.cpu.registers.pc;
		return cycles;
	}

	ubyte* value;
}

/** The INC (INCrement) instruction.
	This instruction increments it's register or memory.
*/
class INC : Instruction {

	this(ubyte* value, bool isHL) {
		this.value = value;

		cycles = isHL ? 3 : 1;
		name = "INC";
	}

	override int execute(System s) {
		(*value)++;

		s.cpu.registers.f.zero = (*value) == 0;
		s.cpu.registers.f.subtract = false;
		s.cpu.registers.f.halfCarry = (*value & 0x0F) == 0x00;

		++s.cpu.registers.pc;
		return cycles;
	}

	ubyte* value;
}

@("[Instructions - Arithmetic] XOR A (AF) operation")
unittest {
	System system = new System();
	system.cpu.registers.a = 0b00100101;
	Flags flags = system.cpu.registers.f;

	Instruction xor = new XOR(system.cpu.registers.a);

	int cycles = xor.execute(system);
	assertEquals(0, system.cpu.registers.a);

	assertEquals(1, cycles);
	assertEquals(1, system.cpu.registers.pc);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b10000000, system.cpu.registers.f);
}

@("[Instructions - Arithmetic] DEC B (05) operation")
unittest {
	System system = new System();
	system.cpu.registers.b = 0xC8;
	Flags flags = system.cpu.registers.f;

	Instruction dec = new DEC(&system.cpu.registers.b, false);

	int cycles = dec.execute(system);
	assertEquals(0xC7, system.cpu.registers.b);

	assertEquals(1, cycles);
	assertEquals(1, system.cpu.registers.pc);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b01000000, system.cpu.registers.f);

	system.cpu.registers.b = 0x70;
	flags = system.cpu.registers.f;

	dec.execute(system);
	assertEquals(0x6F, system.cpu.registers.b);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b01100000, system.cpu.registers.f);

	system.cpu.registers.b = 0x01;
	system.cpu.registers.f.carry = true;
	flags = system.cpu.registers.f;

	dec.execute(system);
	assertEquals(0x00, system.cpu.registers.b);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b11010000, system.cpu.registers.f);

	flags = system.cpu.registers.f;

	dec.execute(system);
	assertEquals(0xFF, system.cpu.registers.b);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b01110000, system.cpu.registers.f);
	assertEquals(4, system.cpu.registers.pc);
}

@("[Instructions - Arithmetic] INC (HL) (34) operation")
unittest {
	System system = new System();
	system.cpu.registers.hl = 0x7C38;
	system.memMap.memory[system.cpu.registers.hl] = 0x28;
	Flags flags = system.cpu.registers.f;

	Instruction inc = new INC(&(system.memMap.memory[system.cpu.registers.hl]), true);

	int cycles = inc.execute(system);
	assertEquals(0x29, system.memMap.memory[system.cpu.registers.hl]);

	assertEquals(3, cycles);
	assertEquals(1, system.cpu.registers.pc);
	assertEquals(0b00000000, system.cpu.registers.f);

	system.memMap.memory[system.cpu.registers.hl] = 0x4F;
	flags = system.cpu.registers.f;

	inc.execute(system);
	assertEquals(0x50, system.memMap.memory[system.cpu.registers.hl]);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b00100000, system.cpu.registers.f);

	system.memMap.memory[system.cpu.registers.hl] = 0xFF;
	system.cpu.registers.f.carry = true;
	flags = system.cpu.registers.f;

	inc.execute(system);
	assertEquals(0x00, system.memMap.memory[system.cpu.registers.hl]);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b10110000, system.cpu.registers.f);

	flags = system.cpu.registers.f;

	inc.execute(system);
	assertEquals(0x01, system.memMap.memory[system.cpu.registers.hl]);
	expectThrows!AssertException(assertEquals(flags, system.cpu.registers.f));
	assertEquals(0b00010000, system.cpu.registers.f);
	assertEquals(4, system.cpu.registers.pc);
}
