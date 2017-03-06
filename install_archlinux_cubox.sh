#!/bin/bash

device=$1
image="ArchLinuxARM-imx6-cubox-latest.tar.gz"

if [ -z "${device}" ]; then
	echo "Please define device name"
	echo "Usage:"
	echo "    $0 <device>"
	echo
	echo "Example:"
	echo "    $0 sdb"
	exit 1
fi

echo
echo "Going to install ArchLinux (CuBox-i) on device '/dev/${device}'"
echo
fdisk -l /dev/${device}

echo
echo "All data on this device will be lost!"
echo -n "Do you want to continue? (y/N): "

read confirm

if [ ! "${confirm}" = "y" ]; then
	echo "-- interrupted --"
	exit 2
fi

echo

if [ ! -f "${image}" ]; then
	echo "Downloading latest CuBox image..."
	wget http://os.archlinuxarm.org/os/${image}
fi

echo "Preparing device..."

umount /dev/${device}1
dd if=/dev/zero of=/dev/${device} bs=1M count=4

echo
echo
echo "Manually perform following steps:"
echo "  1. Type 'n', and press ENTER, accepting default values."
echo "  2. Type 'w' to write changes and exit."
fdisk /dev/${device}
mkfs.ext4 /dev/${device}1
mkdir -p root
mount /dev/${device}1 root
bsdtar -xpf ${image} -C root

echo "Installing U-Boot bootloader..."
dd if=root/boot/SPL of=/dev/${device} bs=1K seek=1
dd if=root/boot/u-boot.img of=/dev/${device} bs=1K seek=69

echo "Syncing..."
sync
umount root

echo "Done!"
