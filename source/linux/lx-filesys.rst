:description: Understanding how Linux organizes files.
:Author: Vince Veselosky
:Copyright: © 2011 Vince Veselosky
:Contact: vince@control-escape.com
:Date: 2011-06-03T22:51:16-0400

The Linux (Virtual) File System
================================================================================
Probably the most important difference (from the user's perspective) between
the DOS/Windows world and the Linux world is the organization and operation of
the file system.

Some ideas will seem very familiar, and others will seem completely alien, but
with a good understanding of the Linux file system, you have the skill to
avoid some of the most common problems experienced by new Linux users.

.. _linux-intro-filesystem-what-is-filesystem:

What is a file system?
********************************************************************************
Ever go looking for a book in the library? In order to find what you're
looking for, you must understand the library's file system, or method of
organization. Fiction books are easy, they use a simple type of file system
commonly known as alphabetical by author.  Nonfiction books can be tougher
because they use a different type of file system, the Dewey Decimal System.
What if you don't understand the Dewey Decimal System? What if you only know
the title of a book and you don't know whether it's fiction or non-fiction?
How can we find our book now? Luckily there is a librarian to help us, and she
has created a card catalog (or in most libraries now, a computerized catalog)
listing all the books available and where to find them.

Now, picture your computer as the library. Like the library, your computer can
have different file systems. The operating system is your librarian, who has
provided the directory tree (also referred to as *the* file system) as a
catalog of the files available.

Both Windows and Linux use a *hierarchical* directory structure. The hierarchy
of the file system begins at the *root directory*, called "/" (slash) on Linux
and "\\" (backslash) on DOS/Windows. Beneath or inside the root directory
there may be files and other directories. Each directory may contain files and
other directories, and so on.

Unfortunately, the world of computers is not as standardized as our libraries.
In computers, every librarian or operating system has its own type of file
system, and other operating systems often don't know how to read it. Lucky for
us, Linux is a versatile operating system and it *does* understand the file
system used by Windows.

.. _linux-intro-filesystem-everything-is-a-file:

In Linux, *Everything* Is a File
********************************************************************************
The key insight you need to understand is that in Linux, *everything* is a
file, and all files can be found in a single, unified directory hierarchy,
also known as *the* file system.

Typically one device will have one file system. For example, each floppy disk
(remember those?) or CD-ROM contains a file system. Your operating system can
give you access to these file systems.

Under Windows, each file system/device (the division between the device and
the file system that resides on it is not clear in Windows) is assigned a
device name, a drive letter. The first floppy drive is always drive A:, the
first hard drive partition is always drive C:, other devices may receive
different letter depending how many you have and what type they are. These
file systems are all separate from each other, each having its own root
directory and hierarchy. The only way to access the files on one of these
devices is by specifying the drive letter. Unfortunately, these drive letters
are not *fixed*. When you plug an external drive into your Windows machine,
you can't be sure what letter it's going to get, and that can sometimes be
annoying.

Linux assigns a name to each device too, but this is not how the files on that
device are accessed. There are no drive letters in Linux. Instead, Linux
creates one unified Virtual File System for us, which makes all the files on
*all* devices appear to exist on one global device. In Linux, there is *one*
root directory, and every file you have access to is located under it
somewhere. Furthermore, the Linux root directory does not have to be on any
particular device. It might not be on your first hard drive. It might not even
be on your own computer! Linux can use a network shared resource as its root
directory.

You're probably familiar with the concept of your data being saved in a file
(like a text document or a picture). You may also know (but not necessarily
care) that all the programs you run are also stored in files. Under Linux, all
the internals of your running operating system exist in files in the file
system.

