#!/bin/sh
#Create temp directory
TEMP_DIR=`mktemp -d`


CUR_DIR=`pwd`
IMAGES_DIR=$1
BOARD_DIR=${CUR_DIR}/board/cyberoam/cr15wi

$HOST_DIR/usr/bin/genimage --config ${BOARD_DIR}/genimage.cfg --tmppath=$TEMP_DIR

#Clean up
rm -rf $TEMP_DIR
