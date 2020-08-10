#!/bin/bash

set -e

if [[ $EUID -ne 0 ]]; then
	echo "Must be run as root"
	exit -1
fi

if [ -z $1 ]; then
	echo "Please provide a AVR GNU Toolchain filename."
	exit -2
fi

if [ ! -f "$1" ]; then
	echo "Toolchain file \"$1\" not found"
	exit -3
fi

# Set the SRC path
SRC=$1

VER=`echo $SRC | awk -F"-" '{ print $4 }'`
NAME="avr8-gnu-toolchain-$VER"
DST="/opt/$NAME"

echo "Version: $VER"
echo "Name: $NAME"
echo "Destination: $DST"

if [ -d "$DST" ]; then
	echo "Destination folder exists.  Exiting."
	exit -1
fi

echo "Installing AVR GNU Toolchain version $VER to $DST"

echo "Extract installer to temp folder"
tar -xf "$SRC" -C /tmp/

echo "Creating install folder"
mkdir -p "$DST"

mv /tmp/avr8-gnu-toolchain-linux_x86_64/* "$DST/"
rm -rf /tmp/avr8-gnu-toolchain-linux_x86_64
