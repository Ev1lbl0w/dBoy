# dBoy - A Gameboy (Color) libretro core in D language!

## Compilling

Get the source:

```bash
git clone https://github.com/Ev1lbl0w/dBoy.git
cd dboy
dub build
```

The emulator will be located at `bin/dboy`

## Usage

Note that the emulator currently doesn't display anything. Right now it shows the instructions being executed and, on failure, show the opcode that failed.

`dBoy rom_file.gb [-d]`

Arguments in square brackets [] are opcional:

- `-d` : Toggle debug mode (single instruction stepping and CPU registers dump)

## Why another Gameboy emulator?

There are tons of emulators available. And in Gameboy, there's a lot. Which are likely faster, safer, etc...

So, what's the point of this emulator? Well, two big reasons:

- Firstly, I simply wanted to create an emulator. I wanted to learn how do you even begin writing such a thing, so I decided to starts on a blank sheet.

- Secondly, I wanted to write a different emulator. Most emulators are optimized for speed, low-level emulation, dynamic recompilation, etc... But what about an emulator that was easy to... read? Gameboy hardware isn't demanding to today's standards, so I'm sacrificing speed and efficiency for code readability. The code is very high level, with the purpose of being super simple to read and understand what's going on.

## Why use libretro framework?

Again, two big reasons:

- Using libretro frees me from the burden of having to learn how to display graphics, audio, get input, etc... The libretro frontend handles all that for me, so I can focus on the most essential: emulating the hardware
- Libretro makes it much more mainstream, as it makes in plug-and-play on popular emulators. This way, it's easier to get more visibility as well.

## Planned features

- Game booting (Tetris)
- Savestates
- Sound support
- Peripheral support