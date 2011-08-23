:description: Where do program files go when you install new Linux software? Mystery solved.
:keywords: install software,Linux,rpm,deb,tar,tgz
:Author: Vince Veselosky
:Copyright: © 2011 Vince Veselosky
:Contact: vince@control-escape.com
:Date: 2011-06-03T22:01:11-0400

Where did the files go?
================================================================================

After you have installed your software, you may be left asking, *Now what?*

You are probably staring at a command prompt or a message saying your software
package has been installed. But where did it go? How do you start the program?
This is one of those mystical Linux moments when you realize that you are a
fish and this is not the water you are used to.

If you are using a graphical desktop (KDE or Gnome), the good news is that
your newly installed program probably also has a newly installed icon and
entry in your programs menu. The bad news is that the menu is so large and
poorly organized on most systems that you may not be able to find it.

On the other hand, if you were installing a server or a command line utility,
you probably will not find it in your menu no matter how hard you look. So
let's take a quick tour to find out where files live on your Linux system.
(You may first want to read about the `Linux Virtual File System
<intro-filesystem>`:doc: for some background.)

User Programs (binaries)
********************************************************************************

`/bin`:kbd: - Essential user commands
--------------------------------------------------------------------------------

The `/bin`:kbd: directory contains essential commands that every user will
need. This includes your login shell and basic utilities like `ls`:kbd:. The
contents of this directory are usually fixed at the time you install Linux.
Programs you install later will usually go elsewhere (read on).

`/usr/bin`:kbd: - Most user commands
--------------------------------------------------------------------------------

The `/usr`:kbd: hierarchy contains the programs and related files meant for
users. (The original Unix makers had a thing for abbreviation.) The
`/usr/bin`:kbd: directory contains the program binaries. If you just installed
a software package and don't know where the binary went, this is the first
place to look. A typical desktop system will have *many* programs here.

`/usr/local/bin`:kbd: - "Local" commands
--------------------------------------------------------------------------------

When you compile software from source code (see `Installing from Source
<lx-swinstall-tar.html>`_), those install files are usually kept separate from
those provided as part of your Linux distribution. That is what the
`/usr/local/`:kbd: hierarchy is for.

System Administration Programs (binaries)
********************************************************************************

`/sbin`:kbd: - Essential System Admin Commands
--------------------------------------------------------------------------------

The `/sbin`:kbd: directory contains programs needed by the system
administrator, like `fsck`:kbd:, which is used to check file systems for
errors. Like `/bin`:kbd:, `/sbin`:kbd: is populated when you install your
Linux system, and rarely changes.

`/usr/sbin`:kbd: - Non-essential System Administration Programs (binaries)
--------------------------------------------------------------------------------

This is where you will find commands for optional system services and network
servers. Desktop tools will not show up here, but if you just installed a new
mail server, this is where to look for the binaries.

`/usr/local/sbin`:kbd: - "Local" System Administration Commands
--------------------------------------------------------------------------------

When you compile servers or administration utilities from source code (see
`Installing from Source <lx-swinstall-tar>`:doc:), this is where the binaries
normally will go.

Libraries
********************************************************************************

Libraries are shared bits of code. On Windows these are called `DLL`:dfn:
files (Dynamic Loading Libraries). On Linux systems they are usually called
`SO`:dfn: (Shared Object) files. As to location, are you detecting a pattern
yet? There are three directories where library files are placed: `/lib`:kbd:,
`/usr/lib`:kbd:, and `/usr/local/lib`:kbd:.

Documentation
********************************************************************************

Documentation is a minor exception to the pattern of file placement. Pages of
the system manual (`man`:kbd: pages) follow the same pattern as the programs
they document: `/man`:kbd:, `/usr/man`:kbd:, and `/usr/local/man`:kbd:. You
should not access these files directly, however, but by using the `man`:kbd:
command (see `Getting Help <bootstrap>`:doc:).

Many programs install addition documentation in the form of text files, HTML,
or other things not `man`:kbd: pages. This extra documentation is stored in
directories under `/usr/share/doc`:kbd: or `/usr/local/share/doc`:kbd:. (On
older systems you may find this under `/usr/doc`:kbd: instead.)

Resources
********************************************************************************

To learn more about where things live and why, you can read the defining
document: the `Filesystem Hierarchy Standard <http://www.pathname.com/fhs/>`_.

