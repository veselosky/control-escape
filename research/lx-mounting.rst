

Accessing CD's and Floppies from Linux
================================================================================
:author: Vince Veselosky
:description: How to access files on floppy disks, cdroms, and other drives from within Linux.
:keywords: Linux,CD-ROM,floppy

Getting to CD's and Floppies
================================================================================

Background
********************************************************************************

One of the first things you'll need to do after you're up and running is
access programs and documentation on CDROMs. But where the heck are they?
There's no D: drive! There's not even a C: drive!

If you don't know why there's no C: drive, you need to read about `The Linux (Virtual) File System <lx-filesys.html>`_ before you try this.
If you don't understand how the file system works, you're very likely to
destroy something.

Before you can access files on a floppy, CD-ROM, zip drive, or any other device
(including your hard drive), you need to tell Linux where in the directory
tree you would like those files to appear. This process is called "mounting"
the file system. Please note that you do not mount a *device*,
you mount a *file system* that resides on the device. 
Also note that when you are
done using it you should unmount the file system. Most new CD-ROM
drives will not
eject the disc until it has been unmounted. Oddly, the command to unmount a
drive is not "unmount", it is "umount" (without the "n"). I can't explain
it.

----

The`` mount ``Command
********************************************************************************

The simplest way to get something mounted is at the command line. You use the
command mount &lt;device name> &lt;mount point>. For example, to mount my
CD-ROM drive from the command line:

``[root]# mount /dev/hdc /mnt/cdrom``

This tells Linux to take the file system found on device /dev/hdc and cause it
to appear as part of the Linux file system in the directory /mnt/cdrom. We
could have specified the type of file system to be found on /dev/hdc, but
since we did not, Linux will try to automatically detect it.

There are a few items of note here. First, I performed this operation as root.
When mounting drives this way, you will usually need to be `SuperUser <lx-postinstall.html#user>`_. There are ways to allow normal
users to mount drives, but this will be covered later. Second, the mount point
/mnt/cdrom is a directory that already exists on my hard drive. If the mount
point does not exist, you will get an error. Most distributions include a
directory called /mnt that is intended for this purpose. Third, you should
make special directories just for mounting devices, and leave them empty.
Technically you can mount your cdrom anywhere in the directory tree, even a
directory that is not empty. However, any files in that directory will become
invisible in the virtual file system. They will still exist on disk, but you
will be unable to access them until the file system that obscures them is
unmounted. There are rare cases where this might be desirable, but in general
it can create unexpected behavior and is not advisable. For example, If you
mount your CD-ROM at /usr, you'll lose access to most of your installed
programs.

Where does &lt;device name> come from?
--------------------------------------------------------------------------------

The most common type of hard drives and CDROMs in personal computers are IDE
drives. These drives require a controller, and there can only be two drives
per controller, a Master and a Slave. Most PCs made in recent years have two
IDE controllers built in, a Primary and a Secondary, which allows you to
install up to four IDE devices. Each IDE device under Linux has a fixed device
name.

<table border="1" cellspacing="2" cellpadding="2">
<thead>
<tr>
<th>
Device Name

</th>
<th>
IDE Controller

</th>
<th>
Drive Designation

</th>
</tr>
</thead>
<tbody>
<tr>
<td>
``/dev/hda``

</td>
<td>
Primary

</td>
<td>
Master

</td>
</tr>
<tr>
<td>
``/dev/hdb``

</td>
<td>
Primary

</td>
<td>
Slave

</td>
</tr>
<tr>
<td>
``/dev/hdc``

</td>
<td>
Secondary

</td>
<td>
Master

</td>
</tr>
<tr>
<td>
``/dev/hdd``

</td>
<td>
Secondary

</td>
<td>
Slave

</td>
</tr>
</tbody>
</table>

CD-ROM drives typically ship from the factory as the Secondary Master device,
/dev/hdc. Occasionally you will find one slaved to the hard drive as
/dev/hdb.

Remember, to unmount a drive, type "``umount``"! There is no "n"!

The mount command will accept many options, but the defaults will do for quick
mounts. For details, read the `man page <lx-reading.html>`_. For devices
that you mount frequently like CD-ROM drives and floppy drives, you can store
default mount settings in a special file, /etc/fstab (File System TABle).

----

The File System Config File: /etc/fstab
********************************************************************************

This is a plain text file that stores default mount settings for various file
systems. When Linux is booting up, it uses the settings in this file to
determine what file systems should be mounted automatically. It is laid out in
columns, like a table as the name suggests. Although there are various tools
that can be used to edit this file (see linuxconf below), it can also be
edited with any text editor. Let's take a look at mine:

<table border="0" cellspacing="2" cellpadding="4">
<thead>
<tr valign="top">
<td nowrap="nowrap">

``# Device``

</td>
<td nowrap="nowrap">

``Mount Point``

</td>
<td nowrap="nowrap">

``FS Type``

</td>
<td nowrap="nowrap">

``Mount Options``

</td>
<td nowrap="nowrap">

``Dump``

</td>
<td nowrap="nowrap">

``Check``

</td>
</tr>
</thead>
<tbody>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/hda2``

</td>
<td valign="top" nowrap="nowrap">

``/``

</td>
<td valign="top" nowrap="nowrap">

``ext2``

</td>
<td valign="top" nowrap="nowrap">

``defaults``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``1``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``1``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/hda6``

</td>
<td valign="top" nowrap="nowrap" width="19%">

``/home``

</td>
<td valign="top" nowrap="nowrap">

``ext2``

</td>
<td valign="top" nowrap="nowrap">

``defaults``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``1``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``2``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/hda5``

</td>
<td valign="top" nowrap="nowrap">

``swap``

</td>
<td valign="top" nowrap="nowrap">

``swap``

</td>
<td valign="top" nowrap="nowrap">

``defaults``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/fd0``

</td>
<td valign="top" nowrap="nowrap">

``/mnt/floppy``

</td>
<td valign="top" nowrap="nowrap">

``ext2``

</td>
<td valign="top" nowrap="nowrap">

``noauto``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/fd0``

</td>
<td valign="top" nowrap="nowrap">

``/mnt/a``

</td>
<td valign="top" nowrap="nowrap">

``vfat``

</td>
<td valign="top" nowrap="nowrap">

``noauto``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/cdrom``

</td>
<td valign="top" nowrap="nowrap">

``/mnt/cdrom``

</td>
<td valign="top" nowrap="nowrap">

``iso9660``

</td>
<td valign="top" nowrap="nowrap">

``noauto,ro``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/hda7``

</td>
<td valign="top" nowrap="nowrap">

``/share``

</td>
<td valign="top" nowrap="nowrap">

``vfat``

</td>
<td valign="top" nowrap="nowrap">

``user,rw,exec,uid=500``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``/dev/hda1``

</td>
<td valign="top" nowrap="nowrap">

``/win ``

</td>
<td valign="top" nowrap="nowrap">

``vfat``

</td>
<td valign="top" nowrap="nowrap">

``noauto,user,ro``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
<tr>
<td valign="top" nowrap="nowrap">

``none``

</td>
<td valign="top" nowrap="nowrap">

``/proc``

</td>
<td valign="top" nowrap="nowrap">

``proc``

</td>
<td valign="top" nowrap="nowrap">

``defaults``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
<td valign="bottom" nowrap="nowrap"><p align="right">
``0``

</td>
</tr>
</tbody>
</table>

I have added a comment line at the top to serve as column headers. Let's
examine them one at a time.

The first column lists the device where the file system may be found. As you
can see, there are entries for more than just a CD-ROM and floppy drive. Since
this is a dual boot system running both Linux and Windows 95, I have a lot of
hard drive partitions that need to be mounted as well. Notice that the last
entry has a device of "none". That's because the /proc file system is not
really a device, but a window into the Linux kernel itself. The files found
there don't exist on disk, but are generated by Linux to provide information
about itself. Also notice that I have two separate entries for /dev/fd0 (the
floppy drive), using different information in the other columns. More on this
later.

The second column lists the place in the directory tree where its contents
will appear. Remember that this directory must already exist on your drive or
you will receive an error and the mount will fail. The sole exception to this
is the partition set aside as "swap" space. This is hard drive space that
Linux uses as virtual memory when there is not enough physical memory to
handle all the running programs. It is not actually mounted anywhere in the
Virtual File System (VFS), but is listed here for informational purposes.
Don't mess with it.

The third column lists the type of file system that lives on the device. The
"ext2" file system is the native file system for Linux. My root (/) and /home
partitions are of this type. I also have several "vfat" (Windows 95) file
systems. I use these to share files between my Windows and Linux
installations. The file system type for any and all CDROMs is "iso9660". The
"swap" and "proc" file system types are special cases, as described above. The
only other file systems you might run into are "msdos" (obvious) and "minix",
which is sometimes used for boot floppies because it is more efficient on
small file systems than ext2.

The fourth column is a comma separated list (no spaces!) of any options you
wish to enable when the file system is mounted. For a complete list of
options, check the man page for mount. The most common options are shown here.
"Defaults" is usually fine for file systems that are mounted at boot time.
However, for removable media, you should use the "noauto" option to prevent
Linux trying to mount this at boot time. You may also want normal users to be
able to mount and unmount the media (rather than just root), so include the
option "user". By default, user mountable file systems are mounted with the
implicit options "ro,noexec", which means it is read only and no programs can
be run from that file system. You should include "rw,exec" if you want users
to have full access. The "uid=" option is only used for vfat or msdos file
systems. Since ownership information is not stored on these file systems, this
option tells Linux who the owner will be. Without this option, the file system
is owned by whoever mounted it, or root if it was mounted automatically. The
/share file system shown here will always be owned by user 500, me.

The fifth column is used by the dump command to determine what needs to be
backed up. One means back it up, zero means don't.

The last column is used by fsck to determine what file
systems to check for errors and in what order when Linux boots. A value of
zero means the file system will not be checked automatically (floppies and
CDROMs should not be checked). The root file system should be given a value of
1, and others should get 2.

Notice how I have two separate entries for /dev/fd0, the floppy drive. This is
because there are two types of floppies I may want to use, those formatted
under Linux and those formatted under Windows. Formatted "vfat" diskettes, get
mounted on /mnt/a while ext2 diskettes get mounted on /mnt/floppy. It is not
strictly necessary to have these entries, but I have done it for convenience.
You see, if you use the mount command but give it only one parameter (e.g.
``mount /mnt/a`` ), mount searches the /etc/fstab for an entry that
matches the parameter, either in the device column or the mount point column.
If it finds one, it uses the settings listed. If there are multiple listings
that match, it uses the *first* one from
the top. So if I type "``mount /dev/fd0``", Linux will try to mount an
ext2 file system. If the floppy was formatted for Windows, it will fail with
an error because it is the wrong file system type.

----

linuxconf
********************************************************************************

linuxconf is your best tool for system configuration. Any time you have to
pull some kind of administrative duty, you can pretty much trust that
linuxconf can do it for you. First off, you must be SuperUser to do this. If
you don't know what SuperUser is (or don't remember how to become one), you
need to read `Post Install <lx-postinstall.html>`_.

``[root]# linuxconf``

Select the Config menu. Select File Systems. Select Access local drive. You
should now be viewing a list of mounted file systems. Select Add. Now we fill
out the form.

``Partition:``
--------------------------------------------------------------------------------

``/dev/hdc ``If your CDROM drive is the master drive on the second IDE
controller. I think this is the most common setting.

``/dev/hdb ``If your CD-ROM is slaved to the hard drive on the primary
IDE controller. If your option doesn't appear on the list, type it in.

``Type:``
--------------------------------------------------------------------------------

``iso9660 ``The same for all CDROM's. Just select it from the
list.If this option isn't on the list, you'll probably have to recompile the kernel
or something. Don't ask me how to do that. When it happened to me, I just
reinstalled Linux from the CD.

``Mount point:``
--------------------------------------------------------------------------------

``/mnt/cdrom ``Probably already exists on your system specifically for
this purpose. If not, linuxconf will create it.

Now select Options and choose`` Read Only ``and`` User Mountable``.
Set Dump Frequency and Fsck Priority both to 0 (zero). Select Accept.

Now your system knows all about how to mount the CDROM... but it still hasn't
done it. To actually mount it, type:

``[root]# mount /mnt/cdrom``

Now the contents of the CD-ROM will appear in the folder /mnt/cdrom.

