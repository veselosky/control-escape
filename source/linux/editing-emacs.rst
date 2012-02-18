:Author: Vince Veselosky
:Copyright: © 2011 Vince Veselosky
:Contact: vince@control-escape.com
:Date: 2011-06-03T22:50:22-0400

Editing Files with Emacs
========================================================================
If you're going to use Linux, there simply is no avoiding emacs. You've probably
heard of it, the powerful text editor that provokes wars between its devoted fans
and fans of its more ancient but still omnipresent competitor vi. To those of us
migrating to Linux from a more graphically oriented environment, both programs seem
alien. You might think you can escape by using some other program, but you can't
escape because every program you pick up tries to imitate emacs in some way.

Getting to know emacs may be a necessity, but it's no picnic for immigrants
from other operating systems. We know that emacs is "powerful", and we would
like to access all that power, but it's so hard just to get started editing a
file! As a beginner, I started up emacs thinking it would be like any word
processor. Fifteen minutes later I was rebooting my computer, having been
unable to figure out how to do anything — including exit the program!

*Don't give up!* Things have gotten a lot easier since my first days using
Linux. These days, Emacs is pretty easy to figure out. If you start it up from
your GUI, you'll get a GUI version with full mouse support, and you can click
to explore as with most GUI programs. Also, when started without giving it a
file to edit, Emacs will present you with a nice tutorial that walks you
through how to use the program.

Understanding Emacs Terminology
********************************************************************************
Ordinarily I would not bother going over simple terminology used in
a program's documentation, but this is necessary with Emacs because
it uses a few terms that are not "normal", or not used in normal
ways.

First, there is a shorthand used in Emacs documentation (and most other Linux
documentation) for describing key combinations. A capital "C" followed by a dash
(`C-`:kbd:) means to hold the `Control`:kbd: key down while pressing the following
key. So `C-m`:kbd: means to hold the `Control`:kbd: key while pressing `m`:kbd:. A
capital "M" followed by a dash (`M-`:kbd:) means to hold down the `Meta`:kbd: key.
PC's don't have a Meta key, so usually this means the `Alt`:kbd: key. (It may be
only the left Alt key, or only the right, or both, depending on your
distribution/configuration.) Thus `M-x`:kbd: means `Alt-x`:kbd:.

You will find in the Emacs documentation many references to *buffers* (and even a
menu by that name). A buffer is roughly what we would call an *open file*, although
some buffers contain information that is not a file. And according to the Emacs
documentation, you don't *open* a file, you *visit* one. (The file menu disagrees.)
So a buffer contains a file that you are currently visiting.

Emacs Quick Reference
********************************************************************************

Quitting Emacs
--------------------------------------------------------------------------------
`C-x C-c`:kbd:
    Exit Emacs. If there are unsaved files open, Emacs will ask you to save them.
`C-z`:kbd:
    Suspend Emacs. If used under the X window system, this command will shrink the Emacs frame to an icon.

File Operations
--------------------------------------------------------------------------------
`C-x C-f`:kbd:
     Find File. Visit or Open a file.
`C-x C-s`:kbd:
     Save the current buffer.
`C-x s`:kbd:
     Save All. Offers to save all modified buffers.
`C-x C-w`:kbd:
     Save As (Write). Save the current buffer under a new name.
`C-x k`:kbd:
     Close file. Offers to save the current buffer if modified, then kills it.

Editing Operations
--------------------------------------------------------------------------------
`C-w`:kbd:
    Cut selected text to the kill-ring.
`M-w`:kbd:
    Copy selected text to the kill-ring.
`C-y`:kbd:
    "Yank" or Paste the kill-ring contents at the cursor.
`C-d`:kbd:
    Delete the current selection (without placing in kill-ring)
`C-x u`:kbd: or `C-_`:kbd:
    Undo one batch of changes (usually, one command's worth).

Cursor Movement
--------------------------------------------------------------------------------
`C-a`:kbd:
    Move the cursor to the beginning of the line
`C-e`:kbd:
    Move the cursor to the end of the line
`M-b`:kbd:
    Move the cursor backward one word
`M-f`:kbd:
    Move the cursor forward one word
`M-<`:kbd:
    Move the cursor to the beginning of the buffer
`M->`:kbd:
    Move the cursor to the end of the buffer

Additional Resources
********************************************************************************
* `The GNU Emacs Manual <http://www.gnu.org/software/emacs/manual/html_node/emacs/index.html>`_ — Read it online.

* `Learning GNU Emacs <http://www.amazon.com/gp/product/0596006489?ie=UTF8&tag=controlescape-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0596006489>`_ — Published by O'Reilly Media. Buy from Amazon.

* `GNU Emacs Pocket Reference <http://www.amazon.com/gp/product/1565924967?ie=UTF8&tag=controlescape-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=1565924967>`_ — Published by O'Reilly Media. Buy from Amazon.
