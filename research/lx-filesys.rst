

The Linux (Virtual) File System
================================================================================
:author: Vince Veselosky
:description: Understanding how Linux organizes files.

The Linux (Virtual) File System
================================================================================

Probably the most important difference (from the user's
perspective) between the DOS/Windows world and the Linux world is the
organization and operation of the file system. Some ideas will seem
very familiar, and others will seem completely alien, but with a good
understanding of the Linux file system, you have the skill to avoid
some of the most common problems experienced by new Linux users.

----

What is a file system?
********************************************************************************

Ever go looking for a book in the library? In order to find what
you're looking for, you must understand the library's file system, or
method of organization. Fiction books are easy, they use a simple
type of file system commonly known as alphabetical by author.
Nonfiction books can be tougher because they use a different type of
file system, the Dewey Decimal System. What if you don't understand
the Dewey Decimal System? What if you only know the title of a book
and you don't know whether it's fiction or non-fiction? How can we
find our book now? Luckily there is a librarian to help us, and she
has created a card catalog (or in most libraries now, a computerized
catalog) listing all the books available and where to find them. 

Now, picture your hard drive as the library. Like the library,
your hard drive can have different file systems. The operating system
is your librarian, who has provided the directory tree (sometimes
also referred to as "the file system", with a slightly
different meaning) as a catalog of the files available. 

Unfortunately, the world of computers is not as standardized as
our libraries. In computers, every librarian or operating system has
its own type of file system, and other operating systems often don't
know how to read it. Lucky for us, Linux is a versatile operating
system and it does understand the file system used by Windows 95 &
Windows 98.

----

How The Linux File System Is Different
********************************************************************************

Typically one device will have one file system. (There are many
exceptions to this rule, however.) For example, each floppy disk or
CD-ROM contains a file system. Your operating system can give you
access to these file systems. DOS/Windows and Linux, like all modern
operating systems, use a hierarchical directory structure. The
hierarchy of the file system begins at the *root directory*,
called "/" (slash) on Linux and "\" (backslash)
on DOS/Windows. Beneath or inside the root directory there may be
files and other directories. Each directory may contain files and
other directories, and so on. 

Under DOS/Windows, each file system/device (the division between
the device and the file system that resides on it is not clear in
DOS/Windows) is assigned a device name, a drive letter. There is very
little flexibility for assigning drive letters. The first floppy
drive is always drive A:, the first hard drive partition is always
drive C:, etc. These file systems are all separate from each other,
each having its own root directory and hierarchy. The only way to
access the files on one of these devices is by specifying the drive
letter. 

Linux also assigns a device name to each device, but this is not
how the files on that device are accessed. There are no drive letters
in Linux. Instead, Linux creates a Virtual File System for us, which
makes all the files on all the devices appear to exist on one global
device. In Linux, there is *one* root directory, and every file
you have access to is located under it somewhere. Furthermore, the
Linux root directory does not have to be in any particular place. It
might not be on your first hard drive. It might not even be on your
computer. Linux can use a network shared resource as its root
      directory.

----

Adding File Systems to the Tree
********************************************************************************

(For instructions on how to do this, see `Getting
to CD's and Floppies <lx-mounting.html>`_.)
To gain access to files on another
device, you must first tell Linux where in the directory tree you
would like those files to appear. This process is called *mounting*
a file system. For example, you will frequently need to access files
from CD-ROM. In order to do this, you must tell Linux, "Take the
file system from this CD-ROM and make it appear under the directory
/mnt." The directory given to Linux is called the *mount
point.* In this case it is /mnt. The /mnt directory exists on all
Linux systems, and it is intended specifically for use as a mount
point for temporary media like floppy disks or CDROMs. It may be
empty, or it may contain subdirectories for mounting individual
devices. 

Linux does not require you to use /mnt as the mount point for
other file systems. You may mount file systems anywhere in the
directory tree. However, it is good practice to create empty
directories that are reserved as mount points. Linux will allow you
to mount a file system on a directory that is *not* empty. Any
files in that directory will become invisible in the virtual file
system. They will still exist on disk, but you will be unable to
access them until the file system that obscures them is unmounted.
There are rare cases where this might be desirable, but in general it
can create unexpected behavior and is not advisable. For these
reasons, only the administrator may authorize the mounting of file
systems. 

At least one and perhaps many file systems are automatically
mounted by Linux at boot time. The system administrator can control
which file systems are mounted at boot time, and can pre-determine
the mount points for specific file systems. The sysadmin can also
designate some file systems that may be mounted by normal users, and
can specify when mounted file systems are checked for errors and
backed up. All this information is stored in the file /etc/fstab,
which anyone can read to discover what file systems are available and
      mountable by users.

----

Quick Example
********************************************************************************

Let's take an example to show how this virtual file system is
useful. Say that you are in charge of maintaining a store of sales
data for your company. There is a directory called /finance. Under
that exist directories called sales, purchases, etc. Under the sales
directory you have a subdirectory this_year representing sales for
the current fiscal year, which data is stored on the hard drive..
Last year's data has been archived to a CD ROM. Thanks to the Linux
virtual file system, you can create a directory under sales called
last_year and mount the archive CD-ROM on this directory. Now all your
sales data is available in one place! This is a very simplistic
example, but it does illustrate one advantage of the virtual file
system.

