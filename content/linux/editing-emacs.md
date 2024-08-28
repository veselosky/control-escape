---
type: article
title: "Editing Files with Emacs"
date: "2011-06-03T22:50:22-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

If you\'re going to use Linux, there simply is no avoiding emacs. You\'ve probably heard
of it, the powerful text editor that provokes wars between its devoted fans and fans of
its more ancient but still omnipresent competitor vi. To those of us migrating to Linux
from a more graphically oriented environment, both programs seem alien. You might think
you can escape by using some other program, but you can\'t escape because every program
you pick up tries to imitate emacs in some way.

Getting to know emacs may be a necessity, but it\'s no picnic for immigrants from other
operating systems. We know that emacs is \"powerful\", and we would like to access all
that power, but it\'s so hard just to get started editing a file! As a beginner, I
started up emacs thinking it would be like any word processor. Fifteen minutes later I
was rebooting my computer, having been unable to figure out how to do anything ---
including exit the program!

_Don\'t give up!_ Things have gotten a lot easier since my first days using Linux. These
days, Emacs is pretty easy to figure out. If you start it up from your GUI, you\'ll get
a GUI version with full mouse support, and you can click to explore as with most GUI
programs. Also, when started without giving it a file to edit, Emacs will present you
with a nice tutorial that walks you through how to use the program.

## Understanding Emacs Terminology

Ordinarily I would not bother going over simple terminology used in a program\'s
documentation, but this is necessary with Emacs because it uses a few terms that are not
\"normal\", or not used in normal ways.

First, there is a shorthand used in Emacs documentation (and most other Linux
documentation) for describing key combinations. A capital \"C\" followed by a dash
(`C-`) means to hold the `Control` key down while pressing the following key. So `C-m`
means to hold the `Control` key while pressing `m`. A capital \"M\" followed by a dash
(`M-`) means to hold down the `Meta` key. PC\'s don\'t have a Meta key, so usually this
means the `Alt` key. (It may be only the left Alt key, or only the right, or both,
depending on your distribution/configuration.) Thus `M-x` means `Alt-x`.

You will find in the Emacs documentation many references to _buffers_ (and even a menu
by that name). A buffer is roughly what we would call an _open file_, although some
buffers contain information that is not a file. And according to the Emacs
documentation, you don\'t _open_ a file, you _visit_ one. (The file menu disagrees.) So
a buffer contains a file that you are currently visiting.

## Emacs Quick Reference

### Quitting Emacs

`C-x C-c`: Exit Emacs. If there are unsaved files open, Emacs will ask you to save them.

`C-z`: Suspend Emacs. If used under the X window system, this command will shrink the
Emacs frame to an icon.

### File Operations

`C-x C-f`: Find File. Visit or Open a file.

`C-x C-s`: Save the current buffer.

`C-x s`: Save All. Offers to save all modified buffers.

`C-x C-w`: Save As (Write). Save the current buffer under a new name.

`C-x k`: Close file. Offers to save the current buffer if modified, then kills it.

### Editing Operations

`C-w`: Cut selected text to the kill-ring.

`M-w`: Copy selected text to the kill-ring.

`C-y`: \"Yank\" or Paste the kill-ring contents at the cursor.

`C-d`: Delete the current selection (without placing in kill-ring)

`C-x u` or `C-_`: Undo one batch of changes (usually, one command\'s worth).

### Cursor Movement

`C-a`: Move the cursor to the beginning of the line

`C-e`: Move the cursor to the end of the line

`M-b`: Move the cursor backward one word

`M-f`: Move the cursor forward one word

`M-<`: Move the cursor to the beginning of the buffer

`M->`: Move the cursor to the end of the buffer

## Additional Resources

- [The GNU Emacs Manual](http://www.gnu.org/software/emacs/manual/html_node/emacs/index.html)
  --- Read it online.
- [Learning GNU Emacs](http://www.amazon.com/gp/product/0596006489?ie=UTF8&tag=controlescape-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=0596006489)
  --- Published by O\'Reilly Media. Buy from Amazon.
- [GNU Emacs Pocket Reference](http://www.amazon.com/gp/product/1565924967?ie=UTF8&tag=controlescape-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=1565924967)
  --- Published by O\'Reilly Media. Buy from Amazon.
