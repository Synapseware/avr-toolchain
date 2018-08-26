avr-toolchain
=============

Contains snapshots and tools for building AVR projects against the new microcontrollers from Microchip.  You can read about their [c-compilers here](http://www.microchip.com/mplab/avr-support/avr-and-arm-toolchains-(c-compilers))

This repository contains a Makefile template as well, which you'll need to modify the path variables at the top so it can find the pack files, new AVR toolchain, etc.

# Installation
The goal is to extract the avr8 toolchain tarball to your `/opt` directory.  You can either rename the file so it's versioned, or leave it as the default from Microchip.  I'll assume you want a versioned installation.

	- Extract the avr8 toolchain tarball file `/opt`
	- Rename it from `/opt/avr8-gnu-toolchain-linux_x86_64` to `/opt/avr8-gnu-toolchain-3.6.1.1752`

# Pack files
Extract the included pack files, or [download](http://packs.download.atmel.com/) fresh ones from Microchip.  Ideally, these should be extracted to `/opt/avr/packs`.  They are simply zip files, so just extract with `zip {packfile} -d /opt/avr/packs`

# Usage
Copy the included Makefile to your source directory, taking care to rename it from `Makefile.example` to `Makefile`.  Update the paths accordingly.
