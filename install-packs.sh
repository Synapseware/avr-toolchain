#!/bin/bash

# Extracts all the atpack files that exist in the given directory (or the current directory)
# to /opt/avr/packs.  Point your Makefile to /opt/avr/packs, and give the device family
# and pack version.  For example, if you have /opt/avr/packs/Atmel.ATtiny_DFP.1.3.172/, then
# the family is "ATtiny" and the version is "1.3.172".

set -e

if [[ $EUID -ne 0 ]]; then
	echo "Must be run as root"
	exit -1
fi

SRC=
if [ -z $1 ]; then
	echo "Path not specified, looking for atpack files in $PWD"
	SRC=$PWD/packs
else
	SRC=$1
fi

# Ensure the packs directory
[ ! -d "/opt/avr/packs" ] && mkdir -p /opt/avr/packs

# Enumerate the atpack files
echo "Looking for atpack files in $SRC"

for entry in $SRC/*.atpack
do
	NAME=$(basename "$entry")
	EXT=${NAME##*.}
	PACK=${NAME%.*}

	OUTDIR=/opt/avr/packs/$PACK
	if [ -d "$OUTDIR" ]; then
		echo "Skipping pack $PACK"
		continue
	fi

	#echo "unzip \"$entry\" -d \"$OUTDIR\""
	echo "Extracting pack $NAME to $OUTDIR"

	unzip $entry -d $OUTDIR
done
