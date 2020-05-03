module instructions.memory;

version(unittest) {
	import aurorafw.unit.assertion;
	import components.cpu;
}

import instructions.instruction;
import components.system;

/** This file contains all the instructions that handle memory operations.
	This includes:
	- Loading and storing operations
	- Stack operations
*/

/** The LD (Load) instruction.
	This instruction loads memory/register contents to another register.
	It is used to copy registers or retrieve data from memory.
*/
class LD : Instruction {

	// Constructor for copying a 16-bit value to a 16-bit address
	this(ushort* to, int from = -1) {
		this.is16bit = true;

		to16bit = to;
		from16bit = from;

		cycles = (from == -1) ? 3 : 5;
		name = "LD";
	}

	// Constructor for copying an 8-bit value to an 8-bit address
	this(ubyte* to, short from = -1, bool usesMemory = false) {
		this.is16bit = false;

		to8bit = to;
		from8bit = from;

		cycles = (from == -1) ? 2 : 1;
		cycles += usesMemory ? 1 : 0;
		name = "LD";
	}

	override int execute(System s) {
		if(is16bit) {
			// 16-bit operation
			if(from16bit == -1) {
				// We need to retrive the value from memory
				ubyte h = s.memMap.memory[++s.cpu.registers.pc];
				ubyte l = s.memMap.memory[++s.cpu.registers.pc];
				ushort val = (h << 8) | l;

				*to16bit = val;
			} else {
				// We already got the value from a register
				// Special case: if "to" is the SP and "from" is the HL, this op only takes two cycles
				// and be safely copied (no need to swap endianness)
				if(to16bit == &s.cpu.registers.sp && cast(ushort*)&from16bit == s.cpu.registers.hl_ptr) {
					*to16bit = cast(ushort)from16bit;
					cycles = 2;
				} else {
					// "to" points to memory, so we must write it with the endianness swapped.
					(*to16bit++) = (from16bit & 0x00FF);
					(*to16bit) = (from16bit & 0xFF00);
				}
			}
		} else {
			// 8-bit operation
			if(from8bit == -1) {
				// We need to retrieve the value from memory
				ubyte val = s.memMap.memory[++s.cpu.registers.pc];
				*to8bit = val;
			} else {
				// We already got the value from a register
				*to8bit = cast(ubyte)from8bit;
			}
		}
		++s.cpu.registers.pc;
		return cycles;
	}

	short from8bit;
	int from16bit;
	ubyte* to8bit;
	ushort* to16bit;
	bool is16bit;
}

/** The LDD (Load and Decrement) instruction.
	This instruction works just like LD (even inheriting it), but it
	also decrements the loaded register.
*/
class LDD : LD {
	// Constructor to copy and 8-bit value to an 8-bit address
	this(ubyte* to, ubyte from) {
		super(to, cast(short)from);
		name = "LDD";
	}

	override int execute(System s) {
		int cycles = super.execute(s);

		s.cpu.registers.hl = cast(short)(s.cpu.registers.hl - 1);

		return cycles + 1;
	}
}

@("[Instructions - Memory] LD C,n (0E) instruction")
unittest {
	System system = new System();
	system.memMap.memory[(system.cpu.registers.pc + 1)] = 0xAC;
	Flags flags = system.cpu.registers.f;

	Instruction ld = new LD(&system.cpu.registers.c);

	int cycles = ld.execute(system);
	assertEquals(0xAC, system.cpu.registers.c);
	assertEquals(2, system.cpu.registers.pc);

	assertEquals(2, cycles);
	assertEquals(flags, system.cpu.registers.f);
}

@("[Instructions - Memory] LD L,C (69) instruction")
unittest {
	System system = new System();
	system.cpu.registers.c = 0x17;
	Flags flags = system.cpu.registers.f;

	Instruction ld = new LD(&system.cpu.registers.l, system.cpu.registers.c);

	int cycles = ld.execute(system);
	assertEquals(0x17, system.cpu.registers.l);
	assertEquals(system.cpu.registers.c, system.cpu.registers.l);
	assertEquals(1, system.cpu.registers.pc);

	assertEquals(1, cycles);
	assertEquals(flags, system.cpu.registers.f);
}

@("[Instructions - Memory] LD HL,nn (21) instruction")
unittest {
	System system = new System();
	system.memMap.memory[(system.cpu.registers.pc + 1) .. (system.cpu.registers.pc + 3)] = [ 0x34, 0x12 ];
	Flags flags = system.cpu.registers.f;

	Instruction ld = new LD(system.cpu.registers.hl_ptr);

	int cycles = ld.execute(system);
	assertEquals(0x1234, system.cpu.registers.hl);
	assertEquals(0x12, system.cpu.registers.h);
	assertEquals(0x34, system.cpu.registers.l);
	assertEquals(3, system.cpu.registers.pc);

	assertEquals(3, cycles);
	assertEquals(flags, system.cpu.registers.f);
}

@("[Instructions - Memory] LD (HL),n (36) instruction")
unittest {
	System system = new System();
	system.cpu.registers.hl = 0x4187;
	system.memMap.memory[(system.cpu.registers.pc + 1)] = 0x6A;
	Flags flags = system.cpu.registers.f;

	Instruction ld = new LD(&system.memMap.memory[system.cpu.registers.hl], -1, true);

	int cycles = ld.execute(system);
	assertEquals(0x6A, system.memMap.memory[system.cpu.registers.hl]);
	assertEquals(2, system.cpu.registers.pc);

	assertEquals(3, cycles);
	assertEquals(flags, system.cpu.registers.f);
}

@("[Instructions - Memory] LD B,(HL) (46) instruction")
unittest {
	System system = new System();
	system.cpu.registers.hl = 0x8A29;
	system.memMap.memory[system.cpu.registers.hl] = 0xCB;
	Flags flags = system.cpu.registers.f;

	Instruction ld = new LD(&system.cpu.registers.b, system.memMap.memory[system.cpu.registers.hl], true);

	int cycles = ld.execute(system);
	assertEquals(0xCB, system.cpu.registers.b);
	assertEquals(1, system.cpu.registers.pc);

	assertEquals(2, cycles);
	assertEquals(flags, system.cpu.registers.f);
}

@("[Instructions - Memory] LDD (HL),A (32) instruction")
unittest {
	System system = new System();
	system.cpu.registers.a = 0x27;
	system.cpu.registers.hl = 0xA6B8;
	Flags flags = system.cpu.registers.f;

	Instruction ld = new LDD(&(system.memMap.memory[system.cpu.registers.hl]), system.cpu.registers.a);

	int cycles = ld.execute(system);
	assertEquals(0xA6B7, system.cpu.registers.hl);
	assertEquals(0x27, system.memMap.memory[0xA6B8]);
	assertEquals(1, system.cpu.registers.pc);

	assertEquals(2, cycles);
	assertEquals(flags, system.cpu.registers.f);
}