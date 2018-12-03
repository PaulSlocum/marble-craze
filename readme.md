# Marble Craze

A game for the Atari 2600 console inspired by Atari's Marble Madness and Labyrinth, the wooden maze game played with steel marbles. Includes simultaneous two player mode, 18 levels, background music, hidden areas.  The game is written in 6507 assembly and is notable for its innovative music driver and use of dual-paddle controllers for each player. Reading analog paddle controllers on the Atari 2600 takes away from significant CPU time from graphics processing which made the game's display kernel design especially challenging.

![Mable Craze screenshot](images/mcScreenshot2.png)


## Playing The Game

Cartridges are available from [Atariage](https://atariage.com/software_page.php?SoftwareID=3699) and the ROM (marblecr.bin) can be played on the Stella emulator or on real Atari 2600 hardware using a Harmony Cart or similar.


### Building From Source

I use the DASM assembler to build the game, and there is also a C program included in the project that helps assemble the level data from text files.  More info on assembly coming soon...


## License

©2002-2018 Paul Slocum, All rights reserved.  Source, binary, and other files provided for personal use only.  Will likely eventually switch to an MIT license but I've had too many problems with people selling poor quality cartridges on ebay.

