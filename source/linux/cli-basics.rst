:Author: Vince Veselosky
:Copyright: 2011 Vince Veselosky.
:Contact: vince@control-escape.com
:Date: 2011-01-03T08:50

Linux Command Line Basics
==============================================================================

What is this "shell"?
********************************************************************************

The "shell" is another name for the command shell or command interpreter. This
is the program that gives you a command prompt, accepts the commands you type
there, and basically makes the computer do what you tell it to. In DOS the
program that did this was command.com (unless you were a real technogeek and
used `4dos <http://en.wikipedia.org/wiki/4DOS>`_ or something). In Linux, the
shell is the first program that starts
when you log in, and it keeps running until you log out, waiting to do your
bidding. Linux is able to use any of several different shells, but the default
Linux shell is called bash and is the only one I will discuss.

Why It Is Called a Shell
********************************************************************************
The shell's job is to interpret your commands and run the programs you
request. Linux was designed to be a multitasking operating system, which means
you can run more than one program at one time. Linux was also designed as a
multi-user OS, which means that you can have more than one *shell*
running at the same time. (Each user gets his own shell at login.) As a user,
you have access only to the programs you are running, not the ones other users
are running (though you can run your own copy of the same program). The
programs are kept separate because they are "enclosed" in a "shell".

Cool Command Line Tricks
********************************************************************************

Here is the stuff that you MUST know. The command line interface would be
completely unbearable if not for a few simple tricks that make life okay.

Command History
--------------------------------------------------------------------------------

The shell stores a list of the commands that you have issued. You can navigate
up and down through this list using the Up and Down Arrow keys. To repeat the
last command is just Up Arrow, Enter.

Command Completion
--------------------------------------------------------------------------------

Linux can have some outrageously long file names, which is great when you're
reading them in a list, but it sucks when you have to type it on the command
line. At least it *would* suck if not for this nifty little feature. Type
the first letter or two and then press the Tab key. The shell will try to
complete your command. If you typed enough letters to uniquely identify the
file name, the shell fills the rest in for you. If the letters match multiple
file names, the shell will fill in everything up to the point where they
differ and wait. Hit Tab again and it will give you a list of possibilities.
The shell will also help you complete path names. Try it out. You will
*love* this.

Multitasking
--------------------------------------------------------------------------------

I'll try to expand this later, but here's the one minute version. To run a job
(program) in the background, type an ampersand (&) at the end of the command
line. To suspend the currently running job, Ctrl-Z. To force a suspended job to
run in the background, type `bg <job>`:kbd:.  To bring a background job into
the foreground, type `fg <job>`:kbd:. To see a list of jobs currently running
(or suspended) type `jobs`:kbd:. If you exclude the `<job>` argument on these
commands, it defaults to whatever job was last running in the foreground (not
the one currently in the foreground).


.. _cli-basics-navigation:

Navigation: ls, cd, and pwd
********************************************************************************

.. _cli-basics-viewing-files:

Viewing files: cat, more or less
********************************************************************************

.. _cli-basics-creation:

Creation: touch and mkdir
********************************************************************************

.. _cli-basics-copy-and-move:

Copy and Move
********************************************************************************

.. _cli-basics-deletion:

Deletion: rm and rmdir
********************************************************************************

