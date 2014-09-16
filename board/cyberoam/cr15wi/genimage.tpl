GENIMAGE_CFG="image cfdisk.img {\n
hdimage{\n
	align=1M\n
}\n
partition boot {\n
	in-partition-table = \"no\"\n
	image = \"$BOOT_IMG\"\n
	offset = 0\n
	size = 512\n
}\n
	partition grub {\n
	in-partition-table = \"no\"\n
	image = \"$GRUB_IMG\"\n
	offset = 512\n
}\n
	partition rootfs {\n
	partition-type = 0x83\n
	image = \"$ROOTFS_IMG\"\n
}\n
}\n"
