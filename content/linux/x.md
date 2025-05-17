---
type: article
title: "Introducing The X Window System"
description:
  "A brief introduction to the X Window System, the Linux graphical interface. Covers
  installation and initial configuration."
date: "2011-06-04T23:16:21-0400"
params:
  author: "Vince Veselosky"
---

**WARNING:** This article is out of date. It is retained for historical purposes only.

The X Window System is the graphical interface for Linux (and I think every other
variant of UNIX, too). A word of caution for users of MS Windows: unless you are looking
for fight, don\'t ever call it \"X Windows\" around a UNIX person! Flame wars have raged
for years over this. The proper term is \"The X Window System.\" If you must shorten it,
call it X11, or just X. They\'ll know what you mean. I will be using these terms
interchangeably below.

Like everything else on Linux, the X Window System is based on a network paradigm. The
program that actually controls your display, drawing the boxes and buttons you see, is
called the _X Server_. Each X server is made for a specific video card, so there are
several X servers to choose from. Programs that use the X server to display themselves
on your screen are called _X clients_. Unlike MS Windows, the X server and X client can
run on different computers and talk to each other across the network. This means that
you can run a program on another machine and make it display itself on your own! (This
is a fairly advanced topic and will not be covered in this article, I just thought I
should mention it because it\'s _cool_).

## Obtaining XFree86

A version of the X Window System that runs on Intel platforms and is used in all Linux
distributions (as well as [FreeBSD](http://www.freebsd.org) and other free Unixes) is
produced by the [XFree86 Project](http://www.xfree86.org). Obtaining it is usually not
an issue, since it is included with the operating system distribution. Each distributor
tweaks and tests the X Window System to work best with their distribution, so check with
your Linux distributor for updates first. But if you need to upgrade in order to support
a new video card, or if you just want to be on the cutting edge, you can always get the
latest version in source or binary form at [XFree86.org](http://www.xfree86.org).

## Installing and Configuring XFree86

In almost every case, the installation of XFree86 should be handled by your
distribution\'s setup utility during Linux installation. If you chose not to install it
at the time you installed Linux, the package utility for your distribution should allow
you to install it. See your distribution documentation for details.

Even after it is installed, you may still have some work to do before X will run
properly. It needs to know about your video card and monitor so that it can use the
correct X server and the optimal screen resolutions and refresh rates. Some
distributions contain special tools for configuring X on your system. Red Hat uses the X
Configurator to automatically detect information about your video card. To run it,
[become SuperUser](users-groups#becoming-superuser) and type `setup` at the terminal.
(This setup utility can also be used to configure your sound card, system time, and
other things as well). SuSE Linux has a utility called `sax` which performs this task.
You can access it through the menus in Yast, the SuSE setup tool.

If these automated tools fail to get you up and running, or are not available in your
distribution, you can configure XFree86 using tools that come in the XFree86
distribution.

### XF86Setup

The easier of the two standard configuration utilities is `XF86Setup` (remember that
Linux is case sensitive, so you must type the name exactly as it appears).

If it finds an existing XFree86 configuration file it will offer to use it as a starting
point. Whether you do this is up to you, but if your X system is not working now, I
would recommend starting over from scratch. It then informs you that it will try to
switch into graphics mode. XF86Setup uses the VGA X server to host the graphical setup
program. This server _should_ run on any VGA compatible video card, but there are some
cards that are not as compatible as they claim to be. If you don\'t get something that
looks like an XFree86 setup program, skip to the section on xf86config below.

If Linux was able to detect your mouse, it should already be working. If not, the first
screen of XF86Setup explains how to use the program via the keyboard. The first screen
is used to configure your mouse to work under X. Several types of mice are supported,
but most will choose either Microsoft (for serial mice) or PS/2. From the \"Mouse
Device\" list choose the port where your mouse is attached. PS/2 mice will be
`/dev/psaux` while serial mice will probably be `/dev/cua0`. If your mouse is already
working, _do not change this setting_. If you have a two-button mouse, I recommend
pressing the button \"Emulate 3 Buttons\". This simulates a middle mouse button click
when you hit the left and right buttons at the same time. (Press the Apply button and
try it). The middle mouse button is used in many X programs. You may also adjust the
other settings to your liking.

The second screen allows you to choose a keyboard layout. The default will probably
work, but if you have a \"Windows-ready\" keyboard you may want to pick the 104-key from
the list. The picture of the keyboard will change as you select new ones, so you can
just compare it to your own until something matches (or comes close). You can also
adjust how the Shift, Control, and CapsLock keys work here. I recommend you stick with
the defaults.

The next screen is the most vital, where you must select your video card. If you get
this wrong, X will not work. The list of supported cards is quite extensive, so unless
your card is a brand new model, it is likely to be found here. After you select your
card, it is a good idea to read the README file for your card (just press the button).
It will tell you about any special configuration options or bugs you should be aware of.
The \"Detailed Setup\" option allows you to pick special configuration options, specify
the RAMDAC or chip set for your card, and other details that are likely to confuse you
completely. Don\'t use it unless you have to.

On the next screen you must tell XFree86 about your monitor. Pick the highest resolution
and refresh rate supported by your monitor (you should be able to find this information
in your monitor documentation). If you have an old monitor, be careful not to
over-estimate! While the new multi-frequency monitors will adjust themselves to the
video card as needed and turn themselves off if there is a problem, older
fixed-frequency monitors can be severely damaged (we\'re talking smoke and flames here,
literally) if you use a higher refresh rate than the monitor supports.

The next screen is for \"Mode Selection\", where you will choose your default screen
resolution and color depth. Normal resolution these days is 800x600, but you may want to
use a higher resolution if your monitor supports it. You may choose more than one
resolution, and X will allow you to switch between them, but I recommend using only one
to start with. The color depth setting is at the bottom of the screen; 8bpp (Bits Per
Pixel) is 256 colors, faster but not that pretty for photographs or clean fades; 16bpp
is \"high color\", 64 thousand colors, much prettier; 24bpp or higher is \"true color\",
excellent for editing photos. The choice is yours, but here you must choose only one.

The final screen allows you to adjust other options for your X Window System. The
defaults should be fine. I highly recommend that you enable the first option, \"Allow
server to be killed with hotkey sequence (Ctrl-Alt-Backspace)\". This is your emergency
escape hatch from X in case something hangs and the interface stops responding. (While
Linux itself is rock solid stable, some of the programs you install might not be so
great!)

Once you\'ve filled out all the screens to your satisfaction, press the \"Done\" button
at the bottom. XF86Setup then gives you a chance to change your mind in case you hit
\"Done\" by accident. If you press \"Okay\", it will attempt to run your X server with
the new settings. If all goes well, you will see a (rather ugly) graphical screen
running at your default resolution and color depth, and a Congratulations message. If
you see scrambled eggs instead, something was not configured correctly. Press
`Ctrl-Alt-Backspace` to kill the X server. You\'ll get an error message. Start over
again.

If the Congratulations message is visible, you have the option of using the xvidtune
utility to adjust the image on your screen. (If your monitor has controls to adjust the
image, use those control instead). Once you are satisfied, you can save the
configuration to the default configuration file, or to a file under another name if you
prefer. A backup copy of the original will be saved if it exists. You will then be
returned to the command prompt. Type `startx` and enjoy the show!

### xf86config

If XF86Setup will not work on your computer for some reason, you can fall back to the
old text-based method for configuring XFree86. Type `xf86config` to start the script.
Read each screen carefully, as the messages contain important clues about answering the
questions. At any time you can press Ctrl-C to abort the process.

The first question asks you to choose your mouse type from a menu. Serial mice are
probably type 1, Microsoft compatible. Next it asks whether you want your two-button
mouse to emulate three buttons. This simulates a middle mouse button click when you hit
the left and right buttons at the same time. The middle mouse button is used in many X
programs. I recommend answering YES.

Next you are asked to type the name of the device where your mouse is connected. The
default `/dev/mouse` may not work if Linux did not detect your mouse during
installation. PS/2 mice will be `/dev/psaux` while serial mice will probably be
`/dev/cua0`. If your mouse is already working, _do not change this setting_. Just take
the default.

Next you are asked whether you want to use the XKB keyboard extension. Answer yes, and
select the appropriate keyboard layout from the menu. Most folks can get by with option
1, the standard 101-key US keyboard.

The next step asks to configure your monitor. You will need to have your monitor manual
handy to get the horizontal and vertical refresh rates required here. For the horizontal
sync range, if you cannot find this exact information, choose the line that corresponds
to the highest resolution and refresh rate supported by your monitor. If you have an old
monitor, be careful not to over-estimate! While the new multi-frequency monitors will
adjust themselves to the video card as needed and turn themselves off if there is a
problem, older fixed-frequency monitors can be severely damaged (we\'re talking smoke
and flames here, literally) if you use a higher refresh rate than the monitor supports.
For the vertical refresh rate, if you cannot find the exact numbers, the 50-90 range
should work on most monitors. If you have an especially old monitor, you may want to
pick the smallest range just to be safe.

You are then asked to provide identification or description strings for your monitor,
vendor, and model. These names are optional. If you know them, go ahead and fill them
in, if not just hit enter.

Next comes the vital part, where you are asked about your video card. You are given the
option to select a video card from the card database. If you want to get this working,
answer YES here. You will then be presented with a list of video cards. This list
contains hundreds of cards and there is no way to back up, so read the list carefully
and choose the correct video card for your system. When you see your card, type its
number and press enter. Information from the card database about your card will be
displayed. Note any special tips given here, such as \"Do NOT probe clocks\". This may
mean something later in the process. If this is the correct card, press enter. If not,
you must press Ctrl-C and start the whole process over again.

The next screen will ask you which X server to run. If you found your card on the list,
you should have 5 options, the fifth being \"Choose the server from the card
definition\". _Always_ pick this option if it is available. If this option is not
present, it may mean your video card is unsupported. You can try using one of the first
3 servers, but there is no guarantee that any of them will work. In fact, if XF86Setup
failed, they probably won\'t. Visit the [XFree86 web site](http://www.xfree86.org) to
find out about X support for your card, or contact the card manufacturer for more
information on chip set compatibility.

After picking the X server, you will be asked whether you want to set the symbolic link
to your server. Always answer YES. Then you will be asked about the amount of video
memory on your card. Choose the appropriate value (given here in kbytes). Next you are
asked to enter description strings for your video card. Again, these are optional, press
enter to use the defaults. Next you are asked to select a RAMDAC. Unless you know for
certain which RAMDAC is on your video card, press \"q\" to quit this step without
choosing one. Most X servers will autodetect this setting properly anyway. The next
screen asks about clock chips. My advice here is the same, press `enter` to continue.
Then you will be asked if you want X to probe for clocks. If your card definition in the
database said don\'t do this (I told you that would come up later) then _don\'t_. It
could crash your system. If in doubt, skip it.

Finally, you are given the opportunity to choose your default screen resolution and
color depth. The configuration script will have some default resolutions listed based on
the capabilities of your card. Normal resolution these days is 800x600, but you may want
to use a higher resolution if your monitor supports it. You may choose more than one
resolution via the menus, which are self-explanatory. X will allow you to switch between
the different resolutions you choose, but I recommend using only one to start with. The
first resolution listed will be the default.

The color depth settings are: 8bpp (Bits Per Pixel) is 256 colors, faster but not that
pretty for photographs or clean fades; 16bpp is \"high color\", 64 thousand colors, much
prettier; 24bpp or higher is \"true color\", excellent for editing photos. The choice is
yours, but again the first one listed is the default.

Once you are satisfied with your mode settings, choose the last option and you will be
asked if you want to save the XF86Config file. Answer YES, and you are back at the
command prompt. If everything went well, you can type `startx` and enjoy the show!
