#!/bin/bash

# Exit on errors
set -e

FOLDER=$1
SIZE=$2

# Ask for image folder name if not passed as arg
if [ -z "$FOLDER" ]; then
    echo "Folder name containing images to convert:"
    read FOLDER
fi

# Set default size if not passed as arg
if [ -z "$SIZE" ]; then
    echo "What size (max length)?"
    read SIZE
    if [ "$SIZE" = "" ]; then
        SIZE=1000
    fi
fi

# Remove trailing slash from folder name, if it's there
FOLDER=${FOLDER%/}

# Exit if folder not found
[ ! -d "$FOLDER" ] && echo "Folder not found. Exiting." && exit

NEWFOLDER="${FOLDER}-${SIZE}w"

# Confirm before proceeding
echo "All images in '$FOLDER' will be copied to '$NEWFOLDER' and resized so the longest dimension is ${SIZE}px. Proceed? [Y/n]"
read INPUT
if [ "$INPUT" = "n" ] || [ "$INPUT" = "N" ]; then
    echo "Exiting..."
    exit
fi

# Copy images to new folder
mkdir "$NEWFOLDER" && scp -r $FOLDER/* $NEWFOLDER/

# Use imagemagick to resize JPGs & PNGs to (max length) $SIZE
find ${NEWFOLDER} -type f \( -iname \*.jpg -o -iname \*.png \) -exec convert \{} -verbose -resize $SIZEx$SIZE\> \{} \;

