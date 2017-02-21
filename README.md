# Install ArchLinux ARM

Script to automate installation of ArchLinux ARM to micro SD card.

The script is based on [CuBox-i Installation Process](https://archlinuxarm.org/platforms/armv7/freescale/cubox-i)
from ArchLinux ARM community web-site.

## Important

Script requires root permissions, or sudo rights.

Be careful, since **you will loose all your data** on the device which name is passed to the script:
 * Do a backup first!
 * Supply a correct device name!
 * You have 1 chance to interrupt the process.


## Usage

Run script with a device name as first parameter and follow the instructions.

```bash
$ sudo ./install_archlinux_cubox.sh sdb

Going to install ArchLinux (CuBox-i) on device '/dev/sdb'

All data on this device will be lost!
Do you want to continue? (y/N):
...
```

## Links

 * [ArchLinux ARM - CuBox-i page](https://archlinuxarm.org/platforms/armv7/freescale/cubox-i)
 * [How to install latest Kernel on Cubox-i & Hummingboard](http://forum.solid-run.com/viewtopic.php?p=8655#p8655)
