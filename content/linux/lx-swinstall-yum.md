---
type: article
title: "Managing Linux Software With yum and rpm"
date: "2011-06-03T22:03:51-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

I have been planning to update this article to contain detailed information on
configuring and using `yum` to manage Linux software. Sorry for the delay, but there are
only so many hours in the day. For the moment, the best resource for learning about
`yum` is the official documentation at
[Managing Software with yum](http://fedora.redhat.com/docs/yum/en/). Meanwhile, here is
some background on RPM, which is the technology underneath `yum`.

RPM is the Red Hat Package Manager. Red Hat invented the thing, so naturally you will
find it in Red Hat Enterprise Linux as well as their less commercial Fedora distro. It
is also supported by S.u.S.E. Software gets wrapped up into these RPM packages that you
can download from the Internet. You use the `rpm` utility to install them, and it keeps
track of version information and changes made by the install so the package can be
uninstalled or upgraded later if you choose.

The syntax of `rpm` is pretty simple. To install a package:

[root]# rpm -i ${packagename}

If you already have an older version of the program installed and you want to upgrade to
a newer version:

[root]# rpm -U ${packagename}

Remember that Linux is case sensitive, that\'s an upper case U. So you installed the
software, played with it for a while, found out it sucks. How to get rid of it?

[root]# rpm -e ${packagename}

There are also graphical front ends to the rpm utility for X11. Look in my section on
the X Window System for a discussion of them.

## Resources

- [Managing Software with yum](http://fedora.redhat.com/docs/yum/en/) -Official
  documentation (recommended)
