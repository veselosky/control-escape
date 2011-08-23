

Introducing XEmacs
================================================================================
:author: Vince Veselosky
:description: How to obtain, install, and start working with this venerable free text editor for UNIX systems.

Introducing XEmacs
================================================================================

* `Obtaining and Installing <#obtain>`_
* `Understanding XEmacs Terminology <#terminology>`_
<ul>
        * `The XEmacs Screen <#screen>`_
* `Fixing the Delete Key <#delete>`_
* `Using XEmacs <#using>`_
* `Clipboard Operations <#clipboard>`_
* `Modes and Features <#modes>`_
* `INFO Documentation <#info>`_
* `Summary <#summary>`_
* `Resources <#resources>`_
* `Chart of Commands & Keys <#chart>`_
</ul>
`back to the Linux Guide </linux/contents.html>`_

If you're going to use a UNIX operating system like Linux, 
there simply is no avoiding
emacs. You've probably heard of it, the powerful text editor
that provokes wars between its devoted fans and fans of its more
ancient but still omnipresent competitor vi. To those of us
migrating to Linux from a more graphically oriented environment, 
both programs seem alien. You might think you can escape by using
some other program, but you can't escape because every program you pick
up tries to imitate emacs in some way.

Getting to know emacs may be a necessity, but it's no picnic
for immigrants from other operating systems. We know that 
emacs is "powerful", and we
would like to access all that power, but it's so hard just to
get started editing a file! Most beginners will start up emacs
thinking it will be like any word processor. Fifteen minutes later
they are rebooting their computer, having been unable to figure out
how to do anything (including exit the program).

*Don't give up!* XEmacs will solve your text editor
woes, because it wraps up all the power of
emacs inside a comfortable graphical user interface with buttons 
and menus to give you access to the most common operations. Now
you can start editing immediately!

Formerly known as Lucid Emacs, XEmacs was developed by a
"collaboration of Lucid, Inc. with Sun Microsystems, Inc. and the
University of Illinois with additional support having been provided by
Amdahl Corporation, INS Engineering Corporation, and a huge amount of
volunteer effort." (Quoted directly from the XEmacs About box.) It was 
initially based on GNU Emacs 19 and has kept pace
with newer versions.</p.>

There are two kinds of computer people, the keyboard people 
and the mouse people. Mouse people will be happy with XEmacs
because they will actually be able to use it (unlike many Linux
editors that never heard of a mouse). Keyboard people will 
fall in love with XEmacs (and emacs in general) because there are
so many amazing things you can do with just a few keystrokes. But
even mouse people will have to learn a few of the keyboard tricks
in order to get by. What follows should be enough information to
get you started editing files with XEmacs, and give you the
know-how to find out the rest for yourself.

Obtaining and Installing XEmacs
********************************************************************************

For some unfathomable reason XEmacs is not included with 
every Linux distribution. Neither my `
Red Hat <http://www.redhat.com>`_ 5.1 nor `S.u.S.E. <http://www.suse.com>`_ 5.2 
distributions contain it. If you're using a distribution that supports 
RPMs you can download the latest RPM package from 
`Red Hat Contrib|Net <ftp://contrib.redhat.com>`_. There are 
multiple versions posted there, so make sure to pick the right one for 
your distribution. Personally, I fetched version 20.4 for glibc2
(libc6) based distributions (Red Hat 5+).

If you don't have RPM support, or if you are using a system other
than Linux (XEmacs runs on most UNIX systems and Win32), 
you'll want to grab the source code archive from the 
`XEmacs home page <http://www.xemacs.org/>`_. Don't be scared 
of that word "source". Compiling this program is very easy to do since 
it follows standard GNU procedures. You simply need to extract the
archive to a temporary directory [``tar xzvf *.tar.gz``], run 
the configure script [``./configure``], build the program
with gnu make [``make``] and install it [``make install``].
You may also want to 
grab some of the accessories in separate RPMs(or tar.gz's), but
they are not needed to run XEmacs.

Like its brother GNU Emacs (and despite its name), XEmacs runs
on the console as well as in X, so you can learn just one editor
rather than one per environment. You don't get the full advantage
of XEmacs, however, unless you run it where it runs best, under
the X Window System. The first time you fire it up there, you'll
feel like you've come home. There's a nice menu bar across the top 
with familiar looking entries like "File", "Edit" and "Help", and
a row of command buttons under that for all your common
operations: open, save, print, cut, copy, paste. From this point
you can probably fiddle with the menus and get a file opened,
changed and saved without any help. But in order to master XEmacs, 
there are a few "secrets" you'll need to know.

----

Understanding XEmacs Terminology
********************************************************************************

Ordinarily I would not bother going over simple terminology used in 
a program's documentation, but this is necessary with XEmacs because
it uses a few terms that are not "normal", or not used in normal
ways. `Figure 1 </images/xemacs-fig1.gif" title="New Window: GIF 762x498 26k" target="image>`_  will
serve as a useful reference for most of this discussion, as it
identifies the major elements of the XEmacs frame and mode line.

First, there is a shorthand used in XEmacs documentation  
(and most other Linux documentation) for describing key combinations. 
A capital "C"
followed by a dash ("C-") means to hold the `Control`:kbd: key 
down while pressing the following key. So "C-m" means to hold the 
`Control`:kbd: key while pressing "m". A capital
"M" followed by a dash ("M-") means to hold down the `Meta`:kbd:
key. PC's don't have a Meta key, so usually this means the `Alt`:kbd:
key. (It may be only the left Alt key or only the right, or both,
depending on your distribution/configuration.) Thus "M-x" means "Alt-x".

You will find in the XEmacs documentation many references to 
*buffers* (and even a menu by that name). A buffer
is roughly what we would call an *open file*, although some buffers 
contain information that is not a file. And according to the XEmacs 
documentation, you don't *open* a file, you *visit*
one. (The file menu disagrees.) So a buffer contains a file that you 
are currently visiting.

The XEmacs Screen
--------------------------------------------------------------------------------

The window that contains the XEmacs screen is referred to as the
*frame*. That frame can be 
divided into *windows* that look like divisions of the
"main window". (See `Figure 1 </images/xemacs-fig1.gif" title="New Window: GIF 762x498 26k" target="image>`_) Each
window displays a buffer (but you
can have buffers that are not displayed in a window). At the bottom
of each window is a *mode line*, which we would think
of as a *status bar*. A detailed explanation of the mode line
will follow shortly. At the very bottom of the screen is one
line called the *echo area*. The echo area is where you and
XEmacs communicate with each other. Status messages and "hints" will
appear there, or input will be requested via a *minibuffer*, as 
it is sometimes called in the documentation.

When you hover the mouse over an area of the mode line, the
echo area gives a brief explanation of what the item under the cursor 
is or does. (See `Figure 1 </images/xemacs-fig1.gif" title="New Window: GIF 762x498 26k" target="image>`_) The mode line
always begins
with two dashes (--). At the left side of the mode line, next to the
dashes, is a two character indicator of the status of the current
buffer. Dashes (--) mean the buffer is "clean" or
unmodified. Asterisks (**) mean the buffer is "dirty", or has been
modified and contains unsaved changes. Percent signs (%%) indicate 
that the 
buffer is read-only. Next, the mode line displays the name of the
current buffer, followed by a list of the currently active *modes*.
Following this are some indicators of your position in the buffer. The 
item beginning with "L" is the line number where the cursor is (an
optional indicator that I activated). The last entry on the mode line
gives a clue about how much of the buffer is "behind" you. "All" means 
that the entire buffer is visible in the window. A percentage (30%
here) indicates how much of the buffer lies above the top of the
window.

You can right-click on areas of the mode line and get a context
sensitive menu of possible actions. Right click on the buffer name and 
you will get a menu of active buffers you can display in the
window. Right click on the mode area and get a menu of minor modes
that can be activated. Right clicking elsewhere gives you a list of
window manipulation commands. 

Speaking of right clicks, you won't see that phrase in the
XEmacs documentation. Unix workstations traditionally use a
three-button mouse, and the documentation refers to mouse buttons 1, 2,
and 3. Button 3 is a right click, button 1 is a standard left
click, and button 2 is a click of the *middle* mouse
button. If your mouse doesn't have a middle button, you might be 
able to simulate a middle click by clicking both buttons at the
same time. (This behavior is controlled by your X server, not
XEmacs.) Many XEmacs command depend on button 2, the middle
button, and I highly recommend you get a three button mouse. You 
can pick one up anywhere they sell mice.

Below the mode line, on the last line of the frame, lies
the echo area, also called the minibuffer when used for input.
In addition to relaying messages to the user, the echo area
acts like a tiny command line, where you can give XEmacs instructions 
on how to do its job. Whenever you use a key sequence that
requires input to complete the command, XEmacs gets that input
via the minibuffer in the echo area (so if it seems to be ignoring 
you, check the bottom of the screen to see if it's waiting for you 
to answer a question).

Occasionally you may find yourself stuck in the minibuffer. You
probably typed a control key sequence that didn't do what you
thought. Like a modal dialog, the minibuffer prevents you from editing 
while it is active. You must cancel it to continue working, but ESC
does not do the trick! When this happens, the key you want is C-]
(Control + right square bracket). Don't ask me why.

"Delete...No, I said DELETE!...ARRRGH!
--------------------------------------------------------------------------------

The first and most annoying thing that PC users will discover
about XEmacs is that the backspace key backspaces, and the delete
key *also backspaces*! The reason for this peculiar behavior no
doubt goes back to the ancient days of Unix, but it has never been 
satisfactorily explained to me. To fix it, click the Options menu, 
choose Customize->Emacs->Editing->Basics->Delete Key Deletes
Forward. Once that's done, be sure to click Options->Save
Options so it will stick! (The key that normally "deletes" in 
XEmacs is Control-d, which still works.) Bear in mind, however, that
the XEmacs documentation is written with the default configuration in
mind, so when it says to press <DEL>, it usually means the
backspace key.

Using XEmacs
********************************************************************************

Although the command buttons at the top of the screen make it
easy to access the basic editing functions, you'll want to know
the keyboard commands to increase your speed. The `chart <#chart>`_ below should
serve as a good reference to get you started. Where multiple key
combinations are listed, some may not work with all configurations,
let trial and error verify yours. There are a few other things
you should take note of.

To open or *visit* a document, you type C-x,C-f. 
Note that if you press
the Open button or choose File->Open from the menus, you'll get
a dialog box to help you find the file. If you use the keyboard
shortcut, the dialog box does not appear, and you are prompted
to enter the filename in the minibuffer. Command line completion works 
here as it does at the shell prompt, by pressing TAB. Pressing TAB
twice opens a *DirEd* (Directory Edit) buffer, which works 
like a little 
file manager to help you locate the file you want. Don't double-click!
Selecting items in the DirEd buffer is done with mouse button 2, 
the middle button.

You will also notice early on that there is no "New" button and no
File->New option on the menu. To create a new, blank document, use the 
File->Open command (or any equivalent) and specify a file name that
does not already exist. The file will be created for you when you save 
it. There is also no File->Close option on the menu. The keyboard 
equivalent is `C-x k`:kbd: ('kill-buffer').

Once you are in a regular buffer, you will find that the standard
editing keys you are accustomed to will behave as they do on Windows 
or Mac word processors (see the `chart <#chart>`_ for
details), with a few exceptions. The Undo command, for
example, is normally bound to `C-z`:kbd: on Windows, but that 
key is already taken in XEmacs. So instead we use `C-_`:kbd: 
(that's Control Underscore,
which on PC keyboards is Control-Shift-Dash), or `C-x u`:kbd:.

"Clipboard" Operations
--------------------------------------------------------------------------------

As you would expect, XEmacs supports the standard cut, copy and
paste operations. A common cause of confusion, however, is the fact
that XEmacs has its own internal "clipboard" called the
*kill-ring*, in addition to the standard X clipboard. Normally
they work together and contain the same text, but because other
programs have access to the X clipboard, they sometimes get out of
sync. This results in different paste commands pasting different
text. Pressing the middle mouse button pastes from the X
clipboard. Pressing `C-y`:kbd: pastes from the XEmacs kill-ring.
This might be disturbing at first to former Windows users, but it is 
easy to get used to.

One cool feature that XEmacs has over Windows is the ability to
accumulate text in the kill-ring or in a buffer. Normally the copy
command replaces the clipboard and/or kill-ring contents with the
current selection. The `C-M-w`:kbd: (that's Ctrl-Alt-w) command 
causes the selected
text to be *added to* the text in the kill-ring instead of 
replacing it. There are also commands that append the selected text to 
a special buffer, but these are not bound to keys by default. See the
XEmacs documentation for details.

XEmacs Modes and Features
--------------------------------------------------------------------------------

One of the things that makes XEmacs so powerful is its special 
editing modes. XEmacs recognizes many different kinds of files, and
has specific menus, commands, and display settings for each kind of
file that it recognizes. For example, if you open a file called foo.c, 
a menu appears containing commands particular to the C programming
language. If you open and HTML file, several menus give you a host of
options for editing HTML mark-up. 
(See `Figure 1 </images/xemacs-fig1.gif" title="New Window: GIF 762x498 26k" target="image>`_) XEmacs has modes for
dozens if not hundreds of different languages and file types,
including shell scripts, C, HTML, SGML, Python, Perl, LaTeX, Texinfo,
nroff, the list goes on and on.

The modes that specify the language are called Major Modes, and
only one can be active at a time for any one buffer. There are also
Minor Modes that can specify behavior of XEmacs while in a particular
buffer. Many minor modes can be active at the same time. For example, 
Syntax Highlighting (called Font Lock Mode) can be activated in any
buffer where XEmacs knows about the language. See 
`Figure 1 </images/xemacs-fig1.gif" title="New Window: GIF 762x498 26k" target="image>`_ for an example. Auto Fill mode
causes XEmacs to insert end-of-line characters as you type to wrap
long lines. Ispell mode can be invoked to spell check each word as you
type it. Abbrev mode implements a customizable replace-as-you-go dictionary,
replacing "ILCN" with "Incredibly Lengthy Corporation Name", for
example, to save a lot of wear on your fingers. In proprietary
software, these features would be found only in expensive word processors.

Not only does XEmacs support many other features you would expect 
to find in advanced word processors, such as AutoSave and Version
Control, but it has many that proprietary word processors only wish
they had. Check out the Apps menu and you'll find a built-in calendar
program that knows the cycles of the moon, an email and Usenet client, 
a complete World Wide Web browser, and of course, a collection of
time-wasting games.

INFO Documentation
--------------------------------------------------------------------------------

That should be enough to get you started with XEmacs. The only
other thing you'll need to know is how to get help and learn
more. XEmacs makes that easy, as it comes with a complete reference
and a New User's Guide in texinfo format. Press the "info" button at
the top of the screen, or select a topic from the Help menu to access
the documentation in a separate XEmacs frame.

The XEmacs info frame works the same as the normal info browser
(type info at the command line for details), with a few
enhancements. Navigation buttons have been added to the button bar
providing access to the Previous, Next, and Up relative nodes. There
is still no button for the "Last Visited" node, so you'll need to use
the "L" key to back up. Hyperlinks may be activated by clicking the
middle mouse button (button 2), and text can be copied to the
clipboard or kill-ring using standard commands.

The info documentation contains a complete XEmacs manual that tells 
you everything you need to know to operate and customize XEmacs. The
New Users Guide is the best place to start. It will help you get 
familiar with standard XEmacs operations. The included XEmacs FAQ is
vast and well-organized. It even cross-references related
questions. If you have a thorny problem, and you can't find the answer 
in the manual, chances are it is in the FAQ. The latest version of all
these documents is available via the web at the 
`XEmacs home page <http://www.xemacs.org/>`_.

Summary
********************************************************************************

XEmacs is an astoundingly capable and complex editor. Installation
is as easy as a Linux program gets. The sharp learning curve of the 
console-based GNU Emacs
has been blunted somewhat by clever graphical design, allowing new
users to begin editing immediately, but new users
will still take some time to get completely comfortable with XEmacs. 
The thorough 
documentation is an excellent resource to novice and expert alike,
but is not searchable. Users looking for a general word processor
could get by well with XEmacs, but will probably be happier with
StarOffice or WordPerfect. However, to those who edit
"special" text like programming languages or mark-up languages such as
HTML, XEmacs' editing modes will quickly become an indispensable part
of daily life. Most importantly, XEmacs has the same ancient lineage
as Linux itself, and the skills learned here, from shortcut keys to
customization files, can be applied to Linux administration and any
number of other software tasks.

Resources
********************************************************************************

`XEmacs home page <http://www.xemacs.org/>`_

`
XEmacs Documentation on the Web <http://www.cs.indiana.edu/elisp/xemacs.html>`_

Info documentation accompanying the software (described above)

Chart of Common XEmacs Commands & Keys
********************************************************************************
<table border="2" cellpadding="3">
<caption>Common XEmacs Keyboard Commands</caption>
<tr>
<th colspan="2" align="left">Quitting XEmacs</th>
</tr>
<tr>
<td>`C-x C-c`:kbd:</td>
<td>Exit XEmacs. If there are unsaved files open,
XEmacs will ask you to save them.</td>
</tr>
<tr>
<td>`C-z`:kbd:</td>
<td>Suspend XEmacs. If used under the X window system,
this command will shrink the XEmacs frame to an icon.</td>
</tr>
<tr>
<th colspan="2" align="left">File Operations</th>
</tr>
<tr>
<td>`C-x C-f`:kbd:</td>
<td>Find File. Visit or Open a file.</td>
</tr>
<tr>
<td>`C-x C-s`:kbd:</td>
<td>Save the current buffer.</td>
</tr>
<tr>
<td>`C-x s`:kbd:</td>
<td>Save All. Offers to save all modified buffers.</td>
</tr>
<tr>
<td>`C-x C-w`:kbd:</td>
<td>Save As (Write). Save the current buffer under a new name.</td>
</tr>
<tr>
<td>`C-x k`:kbd:</td>
<td>Close file. Offers to save the current buffer if modified, then kills
it.</td>
</tr>
<tr>
<th colspan="2" align="left">Editing Operations</th>
</tr>
<tr>
<td>`C-w`:kbd:</td>
<td>Cut selected text to the kill-ring.</td>
</tr>
<tr>
<td>`M-w`:kbd:</td>
<td>Copy selected text to the kill-ring.</td>
</tr>
<tr>
<td>`C-y`:kbd:</td>
<td>"Yank" or Paste the kill-ring contents at the cursor.</td>
</tr>
<tr>
<td>`C-d`:kbd:</td>
<td>Delete the current selection (without placing in kill-ring)</td>
</tr>
<tr>
<td>`C-x u
C-_`:kbd:</td>
<td>Undo one batch of changes (usually, one command's worth).</td>
</tr>
<tr>
<th colspan="2" align="left">Cursor Movement</th>
</tr>
<tr>
<td>`C-a
Home`:kbd:</td>
<td>Move the cursor to the beginning of the line</td>
</tr>
<tr>
<td>`C-e
End`:kbd:</td>
<td>Move the cursor to the end of the line</td>
</tr>
<tr>
<td>`M-b
C-LeftArrow`:kbd:</td>
<td>Move the cursor backward one word</td>
</tr>
<tr>
<td>`M-f
C-RightArrow`:kbd:</td>
<td>Move the cursor forward one word</td>
</tr>
<tr>
<td>`M-<
C-Home`:kbd:</td>
<td>Move the cursor to the beginning of the buffer</td>
</tr>
<tr>
<td>`M->
C-End`:kbd:</td>
<td>Move the cursor to the end of the buffer</td>
</tr>
</table>
  

