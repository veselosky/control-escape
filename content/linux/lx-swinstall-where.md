---
type: article
title: "Where did the files go?"
description: "Where do program files go when you install new Linux software?"
date: "2011-06-03T22:01:11-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

After you have installed your software, you may be left asking, _Now what?_

You are probably staring at a command prompt or a message saying your software package
has been installed. But where did it go? How do you start the program? This is one of
those mystical Linux moments when you realize that you are a fish and this is not the
water you are used to.

If you are using a graphical desktop (KDE or Gnome), the good news is that your newly
installed program probably also has a newly installed icon and entry in your programs
menu. The bad news is that the menu is so large and poorly organized on most systems
that you may not be able to find it.

On the other hand, if you were installing a server or a command line utility, you
probably will not find it in your menu no matter how hard you look. So let\'s take a
quick tour to find out where files live on your Linux system. (You may first want to
read about the [Linux Virtual File System](/linux/lx-filesys) for some background.)

## User Programs (binaries)

### `/bin` - Essential user commands

The `/bin` directory contains essential commands that every user will need. This
includes your login shell and basic utilities like `ls`. The contents of this directory
are usually fixed at the time you install Linux. Programs you install later will usually
go elsewhere (read on).

### `/usr/bin` - Most user commands

The `/usr` hierarchy contains the programs and related files meant for users. (The
original Unix makers had a thing for abbreviation.) The `/usr/bin` directory contains
the program binaries. If you just installed a software package and don\'t know where the
binary went, this is the first place to look. A typical desktop system will have _many_
programs here.

### `/usr/local/bin` - \"Local\" commands

When you compile software from source code (see
[Installing from Source](/linux/lx-swinstall-tar)), those install files are usually kept
separate from those provided as part of your Linux distribution. That is what the
`/usr/local/` hierarchy is for.

## System Administration Programs (binaries)

### `/sbin` - Essential System Admin Commands

The `/sbin` directory contains programs needed by the system administrator, like `fsck`,
which is used to check file systems for errors. Like `/bin`, `/sbin` is populated when
you install your Linux system, and rarely changes.

### `/usr/sbin` - Non-essential System Administration Programs (binaries)

This is where you will find commands for optional system services and network servers.
Desktop tools will not show up here, but if you just installed a new mail server, this
is where to look for the binaries.

### `/usr/local/sbin` - \"Local\" System Administration Commands

When you compile servers or administration utilities from source code (see
[Installing from Source](/linux/lx-swinstall-tar)), this is where the binaries normally will
go.

## Libraries

Libraries are shared bits of code. On Windows these are called `DLL` files (Dynamic
Loading Libraries). On Linux systems they are usually called `SO` (Shared Object) files.
As to location, are you detecting a pattern yet? There are three directories where
library files are placed: `/lib`, `/usr/lib`, and `/usr/local/lib`.

## Documentation

Documentation is a minor exception to the pattern of file placement. Pages of the system
manual (`man` pages) follow the same pattern as the programs they document: `/man`,
`/usr/man`, and `/usr/local/man`. You should not access these files directly, however,
but by using the `man` command (see [Getting Help](/linux/bootstrap)).

Many programs install addition documentation in the form of text files, HTML, or other
things not `man` pages. This extra documentation is stored in directories under
`/usr/share/doc` or `/usr/local/share/doc`. (On older systems you may find this under
`/usr/doc` instead.)

## Resources

To learn more about where things live and why, you can read the defining document: the
[Filesystem Hierarchy Standard](http://www.pathname.com/fhs/).
