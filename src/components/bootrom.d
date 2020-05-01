module components.bootrom;

import components.system;

/** BootROM
	This firmware is responsible for running code before the game's code.
	It is run after all the pre-initial setup (plugging in a cart, a link cable, etc...).
	It it we're a physical device, this code runs as soon as the user powers on the console.
*/
abstract class BootROM {
	abstract void execute(System s);
}