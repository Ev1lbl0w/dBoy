module components.memory;

import components.system;

class MemoryMap : Component {
	
	this(System system) {
		super(system);
	}

	@property ubyte[] game() {
		return memory[0x0000 .. 0x7FFF];
	}

public:
	ubyte[0x10000] memory;
}