#!/bin/bash

if [[ $EUID -ne 0 ]]; then
	echo "Must be run as root"
	exit -1
fi

if [ -z $1 ]; then
	echo "Please provide a AVR GNU Toolchain filename."
	exit -2
fi

SRC=$1

echo "Installing AVR GNU Toolchain from $SRC to /opt"

tar -xvf "$SRC" -C /opt/

