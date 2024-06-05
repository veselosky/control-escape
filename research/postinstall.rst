

What You Should Really Do First After Installing Linux
================================================================================
:author: Vince Veselosky
:description: What you should really do first after installing Linux.

Post-install: What You Should Really Do First
================================================================================

Okay, you've finally got Linux installed, it boots up and asks you to

``Login: root``
``Password:``
``[root]#``

You log in as "root" (the administrator) using the password you picked during
the installation. (The documentation seldom mentions this login name
and password, I don't know why. Many new users never get past this
point!) You will not see the password as you type it.

Please note a few important things. First, most of the new Linux
distributions allow you to create a regular user during the
installation. If you did this, you should log in first as that user, not
as root. See `User and SuperUser <#user>`_ below to understand
why. Second, most new Linux distributions are very good at detecting
graphics hardware, so there is a good chance that your first login will
boot straight into GUI mode ("runlevel 5" in most Linuxes). If that
happens, obviously you won't need to run the "startx" command explained
below.

So you have logged in. Now what?

The `
Linux Installation and Getting Started Guide <http://tldp.org/LDP/gs/gs.html>`_ (you should have read
this by now; if not it's
available on-line thanks to `The Linux
Documentation Project <http://tldp.org>`_) will tell you to run several commands at the
command line to create a new account, shutdown the computer, etc. Don't
listen. We are coming from the world of Windows, and we need to leverage the
knowledge we already have to get some work done. That means we need to get off
this barren command line and back into a GUI where we feel comfortable. On
Linux, this means the X Window System.

Don't type ``win``, it won't work. The first time I installed Linux it
took me four hours to figure out how to start X, and I'm about to save you
that trouble.

``[root]# startx``

That's it. That's how we get into our GUI, the X Window System. The first
thing you should type at the command prompt is ``startx``. Note
that this assumes the X Window System is already configured on your 
system. This is done during installation on some distributions, but
requires extra work on others. If ``startx`` doesn't work for 
you, see `Introduction to The X Window System <x.html>`_ for 
instructions to get it working.

You should now be looking at some variant of a GUI. What you see exactly
depends on which version of which distribution you have installed. For my
Mandrake Linux system, I get an interface called KDE (the K Desktop
Environment) that looks similar to Windows. I have a task bar, a "start"
button that gives me a menu, and several desktop icons. Now this feels a 
little more like home!

Now that we are feeling more comfortable, we can explore the reasons that all
the books tell us the same things to do first. If you already know all this
and just need to see how to create a user account for yourself skip to `Creating Yourself <#creating>`_.

User and SuperUser
********************************************************************************

Linux puts a lot of power at your fingertips. That's the best reason to switch
to Linux; it's also the most dangerous thing about the system. Linux controls
how much power you can use on the computer based on your Login ID. It keeps a
database of all users, and it keeps track of which user owns which files, and
which users have permission to view, edit, and execute each file, folder or
program. An ordinary user will not be able to do really dangerous things, like
editing the user database, or deleting every file on the system.

But right now you are logged in as root. You are not just an ordinary user,
you are SuperUser. (SuperUser is a real Unix term, synonymous with root.)
There are no restrictions on your power. You have the ability to crash the
system and make it otherwise unusable in more ways than you can imagine. As a
novice it is very easy to make your system completely unusable with a single
erroneous command. Believe me. I speak from experience. The first weekend
after I installed Linux, I had to reinstall it FOUR times before I finally got
smart and quit destroying it. And I'm a pretty savvy guy around computers, so
don't think you're immune just because you know your way around a PC.

Because it is so dangerous to be logged in as root, you should never use this
account unless you have to. The root account is meant to be used by the System
Administrator to perform certain duties which can be destructive and therefore
should only be performed by an expert. Some examples are emptying log files,
mounting and unmounting file systems (more on this later under `Getting to CD's and Floppies <lx-mounting.html>`_ ), installing or
removing programs, and creating or deleting user accounts.

If you are using Mandrake Linux, you will have a tool available to
perform the most common administration tasks, even when logged in as a
regular user. This is called the Mandrake Control Center, which you may
find on your desktop or in the Configuration menu. It will ask you for
the root password when you start it for security reasons. As a result of
this handy tool, you may never need to actually log in as root.

Becoming SuperUser
********************************************************************************

No phone booth needed. The obvious way is to login as root. That's the best
way to do it if you plan on doing a bunch of system maintenance type stuff,
but it can be a pain if you're logged in as User with an X session and 14
programs open and connected to the Internet and you just need to copy
*one* file into /usr/lib so you can run this program you just downloaded.
Fear not, there is a better way. Type this:

``[user]&#36; su``
``Password:*****``
``[root]#``

Bang! Just like that, you are SuperUser! A few cautions: Although you are now
SuperUser, this is not a "login" shell, so your environment hasn't changed.
The biggest way this will effect you is that some programs you normally run as
root may appear to be missing. That's because your PATH environment variable,
the list of places Linux looks for executables, does not contain
``/sbin`` or ``/usr/sbin``. If you try to run a command like
``shutdown`` (see below) and it complains, try typing 
``/sbin/shutdown`` instead. That should do it.

When you are finished with your maintenance tasks you should immediately
change back to normal user mode:

``[root]# exit``
``[user]&#36;``

Notice that while you are SuperUser, your command prompt looks
different. An ordinary user is prompted with the dollar sign
(``&#36;``) while SuperUser gets a pound sign (``#``). This makes 
it easy to tell which mode you are in. (This is true on 
most distributions, but the prompts may be different on
different distributions, and they can be customized.)

Creating Yourself
********************************************************************************

DO NOT SKIP THIS STEP!!! It is very important that you create a user account
for yourself and use it while you are learning. If you don't believe me, read
`User and SuperUser <#user>`_ above. If you created a username
for yourself when installing Linux, login as that user now and call this
step finished. Otherwise, read on.

Bear in mind here that setting up a new user account is the job of 
the system administrator. Ordinarily you would never see this done,
but this is your own PC and that makes you the administrator. It is 
very important to differentiate between the things an Administrator 
(or SuperUser) does, and the things a normal user does. The only time 
you should ever use the root account is when you are performing 
administrative duties. If you are running programs, playing
games, or just exploring, you should be a regular User.

Each distribution has its own tools for creating user
accounts. Older versions of Red Hat have the User and Group
Configurator while newer versions use a program called
``linuxconf`` for all kinds of administrative tasks. Mandrake
has a user tool in the Mandrake Control Center, S.u.S.E uses a program
called Yast, and so on. You are welcome to explore
these tools on your own. However, there is a least common denominator 
that works on every system.

From a terminal (or xterm window) type:

:kbd:`[root]# useradd <var>vince</var>`

Of course, you won't want to be called ``vince``, so fill 
in your own chosen moniker here. Remember that Linux is case
sensitive. If you fill in ``vince`` here and then type 
``Vince`` later, Linux will not recognize you. 

This command creates a home directory for you and makes appropriate 
entries in system files so the system will recognize you. By default
it sets your password to a random and un-duplicatable string, which
means this account cannot be used until a new password is set. Use
the ``passwd`` command to set a usable password for this account:

:kbd:`[root]# passwd vince
New UNIX password:
Retype new UNIX password:
passwd: all authentication tokens updated successfully
`

SuperUser can change any password on the system. A regular user can 
change his own password using this same command, but cannot change
passwords to other accounts.

Getting Out/Shutting Down
********************************************************************************

Now you should log on as yourself, the user. To exit X and get back to the
command prompt, select "Logout" from the main menu (or similar menu
options in your version). If your system booted into GUI mode
automatically, it may now give you the option to shutdown or restart the
computer, or just log out to log in as a different user. Otherwise,
you'll need to run the commands below.

If you are running some other window manager that does not provide a menu
option like this, and you can find no other way to close down X, hit
:kbd:`Ctrl-Alt-Backspace` on your keyboard. This will shut down the X
server. This is for emergencies only and is not a healthy way to close 
your X server, so consult the documentation for your distribution to
find the correct way.

Now you are back at the command prompt. To log out and return to the
``Login:`` prompt, just type:

``[root]# logout``

If you're ready to turn off the computer, you need to instruct Linux
to shut it down properly so that your files are not damaged. To turn
off the power type:

``[root]# shutdown -h now``

To reboot the computer type:

``[root]# shutdown -r now``

Note, however, that the ``shutdown`` command can only be
run by the root user. If you try to run it as a regular user, even
using the ``su`` command, you'll get the message:
``shutdown: must be root.``

On Linux systems, an alternative is to use the commands 
``/sbin/halt`` to power down the computer and 
``/sbin/reboot`` to reboot. These commands can be run by
regular users with the proper permissions. This is *not* universally 
correct on UNIX systems, so it is recommended not to try this on
non-Linux systems.

