module components.system;

version(unittest) import aurorafw.unit.assertion;

import std.stdio;

import components.cpu;
import components.gpu;
import components.sound;
import components.memory;
import components.bootrom;

import bootroms.none;
import instructions.instruction;

class System {

	this(BootROM bootROM = new NoneBootROM()) {
		cpu = new CPU(this);
		gpu = new GPU(this);
		soundChip = new SoundChip(this);
		memMap = new MemoryMap(this);
		this.bootROM = bootROM;
	}

	void loadGameCart(string filename) {
		File gameFile = File(filename, "rb");

		if(!gameFile.isOpen())
			throw new Exception("Error: Game file doesn't exist!");

		gameFile.rawRead(memMap.game);

		int i;
	}

	void boot() {
		bootROM.execute(this);
	}

	void step() {
		Instruction i = parseOpcode(memMap.memory[cpu.registers.pc], this);

		writefln("0x%04X : %s (0x%02X)", cpu.registers.pc, i.name, memMap.memory[cpu.registers.pc]);
		i.execute(this);
	}

	CPU cpu;
	GPU gpu;
	SoundChip soundChip;
	MemoryMap memMap;
	BootROM bootROM;
}

class Component {

	this(System system) {
		this.system = system;
	}

	System system;
}

@("[System] Test component initialization")
unittest {
	System system = new System();

	assertNotNull(system.cpu);
	assertNotNull(system.gpu);
	assertNotNull(system.soundChip);
	assertNotNull(system.memMap);

	assertEquals(system.cpu.system, system);
	assertEquals(system.gpu.system.soundChip.system.memMap.system, system.cpu.system);
}