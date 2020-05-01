module bootroms.full;

import components.bootrom;
import components.system;

/** FullBootROM
	This bootROM simulates the real bootrom present in the Nintendo devices.
	It performs a full boot-up sequence, including if 
*/
class FullBootROM : BootROM {
	override void execute(System s) {
		return; // TODO
	}
}