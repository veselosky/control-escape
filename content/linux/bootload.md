---
type: article
title: "Choosing a Boot Loader"
date: "2011-06-04T21:57:51-0400"
tags:
  - outdated
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
  outdated: true
---

Every operating system provides a tiny program called a boot loader whose job is to load
the rest of the operating system into your computer\'s memory at boot time. It is
typical of the Linux personality that it gives you a choice of boot loaders.

If you will be running Linux on a computer by itself, there is no need to read any
further, you want to use LILO as your boot loader. You can skip ahead to the section
about LILO. If you are planning for Linux to share your computer with Windows, DOS, or
another operating system, your choice will involve a little more discrimination.

When setting up a multiple boot PC with Linux, you have three choices about how to get
it loaded: LILO, Loadlin, or floppy. Let\'s examine each separately.

## LILO, the Linux Loader

Although opinions vary, LILO is certainly the most popular boot loader for Linux. It
resides on your hard drive, and at boot time it presents you with a \"boot prompt\"
where you can choose an operating system to boot, choose a particular Linux kernel to
load, and pass special parameters to the Linux kernel when it is loaded. LILO is fast,
flexible, and independent, since it does not require any other operating system to be
present. This makes it the loader of choice for Linux-only systems.

LILO does have a few limitations, however, which means it is not perfect for everyone.
For starters, LILO can install itself in two places on your hard drive: the _boot
sector_ of a partition ([what's a partition?](/linux/lx-partition)), or the _master boot
record_ of the hard drive. The master boot record is the place on your hard drive that
your computer\'s BIOS looks for the _bootstrap_ program that will load your operating
system. This can be LILO, or it can be the DOS (and Windows) boot loader. If there is no
other operating system present, LILO will have to be in the master boot record. However,
some operating systems, notably Windows NT, don\'t like for the master boot record to be
altered. Also, some disk utilities will see the master boot record as \"corrupted\" and
will kindly \"fix\" it for you, thus erasing LILO and preventing you from booting Linux.

If you run into problems like this, you can install LILO into the boot sector of the
Linux partition, and allow the DOS boot loader to live in the master boot record. In
order to boot Linux, you will need to use the DOS version of fdisk to set the Linux
partition \"active\" and reboot your PC to get into Linux. This is of course a big pain.

Another limitation of LILO is that it uses only your PC\'s BIOS to access your hard
drive. While this is not normally a problem, some new hard drives are so big that the
PC\'s BIOS may have difficulty reading it all. (This is due to a limitation in the BIOS
itself that goes back to the original IBM PC.) The short explanation is that, due to
this limitation, all of the files LILO needs to access must reside within the first 1024
cylinders of your hard drive. For a modern LBA BIOS, that means under the 8GB mark.

If you have an especially large hard drive and your other operating system already takes
up more space than this, you may need to jump through some hoops to get LILO to work.
You will either need to repartition your drive so that Linux can have a partition within
the first 1024 cylinders, or you will need to install Linux (not LILO, but Linux) onto a
second hard drive, again within the first 1024 cylinders. LILO is capable of loading
Linux from a second hard drive with the same limitations.

LILO Pros:

- Installing to the master boot record makes booting very fast.
- Gives you an option at boot time to choose an operating system.

LILO Cons:

- Some utilities or operating system installation programs might overwrite the master
  boot record, erasing LILO. You will then need an alternate method of booting Linux to
  repair LILO.
- All files needed by LILO must reside in the first 1024 cylinders (8GB) of the drive.

## Booting Linux with Loadlin

For those who cannot use LILO because of its limitations, or those who will spend the
majority of their time in Windows and very little using Linux, Loadlin is an excellent
alternative. Loadlin is a utility that runs under DOS. It loads the Linux kernel into
memory right on top of DOS. All of Loadlin\'s files, including the Linux kernel itself,
reside on your DOS partition. Like LILO, Loadlin allows you to pass parameters to the
Linux kernel at load time. But because it uses the operating system driver rather than
the BIOS to read the hard drive, there is no 1024 cylinder limit as with LILO.

Of course, the main disadvantage of Loadlin is that you must boot to DOS before you can
load Linux. If you are running Windows 95/98, that means you will have to reboot to
MS-DOS mode, or make changes to the Windows configuration so that it goes there by
default. And whereas most Linux distributions will install LILO for you, saving you the
trouble of the initial configuration, with Loadlin you are usually left to do it all on
your own.

I find that Loadlin makes an excellent \"backup\" bootloader. Normally I use LILO, but
if LILO ever fails because some program clobbered my master boot record, it is nice to
be able to just load Linux from within DOS to repair the damage rather than digging at
the bottom of the closet trying to find that boot floppy!

Loadlin Pros:

- No 1024 cylinder limit.
- Does not alter the master boot record of your hard drive.

Loadlin Cons:

- Requires DOS to load before Linux every time.
- Usually requires manual configuration.

## Booting Linux from Floppy Disk

Booting from floppy is the slowest but most reliable method, the least common
denominator for boot loaders. Loading the Linux kernel from floppy disk means taking a
couple of extra minutes to boot the system, but once it is loaded all your normal Linux
programs will run from the hard drive, so your system performance will not suffer. The
small size of the disk might limit the capabilities of your Linux kernel, which can grow
quite large if you like to experiment, but most of the \"stock\" kernels shipping with
current Linux distributions will fit on a floppy without any trouble.

Of course floppies are easily lost or damaged, so you\'d better have more than one! On
the other hand, there are no cylinder limitations on floppy disks, and you don\'t have
to worry about your master boot record at all. It\'s a good idea to keep a boot floppy
around for emergencies, but I would not use this method regularly unless it is
absolutely necessary.

Boot Floppy Pros:

- No 1024 cylinder limit.
- Does not alter the master boot record of your hard drive.

Boot Floppy Cons:

- Extremely slow to load.
- Limits the size of kernel you can boot.
- Floppy disks are easily lost or damaged.
