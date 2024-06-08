---
type: article
title: "Adding File Systems to the Tree"
date: "2011-06-03T22:51:53-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

To gain access to files on another device, you must first tell Linux where in the
directory tree you would like those files to appear. This process is called _mounting_ a
file system. For example, you will frequently need to access files from CD-ROM. In order
to do this, you must tell Linux, \"Take the file system from this CD-ROM and make it
appear under the directory /mnt.\" The directory given to Linux is called the _mount
point._ In this case it is /mnt. The /mnt directory exists on all Linux systems, and it
is intended specifically for use as a mount point for temporary media like floppy disks
or CDROMs. It may be empty, or it may contain subdirectories for mounting individual
devices.

Linux does not require you to use /mnt as the mount point for other file systems. You
may mount file systems anywhere in the directory tree. However, it is good practice to
create empty directories that are reserved as mount points. Linux will allow you to
mount a file system on a directory that is _not_ empty. Any files in that directory will
become invisible in the virtual file system. They will still exist on disk, but you will
be unable to access them until the file system that obscures them is unmounted. There
are rare cases where this might be desirable, but in general it can create unexpected
behavior and is not advisable. For these reasons, only the administrator may authorize
the mounting of file systems.

At least one and perhaps many file systems are automatically mounted by Linux at boot
time. The system administrator can control which file systems are mounted at boot time,
and can pre-determine the mount points for specific file systems. The sysadmin can also
designate some file systems that may be mounted by normal users, and can specify when
mounted file systems are checked for errors and backed up. All this information is
stored in the file /etc/fstab, which anyone can read to discover what file systems are
available and mountable by users.

## Quick Example

Let\'s take an example to show how this virtual file system is useful. Say that you are
in charge of maintaining a store of sales data for your company. There is a directory
called /finance. Under that exist directories called sales, purchases, etc. Under the
sales directory you have a subdirectory this_year representing sales for the current
fiscal year, which data is stored on the hard drive.. Last year\'s data has been
archived to a CD ROM. Thanks to the Linux virtual file system, you can create a
directory under sales called last_year and mount the archive CD-ROM on this directory.
Now all your sales data is available in one place! This is a very simplistic example,
but it does illustrate one advantage of the virtual file system.
