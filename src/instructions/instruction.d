module instructions.instruction;

version(unittest) import aurorafw.unit.assertion;

import components.system;
import instructions.arithmetic;
import instructions.flow;
import instructions.misc;

class Instruction {

	abstract int execute(System system);
	// How many CPU cycles it takes to run this instruction
	int cycles;

	// Name of instruction in assembly
	string name;
}

/// Simple matching statement to match opCode's to Instruction's
static Instruction parseOpcode(ubyte opCode, System s) {
	switch(opCode) {
		case 0x00:	// NOP
			return new NOP();
		case 0x01:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x02:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x03:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x04:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x05:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x06:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x07:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x08:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x09:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x10:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x11:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x12:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x13:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x14:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x15:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x16:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x17:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x18:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x19:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x20:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x21:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x22:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x23:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x24:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x25:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x26:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x27:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x28:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x29:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x30:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x31:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x32:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x33:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x34:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x35:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x36:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x37:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x38:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x39:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x40:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x41:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x42:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x43:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x44:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x45:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x46:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x47:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x48:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x49:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x50:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x51:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x52:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x53:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x54:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x55:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x56:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x57:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x58:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x59:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x60:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x61:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x62:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x63:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x64:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x65:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x66:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x67:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x68:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x69:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x70:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x71:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x72:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x73:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x74:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x75:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x76:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x77:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x78:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x79:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x80:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x81:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x82:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x83:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x84:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x85:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x86:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x87:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x88:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x89:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x90:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x91:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x92:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x93:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x94:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x95:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x96:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x97:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x98:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x99:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAF:	// XOR A
			return new XOR(s.cpu.registers.a);
		case 0xB0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC3:	// JP nn
			return new JP(true);
		case 0xC4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCB:
			throw new Exception("Error: Unimplemented opCode!");
			//return parseExtendedOpcode()
		case 0xCC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xED:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFF:
			throw new Exception("Error: Unimplemented opCode!");
		default:
			throw new Exception("Error: Unimplemented opCode!");
	}
}

/// Simple matching statement to match extended opCode's to Instruction's
static Instruction parseExtendedOpcode(ubyte opCode) {
	switch(opCode) {
		case 0x00:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x01:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x02:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x03:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x04:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x05:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x06:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x07:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x08:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x09:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x0F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x10:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x11:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x12:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x13:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x14:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x15:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x16:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x17:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x18:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x19:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x1F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x20:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x21:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x22:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x23:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x24:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x25:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x26:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x27:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x28:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x29:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x2F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x30:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x31:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x32:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x33:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x34:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x35:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x36:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x37:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x38:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x39:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x3F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x40:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x41:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x42:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x43:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x44:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x45:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x46:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x47:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x48:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x49:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x4F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x50:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x51:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x52:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x53:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x54:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x55:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x56:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x57:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x58:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x59:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x5F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x60:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x61:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x62:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x63:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x64:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x65:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x66:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x67:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x68:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x69:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x6F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x70:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x71:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x72:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x73:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x74:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x75:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x76:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x77:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x78:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x79:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x7F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x80:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x81:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x82:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x83:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x84:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x85:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x86:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x87:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x88:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x89:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x8F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x90:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x91:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x92:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x93:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x94:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x95:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x96:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x97:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x98:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x99:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9A:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9B:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9C:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9D:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9E:
			throw new Exception("Error: Unimplemented opCode!");
		case 0x9F:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xA9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xAF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xB9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xBF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xC9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xCF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xD9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xDF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xE9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xED:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xEF:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF0:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF1:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF2:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF3:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF4:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF5:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF6:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF7:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF8:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xF9:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFA:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFB:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFC:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFD:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFE:
			throw new Exception("Error: Unimplemented opCode!");
		case 0xFF:
			throw new Exception("Error: Unimplemented opCode!");
		default:
			throw new Exception("Error: Unimplemented opCode!");
	}
}

@("[Instructions] Parsing of operation from opCodes")
unittest {
	System system = new System();
	ubyte[] program = [
		0x00,	// NOP
		0xAF	// XOR A
	];
	ubyte* arrPointer = program.ptr;
	Instruction i;

	// NOP (00) instruction
	i = parseOpcode(*(arrPointer++), system);
	assertTrue(typeid(i) == typeid(NOP));

	// XOR (AF) instruction
	i = parseOpcode(*(arrPointer++), system);
	assertTrue(typeid(i) == typeid(XOR));
}