module bootroms.none;

import components.bootrom;
import components.system;

/** NoneBootROM
	This bootROM does the least needed to boot a ROM. It effectifely skips
	the initial logo and jingle, bypasses any security checks, and simply
	starts execution at 0x100.
*/
class NoneBootROM : BootROM {
	override void execute(System s) {
		s.cpu.registers.pc = 0x100;
	}
}