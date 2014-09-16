#!/bin/bash
#Create temp directory
TEMP_DIR=`mktemp -d`
EMPTY_DIR=`mktemp -d`


CUR_DIR=`pwd`
IMAGES_DIR=$1
BOARD_DIR=${CUR_DIR}/board/cyberoam/cr15wi


BOOT_IMG=${HOST_DIR}/usr/lib/grub/i386-pc/boot.img
GRUB_IMG=${IMAGES_DIR}/grub.img
ROOTFS_IMG=${IMAGES_DIR}/rootfs.ext4

source ${BOARD_DIR}/genimage.tpl
echo -e ${GENIMAGE_CFG} > ${BOARD_DIR}/genimage.cfg

${HOST_DIR}/usr/bin/genimage --config ${BOARD_DIR}/genimage.cfg --tmppath=$TEMP_DIR --rootpath=${EMPTY_DIR} --outputpath=${IMAGES_DIR}

#Clean up
rm ${BOARD_DIR}/genimage.cfg
rmdir ${EMPTY_DIR}
rm -rf ${TEMP_DIR}
