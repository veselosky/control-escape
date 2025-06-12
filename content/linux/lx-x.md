---
type: article
title: "A Little About The X Window System"
description:
  "A brief description of some of the visual elements of the X Window System, the Linux
  graphical interface."
date: "2011-06-04T23:16:21-0400"
params:
  author: "Vince Veselosky"
---

{{< warning title="Warning">}}
Information on this page has not been updated in a long time. It may be out of date.
{{< /warning >}}

Among other things, X provides programs with standard services to display themselves
graphically. The concept of running graphical programs in a window should be familiar to
everyone reading this. However, when you\'re in X, things will look a little strange.
Your screen may look a lot like MS Windows, or nothing at all like it. Why?

## Window Managers

X11 gives programs the ability to show themselves in a window. However, what that window
looks like, where it appears on the screen, how you call it up, etc., are controlled by
a separate program called the Window Manager. Its title more or less describes its
function. In Windows 95, this job is filled by Explorer, in Windows 98 by Internet
Explorer, and in Windows 3.x (if you can remember back that far) it was Program Manager.
I\'ve never used a Mac, but readers tell me this job is filled by Finder on that
platform. The thing is, each of these environments provide you with ONE window manager.
Although you may be able to find replacements on the Internet, only one \"standard\"
window manager is available for new installs. Linux gives you your choice of half a
dozen or more right out of the box.

Red Hat Linux by default uses the fvwm95 window manager, which gives a look and feel
similar to Windows 95. You get a start button and task bar, the windows have close,
minimize and maximize buttons in the upper right corner of the title bar. It should feel
familiar. Unfortunately, the window manager doesn\'t control the appearance of the
program inside the window. Some programs you run will work exactly the way you expect
them too, but others will seem to perform bizarre operations and will make no sense to
you at all. This is largely due to \"widgets\".

## Widgets?

Disclaimer: I am not an X programmer, so I\'m just making best guesses about the nature
of X widgets in this section. This should be \"close enough for government work\".

The X Window System provides _windowing_ services, but does not provide scroll bars,
check boxes, push buttons, and other such \"widgets\". To fill this role, programmers
use a \"widget set\", which is like a tool box containing these items. As with window
managers, MS Windows provides one standard widget set that\'s built into new installs.
On X, there is more than one kind of widget set, and they operate differently from one
another. The most popular ones today look a lot like the MS Windows widgets and function
pretty much the same. But many old programs use old \"Athena\" widgets, and they behave
quit differently.

The first thing you will notice is the scroll bars. They look different. Click on the
bottom and they scroll down. Okay. Click on the top and\... hey! It scrolled down again!
If this happens to you, Right-Click the scrollbar and it should scroll up. You\'ll also
find that in some programs, you cannot type in a text box unless the mouse is pointing
at it. You may also notice that the Delete key doesn\'t work, or that instead of
deleting it actually backspaces. I\'ve heard there are ways to correct this behavior,
but I haven\'t figured them out yet.

The best way around this poor level of uniformity (in my humble opinion) is to install
one of the new desktop environments available for Linux.

## Desktop Environments

A desktop environment sits on top of X and helps to integrate applications and unify the
user interface, as well as providing services not included in the default setup (like a
trash/recycle bin).

Red Hat Linux ships with GNOME ([www.gnome.org](http://www.gnome.org/)), a desktop
environment from the [GNU Project](http://www.gnu.org/), the organization who wrote a
huge number of the free programs and utilities on every Linux system. GNOME promises to
be a fantastic environment. I haven\'t had a chance to try it out yet, but at the time
of this writing, GNOME Version 1.0 has just been released, so packages should be
available for all major distributions by the time you read this. Check the
[GNOME web site](http://www.gnome.org) for release announcements and installation
instructions.

Currently I am running the [K Desktop Environment](lx-kde.html)
([www.kde.org](http://www.kde.org/)) version 1.1. KDE is a vast improvement over a
standard X setup. It installs quite easily (see my [KDE section](lx-kde.html) for
details). It looks very nice and works pretty much like you\'d expect, borrowing its
shortcut keys from Windows rather than emacs as many other Linux programs do. KDE has a
terrific help system that integrates its own html-format help with the Linux man pages
and info documents, so you can search all your system documentation in one place. KDE
also includes a load of excellent applications for everyday tasks like email, web, file
management, and a text editor that works the same as on MS Windows. (I never would have
thought I could miss Notepad!)

There is also a proprietary desktop system available for Linux called CDE (Common
Desktop Environment). It is based on standards in the Unix community and is similar to
what you would see on a Solaris or HP/UX desktop. This is proprietary software, and to
my knowledge there is no free version available. However, if you are converting from
another Unix rather than Windows, you may find this environment comfortable.
