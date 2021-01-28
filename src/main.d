import std.stdio;
import core.stdc.stdlib;
import std.algorithm;

import components.system;
import components.cpu;
import components.gpu;
import components.memory;
import components.sound;
import components.bootrom;

immutable string separator = "-------------";

void printHelp() {
	writeln("Usage: dBoy rom_file.gb [-d = toggle debug mode]");
	exit(EXIT_FAILURE);
}

void main(string[] args) {
	if(args.length < 2)
		printHelp();

	System system = new System();
	system.loadGameCart(args[1]);
	system.boot();

	try {
		while(true) {
			system.step();
			if(args.canFind("-d")) {
				writeln(separator);
				dumpCPU(system.cpu);
				writeln("Press Enter for stepping to the next instruction...");
				readln();
			}
		}
	} catch(Exception e) {
		writeln("Program has halted.");
		writeln("Exception message: \"", e.msg, "\"");
		writeln("\nNow dumping info:\n", separator);
		dumpSystem(system);
		writeln("End of dump, program exiting now");
	}
}

void dumpSystem(System s) {
	dumpCPU(s.cpu);
	dumpGPU(s.gpu);
	dumpSoundChip(s.soundChip);
	dumpMemoryMap(s.memMap, s.cpu);
	dumpBootROM(s.bootROM);
}

void dumpCPU(CPU c) {
	writeln("CPU\n", separator);
	writeln("Registers:");
	writefln("\tA: 0x%02X (0b%08b)", c.registers.a, c.registers.a);
	writefln("\tB: 0x%02X (0b%08b)", c.registers.b, c.registers.b);
	writefln("\tC: 0x%02X (0b%08b)", c.registers.c, c.registers.c);
	writefln("\tD: 0x%02X (0b%08b)", c.registers.d, c.registers.d);
	writefln("\tE: 0x%02X (0b%08b)", c.registers.e, c.registers.e);
	writefln("\tF: 0x%02X (0b%08b)", c.registers.f, c.registers.f);
	writefln("\tH: 0x%02X (0b%08b)", c.registers.h, c.registers.h);
	writefln("\tL: 0x%02X (0b%08b)", c.registers.l, c.registers.l);
	writeln("\t", separator);
	writefln("\tPC: 0x%04X (0b%016b)", c.registers.pc, c.registers.pc);
	writefln("\tSP: 0x%04X (0b%016b)", c.registers.sp, c.registers.sp);
}

void dumpGPU(GPU g) {}
void dumpSoundChip(SoundChip s) {}

void dumpMemoryMap(MemoryMap m, CPU c) {
	writeln(separator, "\nMemory Map\n", separator);
	writefln("Opcode that failed: %X (at address 0x%04X)", m.memory[c.registers.pc], c.registers.pc);
	writefln("Next 5 opcodes (including current one): %(%02X %)", m.memory[c.registers.pc..c.registers.pc+5]);
}

void dumpBootROM(BootROM b) {
	writeln(separator, "\nBootROM\n", separator);
	writeln("BootROM used: ", b.classinfo.name);
	writeln(separator);
}