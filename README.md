# Gameboy Emulator

An educational project to learn how the [Gameboy](https://en.wikipedia.org/wiki/Game_Boy) operates. In its current state it can run games that use [no mapper](https://gbhwdb.gekkio.fi/cartridges/no-mapper.html), [MBC1](https://gbhwdb.gekkio.fi/cartridges/mbc1.html), and [MBC3](https://gbhwdb.gekkio.fi/cartridges/mbc3.html), which covers most commercial games (such as Pokemon and Tetris). More obscure mappers will be implemented later.

# Demo

Save file taken from [here](https://projectpokemon.org/home/files/file/4898-my-old-pok%C3%A9mon-red-save-file/).

![Alt](https://i.giphy.com/media/v1.Y2lkPTc5MGI3NjExZ3VlZjc4bjFpaHZpNnJhcmc0YTlxMjA0bXhoZ3B5Z2c2YW10aHl6biZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/DJDkUtqYWHICSCPZ4T/giphy.gif)

# Features

## Mappers

* [No mapper](https://gbhwdb.gekkio.fi/cartridges/no-mapper.html)
* [MBC1](https://gbhwdb.gekkio.fi/cartridges/mbc1.html)
* [MBC3](https://gbhwdb.gekkio.fi/cartridges/mbc3.html)

## CPU & Interrupts

Passes all of [Blargg's test ROMS](https://github.com/retrio/gb-test-roms) (excluding CGB and sound tests). This means that all CPU instructions are implemented and functional, as well as cycle accurate. Interrupts all work as intended.

## Display

Passes [DMG Acid](https://github.com/mattcurrie/dmg-acid2), which tests the display. This means that the PPU is working correctly and is fully functional.

## Audio

Audio is not implemented yet but will be in the future.

## Boot ROM

Supports boot ROM functionality, meaning whenever the emulator is turned on it loads the boot ROM at location 0x0000 and starts from there. See [usage](#usage) for more information on how to download the boot ROM for yourself.

## Pokemon Hacking

Whenever Pokemon Red or Blue is booted up, it runs a checksum verification to ensure the save file hasn't been messed with. This emulator automatically sets the correct checksum so that you can hack the save file without worrying about corrupting the game.

This feature is automatically turned on if Pokemon Red or Blue is detected, however if you wanted to turn on this functionality manually, search for the variable named `pokemon` near the top of the file and set its value to 1.

If you want to learn more about hacking the save file, [here](https://bulbapedia.bulbagarden.net/wiki/Save_data_structure_(Generation_I)) is a good reference file.

## Customization

Customization is not featured directly in the GUI, but it is easy to tweak anything through the file itself. There are macros and variables defined at the top of the file that can be modified to edit behaviour.

For colors, use the macros called `HEX_WHT` through `HEX_BLK` (ignore `HEX_EXT` that's for debugging). You can change the hexcode of each tone (white, light grey, dark grey, and black).

For screen size, you can change the variables `FCT_X` and `FCT_Y`, which scale the X and Y axises. 

For controls, use the macros KEY_[button name]. For example, to set a custom key to press the A button, the variable is called KEY_A. You can use [this file](https://wiki.libsdl.org/SDL3/SDL_Keycode) to find the corresponding keycode for each key on your keyboard.

# Usage

This project is mostly educational and wasn't intended to be distributed. If you want to run it, however, you can do so by doing the following:

1. Install the latest stable release of [SDL3](https://github.com/libsdl-org/SDL/releases) for your operating system. On Windows, make sure you either install the mingw64 version or install SDL3 from the Cygwin installer. Create an environment variable called `SDL3_DIR` and set it to the folder that you installed SDL3 in (for Cygwin, this folder would be `/usr`). This folder should have the directories `include` and `lib`.
2. Since the bootrom is copyright protected, you will need to install it yourself. You can install the boot ROM [here](https://gbdev.gg8.se/files/roms/bootroms/dmg_boot.bin) (WARNING: directly download link. If you want to download it manually, it is the file called `dmg_boot.bin` in [this folder](https://gbdev.gg8.se/files/roms/bootroms/), taken from [here](https://gbdev.gg8.se/wiki/articles/Gameboy_Bootstrap_ROM#Contents_of_the_ROMs)).
3. Dump the ROM file of whatever game you want to play to your computer. [GBxCart](https://www.gbxcart.com/) is an affordable cartridge dumper for the Gameboy that you can order on most online shopping websites. Downloading the ROM file from the internet is piracy and it is illegal to do.
4. Find the variables named `rom_loc` and `boot_rom_loc` and set the variables to the file location of the game rom file and the boot rom file, respectively.
5. Install [GNU make](https://www.gnu.org/software/make/) and run the command `make` in the folder you downloaded this repository.

You should have an exectuable called `gbemu` that you are able to run. If you have any issues, [open an issue](https://github.com/nishantc1527/gameboy/issues/new) on Github or email me at <nishantc1527@gmail.com>.

# References

All the technical research for this project was done from [this site](https://gbdev.io/pandocs/About.html). For implementing a cycle accurate CPU, I used [this](https://meganesu.github.io/generate-gb-opcodes/) opcode table. If you plan to make your own emulator, these are the only two resources that you need.
