---
type: article
title: "Partitions: Planning Your Linux Installation"
description: "Explains hard drive partitioning for Linux installation."
date: "2011-06-04T18:18:16-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

This article will explain some of the terms involved with partitioning your hard drive,
as well as some concepts you will need to understand before installing Linux, and will
help you determine what partitions you need to create for Linux.

## What is a partition?

Imagine your company is moving into a new building that is set up like a warehouse.
There are no internal walls, it\'s just one big room for everybody to work in. Chances
are, the first thing the boss is going to do is build himself an office (he wouldn\'t
want to associate with you workers), so he\'ll have a _partition_ set up, an internal
wall to separate him from you. Next, each worker will get a cubicle in the big room with
smaller partitions to separate you from the person next to you.

Hard drives work the same way. The disk gets partitioned into smaller, separate pieces
which can belong to different owners. In our case, Windows might own some and Linux will
own others. On hard drives though, the word \"partition\" does not refer to the wall
itself, it refers to the separated space. So we say Linux is installed \"on\" the first
partition.

## What is a file system?

Ever go looking for a book in the library? In order to find what you\'re looking for,
you must understand the library\'s file system, or method of organization. Fiction books
are easy, they use a simple type of file system commonly known as alphabetical by
author. Nonfiction books can be tougher because they use a different type of file
system, the Dewey Decimal System. What if you don\'t understand the Dewey Decimal
System? What if you only know the title of a book and you don\'t know whether it\'s
fiction or non-fiction? How can we find our book now? Luckily there is a librarian to
help us, and she has created a card catalog (or in most libraries now, a computerized
catalog) listing all the books available and where to find them.

Now, picture your hard drive as the library. Like the library, your hard drive can have
different file systems. The operating system is your librarian, who has provided the
directory tree (sometimes also referred to as \"the file system\", with a slightly
different meaning) as a catalog of the files available.

Unfortunately, the world of computers is not as standardized as our libraries. In
computers, every librarian or operating system has its own type of file system, and
other operating systems often don\'t know how to read it. Lucky for us, Linux is a
versatile operating system and it does understand the file system used by Windows 95 and
Windows 98, as well as many others.

## Planning your partitions

Each distribution\'s installation guide contains (or should contain) a section on
partitioning your hard drive. I have noticed, however, that the manuals often include
far more detail than is necessary in a typical desktop installation, and can be
confusing to new users.

Personally, I favor the KISS principle (Keep It Simple, Stupid), especially for
beginners. If you are installing a server that will serve multiple user\'s
simultaneously and provide myriad services, you will want to read these manual sections
as well as the [Partition Mini-HOWTO](http://tldp.org/HOWTO/mini/Partition/index.html),
an excellent document detailing the reasons one might want to create the seven or more
partitions sometimes recommended in these primers.

For a single-user desktop system, you can ignore just about all of that. Desktop systems
for personal use don\'t have most of the complications that require so many partitions.
For a healthy Linux installation, I recommend three partitions: swap, root, and home.

### Swap

You need one partition that will be used as Linux swap space. This is space on your hard
drive that can be used as _virtual memory_. Virtual memory allows your computer to run
large programs and perform complex tasks even if it does not have enough physical RAM to
do the job. (It is a lot slower, but it works.)

The amount of swap space required is a matter of religious argument among geeks and
hackers, and entire volumes could be written about the subject. To keep it simple,
create one swap partition that is 50% to 100% the size of the physical RAM in your
system. If you are short on RAM with plenty of drive space, go large. If you\'re short
on drive space and have lots of RAM, go small.

### root (/)

The _root_ file system is represented by a forward slash (/). It is the top of the
directory tree, and contains Linux and everything that you install with Linux. (See [The
Linux (Virtual) File System]({{<ref "lx-filesys">}}) for details). This is roughly
equivalent to your \"C:\" drive under DOS or Windows. You _must_ create a partition for
the root directory. (Don\'t confuse this with the \"root\" user account, who is the
administrator of the system. That\'s a different kind of root!)

The size of your root partition will vary depending on what you install or plan to
install. Check your distribution\'s documentation, and reserve enough space for a
_maximum_ installation, plus _at least_ 100MB more for temporary space and installation
of new software. If you plan to download and try out lots of software, leave more space.
If you have a small hard drive, you can trim back on your installed packages to save
space.

In general, you should be fine with a root partition between 2GB and 8GB.

### /home

The third and final partition you should create will hold your `/home` directory. This
is the place where all the user-specific files, your data in other words, are stored. It
is roughly equivalent to the \"My Documents\" folder on a MS Windows desktop (if you
have MS Office installed). On a multi-user system, each user will have her own directory
under `/home`.

Strictly speaking, it is not necessary to create a separate partition for `/home`. If
you do not, it will reside on the root partition like everything else. If you are
cramped for space, you may need to configure your machine this way.

The reason I recommend creating a separate partition is that you are a new user. You are
going to want to play with things, experiment, push the limits of your system. Before
long, you will break something so badly that you will need to reinstall, or you\'ll just
want to reinstall with different options, or try a different Linux distribution. Having
`/home` on a separate partition makes it very easy to wipe out and reinstall Linux
without losing any of your data.

Don\'t think to yourself, \"I\'ll be careful, I won\'t need to reinstall.\" Wrong. You
will _definitely_ hose up your system at least once, and for the novice, reinstalling is
often the easiest way to fix it. I had ten years of computer experience and worked in
technical support when I started with Linux, so I knew my way around a PC, and I had to
reinstall _twice_. Just plan on it and make it easy on yourself. Keep your data on a
separate `/home` partition, or keep it backed up on some other medium, and be sure to
create the boot floppies when prompted to do so during the installation process. They
have saved my system more than once.

And don\'t get the wrong impression here. This reinstall problem is only because you are
a new user, still learning. Six months from now your system will be purring like a
nursing kitten, and you\'ll go weeks or months without _rebooting_, let alone
reinstalling.
