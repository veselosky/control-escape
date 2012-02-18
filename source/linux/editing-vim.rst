:Author: Vince Veselosky
:Copyright: 2011 Vince Veselosky.
:Contact: vince@control-escape.com
:Date: 2011-01-06T17:18:06

Editing files with vi
===============================================================================
The thing you have to understand about `vi`:command: and its work-alike editors
is *modality*. Most programs have just one mode, accepting input and placing it
at the cursor. This is what you probably expect from a program. But ``vi`` has
other modes. When you start ``vi``, you'll be in "Normal" mode, which is really
*command* mode. When you are in Normal mode, whatever you type is considered
*not* to be input, but *commands* that vi will try to execute.

This may sound a little crazy, but it is actually a very powerful way to edit
documents. Even if you hate it, the ubiquity of ``vi`` means that you're going
to need to learn the basics, because sometimes you just *have* to use it. On
the other hand, if you enjoy working at a command line, then you may end up
*loving* ``vi``.

Lesson 1: How to Quit vi
*******************************************************************************
Since ``vi`` is the default editor, there's a good chance you got dropped into
it without knowing it. This can be *extremely* frustrating if you don't know
your way around the program.

To exit ``vi`` *without* saving changes, hit `Escape`:kbd: a couple of times to
ensure you are in Normal mode, and then type::

    :q!

Lesson 2: Editing with ``vi``
*******************************************************************************
Start ``vi`` and press `i`:kbd:. The cursor may change shape, and ``INSERT`` is
displayed at the bottom of the screen (in most ``vi`` clones). You are now in
`insert mode`:dfn: — all your keystrokes are entered into the current buffer
and are displayed to the screen.

Hit the `Escape`:kbd: key. The cursor changes shape again, and ``INSERT`` has
disappeared. You are back in Normal mode. Hitting `Escape`:kbd: a few times
will pretty much always cancel whatever you are doing and return you to Normal
mode.

Command mode is also where you move around in the file. On most systems, you
can use the arrow keys to move the cursor. If that fails, cursor movement can
be accomplished with the `hjkl` keys::

    h	move left one character
    j	move down one character
    k	move up one character
    l	move right one character

``vi`` has its own command line, which you access by typing a colon. Commands typed at the command line will not be executed until you hit `Enter`:kbd:, just like in the shell.

Many of the commands that you will use in command mode begin with a colon. For example, the command to quit is `:q`:kbd:, as we learned in Lesson 1 above. Actually, in Lesson 1 we added `!`:kbd:, which tells ``vi`` to "force" the operation. If you have edited the file, typing `:q`:kbd: will *not* immediately exit the program, but instead produce this error message::

    E37: No write since last change (add ! to override)

To save your changes, use the `:w`:kbd: command ("Write"). You can save and quit all in one go by typing both commands together::

    :wq

Of course, if you started ``vi`` without giving a file name, you'll need to provide one. For example, to save your working file as `test.txt`:file:, you would type::

    :w test.txt

Try editing some text now.

* Start vi
* Hit `i`:kbd: to go to Insert mode.
* Type some text.
* Hit `Escape`:kbd: to return to Normal mode.
* Type `:w test.txt`:kbd: to save your work
* Type `:q`:kbd: to quit


``vi`` Quick Reference
*******************************************************************************

Movement
------------------------------------------------------------------------------
`h`:kbd:, `j`:kbd:, `k`:kbd:, `l`:kbd:
    left, down, up, right

`$`:kbd:
    To the end of the line

`^`:kbd:
    To the beginning of the line

`G`:kbd:
    To the end of the file

`:1`:kbd:
    To the beginning of the file

`:47`:kbd:
    To line 47

Editing
------------------------------------------------------------------------------
`dd`:kbd:
    Remove a line

`5dd`:kbd:
    Removing five lines

`r`:kbd:
    Replace a character

`x`:kbd:
    Delete a character

`5x`:kbd:
    Delete 5 characters

`u`:kbd:
    Undo last action

`J`:kbd:
    Join current and next lines (Note the capital — hold the `Shift`:kbd: key)

Saving and Quitting
------------------------------------------------------------------------------
`:q`:kbd:
    Quit

`:q!`:kbd:
    Quit without saving

`:wq`:kbd:
    Write and quit

`:w`:kbd:
    Write (without quitting)

`:e!`:kbd:
    Reload currently open file from disk

`:w test.txt`:kbd:
    Write buffer to file `test.txt`:file:

`:e test2.txt`:kbd:
    Open file `test2.txt`:file:


Additional Resources
*******************************************************************************
* `vim documentation online <http://vimdoc.sourceforge.net/>`_

* `Learning the vi and Vim Editors <http://www.amazon.com/gp/product/059652983X?ie=UTF8&tag=controlescape-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=059652983X>`_

* `VI Editor Pocket Reference <http://www.amazon.com/gp/product/1565924975?ie=UTF8&tag=controlescape-20&linkCode=as2&camp=1789&creative=390957&creativeASIN=1565924975>`_

