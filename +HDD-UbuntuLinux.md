# Adding a hard drive to Ubuntu22/Linux 

## First
Connect your _new_ hard drive to the mother board using the data a SATA III Data signal cable (small one) and the power cable (large one). 
<img src="https://github.com/ricardoi/cheatsheets/blob/master/figures/SATAcabling.jpg"  width="600" height="400">
## Second
Find out the name of your new hard drive 
```bash
$ ls /dev/sd*
``` 

It will display all your hard drives in your computer as sata drive (sd) `a` and `a1`, the physical and the system files. 
```bash
/dev/sda  /dev/sda1  /dev/sdb
```
> Here we haven't created the systems files, so there aren't in display.

`/dev/sdb` is the new hdd, but first **unmount** it to reformat it to Ubunut/Linux compatible formats: ext4, FAT32, or NTFS file system.
```bash
$ sudo umount /dev/sdb
```
and then proceed to format it with `mkfs`, probably you need first to `apt install xfsprogs`
```bash
$ sudo mkfs -t ext4 /dev/sdb
```
To prepare the partitions and 
To read the new device you should type `fdisk` for devices smaller than 2 Tb or `parted` for larger volumes
```bash
$ sudo fdisk /dev/sdb
```
**OR** 
```bash
$sudo parted /dev/sdb
## It will prompt a new interface
# start with
(parted) print
Model: ATA ST10000NE0008-2P (scsi)
Disk /dev/sdb: 10.0TB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 
```
In the same window you can create a partition o multiple partitions, in my case I will create two partitions, one with 25% of the hdd capacity for raw data and the other 75% for databases 
```bash
(parted) mkpart
Partition name []? data2 
File system type? [ext2]? ext4 # I want ext4
Start? 0% # type 0%
End? 25% 
(parted) mkpart
Partition name?  []? DBs
File system type?  [ext2]? ext4                                           
Start? 26%                                                                
End? 100%                                                                 
(parted) print                                                            
Model: ATA ST10000NE0008-2P (scsi)
Disk /dev/sdb: 10.0TB
Sector size (logical/physical): 512B/4096B
Partition Table: gpt
Disk Flags: 

Number  Start   End     Size    File system  Name   Flags
 1      1049kB  2500GB  2500GB  ext4         data2
 2      2600GB  10.0TB  7401GB  ext4         DBs
```

After creating the partitions, we need to create a file systems on each partitio to be readed by the OS
```bash
$sudo mkfs.xfs /dev/sdb1
meta-data=/dev/sdb1              isize=512    agcount=4, agsize=152600512 blks
         =                       sectsz=4096  attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=0 inobtcount=0
data     =                       bsize=4096   blocks=610402048, imaxpct=5
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=298047, version=2
         =                       sectsz=4096  sunit=1 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
$sudo mkfs.xfs /dev/sdb2
meta-data=/dev/sdb2              isize=512    agcount=7, agsize=268435455 blks
         =                       sectsz=4096  attr=2, projid32bit=1
         =                       crc=1        finobt=1, sparse=1, rmapbt=0
         =                       reflink=1    bigtime=0 inobtcount=0
data     =                       bsize=4096   blocks=1806790656, imaxpct=5
         =                       sunit=0      swidth=0 blks
naming   =version 2              bsize=4096   ascii-ci=0, ftype=1
log      =internal log           bsize=4096   blocks=521728, version=2
         =                       sectsz=4096  sunit=1 blks, lazy-count=1
realtime =none                   extsz=4096   blocks=0, rtextents=0
```
Now each partition is visible to Ubuntu, check the added volumes
```bash
ls /dev/sd*
/dev/sda  /dev/sda1  /dev/sdb  /dev/sdb1  /dev/sdb2
```
> Here we created the systems files, so they are in display!!

However, the volumes are root owned, so you need to change the group and permissions to write and read.
```bash
$sudo chgrp adm /media/new_hdd2
$sudo chdmod g+w /media/new_hdd2
```

Enjoy your extra hard drive space!!
