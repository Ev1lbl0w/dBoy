module instructions.flow;

version(unittest) {
	import aurorafw.unit.assertion;
	import components.cpu;
}

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
		} else {
			s.cpu.registers.pc += 3;
		}

		return cycles;
	}

	bool condition;
}

/** The RET (RETurn) instruction.
	This instruction returns execution from a sub-routine, fetching the return address from stack.
*/
class RET : Instruction {

	this(bool condition) {
		this.condition = condition;

		cycles = condition ? 5 : 2;
		name = "RET";
	}

	override int execute(System s) {
		if(condition) {
			ubyte l = s.memMap.memory[s.cpu.registers.sp++];
			ubyte h = s.memMap.memory[s.cpu.registers.sp++];
			ushort address = (h << 8) | l;
			s.cpu.registers.pc = address;
		} else {
			s.cpu.registers.pc++;
		}

		return cycles;
	}

	bool condition;
}

@("[Instructions - Flow Control] JP nn (C3) instruction")
unittest {
	System system = new System();
	system.memMap.memory[(system.cpu.registers.pc + 1) .. (system.cpu.registers.pc + 3)] = [ 0x34, 0x12 ];
	Flags flags = system.cpu.registers.f;

	Instruction jp = new JP(true);

	int cycles = jp.execute(system);
	assertEquals(0x1234, system.cpu.registers.pc);

	assertEquals(4, cycles);
	assertEquals(flags, system.cpu.registers.f);
}

@("[Instructions - Flow Control] JP NZ,nn (20) instruction")
unittest {
	System system = new System();
	system.cpu.registers.f.zero = true;
	system.memMap.memory[(system.cpu.registers.pc + 1) .. (system.cpu.registers.pc + 3)] = [ 0x34, 0x12 ];
	Flags flags = system.cpu.registers.f;

	// Flag zero is set, should fail to jump
	Instruction jp = new JP(!system.cpu.registers.f.zero);

	int cycles = jp.execute(system);
	assertEquals(3, system.cpu.registers.pc);

	assertEquals(3, cycles);
	assertEquals(flags, system.cpu.registers.f);

	system.cpu.registers.f.zero = false;
	system.cpu.registers.pc = 0;

	// Flag zero is reset, should jump
	jp = new JP(!system.cpu.registers.f.zero);

	cycles = jp.execute(system);
	assertEquals(0x1234, system.cpu.registers.pc);

	assertEquals(4, cycles);
}

@("[Instructions - Flow Control] RET Z (C8) instruction")
unittest {
	System system = new System();
	system.cpu.registers.f.zero = false;
	system.cpu.registers.sp = 0xFFFC;
	system.cpu.registers.pc = 0x3000;
	system.memMap.memory[(system.cpu.registers.sp) .. (system.cpu.registers.sp + 2)] = [ 0x34, 0x12 ];
	Flags flags = system.cpu.registers.f;

	// Flag zero is reset, should fail to jump
	Instruction ret = new RET(system.cpu.registers.f.zero);

	int cycles = ret.execute(system);
	assertEquals(0x3001, system.cpu.registers.pc);
	assertEquals(0xFFFC, system.cpu.registers.sp);

	assertEquals(2, cycles);
	assertEquals(flags, system.cpu.registers.f);

	system.cpu.registers.f.zero = true;
	system.cpu.registers.pc = 0x3000;

	// Flag zero is set, should jump
	ret = new RET(system.cpu.registers.f.zero);

	cycles = ret.execute(system);
	assertEquals(0x1234, system.cpu.registers.pc);
	assertEquals(0xFFFE, system.cpu.registers.sp);

	assertEquals(5, cycles);
}
