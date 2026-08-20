#!/bin/bash
# Copy the pictures saved by the camera node from the robot to this computer.
#
# RUN THIS ON YOUR OWN COMPUTER, not on the robot.
#
#   ./get_images.sh duckie03                    # folder name taken from this repo
#   ./get_images.sh duckie03 other-folder       # if the folder on the robot differs
#
# Password is quackquack, unless you set up an SSH key.
set -e

ROBOT=${1:?usage: ./get_images.sh <robot name> [repo folder on the robot]}

# Default: the name of the folder this script sits in, which is your repo
# folder (team1, team2, ...) and normally the same name on the robot.
HERE=$(cd "$(dirname "$0")" && pwd)
REPO=${2:-$(basename "$HERE")}
DEST=./images_from_$ROBOT

mkdir -p "$DEST"
scp "duckie@$ROBOT.local:~/$REPO/images/*.jpg" "$DEST"/
echo "Pictures are in $DEST"
