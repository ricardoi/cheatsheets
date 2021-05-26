### HOW TO MAKE A BOOTABLE USB STICK FROM AN ISO FILE ON AN APPLE MAC OS X

This quick step by step will show you how to make a bootable USB stick from a downloaded ISO image file using an Apple Mac OS X.

> Note: this procedure requires an .img file that you will be required to create from the .iso file you download.

Tip: Drag and Drop a file from Finder to Terminal to 'paste' the full path without typing and risking typos.

Download the desired file
Open the Terminal (in /Applications/Utilities/ or query Terminal in Spotlight)
Convert the `.iso` file to `.img` using the convert option of hdiutil:
```bash
hdiutil convert -format UDRW -o /path/to/target.img /path/to/source.iso
```
> Note: OS X tends to put the .dmg ending on the output file automatically. Rename the file by typing:
```bash
mv /path/to/target.img.dmg /path/to/target.img
```
> Run diskutil list to get the current list of devices
> Insert your flash media
> Run diskutil list again and determine the device node assigned to your flash media (e.g. /dev/disk2)
> Run diskutil unmountDisk `/dev/diskN` (replace N with the disk number from the last command - in the previous example, N would be 2)
#### Execute 
```bash
sudo dd if=/path/to/downloaded.img of=/dev/rdiskN bs=1m
``` 
> (replace `/path/to/downloaded.img` with the path where the image file is located; for example, `./ubuntu.img` or `./ubuntu.dmg`).
> Note: Using /dev/rdisk instead of /dev/disk may be faster.
> Note: If you see the error dd: Invalid number '1m', you are using GNU dd. Use the same command but replace bs=1m with bs=1M.
> Note: If you see the error dd: /dev/diskN: Resource busy, make sure the disk is not in use. Start the 'Disk Utility.app' and unmount (don't eject) the drive.
> Run diskutil eject /dev/diskN and remove your flash media when the command completes
> Now the USB stick is ready. Boot the device that you want from the USB stick.

