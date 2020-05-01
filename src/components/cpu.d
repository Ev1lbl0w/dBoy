module components.cpu;

version(unittest) import aurorafw.unit.assertion;

import components.system;

struct Registers {
	ubyte a, b, c, d, e, h, l;
	ushort pc, sp;
	Flags f;

	@property ushort af() {
		return (a << 8) | f;
	}

	@property void af(ushort var) {
		f = var & 0x00FF;
		a = var >> 8;
	}

	@property ushort bc() {
		return (b << 8) | c;
	}

	@property void bc(ushort var) {
		c = var & 0x00FF;
		b = var >> 8;
	}

	@property ushort de() {
		return (d << 8) | e;
	}

	@property void de(ushort var) {
		e = var & 0x00FF;
		d = var >> 8;
	}

	@property ushort hl() {
		return (h << 8) | l;
	}

	@property void hl(ushort var) {
		l = var & 0x00FF;
		h = var >> 8;
	}
}

struct Flags {
	ubyte flags;
	alias flags this;

	@property bool zero() {
		return (flags & (1 << 7)) > 0;
	}

	@property void zero(bool var) {
		flags = var ? flags | (1 << 7) : flags & ~(1 << 7);
	}

	@property bool subtract() {
		return (flags & (1 << 6)) > 0;
	}

	@property void subtract(bool var) {
		flags = var ? flags | (1 << 6) : flags & ~(1 << 6);
	}

	@property bool halfCarry() {
		return (flags & (1 << 5)) > 0;
	}

	@property void halfCarry(bool var) {
		flags = var ? flags | (1 << 5) : flags & ~(1 << 5);
	}

	@property bool carry() {
		return (flags & (1 << 4)) > 0;
	}

	@property void carry(bool var) {
		flags = var ? flags | (1 << 4) : flags & ~(1 << 4);
	}
}

class CPU : Component {

	this(System system) {
		super(system);
	}
	~this() {}

	Registers registers;
}

@("[CPU] Test reading and writing to registers (8-bit)")
unittest {
	System system = new System();
	CPU cpu = system.cpu;

	cpu.registers.a = 0b00100111;
	cpu.registers.h = 0b11011000;

	assertEquals(0b00100111, cpu.registers.a);
	assertEquals(0b11011000, cpu.registers.h);

	assertEquals(0b00000000, cpu.registers.c);

	assertEquals(0b00000000, cpu.registers.a & cpu.registers.h);
	assertEquals(0b11111111, cpu.registers.a | cpu.registers.h);
}

@("[CPU] Test reading and writing to two registers (16-bit)")
unittest {
	System system = new System();
	CPU cpu = system.cpu;

	cpu.registers.b = 0xAB;
	cpu.registers.c = 0xCD;

	assertEquals(0xABCD, cpu.registers.bc);

	cpu.registers.bc = 0xEF01;
	assertEquals(0xEF, cpu.registers.b);
	assertEquals(0x01, cpu.registers.c);
}

@("[CPU] Test flags conversion from and to ubyte")
unittest {
	System system = new System();
	CPU cpu = system.cpu;

	cpu.registers.f.zero = true;
	cpu.registers.f.subtract = true;
	cpu.registers.f.carry = true;

	assertEquals(false, cpu.registers.f.halfCarry);
	assertEquals(0b11010000, cpu.registers.f);
	
	cpu.registers.f = 0b01100000;

	assertEquals(false, cpu.registers.f.zero);
	assertEquals(true, cpu.registers.f.subtract);
	assertEquals(true, cpu.registers.f.halfCarry);
	assertEquals(false, cpu.registers.f.carry);
}

@("[CPU] Test interchange between 16-bit registers and flags wrapper")
unittest {
	System system = new System();
	CPU cpu = system.cpu;

	cpu.registers.af = 0xC0C0;

	assertEquals(0xC0, cpu.registers.a);
	assertEquals(0xC0, cpu.registers.f);

	assertEquals(true, cpu.registers.f.zero);
	assertEquals(true, cpu.registers.f.subtract);
	assertEquals(false, cpu.registers.f.halfCarry);
	assertEquals(false, cpu.registers.f.carry);

	cpu.registers.f.zero = false;
	cpu.registers.f.carry = true;

	assertEquals(0xC050, cpu.registers.af);
}