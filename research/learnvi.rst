
Learning the vi Editor/Print version
================================================================================
From Wikibooks, open books for an open world

Learning the vi Editor
================================================================================

    This book aims to teach you how to use the **vi**
    editor, common to many Unix and Unix-like operating systems.
    ~
    ~
    ~
    ~
    ~
    "Learning_the_vi_editor" [New file].

The above text is a little example of how the vi editor's screen looks.
 
Getting acquainted
================================================================================

Introduction
********************************************************************************

Overview
--------------------------------------------------------------------------------
``vi`` is a powerful editor that is ubiquitous amongst Unix and Unix-like operating systems, but is available on many other operating systems, even on MS-DOS, Windows and the Macintosh. If not the original vi, there is usually at least a good clone available that runs on your system. Even if you use another editor you must have a passing knowledge of vi as an administrator. Sometimes vi is the only editor available when your computer crashes leaving a minimal system for you to repair.

vi, pronounced like 'vee eye', was originally written by Bill Joy for BSD Unix in Berkeley in 1976 and became quickly part of many vendor-specific versions of the (at that time) original AT&T Unix. It was later directly added to AT&T's System V Unix, too. Bill Joy later went on to co-found `Sun Microsystems <http://www.sun.com"rel="nofollow>`_, and became the company's Chief Scientist at that time. vi stands for *visual* and was an enormous improvement of the classic Unix editor called **ed**. **ed** is a line-editor. If you are still familiar with MS-DOS, then you may know the MS-DOS **edlin** editor. ed is similar, although more powerful than edlin, which doesn't mean much.

vi also has a line-mode, called **ex**. In fact, one can argue that the program is indeed two editors in one, one editor called vi, another called ex. It is possible to switch between line and visual mode during editing. It is also possible to choose the mode during startup. However, pure usage of ex is rare. The visual mode is the prevailing mode.

Although vi stands for *visual*, classic vi is mainly operated via the character keys, and not via the mouse or the cursor keys. Once you are used to this, it becomes extremely convenient, because there is less movement of the hands to the cursor keys or mouse involved.

vi also served as a kind of incubator for Unix's terminal control capabilities. Because of vi's need to control the terminal and the many different types of terminals at that time, the *termcap* (terminal-capabilities) database was introduced (later replaced with the more flexible *terminfo* database). vi's internal high-level screen control library was later separated, and became *curses* - the Unix standard library for CRT screen handling.

Conventions
--------------------------------------------------------------------------------
<c>
    A single character, such as 'a' or '1'.

<ESC>, <Ctrl-[>
    Indicates that the Escape (Esc) key on your keyboard should be pressed, which is identical to Control and '['.

<CR>
    Indicates that the Return (Enter) key should be pressed.
    
<TAB>
    Indicates that the Tabulator key should be pressed
    
<Ctrl-x>, <C-x>
    Indicates that the Control key and the 'x' key should be pressed simultaneously. 'x' can be almost any other key on your keyboard.
    
<Shift-x>, <S-x>, <X>
    Indicates that the Shift key and the 'x' key should be pressed simultaneously
    
<Meta-x>, <M-x>
    Indicates that the Meta or Alt key and the 'x' key should be pressed simultaneously.
    
:quit, :q
    An Ex command. started with <:>, followed by the command and ends with <CR>. For many Ex commands there is a long form (:quit) and a short form (:q).
    
:set
    **nocompatible** — represents a setting.
    
**strlen**()&#160;
    represents a function.
/
*pattern*
/
, 
?
*pattern*
?

    A Search pattern. Search pattern in vi are `regular expressions <http://en.wikipedia.org/wiki/regular_expression"title="w:regular expression>`_.
:

*range*

s

/
*search*
/
*replace*
/

*options*
, 
:global
 
/
*pattern*
/
 
delete

    A Search pattern combined with an Ex command.
All commands in *vi* are case sensitive.

**unix-command**(section)

    Sometimes references to Unix commands are used in this book. On first occurrence such a name of a command is written in the typical Unix style. This style consists of the command's name followed by the section of the manual pages in which the command description can be found, in brackets. E.g. **sed**(1) refers to Unix's **sed** command which is usually documented in section 1 of the Unix manual pages (sed is the Unix stream editor; a tool for manipulating text without user interaction).
[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-4" title="Learning the vi Editor/Getting acquainted>`_]
 
Getting vi if you don't have it already

********************************************************************************

If you're running a Unix system, or a Unix-like system (for simplicity from now on we will refer to both as a "Unix system"), such as a BSD or Linux distribution, or even Mac OS X, you're sure to have vi or one of its variants on your system.

If you're running Windows, you can get a version of vi called `"vim" <http://www.vim.org"rel="nofollow>`_ or `"elvis" <http://elvis.the-little-red-haired-girl.org/whatiselvis/"rel="nofollow>`_. If you're on an older Mac OS (pre-OS X) system, you can get MacVim Classic `here <http://macvim.swdev.org/MacClassic/"rel="nofollow>`_.

[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-5" title="Learning the vi Editor/Getting acquainted>`_]
 
Noted vi variants

--------------------------------------------------------------------------------

As mentioned, vi has a number of variants. They have been created because vi was only available on rather expensive Unix operating systems. Although vi itself, as well as nvi, was created in Berkeley for the free BSD Unix variant, usage of BSD Unix required an original AT&T Unix license (this has later changed, see below). Original vi, for example, used code from AT&T's **ed***(1)* editor.

Over time, BSD replaced many of the original AT&T code up to the point where today there is no such code anymore in BSD, and an original Unix license is no longer needed. As part of the effort to replace all AT&T code in BSD, Keith Bostic undertook the work to create a clone of vi that was free of AT&T code, called nvi. nvi then became BSD's standard vi instead of the original vi. Another vi clone is Elvis, which was written by Steve Kirkendal.

Over time, nvi was enhanced – for example, supporting multiple windows – but originally it was not supposed to be an enhancement, 'just' a pure clone.

BSD's original vi (with the ed code inside) lives on as the vi which is distributed with System V Unix, because AT&T decided a long time ago to take it from BSD and add it to the official Unix. Of course AT&T didn't have a problem with an AT&T Unix license, so they probably never replaced the ed code inside the original vi.

Yet, some find nvi still to be too minimal, and so vim was born. **vim** (vi-i*m*proved), is another effort to extend vi's capabilities. Unlike nvi, vim goes even further to extend vi's capabilities. However some find that vim is often too much. vim comes in two variants, a text-only version, and a GUI version, the latter is called **gvim**.

Other vi clones are the already mentioned **elvis** and **stevie**. These clones were born in the CP/M and home computer area to bring the editor to these platforms, too. Of course, they were later ported to MS-DOS and Windows. These days, however, **vim** seems to be the prevailing vi-clone on free/open platforms and proprietary platforms as well.

*You should choose the version you feel most comfortable with* – if you have an editor you feel displeased with, it will affect your productivity.

[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-6" title="Learning the vi Editor/Getting acquainted>`_]
 
Getting around vi

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-7" title="Learning the vi Editor/Getting acquainted>`_]
 
Starting the editor

--------------------------------------------------------------------------------

If you are running a Unix system, you can start up vi by typing

<pre>
 ``vi``
<CR>

</pre>

at the command line. If you are running X, with a desktop like GNOME, KDE, CDE/Motif or OpenLook you may have a launcher button handy to start the editor - if you have such a setup, you can just click the icon.

If you are running Windows or DOS with elvis, you can start up the Windows editor by double-clicking "winelvis.exe", or in DOS, you can start the editor by typing in "elvis" at the command line.

You will be greeted with a screen similar to:

<pre>
~
~
~
~
~
~
"No File"
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-8" title="Learning the vi Editor/Getting acquainted>`_]
 
Quitting the editor

--------------------------------------------------------------------------------

To quit for now, press the Escape key (the editor should beep), then enter the three characters 
:q!
 and press Return:

<pre>

<ESC>

:q!

<CR>

</pre>

Just before you type the final 
<CR>
 the screen will look similar to

<pre>
~
~
~
~
~
~
:q!
</pre>

:q!
 is the short form of 
:quit!
 which quits the editor.

You should be dropped back to your operating system (or, rather, the shell from where you started).

There are other ways to quit, e.g. pressing 
<Z>

<Z>
 (
<Shift-z>

<Shift-z>
) will save any unsaved work and quit the editor. Typing 
:wq
 will always save, even if there are no unsaved changes, and then quit the editor. 
:x
 will write if there are no unsaved changes, and it will quit. 
:wq
 and 
:x
 requires that you had previously provided a file name, so it will not work for the above simple example. Typing 
:q
 will quit if there have been no changes made; if changes have been made, vi will print a warning similar to "No write since last change".

[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-9" title="Learning the vi Editor/Getting acquainted>`_]
 
Don't worry

--------------------------------------------------------------------------------

Many first time vi users stop at this point, and never touch vi again. If you tried to enter some text after you started, you will most likely have been greeted with a series of beeps and rather erratic behavior. Don't worry. This is perfectly normal for vi, and the editor is not broken. You will soon see why this is normal vi behaviour.

[`edit </w/index.php?title=Learning_the_vi_Editor/Getting_acquainted&action=edit&section=T-10" title="Learning the vi Editor/Getting acquainted>`_]
 
Continue

********************************************************************************

Now that you know how to start the editor and quit it, let's move on to getting things done in ``vi``: see `Learning the vi Editor/Basic tasks </wiki/Learning_the_vi_Editor/Basic_tasks" title="Learning the vi Editor/Basic tasks>`_

[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=3" title="Edit section: Basic tasks>`_]
 
Basic tasks

================================================================================

Now that we know how to invoke the editor and quit it, we can get acquainted with how to *use* the editor.

Alternatively, you can use the ViM tutor which comes with many modern vim distributions. It contains, essentially the same information as the text below. You can invoke the tutor by entering **vimtutor** at your shell.

[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-1" title="Learning the vi Editor/Basic tasks>`_]
 
Vi is a *modal* editor

********************************************************************************

The vi editor can do two things:

* accept a command, such as deleting a line
* accept text, written by you
In the vi editor, each of these tasks is achieved by putting the editor into a particular mode of operation (normally just called a *mode*). When you wish to give vi a command, you enter *command mode*, and when you want to enter text, you enter *insert mode*. We'll cover how to do this below.

It is important to set the correct mode before you begin writing, but this is simple to do. When you first start vi, it is automatically in command mode.

[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-2" title="Learning the vi Editor/Basic tasks>`_]
 
Entering text

********************************************************************************

Entering text is the most basic task an editor can do! From command mode (in which the editor starts), press ``i`` to enter *insert mode*, and you can begin typing. You can use the backspace key to correct mistakes you make. If you make a mistake after a few sentences, leave these errors for now, we will look at correcting them later. To leave insert mode once you're done typing, and return to command mode, press the Escape key on your keyboard (or type Control-[).

[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-3" title="Learning the vi Editor/Basic tasks>`_]
 
Exercise

--------------------------------------------------------------------------------

Let's have an exercise:

* Start the editor.
* Enter insert mode.
* Type some text
* Return to command mode.
* Quit the editor.
[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-4" title="Learning the vi Editor/Basic tasks>`_]
 
Solution

--------------------------------------------------------------------------------

* We can start the editor as in the previous section.
* Since the editor starts in command mode, we must press the 
<i>
 key before we can start typing.
* You can make some text up yourself!
* Press the 
<Escape>
 key.
* If you want to quit the editor, you need to be in command mode. Since pressing Escape puts you in command mode, you can just use the method in the previous section to exit: type 
:q!

[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-5" title="Learning the vi Editor/Basic tasks>`_]
 
Command mode

********************************************************************************

Command mode allows you to perform many useful tasks within vi.

[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-6" title="Learning the vi Editor/Basic tasks>`_]
 
Moving around

--------------------------------------------------------------------------------

Say you have been writing for some time, and have forgotten something. Pressing 
<Backspace>
, *erasing* previous work is not the best solution! We would like to move around the document freely, moving the cursor.

We can move around in the editor by first entering command mode, and then using the 
<h>
, 
<j>
, 
<k>
, and 
<l>
 keys.

Note
    your arrow keys may be set up to work, and you can use them if you like, but for proficiency and for advanced work later, you should learn to use the letter keys.
* The 
<h>
 key, in command mode, moves the cursor one character **left**.
* The 
<j>
 key, in command mode, moves the cursor one character **down**.
* The 
<k>
 key, in command mode, moves the cursor one character **up**.
* The 
<l>
 key, in command mode, moves the cursor one character **right**.
If you have trouble remembering this, keep in mind that 
<h>
 is leftmost, the letter 
<j>
goes down below the line, the letter 
<k>
pokes up above the line, and the 
<l>
 key is rightmost. (J also resembles an arrow pointing downward, if you squint a bit.)

After you have moved the cursor using those keys, you can enter insert mode again by pressing 
<i>
. When you do this, you insert text at the cursor, inserting text between the character to the **left** of the cursor and the **current** position of the cursor. Let's practice this in an exercise.

[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-7" title="Learning the vi Editor/Basic tasks>`_]
 
Exercise

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

You can repeat this exercise with your own sentences. Make sure you are proficient doing this before you continue.

* Start the editor.
* Enter the text: "The quick fox jumps over the dog"
* Insert the word "brown" between "quick" and "fox".
* Insert the word "lazy" between "the" and "dog".
* Quit the editor.
[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-8" title="Learning the vi Editor/Basic tasks>`_]
 
Solution

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Use the method in the previous section.
* Press 
<i>
, then enter ``The quick fox jumps over the dog`` normally.
* Press 
<Escape>
, then press 
<h>
 until the cursor is at the letter "f" of "fox". Press 
<i>
, and then type "brown ".
* Press 
<Escape>
, then press 
<l>
 until the cursor is at the letter "d". Press 
<i>
, and then type "lazy ".
* Press 
<Escape>
 again, then type 
:quit!
.
[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-9" title="Learning the vi Editor/Basic tasks>`_]
 
More on movement

--------------------------------------------------------------------------------

Using ``h``, ``j``, ``k``, and ``l`` is ok, but vi understands more than rows and columns. These are some commands that move by text objects:

* ``w`` moves forward to the beginning of the next word.
* ``b`` moves backwards to the beginning of the previous word.
* ``(`` and ``)`` move by sentences, either backward or forward.
* ``{`` and ``}`` move by paragraphs.
[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-10" title="Learning the vi Editor/Basic tasks>`_]
 
Deleting things

--------------------------------------------------------------------------------

If you have made a mistake after a few lines, for instance, pressing Backspace until you have erased the mistake and starting again isn't always the best solution. We need a method of deleting mistakes that happen in the normal course of editing.

vi allows you several methods of deleting text, based on how much you want to remove. Now that you are familiar with moving around, once you've moved the cursor to where your error is:

* the ``x`` key deletes *one* character
* pressing ``dw`` deletes *one* word.
* pressing ``dd`` deletes *one* line
[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-11" title="Learning the vi Editor/Basic tasks>`_]
 
Exercise

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

From now on, we will omit the steps for you to start and quit the editor - you should be already familiar with those.

* Enter the following text: ``Sad I been here, I wouldnt ever ever leave.``
* Change the word "Sad" to "Had".
* Add an apostrophe after "wouldn".
* Delete the extra "ever".
* Delete the line.
[`edit </w/index.php?title=Learning_the_vi_Editor/Basic_tasks&action=edit&section=T-12" title="Learning the vi Editor/Basic tasks>`_]
 
Solution

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* Type the text normally. (You should already be familiar with entering insert mode and leaving it.)
* Enter command mode, use ``h`` to move to the start of the line, and then press ``x`` to delete the "S". Press ``i`` to enter insert mode, insert the "H", then leave insert mode by pressing Escape.
* Now position the cursor on the t, and press ``i`` to enter insert mode, type the " ' ". Leave insert mode by pressing escape.
* Position the cursor over the first "e" in the word "ever" (choose whichever one you like). Type ``dw`` to delete the word.
* Type ``dd`` to remove the entire line.
[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=4" title="Edit section: Making your work easier>`_]
 
Making your work easier

================================================================================

By now you should know the rudiments of using ``vi``. However, to really make ``vi`` work for you, it may be helpful to know the following to make your work easier for you.

[`edit </w/index.php?title=Learning_the_vi_Editor/Making_your_work_easier&action=edit&section=T-1" title="Learning the vi Editor/Making your work easier>`_]
 
More on commands

********************************************************************************

Say you are editing a document, and you wish to delete ten lines - as of now, the only way to do this is to enter ``dd`` ten times. Or if you want to delete seven characters exactly - you would have to enter ``x`` seven times. There must be a better way!

[`edit </w/index.php?title=Learning_the_vi_Editor/Making_your_work_easier&action=edit&section=T-2" title="Learning the vi Editor/Making your work easier>`_]
 
Repetition

--------------------------------------------------------------------------------

Fortunately, vi lets you augment most of the commands in case you want to repeat that command a certain number of times. This is done by typing in the number of times you want that command repeated, followed by the command.

So, if you want to delete ten lines, you would type ``10dd``. Or if you want to delete seven characters, you would type ``7x``.

You can also repeat the last action done by typing ``.`` (this is a single period keystroke), the single-repeat operation over the location you want to repeat the previous operation.

So if you wanted to repeat the deletion of ten lines as in the previous example, you could repeatedly press ``.`` to perform this operation over and over again.

[`edit </w/index.php?title=Learning_the_vi_Editor/Making_your_work_easier&action=edit&section=T-3" title="Learning the vi Editor/Making your work easier>`_]
 
Exercise

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1. Type the sentence ``Good morning Doctor, how are you today?``. Delete "Good morning".

2. Now using the single-repeat operation, delete "how are".

[`edit </w/index.php?title=Learning_the_vi_Editor/Making_your_work_easier&action=edit&section=T-4" title="Learning the vi Editor/Making your work easier>`_]
 
Motion

--------------------------------------------------------------------------------

vi allows you greater flexibility over motion as well. There are a few commands to allow you to quickly jump around your document, such as&#160;:

* ``0`` moves to the immediate beginning of the line
* ``$`` moves to the immediate end of the line
* ``^`` moves to the first non-whitespace character of the line
``^`` acts in the following way, if the line was

<pre>
            hello how are yo``u``
</pre>

and your cursor is on the u, if you would enter ``^``, the cursor would be upon the h.

Furthermore, the ``/`` command allows you to jump directly to some pattern in the file. For example, if you're looking for the next occurrence of the word "pomegranate" in your text, if you hit ``/``, then type in pomegranate (you need not enter insert mode) and hit enter, the cursor will jump to the next occurrence of the word, if it exists. If you want to search backwards, you would perform the same procedure, but use the ``?`` command. To repeat either search, enter ``//``, ``??``, or alternatively, type ``/`` or ``?`` and hit Enter.

[`edit </w/index.php?title=Learning_the_vi_Editor/Making_your_work_easier&action=edit&section=T-5" title="Learning the vi Editor/Making your work easier>`_]
 
Commands and motion

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

We know now that vi lets you enter a number to specify how many times to do something. Consider this example now: you want to delete everything after a certain point on a line - you could enter ``dw`` for each word from the cursor position to the end of the line, or hold down ``x``, but these are cumbersome examples. vi thankfully lets you do something much faster.

With certain commands, vi allows you to specify a position, using the methods in the previous sections. The position is specified after the command. For example, to delete up to the end of the line, you would enter ``d$``.

Other examples:

* ``dt;`` will delete until the next semicolon (This is helpful in languages like C and perl that use semicolons to finish statements).
* ``d2}`` to delete the next two paragraphs.
* ``d4b`` to delete the previous four words (alternatively, you could enter ``4b4dw``).
[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=5" title="Edit section: Advanced tasks>`_]
 
Advanced tasks

================================================================================

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-1" title="Learning the vi Editor/Advanced tasks>`_]
 
Copying and Pasting

********************************************************************************

Copying and pasting tasks are done with three keys, 
<y>
 (for "yank"), 
<d>
 (for "delete"), and 

 (for "paste"). In general, you type 
<y>
 or 
<d>
 to tell vi that you're at the position where you want to start yanking or deleting some text. Then you need to tell vi where to stop, using cursor movement or other commands.

You can also simply use key 
<v>
 to enter a visual mode. Then you can highlight text by moving cursor keys. And finally press 
<y>
 to copy text to clipboard. And 

 for paste.

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-2" title="Learning the vi Editor/Advanced tasks>`_]
 
A Word

--------------------------------------------------------------------------------

To delete a single word, move your cursor to the first letter, then type 
<d>

<w>
. To yank a single word, move your cursor to the first letter, then type 
<y>

<w>
.

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-3" title="Learning the vi Editor/Advanced tasks>`_]
 
Other Methods

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Move to the character past the last letter and type 
<d>
 
<b>
.

To delete a word like "can't", which has an apostrophe, move to the first character and type 
<d>

<W>
. Note the capital W. This tells vi to go all the way to the first whitespace character after the word.

Likewise, try dB.

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-4" title="Learning the vi Editor/Advanced tasks>`_]
 
A Line

--------------------------------------------------------------------------------

To delete a single line, type 
<d>

<d>
.

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-5" title="Learning the vi Editor/Advanced tasks>`_]
 
Other Amounts

--------------------------------------------------------------------------------

One of the great things about vi is that it lets you select a bunch of text without having to move your hand to your mouse.

Type 
<m>

<a>
. This will mark the current position that your cursor is at as mark **a**. You can go back to this position anytime you want from now on by typing 
<`>

<a>
. (`a means "move to the character that has been marked as **a**")

Now move to some other position. Type 
<d>

<`>

<a>
. This will delete everything from the current position to the position you marked as **a**.

Note that you can use nearly any key in place of the 
<a>
 used in this example. For instance, you might use 
<m>

<t>
 to mark the *top* of a section, or 
<m>

<b>
 to mark the *bottom*. These mnemonics are strictly in the user's head - vi doesn't care that *t* means *top* or *b* means bottom. Vi will remember all unique bookmarks, allowing the user to easily and quickly jump between them. Some users find using 
<m>

<m>
 to be a convenient temporary bookmark, because it can be typed so quickly.

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-6" title="Learning the vi Editor/Advanced tasks>`_]
 
To the end or beginning of a line

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<d>

<$>
 or 
<d>

<^>

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-7" title="Learning the vi Editor/Advanced tasks>`_]
 
To the end or beginning of the file

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<d>

<G>
 or 
<d>

<1>

<G>

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-8" title="Learning the vi Editor/Advanced tasks>`_]
 
To the next occurrence of a pattern

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

<d>
/myPattern

This is particularly useful when editing HTML files with d/<

[`edit </w/index.php?title=Learning_the_vi_Editor/Advanced_tasks&action=edit&section=T-9" title="Learning the vi Editor/Advanced tasks>`_]
 
Adjusting the Screen

********************************************************************************

vi, as a visual screen-oriented editor has a number of useful commands to redraw or adjust the screen in case you find yourself somewhere where you don't want to be.

If you run in a Unix shell, it is possible that some background process writes to the same terminal. This will disturb vi's screen layout. In order to force vi to redraw the complete screen, press 
<Ctrl-L>
 or 
<Ctrl-R>
. Both commands do the same.

If you want to adjust what is currently displayed, then the 
<z>
 command is rather useful. It's a kind of Swiss army knife, and has a rather complex syntax:

<pre>
   [/*pattern*/][*m*]``z``[*n*](<CR>|.|-)
</pre>

([ ... ] denotes optional items, (...|...) denotes alternatives)

Before we explain the syntax in detail, here are some common applications of the command:

Scroll the screen so the current line becomes the middle line of the screen. The cursor remains on that line:

<pre>
   
<z>

<.>
   
</pre>

Scroll the screen so the current line becomes the top line on the screen:

<pre>
   
<z>

<CR>

</pre>

Scroll the screen, so the current line becomes the bottom line of the screen

<pre>
   
<z>

<->

</pre>

If a ``/*pattern*/`` or a number *m* is given the cursor is moved further after the adjustment. ``/*pattern*/`` indicates to move the cursor to the first match of that pattern. *m* indicates to move the cursor to the *m*th line on the screen. So, for example,

<pre>
   ``/while/z<CR>``
</pre>

would first scroll the screen so the current line becomes the top line on the screen, and then move the cursor to the first 'while' in the text from that position on.

The number *n* is a rather obscure parameter. If provided, it tells vi to behave as if the screen is just *n* lines high. The result is that only *n* number of lines are adjusted, and the rest of the screen is either ignored or cleared, presumably useful on slow terminals to avoid redrawing the screen unneccessarily.

[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=6" title="Edit section: Details>`_]
 
Details

================================================================================

This section describes some of the details of the vi program itself (such as command line features), and other advanced vi features for aspiring vi power users.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-1" title="Learning the vi Editor/Details>`_]
 
Command line invocation

********************************************************************************

Different vi clones of course have different ways of starting the program (invocation). Usually, however, command-line versions of vi share a common basic set of command line options. These following command line options and flags are typically available. In addition, vi can be started under different names. Depending on the name used to start vi, it may either behave slightly differently or load a different vi clone.

The common command line options and flags are

-
or

-s
    Suppress. All interactive user feedback is suppressed (not written to the terminal). This allows to pipe editing commands through the editor, and use it as a kind of stream editor. There are probably better streaming editor tools on Unix, like **sed**(1), **awk**(1), or **Perl**(n).
    Note, "-" is a common Unix notation to indicate standard input. It has been chosen as an alternative to ``-s`` by the vi authors to provide a familiar look when piping commands. It does not really mean 'read from standard input' since vi does that anyhow.
-C
    En*c*ryption. vi prompts the user for a key (a kind of password), and uses this key to encrypt its files before writing. It also uses this key to decrypt any file opened with vi. This feature is not supported by many clones, and the encryption algorithm is a very weak one (it is based on a 256-element one-rotor algorithm). The algorithm is easy to crack. It is compatible with the Unix **crypt**(1) command. See also ``-x``.
-l
    (lower-case letter L) Change some default settings so they are more useful for editing LISP source code.
-L
    (upper case letter L) Lists all files which have been saved during a crash. See ``-r``, too.
-r *filename*
    Recover the file *filename* after a crash. Use ``-L`` to get a list of files which can be recovered.
-R
    Readonly. Files can only be viewed, not written.
-S
    `Tags <#Tags>`_ are not sorted. When a *tag* file is used, this flag tells vi that the tag file is not sorted, therefore vi will use a slower algorithm to look up tags. See ``-t``, too.
-t *tag*
    Edit (open) that file which contains the given *tag*. This of course requires that a tag file (called *tags*) is available.
-v
    Start in visual mode. Only useful if the editor is started under the name **ex** and not **vi**.
-V
    Verbose. Commands read via standard input are echoed to standard error. This is useful for debugging when the editor is used as a streaming editor.
-w*number*
    Window size. Set the editor's number of lines to *number*. vi behaves as if the terminal has only *number* number of lines. This was used in the old days to speed up things when connecting via a slow terminal or modem line.
-x
    Encryption. Similar to ``-C``. The difference is that vi tries to guess if a file that is opened needs decryption or not. ``-C`` on the other hand always runs the decryption when a file is opened.
+*command*
or

-c *command*
    Execute the command *command* before allowing the user to enter own commands. The most common usage is to use this to position the editor at some specific line in a file. E.g.
<pre>
vi +10 list.txt
</pre>

    will open the file ``list.txt`` and position the cursor at line 10. Another common usage is to specify a pattern:
<pre>
vi +/END script.awk
</pre>

    This will open the file ``script.awk`` and position the cursor at the first occurrence of the pattern 'END'.
As already mentioned, vi can be started using different names (all may not be available depending on the particular clone):

vi
    The usual way to start vi.
view
    vi starts in read-only mode.
vedit
    A few settings are changed to better suit beginners: *magic* is cleared, *showmode* and *novice* are set, and *report* is set to 1.
ex -v
    Same as just typing ``vi``
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-2" title="Learning the vi Editor/Details>`_]
 
Commands: Objects & Operators

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-3" title="Learning the vi Editor/Details>`_]
 
General

--------------------------------------------------------------------------------

Until now, this tutorial has just talked about commands, and that commands can be used in conjunction with things like word counts. E.g. ``d2w`` has been explained as the operator ``d``elete applied to two words. Note the ``2w`` part. You have learned that this part specifies to which text the operator should apply. And indeed, the ``2w`` part specifies to which objects of the text (words, lines, characters etc.) the operator is supposed to be applied. And you have seen that the same object specifiers can be used with all types of operators - as long as the combination makes sense.

vi commands in fact follow a general schema. Commands are made up from operators and objects:

<pre>
   [[*count*] **operator**] [[*number*] **object**]
</pre>

This means the *operator* should be executed *count* times on *number* of *object*s. Almost all parts are optional. Also, some operators don't take objects at all. This operator/operation syntax is vi's heart. It is why people either love or hate vi. People love it, because it is such a simple schema. Once one knows the few operators (not more than ten), and a few of the objects one can be very productive in vi. People who hate vi simply can't get this schema, and the fact that there is a difference between command and insert mode, into their heads.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-4" title="Learning the vi Editor/Details>`_]
 
Objects

--------------------------------------------------------------------------------

We told you that things like the ``w`` command moves one word. We actually cheated a little bit when telling you this. There is no such thing as a ``w`` command. ``w`` is an object specification, not a command. The object specification was given without an explicit operator like ``d``. In such a case vi uses the implicit default operator. And that operator is *move*.

Whenever you use an object specification without an operator, the operator *move* will be used. Therefore, object specifiers degrade to move commands. The following is a list and summary of all object specifier. Logically, you can use them in conjunction with operators, or to move around if used stand-alone. You have seen a few of them already:

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-5" title="Learning the vi Editor/Details>`_]
 
Paragraph, Section, Sentence Objects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

}
    Everything until next paragraph end.
{
    Everything until previous paragraph end.
]]
    [Everything until next section end.]
[[
    [Everything until previous section end.]
)
    Everything until next sentence end.
(
    Everything until previous sentence end.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-6" title="Learning the vi Editor/Details>`_]
 
Line Objects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

[*number*]G
    Everything until line *number*. If *number* is omitted, last (not first) line in file. The first line can be addressed as ``1G`` instead.
[*number*]H
    *number* of lines after the first line currently on screen. If number is not given, the first line on the screen.
[*number*]L
    *number* of lines before the last line currently on screen. If number is not given, the last line on the screen.
M
    The middle line of the screen.
j
    One line down from current line.
k
    One line up from current line.
_
    (underscore) The current line as a whole.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-7" title="Learning the vi Editor/Details>`_]
 
Positions within Lines

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

0
    (Digit 0). Backward to first column of line. Same as ``1|`` (not ``0|``).
^
    Backward to first non-whitespace character.
$
    Forward to end of line.
[*number*]|
    Column *number* of the current line. If number is not given, column 1 is used.
t*char*
    Before the next appearance of character *char* on the current line.
T*char*
    Backwards after the next appearance of character *char* on the current line.
f*char*
    Next appearance of character *char* on the current line.
F*char*
    Previous appearance of character *char* on the current line.
&#160;;
    Repetition of the last ``t``, ``T``, ``f``, or ``F`` command.
,
    Repetition of the last ``t``, ``T``, ``f``, or ``F`` command, but in opposite direction.
+
or

<CR>
    To the first non-whitespace character on the next line.
-
    To first non-whitespace character on the previous line.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-8" title="Learning the vi Editor/Details>`_]
 
Word Objects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

w
    Forward to next begin of a word.
e
    Forward to next end of a word.
b
    Backwards to next begin of a word.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-9" title="Learning the vi Editor/Details>`_]
 
Character Object

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

h
or

<BS>
    Left character.
l
or

<SPACE>
    (lower-case letter L or space) Right character.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-10" title="Learning the vi Editor/Details>`_]
 
Pattern Matching Objects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/
*pattern*
/
&#160;
    Forward to the beginning of the first match of pattern *pattern*.
?
*pattern*
?
&#160;
    Backwards to the beginning of the first match of pattern *pattern*.
<n>
&#160;
    Repeat the last ``/`` or ``?``.
<N>
&#160;
    Repeat the last ``/`` or ``?`` in opposite direction.
<%>
&#160;
    To next matching (, {, or [.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-11" title="Learning the vi Editor/Details>`_]
 
Operators

--------------------------------------------------------------------------------

The previously listed objects can be used as arguments to operators. If no operator is given, the default *move* operator is used. The number of operators in vi is surprisingly small - ten in total. Here is a list of the operators:

*needs better descriptions, a few of them are separately described later in this module*

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-12" title="Learning the vi Editor/Details>`_]
 
Operators taking Objects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

c&#160;
    change - change the addressed objects. In fact, the text is replaced by what is typed in.
d&#160;
    delete - delete the addressed objects. The deleted text is placed in the undo buffer.
y&#160;
    yank - copy the text of the addressed objects into the buffer.
<&#160;
    shift left - object arguments can only be objects which address lines `Indenting and Shifting <#Indenting_and_shifting>`_.
>&#160;
    shift right - object arguments can only be objects which address lines `Indenting and Shifting <#Indenting_and_shifting>`_.
&#160;!&#160;
    *bang* filter-through - filter lines through an external program. Objects can only be objects addressing lines `Filtering (stub) <#Filtering>`_.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-13" title="Learning the vi Editor/Details>`_]
 
Operators not taking Objects

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

r, s,

x&#160;
    Delete character. Use the *d* operator for deleting other objects than characters.
~&#160;
    Flip case of character at cursor position. An uppercase letter becomes its lowercase equivalent, and a lowercase letter becomes its uppercase equivalent.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-14" title="Learning the vi Editor/Details>`_]
 
Special Operator Forms

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There are two special forms when typing an operator:

* Typing the character in upper-case, instead of lower-case. E.g. ``Y`` instead of ``y`` , and
* doubling the character. E.g. ``yy`` instead of ``y``.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-15" title="Learning the vi Editor/Details>`_]
 
'Strange' lines on the screen

********************************************************************************

vi was written at a time when terminal or modem connections were slow. Therefore, vi used several optimisation techniques to limit the need for redrawing the whole screen. In such cases, vi used to display lines beginning with a special marker. Modern vi's seldom have the need for such performance optimizations any more, but they still have the habit to display such lines.

There are two special markers used:

<pre>
~*line*
</pre>

A leading '~' indicates that the line is past the end of the file (non-existent). This can be observed, for example, when vi is started on a new or empty file.

<pre>
@*line*
</pre>

The line is only on the screen, not in the file. This happens for deleted lines. If *wrap* is enabled (the default), this also happens for lines that are too long to show on the screen all at once.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-16" title="Learning the vi Editor/Details>`_]
 
Indenting and shifting

********************************************************************************

vi supports auto-indentation of text lines and also provides command for manual indentation. This is useful when editing program source code. It is a common convention in many programming languages to use indentation to increase readability of the source code.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-17" title="Learning the vi Editor/Details>`_]
 
Options

--------------------------------------------------------------------------------

The option ``shiftwidth`` (sw) determines how much space is used for indentation. E.g.

<pre>

<ESC>

:set
 shiftwidth=4
<CR>

</pre>

or

<pre>

<ESC>

:set
 sw=4
<CR>

</pre>

tells vi to use four spaces for indentation.

The option [``no``]``autoindent`` (ai) tells vi to use auto identation or not. Auto indentation is turned on by

<pre>

<ESC>

:set
 autoindent
<CR>

</pre>

or

<pre>

<ESC>

:set
 ai
<CR>

</pre>

And it is turned off by

<pre>

<ESC>

:set
 noautoindent
<CR>

</pre>

or

<pre>

<ESC>

:set
 noai
<CR>

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-18" title="Learning the vi Editor/Details>`_]
 
Command Mode

--------------------------------------------------------------------------------

Shifting lines is done with the < and > commands. < moves the text one ``shiftwidth``to the left (outdenting), while > moves the text one ``shiftwidth`` to the right (indenting). The number of lines which can be affected are specified in vi's typical way. However, only *`objects <#Objects>`_* which identify lines, and not *objects* which identify words or individual characters can be used.

E.g.

<pre>
>G
</pre>

moves all lines from the current line until the end of the file to the right.

Or

<pre>
<}
</pre>

moves all lines from the current line until the end of the paragraph to the left. Of course, the shift commands can be used in conjunction with ``%``, which indicates the next opening bracket. E.g. to shift the lines encompassing the current cursor position up to the first line with a matching (, {, or [ to the left one would type:

<pre>
<%
</pre>

Like with all commands it is also possible to specify a line count:

[*number*]<<
or

<[*number*]<
    Moves *number* of lines, starting at the current line, one ``shiftwidth`` to the left (outdenting). If *number* is not given, 1 is assumed - this leads to the shifting of the current line to the left.
[*number*]>>
or

>[*number*]>
    Moves *number* of lines, starting at the current line, one ``shiftwidth`` to the right (indenting). If *number* is not given, 1 is assumed - this leads to the shifting of the current line to the right.
The < and > commands can also be used with a marker. In this case, the reference to the marker is placed between the two characters of the command:

<'m<
    Shifts the lines from the marker *m* up and including the current line to the left.
>'m>
    Shifts the lines from the marker *m* up and including the current line to the right.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-19" title="Learning the vi Editor/Details>`_]
 
Insert Mode

--------------------------------------------------------------------------------

^t
    Moves *shiftwidth* to the right. Note, it is a common mistake to use the <TAB> key instead of ``^t``. <TAB> inserts a Ctrl-I character and moves to the next multiple of *tabstop*, and not to *shiftwidth*. So <TAB> only works if *tabstop* and *shiftwidth* are set to the same value.
    Since it is not a good idea to set *tabstop* to anything else than 8, <TAB> can only be used instead of ``^t`` for indenting when *shiftwidth* is also set to 8.
^d
    In autoindent mode, backtabs one *shiftwidth*. E.g. if autoindent is on, and one wants to enter the follwing text:
<pre>
if(true) {
    printf("done"); // start sw indent
    return;
} // bracket moved back to the left
</pre>

    one would type
<pre>
if(true) {<CR>
**^t**printf("done"); // start sw indent<CR>
return;<CR>
**^d**} // bracket moved back to the left<CR>
</pre>

There are some special variants of ``^d``, too:

<small>^</small>^d
    (the letter *^* followed by Ctrl-D). When this is typed first on a new line, all autoindent is killed (the insertion point is moved to the beginning of the line). Autoindent is then continued on the next line.
    E.g. to enter the following text when using autoindenting
<pre>
        an indented paragraph
        another line in the indented paragraph
.F roff formating commands have to start at column one with a '.'
        more text in the indented paragraph
</pre>

one would type

<pre>
**^t**an indented paragraph<CR>
another line in the indented paragraph<CR>
**^^d**.F roff formating commands have to start at column one with a '.'<CR>
more text in the indented paragraph<CR>
</pre>

0^d
    (the digit *0* followed by Ctrl-D). Kills all autoindent (moves cursor to the beginning of the line), and leaves autoindent off, until text is once manually indented (using ``^t``).
    E.g. to enter the following text when using autoindenting
<pre>
     INTEGER FUNCTION FAC(N)
     FAC = 1
     DO 100 I = 2, N
          FAC = I * FAC
C
C PROVIDE LABEL TO END LOOP
C A HINT FOR THOSE GRASSHOPPERS: THIS IS FORTRAN CODE :-)
C
100  CONTINUE
     RETURN
     END
   
</pre>

    one would type
<pre>
<ESC>:set sw=5<CR>
o**^t**INTEGER FUNCTION FAC(N)<CR>
FAC = 1<CR>
DO 100 I = 2, N<CR>
**^t**FAC = I * FAC<CR>
**0^d**C<CR>
C PROVIDE LABEL TO END LOOP<CR>
C A HINT FOR THOSE GRASSHOPPERS: THIS IS FORTRAN CODE :-)<CR>
C<CR>
100  CONTINUE<CR>
**^t**RETURN<CR>
END<CR>
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-20" title="Learning the vi Editor/Details>`_]
 
Modelines

********************************************************************************

Modelines are lines in text files which are specially interpreted by vi when such a text file is opened. When the ``modeline`` (``ml``) (in some version of vi also called ``modelines``) option is turned on (e.g. in the users ``.exrc`` file), vi scans the first and last five lines of each opened file for text of the form

<pre>
*unrelated text* ``vi:``*command*``:`` *more unrelated text*
</pre>

or

<pre>
*unrelated text* ``ex:``*command*``:`` *more unrelated text*
</pre>

Each *command* from such lines is taken and executed as it would have been typed by the user. Any text in front of the modeline-marker (``vi:`` or ``ex:``) or behind the closing : is ignored for the modeline interpretation. This can be used to place modelines in comments if they are used in some programming source code.

Here is an example Java source code file. It contains a modeline on the second and third line, in a Java comment:

<pre>
/* 
 * vi:set sw=4 ai:
 * vi:set showmatch: 
 */
package gnu.freesoftware;
public class Interpreter {
    public Interpreter() ...
         ...
</pre>

When modelines are turned on, and this file is opened, ``shiftwidth`` (``sw``) is set to 4, ``autoindent`` (``ai``) is turned on, and the ``showmatch`` (``sm``) option is turned on, too. There is no particular reason why two ``set`` commands on two modelines are used other than to demonstrate that all modeline commands found in the first and last five lines are executed, and not just the first.

Modelines can be used to play some practical jokes. E.g., a file with the modeline

<pre>
vi:q!:
</pre>

immediately closes the editor and makes it impossible to edit the file as long as modelines are turned on.

Modelines get outright dangerous if they mess with system files. E.g., if the super user (administrator) of a Unix system has modelines turned on, and is tricked into opening a file with the following modeline, the important Unix password file is overwritten with the contents of the opened file:

<pre>
vi:2,$w! /etc/passwd:
root:A shiny new root password:0:0:System Administrator:/:/bin/sh
anotheruser:Another shiny new password:1:0:Just another user:/home/anotheruser:/bin/sh
</pre>

Therefore modelines should only be turned on in a controlled environment. This is sad, since in principle it is a nice idea that files are able to provide the editor with a configuration best suited to edit that file.

There are some other problems with modelines. Classic vi versions always set a file's status to *modified* if they find a modeline, even if no editing in the file has taken place. This forces the user to leave the editor with ``:q!`` instead of just ``:q``. If instead ``ZZ`` is used to leave, the file is written. This causes tools like **make** to think the file has changed if it in fact hasn't.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-21" title="Learning the vi Editor/Details>`_]
 
*.exrc* Configuration File

********************************************************************************

*This module is a `stub <#Power_Users>`_. You can help Wikibooks by `fixing it </wiki/Wikibooks:Find_or_fix_a_stub" title="Wikibooks:Find or fix a stub>`_.* For a start:

.exrc files are files containing vi (and ex) configuration data. The format of the data in such a file is that of ex commands, without the leading ':' (column). Typically, .exrc files are used to load some default mappings (map and map! ex commands) or define particular defaults. E.g. the following .exrc file would set autoindent and the shiftwidth when vi is started:

<pre>
set ai
set sw=4
</pre>

Normally, a .exrc file is placed in the user's home directory. Since the file name starts with a '.', the file is hidden under Unix-like operating systems. It is possible to place .exrc files in other directories, too. Vi can read the .exrc file in the current directory from which it is started. However, this feature is considered a security risk and turned off by default. It is considered a risk, because similar jokes can be played with .exrc files as with what has been described for modelines. The .exrc file in a user's home directory is considered safe, because on a correctly configured Unix system only the particular user should have write access to it.

There are three important things which should be observed when working with a classic vi and .exrc files:

* .exrc files must not contain empty lines. Classic vi chokes on these lines with all kinds of cryptic error messages.
* There is no official way to place a comment in .exrc files. However, since the beginning of time the following hack is used and is known to work: A line which starts with a " (quotation character) is ignored by vi.
* Classic vi is very picky about map and map! commands. Definitions which by all means should work can trigger strange error messages. This is due to classic vi's limited parser and interpreter for such definitions. Spliting a map or map1 command in several smaller ones can sometimes help.
Many clones have relaxed these rules by allowing empty lines in an .exrc file, and by officially specifying the " as the comment character. Also, good clones should have no problem with map or map! specifications.

<pre>
"
" This is a comment in an .exrc file
" A .exrc file must not contain empty lines, so
" comment lines need to be used to separate entries
"
set sm
set sw=8
"
set wm=8
"
" map 'g' to go to begin of file
map g 1G
" rcs check-out (/co) and check-in (/ci)
map /co :w! %.co.bak^M:!co -l %^M:e!
map /ci :w^M:!ci -u %^M:e!^M
"
" Abbreviations
ab Lx Linux
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-22" title="Learning the vi Editor/Details>`_]
 
Tags

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-23" title="Learning the vi Editor/Details>`_]
 
Overview

--------------------------------------------------------------------------------

Vi can use so called *tag files* (or *tags*) to allow for quick navigation (jump) to "interesting" information in a set of files. The most common usage for this is to navigate within source code files. E.g. to jump from the usage of a certain function to the function's definition, possibly in another file.

The mechanism is relatively simple. You tell vi to go to a particular tag. vi looks up the file in which the tag can be found, opens that file and jumps to the location of the tag in that file. In order to find the file and position of a tag, vi consults a *tag file*. A *tag file* contains an index of tags. A tag is an item (e.g. some programming language object) for which such an index entry can be found in a tag file. When vi is asked to jump to a particular tag, vi looks up the index entry for that tag, and uses the information to jump to the particular item.

In order to use this feature one first has to create a tag file, or a set of tag files, containing entries for all potentially interesting items. These tag file or files then need to be made known to vi - if the default file name is not used. This can e.g. be done by having appropriate commands in an ``.exrc`` file.

Modern IDEs provide similar navigation features, but without the need to build a tag file separately. IDEs build the necessary index on-the-fly or use fast brute-force full-text search algorithms. The need for the extra step of creating a tag file for vi is annoying by modern standards. Still, vi's tag file system works and is usable.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-24" title="Learning the vi Editor/Details>`_]
 
Tag File Format, Creation & ctags(1)

--------------------------------------------------------------------------------

The creation of a tag file typically requires to use a tool which analyses the input text files (e.g. programming source code) and generates entries for each item of interest found in the input text file. The most common tool is called **ctags**(1) and is a standard Unix program. Several vi clones come with own versions of ctags, sometimes called differently.

ctags knows the syntax of a number of programming languages and generates index information for items like function names, and macro definitions.

In case ctags is not available, or the available version of ctags does not support the programming language in use it is also possible to generate tag files with text processing tools like **awk**(1), **sed**(1) or **perl**(n) and some clever scripts, because tag files are ASCII files.

Typically an entry in a tag file looks like

<pre>
 *tag-name*<TAB>*file-name*<TAB>*ex-command*
</pre>

*tag-name*
    The name of the item. E.g. a function name or macro name.
*file-name*
    The name of the file in which the *tag-name* item can be found
*ex-command*
    An ex editor command indicating how to locate the item in the file. This can be any ex command. But two types of ex commands make the most sense:
* In the simple form *ex-command* is a line number, which is indeed a valid ex command.
* Usually, however, it is a better idea to use a search pattern like ``/``*tag-name*``/``. This provides some flexibility if the file is edited later. It reduces the number of times the tag file has to be re-build, because something moved inside a file. ctags also mostly generates pattern search commands and not line numbers.
Typically vi clones allow for some extensions of this format. Check the particular documentation.

A tag file should be sorted in alphabetic order to speed up operation. If this can't be done, vi's `-S <#Command_line_invocation>`_ command line option can be used.

It is usually not a good idea to generate tag files by manually running ctags or an own tool. Instead the building of tag files is usually better integrated into the software build system. For Unix this means using *Makefiles*. Typically, the **make**(1s) targets for generating tag files are called *tags*, because that's the name of the to be created tag file:

<pre>
# Makefile snipet
SRCS = ... # all source code
tags: $(SRCS)
        ctags -dt $(SRCS)
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-25" title="Learning the vi Editor/Details>`_]
 
Ex Commands

--------------------------------------------------------------------------------

By default, vi looks in a file called ``tags`` for any tags. This file name can be changed with the following ex command. In fact, more than one file name can be specified. They are all loaded to find tags. The command is maybe best placed in a project-specific ``.exrc`` file.

:set tags=*filename*[\ *filename ...]<CR>*
    Set name of files which contain tag information. The syntax of the command varies a little bit from vi to vi version if more than one tag *filename* is supposed to be provided. Filenames have either to be separated by "``\`` " (backslash space) or "``;``" (semicolon).
Naviation to tags can be done via the following ex command. There is also a vi command to do this.

:ta *tag-name*<CR>
    or
:tag *tag-name*<CR>
    Look up the *tag-name* in the tags file(s), open the file named in the index entry and execute the *ex-command* from the index entry. This effectively positions the user at the file and position where the symbol *tag-name* is defined. The command also remembers the current file and position on the tag stack.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-26" title="Learning the vi Editor/Details>`_]
 
EX commands in vi

********************************************************************************

Ex is a line editor that serves as the foundation for the screen editor vi. Ex commands work on the current line or on a range of lines in a file.

*Syntax of Ex commands*
**:[address] command [options]**

':' specifies an Ex command.

**Address**
The 'address' specifies the lines number or range of lines that are the object of command.If no address is given,the current line is the object of the command.

Address Ranges can be specified by any of the following ways in Ex command syntax.

<table>
<tr>
<th>Syntax</th>
<th>Range</th>
</tr>
<tr>
<td>**&#160;:%**</td>
<td>All the lines in the file.</td>
</tr>
<tr>
<td>**:1,$**</td>
<td>All the lines in the file.</td>
</tr>
<tr>
<td>**:^,$**</td>
<td>All the lines in the file.</td>
</tr>
<tr>
<td>**:X,Y**</td>
<td>All the lines between Line number X to Line number Y.</td>
</tr>
<tr>
<td>**:.,.+n**</td>
<td>All the lines between current line and next n lines.</td>
</tr>
<tr>
<td>**:.,.-n**</td>
<td>All the lines between current line and previous n lines.</td>
</tr>
<tr>
<td>**:X;Y**</td>
<td>Line number X to Line number Y with current line set as Line Number X.</td>
</tr>
<tr>
<td>**:X,+n**</td>
<td>All the lines between Line number X and next n lines from Current Line.</td>
</tr>
<tr>
<td>**:X,-n**</td>
<td>All the lines between Line number X and previous n lines from Current Line.</td>
</tr>
<tr>
<td>**:X**</td>
<td>The Line number X.</td>
</tr>
<tr>
<td>**:.**</td>
<td>The Current Line.</td>
</tr>
<tr>
<td>**:$**</td>
<td>The Last line of File.</td>
</tr>
<tr>
<td>**:0**</td>
<td>The First line of file</td>
</tr>
<tr>
<td>**:X-n**</td>
<td>The Line which is n lines before Line number X .</td>
</tr>
<tr>
<td>**:X+n**</td>
<td>The Line which is n lines after Line number X .</td>
</tr>
<tr>
<td>**:'b**</td>
<td>The Line which is marked by letter b.</td>
</tr>
<tr>
<td>**:'**</td>
<td>The Line which is marked.</td>
</tr>
<tr>
<td>**:/word**</td>
<td>Next Line containing pattern word</td>
</tr>
<tr>
<td>**:?word**</td>
<td>Previous Line containing pattern word</td>
</tr>
</table>

**Commands**

<table>
<tr>
<th>Command</th>
<th>Ex Syntax</th>
<th>Operation</th>
</tr>
<tr>
<td>Substitute</td>
<td>**:%s/str1/str2/g**</td>
<td>Substitute str1 by str2 in the Address range specified as whole file.</td>
</tr>
<tr>
<td>Copy and Paste</td>
<td>**:t8**</td>
<td>Copy current line and Paste after Line number 8.</td>
</tr>
<tr>
<td>Copy and Paste</td>
<td>**:9t11**</td>
<td>Copy line 9 and Paste after Line number 11.</td>
</tr>
<tr>
<td>Copy and Paste</td>
<td>**:5,8t10**</td>
<td>copy lines 5 through 8 and Paste after Line number 5.</td>
</tr>
<tr>
<td>Copy and Paste</td>
<td>**:10,14co20**</td>
<td>Copy lines 10 through 14 and Paste after Line number 20.</td>
</tr>
<tr>
<td>Move and Paste</td>
<td>**:m8**</td>
<td>Cut current line and Paste after Line number 8.</td>
</tr>
<tr>
<td>Move and Paste</td>
<td>**:9m11**</td>
<td>Cut line 9 and Paste after Line number 11.</td>
</tr>
<tr>
<td>Move and Paste</td>
<td>**:5,8m10**</td>
<td>Cut lines 5 through 8 and Paste after Line number 5.</td>
</tr>
<tr>
<td>Yank/Copy in named buffer.</td>
<td>**:3,10y p**</td>
<td>Copy the text between line number 3 and line number 10 in a buffer p (single lowercase char)</td>
</tr>
<tr>
<td>Yank/Copy.</td>
<td>**:3,10y**</td>
<td>Copy the text between line number 3 and line number 10 in a temporary buffer.</td>
</tr>
<tr>
<td>Paste/Put</td>
<td>**:10p**</td>
<td>Paste the text in temporary buffer at line number 10.</td>
</tr>
<tr>
<td>Paste/Put</td>
<td>**:p**</td>
<td>Paste the text in temporary buffer at Current line .</td>
</tr>
<tr>
<td>Paste/Put</td>
<td>**:+10p**</td>
<td>Paste the text in temporary buffer at 10 lines after Current line</td>
</tr>
<tr>
<td>Write/Save file</td>
<td>**:w!**</td>
<td>Save the current file.</td>
</tr>
<tr>
<td>Write/Save file</td>
<td>**:w fname**</td>
<td>Save the current file as fname. Similar to "Save as" in Windows Operating system.</td>
</tr>
<tr>
<td>Write/Save file</td>
<td>**:15,30w fnew**</td>
<td>Saves the Lines between Line number 15 to Line number 30 of current file in a new file named fnew.</td>
</tr>
<tr>
<td>Write/Save file</td>
<td>**:15,30w >> fexist**</td>
<td>appends the Lines between Line number 15 to Line number 30 of current file in a file named fexist.</td>
</tr>
<tr>
<td>Write/Save file</td>
<td>**:x!**</td>
<td>Save & Quit current file Forcefully.</td>
</tr>
<tr>
<td>Quit file</td>
<td>**:q**</td>
<td>Quit the current file.</td>
</tr>
<tr>
<td>Quit file</td>
<td>**:q!**</td>
<td>Quit current file Forcefully without saving.</td>
</tr>
<tr>
<td>Edit/Refresh</td>
<td>**:e!**</td>
<td>Refresh- Discard changes not saved.</td>
</tr>
<tr>
<td>Edit</td>
<td>**:e fname**</td>
<td>Edit file named fname without leaving vi.</td>
</tr>
<tr>
<td>Edit</td>
<td>**:n**</td>
<td>Edit next file without leaving vi.</td>
</tr>
<tr>
<td>Edit</td>
<td>**:p**</td>
<td>Edit previous file without leaving vi.</td>
</tr>
<tr>
<td>Edit</td>
<td>**:rew**</td>
<td>Edit previous file without leaving vi.</td>
</tr>
<tr>
<td>Insert file</td>
<td>**:r fname**</td>
<td>Inserts all the text in the file named "fname" at the current cursor location.</td>
</tr>
<tr>
<td>Read/Insert</td>
<td>**:r! command**</td>
<td>Inserts the output of command at the current cursor location.</td>
</tr>
<tr>
<td>read/Insert</td>
<td>**10:r! command**</td>
<td>Inserts the output of command at Line number 10.</td>
</tr>
<tr>
<td>Insert file</td>
<td>**&#160;:r fname**</td>
<td>Inserts all the text in the file named "fname" at the current cursor location.</td>
</tr>
<tr>
<td>Insert text</td>
<td>**:45i!**</td>
<td>Sets up insert mode at Line number 45.</td>
</tr>
<tr>
<td>append text</td>
<td>**:45a!**</td>
<td>Sets up append mode at Line number 45.</td>
</tr>
<tr>
<td>Delete Lines</td>
<td>**:d**</td>
<td>Deletes current line.</td>
</tr>
<tr>
<td>Delete Line</td>
<td>**:45d**</td>
<td>Delete Line number 45.</td>
</tr>
<tr>
<td>Delete Lines</td>
<td>**:.,.+15d**</td>
<td>Delete all the lines between current line and next 15 lines</td>
</tr>
<tr>
<td>Delete Lines and put in buffer</td>
<td>**:.,.+15d f**</td>
<td>Delete all the lines between current line and next 15 lines and put them in a buffer named f</td>
</tr>
<tr>
<td>mark a Line</td>
<td>**:10ma f**</td>
<td>Mark the Line number 10 with a single lowercase char f.Return later to the mark by 'f.</td>
</tr>
<tr>
<td>Shell Command</td>
<td>**10,15:! command**</td>
<td>Execute command in a shell. Treat the text between Line number 10 and Line numner 15 as standard input to command, and replace these lines with the output.</td>
</tr>
<tr>
<td>View</td>
<td>**:10z**</td>
<td>Set up a view with Line number 10 at the Top of screen.</td>
</tr>
<tr>
<td>View</td>
<td>**:10z+**</td>
<td>Set up a view with Line number 10 at the Top of screen.</td>
</tr>
<tr>
<td>View</td>
<td>**:10z-**</td>
<td>Set up a view with Line number 10 at the bottom of screen.</td>
</tr>
<tr>
<td>View</td>
<td>**:100z.**</td>
<td>Set up a view with Line number 100 at the center of screen.</td>
</tr>
<tr>
<td>View</td>
<td>**:100z^**</td>
<td>Set up a view with Line number 100 at the center of screen and set current line as Line number 100.</td>
</tr>
<tr>
<td>View</td>
<td>**:10z+ 5**</td>
<td>Set up a view with Line number 10 at the Top of screen and display next 5 lines from Line number 10.</td>
</tr>
<tr>
<td>Status</td>
<td>**:f**</td>
<td>Shows current position and the file name at the bottom of the screen.It also specifies if any changes are made to the file since it has been opened.</td>
</tr>
</table>

**Options**

<table>
<tr>
<th>Option</th>
<th>Operation</th>
</tr>
<tr>
<td>&#160;!</td>
<td>Specifies the command has to be executed forcefully.</td>
</tr>
<tr>
<td>destination</td>
<td>Specifies the Line number where the text is to be pasted.Used with Copy and Move commands.</td>
</tr>
<tr>
<td>count</td>
<td>Specifies the number of time command is to be repeated.This number always succeed the command.</td>
</tr>
<tr>
<td>fname</td>
<td>Specifies that the object is a file name "fname".</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-27" title="Learning the vi Editor/Details>`_]
 
Vi Commands

--------------------------------------------------------------------------------

Navigation to tags can be done via the following vi command:

^]
    Take the *tag-name* at the cursor position, look it up in the tag file(s) and navigate to it, similar to the ``:ta`` ex command. The command also remembers the current file and position on the tag stack.
The following command uses the tag stack to go back to the previous position. Older vi's don't have it implemented:

^T
    Get the previous position and file from the tag stack and return to it. The data is removed from the file.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-28" title="Learning the vi Editor/Details>`_]
 
Command Line

--------------------------------------------------------------------------------

Vi can also be started with a tag name instead of a file name. See the `-t <#Command_line_invocation>`_ command line option.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-29" title="Learning the vi Editor/Details>`_]
 
Shell escape

********************************************************************************

While one is working in vi there might arise a need to run another operating system command. In these modern days this is not a big issue. One can open another terminal window and do as pleased. However, this is not necessary when working with vi. Vi, like many of the older interactive Unix tools, contains features to run operating system commands or start a command line interpreter (shell) from within the editor. This dates back to the times when there were no graphical user interfaces and an editor like vi would take up the complete screen of the terminal (a real terminal of course, not a terminal emulation). Being able to run commands from vi spares one the need to first quit the editor just to look something up, e.g. in a manual page.

In addition, vi provides features to insert the text output of other commands directly into the text under editing.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-30" title="Learning the vi Editor/Details>`_]
 
Ex Commands

--------------------------------------------------------------------------------

The editor commands to run another command from within vi are in fact implemented as ex commands. That is, they start with the familiar ':' in command mode.

To execute one command from within vi, one would type

<pre>
:!*command*<CR>
<CR>
</pre>

At the end of the *command* one has to hit Return (the second <CR> shown above) to go back to vi. Vi then repaints the screen and continues where editing was left.

In order to repeat the last *command*, one can simply type

<pre>
:!!<CR>
 <CR>
</pre>

It is possible to append to a previous command by using ``:!!``, followed by whatever should be appended. For example, the second of the following two commands

<pre>
:!ls<CR>
 <CR>
 :!! | more<CR>
 <CR>
</pre>

is actually equal to

<pre>
:!ls | more<CR>
 <CR>
</pre>

(Note, **ls** is the Unix command to list a directory, **more** is the Unix command to paginate output, so it doesn't just scroll off the screen).

Once something is appended to a command, it becomes part of the last remembered command. So in the example above, another

<pre>
:!!<CR>
 <CR>
</pre>

would be equal to

<pre>
:!ls | more<CR>
 <CR>
</pre>

and not

<pre>
:!ls<CR>
 <CR>
</pre>

Two placeholders can be used in shell escapes to denote the current file name or the name of the previously edited file name:

&#160;%&#160;
    is a placeholder for the current file name,
#&#160;
    is a placeholder for the previously edited file name.
For example, if one is editing some shell script and wants to try it out, one could type the following commands to save the file (``:w``), set the file's attributes to executable (``!chmod ...``), and run it (``!%``):

<pre>
:w<CR>
 :!chmod 755 %<CR>
 <CR>
 :!%<CR>
 <CR>
</pre>

If the file's name is, e.g. *script.sh*, the above would be equal to typing

<pre>
:w<CR>
 :!chmod 755 script.sh<CR>
 <CR>
 :!script.sh<CR>
 <CR>
</pre>

Instead of running a command from within vi it is also possible to start the shell from within vi. vi has an own command for this, which looks up the user's default shell (e.g. the Bourne shell or the C shell) and starts it. It is important to note that a new shell is started. The user is not returned to the shell from which vi was started. The command is called *:sh*, and it can be used as it follows:

<pre>
<ESC>:sh<CR>
$ #*shell commands, when done exit shells:*
$ exit<CR>
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-31" title="Learning the vi Editor/Details>`_]
 
Vi Commands

--------------------------------------------------------------------------------

It is possible to filter all or parts of a text currently under editing through an external program. The original text is then replaced with the output of the external command.

The classic example for this feature is the usage of the Unix text formatter **fmt**. vi itself doesn't have any specific formating capabilities, however, by running the text or parts of it through an external formater from within vi, the desired formatting is easily achieved.

The vi command for filtering text is ``!`` (note, as opposed to the ex shell escape command, there is no leading ``:``). ``!`` follows the usual vi command format. So one can specify the scope to which it should apply. E.g. ``!!`` means to filter the current line, or ``!}`` means to filter the current paragraph.

The ``!`` vi command has to be followed by by the name of the external program to be used for filtering. E.g. in order to format the current paragraph with the already mentioned Unix text formatter **fmt**, one would type

<pre>
!}fmt<CR>
</pre>

``!`` can also be used to just insert the output of some external command into the currently edited text. To do so, one would first create a new empty line (e.g. with ``o``), and then use ``!!`` to replace the empty line with the output of a command. For example,

<pre>
o<ESC>!!ls<CR>
</pre>

would include a listing of the files in the current directory into the text under Unix.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-32" title="Learning the vi Editor/Details>`_]
 
Execute command from Buffer

********************************************************************************

*This module is a `stub <#Power_Users>`_. You can help Wikibooks by `fixing it </wiki/Wikibooks:Find_or_fix_a_stub" title="Wikibooks:Find or fix a stub>`_.*

@*b*
    Execute command stored in buffer *b*.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-33" title="Learning the vi Editor/Details>`_]
 
vi for Programmers

********************************************************************************

Classic vi provides a number of features which are useful for programmers. Vi was made by programmers for programmers -- but at a time when programming was different. Classic vi's programming support is, by today's standards, not too great, but of course still usable. And it is still more convenient to use vi for editing programming code than any of the *...pad* editors like **notepad** (Windows) or **dtpad** (CDE/Motif). vi probably works best on Unix systems due to the many text filters that come with Unix and the ease with which additional special-purpose filters can be scripted.

Useful features in vi for programmers are:

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-34" title="Learning the vi Editor/Details>`_]
 
Autoindent and manual Shifting of Lines

--------------------------------------------------------------------------------

See `Indenting and shifting <#Indenting_and_shifting>`_

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-35" title="Learning the vi Editor/Details>`_]
 
Modelines

--------------------------------------------------------------------------------

Modelines to set per-language defaults - if security is not an issue (see `Modelines <#Modelines>`_)

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-36" title="Learning the vi Editor/Details>`_]
 
Tags for Navigating

--------------------------------------------------------------------------------

See `Tags <#Tags>`_

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-37" title="Learning the vi Editor/Details>`_]
 
Shell Escapes

--------------------------------------------------------------------------------

See `Shell escape <#Shell_escape>`_

* One way to use shell escapes is to run a *makefile* or the compiler from within vi. It is in general a good idea to first save the current file before trying to compile it:
<pre>
<ESC>:w<CR>
:!make<CR>
*or*
<ESC>:w<CR>
:!cc %<CR>
*and afterwards*
<ESC>:w<CR>
:!!<CR>
</pre>

* Another way is filter source code through an external command, e.g. through a comment-reformator for the specific language. For example, the following command will filter the current paragraph through a external comment-reformator called **recomment** (not a standard Unix program, but available as a separate script).
<pre>
!}*recomment*
</pre>

    See `[1] <http://examples.oreilly.com/upt3/split/recomment"rel="nofollow>`_ for the **recomment** script for Unix.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-38" title="Learning the vi Editor/Details>`_]
 
Editing multiple Files

--------------------------------------------------------------------------------

vi can be started with a list of files:

<pre>
vi file1 file2 file3 ...
</pre>

Combined with other Unix features, like file matching, this can be a powerful feature. E.g. to open all C source code, including header files in a directory (.h), the following command can be used:

<pre>
vi *.[ch]
</pre>

Or to find all files which contain a certain keyword and open them, something like

<pre>
vi `grep -l Keyword *.txt`
</pre>

can be used.

Once vi has been started with a list of files it is possible to navigate within the list with the following commands:

:n&#160;
    next - Move to the next file in the file list
:rew&#160;
    rewind - rewind the file list and open the first file in the list.
vi clones like vim typically provide more commands, e.g. to go back one file in the file list.

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-39" title="Learning the vi Editor/Details>`_]
 
Flip between two Files

--------------------------------------------------------------------------------

* Flip between two files using ``#`` as the name of the last file. E.g. to flip between a C source file and the corresponding header file.
<pre>
:e x.c<CR>
:e x.h<CR>
*some changes to x.h, then going back to x.c*
<ESC>:w<CR>
:e#<CR>
</pre>

* Flipping between two files using ``CTRL-^``. This is one of the forgotten vi commands.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-40" title="Learning the vi Editor/Details>`_]
 
The **error**(1) Program

--------------------------------------------------------------------------------

The **error**(1) program on Unix can be used to capture error messages from compilers and later jump from error message to error message in the editor. **error'**s way of working is archaic. It parses error messages from the compiler and inserts them as comments into the source file in which the compiler detected the error. Since **error** marks error messages with ``###`` and ``%%%`` in the source file, navigation can be done with vi commands like ``/`` and ``n``.

There are two common ways to use error with vi:

* From outside vi and letting error start vi. error can start vi on all files which produced an error during compilation, using the ``-v`` flag:
<pre>
$ cc *.c 2>&1 | error -v
# Notes:
#  cc    - the C compiler
#  *.c   - all C files in the current directory
#  2>&1  - Standard error output is redirected to normal standard output
#  |     - the output is feed to error as input
</pre>

    2. From inside vi, on the current file. First the file is saved, then it is tried to compile it, processing potential error messages with **error**, then the potentially changed source file is re-read (``:e!``), and finally the first mark is searched with ``/###``:
<pre>
*first time*
<ESC>:w<CR>
:!cc % 2>&1 | error<CR>
:e!<CR>
/###<CR>
*and afterwards*
<ESC>:w<CR>
:!!<CR>
:e!<CR>
/###<CR>
</pre>

Note:&#160;
    **error** is a horrible kludge and can really mess up source code and a version control system! We recommend you try it at least once and form your own opinion. Also have a look at error's man page first. vi clones like vim provide a much more sensible system. Here the editor executes the compiler (or **make**(1s)) and captures the output of the compiler. The information is recorded in an error message file by vim. vim then allows to navigate the source code by extracting file names and line numbers from the error message and jump to these positions. This is the same mechanism as provided by IDEs.
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-41" title="Learning the vi Editor/Details>`_]
 
Macros & Shortcuts

--------------------------------------------------------------------------------

vi's provides the ``:map`` and ``:map!`` commands to define useful shortcuts and macros, and ``ab`` to provide abbreviations.

    *Todo: Provide a few such macros?*
[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-42" title="Learning the vi Editor/Details>`_]
 
nroff/troff Typesetting Support

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-43" title="Learning the vi Editor/Details>`_]
 
Overview

--------------------------------------------------------------------------------

vi provides support for editing text files for the Unix typesetters **nroff** and **troff**. The most "common" usage for this typesetter these days is probably to write manual (man) pages for Unix applications.

The support for writing nroff/troff input text files is always active, there is no special vi mode or option which needs to be turned on. Already from this it can be concluded that there aren't too many nroff/troff specific operations in vi. In fact, vi just provides simple ways to navigate between nroff/troff paragraphs and sections. Nevertheless, these features help when editing nroff/troff files.

nroff's/troff's text file format is simple. Normal text and macros are mixed, where macros indicate how the text should be formatted. A macro starts with a '.' in column one, followed by a one or two letter macro name followed by optional macro arguments. A typical nroff/troff text file with some macros might look like:

<pre>
.SH "A SECTION HEADER"
Some text making up the first paragraph in the section.
More text in the paragraph.
.PP
A new paragraph has been started.
More text in this second paragraph.
.PP
Yet another paragraph.
.\"
.\" A comment infront of the next section header
.\"
.SH "SECTION HEADER 2"
Paragraph text.
</pre>

To simplify navigation in such a text file vi knows the common macro names for sections (the ``.SH`` in the above example) and paragraphs (the ``.PP`` in the example) and provides commands to move to the next/previous section. The list of macro names is configurable in vi.

Several of the common vi features also help when editing nroff/troff text. E.g. shell escapes to run the typesetter from within vi. The following will format the current file with the manual page macros:

<pre>
<ESC>:w<CR>
:!nroff -man % | more<CR>
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-44" title="Learning the vi Editor/Details>`_]
 
Options

--------------------------------------------------------------------------------

The following options are used to define the nroff/troff macro names as known by vi. Like all options, one changes them by using the ``:set`` ex command:

<pre>
:set *option*[=*value*]
</pre>

sections&#160;
    List of macro names which vi interprets as section delimiters. Two consecutive characters in the list form one macro name. Typically, vi's default contains ``.SH``, ``.NH``, ``.H``, and ``.HU``. So the *sections* option reads like
<pre>
sections=SHNHH HU
</pre>

paragraphs&#160;
    or
para&#160;
    List of macro names which vi interprets as paragraph delimiters. Two consecutive characters in the list form one macro name. vi's default typically contains ``.IP``, ``.LP``, ``.PP``, ``.QP``, ``.PL``, ``.Ib``, ``.p``. So the *paragraphs* option reads like
<pre>
paragraphs=IPLPPPQPPLIbp
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Details&action=edit&section=T-45" title="Learning the vi Editor/Details>`_]
 
Vi Commands

--------------------------------------------------------------------------------

When in command mode, the following commands relate to working on nroff/troff text:

[[&#160;
    Moves to the previous section.
]]&#160;
    Moves to the next section.
{&#160;
    Moves to the previous paragraph.
}&#160;
    Moves to the next paragraph.
And, for completeness:

(&#160;
    Moves to the previous sentence.
)&#160;
    Moves to the next sentence.
[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=7" title="Edit section: Vi clones>`_]
 
Vi clones

================================================================================

The following editors are derived from or share the spirit of the original vi editor, coupled to an easier to learn user interface:

* `Vim </wiki/Learning_the_vi_Editor/Vim" title="Learning the vi Editor/Vim>`_ 
`<img alt="75% developed&#160; as of Feb 7, 2005" src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/49/75%25.svg/9px-75%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="75% developed&#160; as of Feb 7, 2005>`_<small>&#160;(Feb 7, 2005)</small>

<ul>
<li>`Basic navigation </wiki/Learning_the_vi_Editor/Vim/Basic_navigation" title="Learning the vi Editor/Vim/Basic navigation>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Modes </wiki/Learning_the_vi_Editor/Vim/Modes" title="Learning the vi Editor/Vim/Modes>`_ 
`<img alt="75% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/49/75%25.svg/9px-75%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="75% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Tips and Tricks </wiki/Learning_the_vi_Editor/Vim/Tips_and_Tricks" title="Learning the vi Editor/Vim/Tips and Tricks>`_ 
`<img alt="25% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/3/34/25%25.svg/9px-25%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="25% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Useful things for programmers to know </wiki/Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Enhancing Vim </wiki/Learning_the_vi_Editor/Vim/Enhancing_Vim" title="Learning the vi Editor/Vim/Enhancing Vim>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `VimL Script language </wiki/Learning_the_vi_Editor/Vim/VimL_Script_language" title="Learning the vi Editor/Vim/VimL Script language>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

</li>
* `vile </wiki/Learning_the_vi_Editor/vile" title="Learning the vi Editor/vile>`_ 
`<img alt="0% developed&#160; as of May 28, 2006, just a stub" src="http://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/00%25.svg/9px-00%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="0% developed&#160; as of May 28, 2006, just a stub>`_<small>&#160;(May 28, 2006, just a stub)</small>

* `vipe </wiki/Learning_the_vi_Editor/vipe" title="Learning the vi Editor/vipe>`_ 
`<img alt="75% developed&#160; as of Oct 11, 2008, wikified man page" src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/49/75%25.svg/9px-75%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="75% developed&#160; as of Oct 11, 2008, wikified man page>`_<small>&#160;(Oct 11, 2008, wikified man page)</small>

* `BusyBox vi </wiki/Learning_the_vi_Editor/BusyBox_vi" title="Learning the vi Editor/BusyBox vi>`_ 
`<img alt="0% developed&#160; as of May 28, 2006, just a stub" src="http://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/00%25.svg/9px-00%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="0% developed&#160; as of May 28, 2006, just a stub>`_<small>&#160;(May 28, 2006, just a stub)</small>

</ul>

[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=8" title="Edit section: Vim>`_]
 
Vim

================================================================================
`<img alt="" src="http://upload.wikimedia.org/wikipedia/commons/thumb/2/28/Vim.png/300px-Vim.png" width="300" height="312"/> </wiki/File:Vim.png>`_

`<img src="http://bits.wikimedia.org/skins-1.5/common/images/magnify-clip.png" width="15" height="11" alt="" /> </wiki/File:Vim.png"title="Enlarge>`_

Graphical Vim under `GTK2 <http://en.wikipedia.org/wiki/GTK%2B"title="w:GTK+>`_

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim&action=edit&section=T-1" title="Learning the vi Editor/Vim>`_]
 
Overview

********************************************************************************

* `Basic navigation </w/index.php?title=Learning_the_vi_Editor/Print_version/Basic_navigation&action=edit&redlink=1"title="Learning the vi Editor/Print version/Basic navigation (does not exist)>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Modes </w/index.php?title=Learning_the_vi_Editor/Print_version/Modes&action=edit&redlink=1"title="Learning the vi Editor/Print version/Modes (does not exist)>`_ 
`<img alt="75% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/4/49/75%25.svg/9px-75%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="75% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Tips and Tricks </w/index.php?title=Learning_the_vi_Editor/Print_version/Tips_and_Tricks&action=edit&redlink=1"title="Learning the vi Editor/Print version/Tips and Tricks (does not exist)>`_ 
`<img alt="25% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/3/34/25%25.svg/9px-25%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="25% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Useful things for programmers to know </w/index.php?title=Learning_the_vi_Editor/Print_version/Useful_things_for_programmers_to_know&action=edit&redlink=1"title="Learning the vi Editor/Print version/Useful things for programmers to know (does not exist)>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Enhancing Vim </w/index.php?title=Learning_the_vi_Editor/Print_version/Enhancing_Vim&action=edit&redlink=1"title="Learning the vi Editor/Print version/Enhancing Vim (does not exist)>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `External Scripts </w/index.php?title=Learning_the_vi_Editor/Print_version/External_Scripts&action=edit&redlink=1"title="Learning the vi Editor/Print version/External Scripts (does not exist)>`_ 
`<img alt="25% developed&#160; as of March 24, 2010" src="http://upload.wikimedia.org/wikipedia/commons/thumb/3/34/25%25.svg/9px-25%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="25% developed&#160; as of March 24, 2010>`_<small>&#160;(March 24, 2010)</small>

* `VimL Script language </w/index.php?title=Learning_the_vi_Editor/Print_version/VimL_Script_language&action=edit&redlink=1"title="Learning the vi Editor/Print version/VimL Script language (does not exist)>`_ 
`<img alt="50% developed&#160; as of Nov 1, 2006" src="http://upload.wikimedia.org/wikipedia/commons/thumb/c/c2/50%25.svg/9px-50%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="50% developed&#160; as of Nov 1, 2006>`_<small>&#160;(Nov 1, 2006)</small>

* `Vim on Windows </w/index.php?title=Learning_the_vi_Editor/Print_version/Vim_on_Windows&action=edit&redlink=1"title="Learning the vi Editor/Print version/Vim on Windows (does not exist)>`_ 
`<img alt="0% developed&#160; as of June 1, 2008" src="http://upload.wikimedia.org/wikipedia/commons/thumb/d/d6/00%25.svg/9px-00%25.svg.png" width="9" height="9" /> </wiki/Help:Development_stages" title="0% developed&#160; as of June 1, 2008>`_<small>&#160;(June 1, 2008)</small>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim&action=edit&section=T-2" title="Learning the vi Editor/Vim>`_]
 
External links

********************************************************************************
<tablestyle="width:250px; float:right; clear:right; margin-left:10px;">
<tr style="vertical-align:middle;">
<td style="padding:0.1em; text-align:center; vertical-align:middle; width:45px; border:none;"><img alt="Wikipedia-logo.png" src="http://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Wikipedia-logo.png/40px-Wikipedia-logo.png" width="40" height="40" /></td>
<td style="color:black; text-align:left; vertical-align:middle; padding:0.5em; padding-left:0em; border:none;">

`Wikipedia <http://en.wikipedia.org/wiki/"title="w:>`_ has related information at `***Vim (text editor)*** <http://en.wikipedia.org/wiki/Vim_(text_editor)"title="wikipedia:Vim (text editor)>`_

</td>
</tr>
</table>

* `vim.org <http://www.vim.org"rel="nofollow>`_ - documentation and many tips and plugins
* `vi-improved.org <http://www.vi-improved.org"rel="nofollow>`_ - Wiki dedicated to vim
* `Public .vimrc files <http://students.iiit.ac.in/~deepakr/config/.vimrc"rel="nofollow>`_
* `zzapper's Best of Vim Tips <http://www.rayninfo.co.uk/vimtips.html"rel="nofollow>`_
* `Vim Recipes <http://vim.runpaint.org/"rel="nofollow>`_ - Free cookbook.
[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Basic_navigation&action=edit&section=T-1" title="Learning the vi Editor/Vim/Basic navigation>`_]
 
Basic navigation

********************************************************************************

Basic navigation in vim is covered below.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Basic_navigation&action=edit&section=T-2" title="Learning the vi Editor/Vim/Basic navigation>`_]
 
Moving around

--------------------------------------------------------------------------------

We can move around in the editor by first entering command mode, and then using the 
<h>
, 
<j>
, 
<k>
, and 
<l>
 keys.

Note
    your arrow keys may be set up to work, and you can use them if you like, but for proficiency and for advanced work later, you should learn to use the letter keys.
* The 
<h>
 key, in command mode, moves the cursor one character **left**.
* The 
<j>
 key, in command mode, moves the cursor one character **down**.
* The 
<k>
 key, in command mode, moves the cursor one character **up**.
* The 
<l>
 key, in command mode, moves the cursor one character **right**.
If you have trouble remembering this, keep in mind that 
<h>
 is leftmost, the letter 
<j>
goes down below the line, the letter 
<k>
pokes up above the line, and the 
<l>
 key is rightmost. (J also resembles an arrow pointing downward, if you squint a bit.)

After you have moved the cursor using those keys, you can enter insert mode again by pressing 
<i>
. When you do this, you insert text at the cursor, inserting text between the character to the **left** of the cursor and the **current** position of the cursor. Let's practice this in an exercise.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Basic_navigation&action=edit&section=T-3" title="Learning the vi Editor/Vim/Basic navigation>`_]
 
VIM Help system

--------------------------------------------------------------------------------

vim is a very feature rich application. Unlike the 'vi' editor it includes a help system. Because the help system will allow you to teach yourself much more than any book on vim possibly could, you will benefit from the power of the vim editor much more if you learn to use it. On a normal vim installation you should be able to start the online help by pressing the 
<HELP>
 key . If your keyboard does not feature a 
<HELP>
 key then you can try 
<F1>
 instead. (Some system administrators may have changed how vim behaves. If you cannot get into vim's help system with these commands, perhaps your administrator can help.)

<pre>

:help

</pre>

Start vim and enter command mode by pressing escape. To get help on any command simply type ``
:help
 *command*``.

For example, if you would like to learn all the different ways the 
:x
 command can be used you could type ``
:h
 x``. To move around in the help files the same keys work, 
<h>
, 
<j>
, 
<k>
, 
<l>
. To leave the help files type 
:quit
. If you know you want to do something, but you aren't sure what the command might be you can type partial commands like this ``
:help
 cut``. To learn to switch text from upper case to lower case you could type 
:help lowercase

When you search for help on any subject, vim will (normally by default) create a window (buffer) which you can navigate just like any window in vim. You can close the help window by typing 
:quit
 or 
:q
 and pressing enter.

The default help file (shown when you type "
help
") explains basic navigation for vim and for vim's help files.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-1" title="Learning the vi Editor/Vim/Modes>`_]
 
Modes

********************************************************************************

VIM offers more modes than vi (which offers only the "normal", "insert" and "command–line" modes). Theses additional modes make VIM more powerful and easier to use; because of this, vim users should at least be aware that they exist. (NOTE: *If you ever enter a mode you are unfamiliar with, you can usually press 
ESC
 to get back to* normal *mode.*)

Here a short overview of each mode available in vim:

<table border="1" cellpadding="2">
<tr>
<th>Name</th>
<th>Description</th>
<th>help page</th>
</tr>
<tr>
<td>insert</td>
<td>For inserting new text. The main difference from vi is that many important "normal" commands are also available in insert mode - provided you have a keyboard with enough meta keys (such as Ctrl, Alt, Windows-key, etc.).</td>
<td>``:help Insert-mode``</td>
</tr>
<tr>
<td>normal</td>
<td>For navigation and manipulation of text.</td>
<td>``:help Normal-mode``</td>
</tr>
<tr>
<td>visual</td>
<td>For navigation and manipulation of text selections, this mode allows you to perform most normal commands, and a few extra commands, on selected text.</td>
<td>``:help visual-mode``</td>
</tr>
<tr>
<td>select</td>
<td>Similar to visual but with a more MS-Window like behavior.</td>
<td>``:help select-mode``</td>
</tr>
<tr>
<td>command-line</td>
<td>For entering editor commands - like the help command in the 3rd column.</td>
<td>``:help Command-line-mode``</td>
</tr>
<tr>
<td>Ex-mode</td>
<td>Similar to the command-line mode but optimized for batch processing.</td>
<td>``:help Ex-mode``</td>
</tr>
</table>

Each mode is described below.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-2" title="Learning the vi Editor/Vim/Modes>`_]
 
insert (and replace)

--------------------------------------------------------------------------------

In insert mode you can type new text. In classic vi the insert mode was just that: insert text and nothing else. Vim makes use of many meta keys on modern keyboards; with a correctly configured vim, cursor keys should work in insert mode.

Insert mode can be reached in several ways, but some of the most common ones are 
<a>
 <small>(append after cursor)</small>, 
<i>
 <small>(insert before cursor)</small>, 
<A>
 <small>(append at end of line)</small>, 
<I>
 <small>(insert at beginning of line)</small>, 
<C>
 <small>(change to end of line)</small>, and 
<s>
 <small>(substitute characters)</small>.

If you wish to edit text by selecting and replacing, as is common in many GUI-based editors, 
<C>
 does nicely. The selected text is deleted before entering insert mode.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-3" title="Learning the vi Editor/Vim/Modes>`_]
 
normal (command)

--------------------------------------------------------------------------------

Unless you use the evim interface this is the standard mode for vim (vim starts in normal mode). Everything the user types in normal mode is interpreted as commands (including those which switch the user to other modes).

If vim is started as evim (*evim* on the command line), vim keeps the user in insert mode all the time. Normal mode can be reached for individual commands by pressing 
<Ctrl-O>
 followed by the desired command. After one command, the user is returned to insert mode. (Each normal command must be started first by pressing 
<Ctrl-O>
).

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-4" title="Learning the vi Editor/Vim/Modes>`_]
 
visual

--------------------------------------------------------------------------------

There are three different types of highlighting in visual mode. Each allows the user to highlight text in different ways. Commands that normally only affect one character, line, or area will affect the highlighted text (such as changing text to uppercase (
<Ctrl-~>
), deleting text (
<d>
), indenting lines (>>, <<, and =), and so forth).

There are three (sub)types of the visual modes which are *visual*, *block-visual* , and *linewise-visual*

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-5" title="Learning the vi Editor/Vim/Modes>`_]
 
plain visual mode

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The plain *visual* mode is started by pressing 'v' in normal mode. At any point, pressing ESC or 
<v>
 will leave VISUAL mode without performing an operation. Movement commands change the selection area, while other commands will generally perform the expected operation on the text (there are some exceptions where the behavior will change or where the command won't work, but if it doesn't do what you hoped you can always undo with 
<u>
).

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-6" title="Learning the vi Editor/Vim/Modes>`_]
 
block visual mode

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**block-visual** is started by pressing 
<Ctrl-V>
 (or 
<Ctrl-Q>
 in some windows versions. If neither of these works use ":help visual-block" to find out how). Visual blocks always maintain a rectangular selection, highlighting only specific columns of characters over multiple lines. In this following example the user wants to put a dash in each phone number between the second and third number fields:

The user first moves the cursor to the top of the column (you could start at the bottom if you want).

<table border="1" cellpadding="2">
<tr>
<td>`<img alt="Vim block change example.jpg" src="http://upload.wikimedia.org/wikibooks/en/a/aa/Vim_block_change_example.jpg" width="396" height="140" /> </wiki/File:Vim_block_change_example.jpg>`_</td>
</tr>
</table>

Next, press 
<Ctrl-V>
. This puts you in block-visual mode (VISUAL BLOCK appears at the bottom to tell you what visual mode you're in). Next, move down to the bottom desired line. You can see a single column highlighted in this example, but you could move right or left and highlight more columns.

<table border="1" cellpadding="2">
<tr>
<td>`<img alt="Vim block change example2.jpg" src="http://upload.wikimedia.org/wikibooks/en/3/3a/Vim_block_change_example2.jpg" width="396" height="140" /> </wiki/File:Vim_block_change_example2.jpg>`_</td>
</tr>
</table>

In this case, the user wants to *change* the spaces to dashes. To change text, we press 'c'. The spaces all disappear, and the changes are shown only in the current line while we type:

<table border="1" cellpadding="2">
<tr>
<td>`<img alt="Vim block change example3.jpg" src="http://upload.wikimedia.org/wikibooks/en/2/28/Vim_block_change_example3.jpg" width="396" height="140" /> </wiki/File:Vim_block_change_example3.jpg>`_</td>
</tr>
</table>

when we press 
<ESC>
, though, the change is duplicated on all the lines.

<table border="1" cellpadding="2">
<tr>
<td>`<img alt="Vim block change example4.jpg" src="http://upload.wikimedia.org/wikibooks/en/d/d8/Vim_block_change_example4.jpg" width="395" height="139" /> </wiki/File:Vim_block_change_example4.jpg>`_</td>
</tr>
</table>

(Note: if you simply want to *insert* text rather than change it, you will need to use '
<I>
' or '
<A>
' rather than '
<i>
' or '
<a>
'.)

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-7" title="Learning the vi Editor/Vim/Modes>`_]
 
linewise visual mode

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In **linewise-visual** mode, enterd by 
<Shift-V>
, entire lines are highlighted. Otherwise, it generally works like the plain **visual** mode.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-8" title="Learning the vi Editor/Vim/Modes>`_]
 
select

--------------------------------------------------------------------------------

like the visual mode but with more `CUA <http://en.wikipedia.org/wiki/Common_User_Access"title="w:Common User Access>`_ like behavior. This means that if you type a single character it replaces the selection. Of course you lose all the one key operation on selection like 
<U>
 to make a selection uppercase.

This mode is usually activated by:

<pre>
:
behave
 mswin
</pre>

which is default for MS-Windows installations. You can get the normal mode with

<pre>
:
behave
 xterm
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-9" title="Learning the vi Editor/Vim/Modes>`_]
 
command-line

--------------------------------------------------------------------------------

Within the command-line you can run `Ex <http://en.wikipedia.org/wiki/Ex_(editor)"title="w:Ex (editor)>`_ commands, enter search patterns, and enter filter commands. At the bottom a command line appears where you can enter the command. Unlike vi - vim supports cursor keys which makes entering commands a lot easier. After one command the editor returns into normal mode.

You can enter an Ex command by typing a ``:`` in normal mode. Some examples include:

<pre>
:
set
 number
:
substitute
/search/replace/ig
</pre>

You can enter a search pattern by typing ``/`` to search forward, or ``?`` to search backward. You can use vim's expanded regular expressions in these search patterns. For example,

<pre>
/word
</pre>

will jump to the next occurrence of "word" (even if it is "sword" or "wordlessly"), but

<pre>
/\<word\>
</pre>

will jump only to a complete word "word" (not "sword" or "wordless").

You can enter a filter by typing 
!
 followed by a motion command, then a shell command to run on the text captured by the motion. For example, typing

<pre>

!
22jsort
</pre>

in Linux will sort the current and 22 following lines with the *sort* system command. The same thing can be done with

<pre>
:.,.+22
!
sort
</pre>

As a matter of fact, vim creates the above command for you if you follow the first example!

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Modes&action=edit&section=T-10" title="Learning the vi Editor/Vim/Modes>`_]
 
Ex-mode

--------------------------------------------------------------------------------

The Ex mode is similar to the command line mode as it also allows you to enter `Ex <http://en.wikipedia.org/wiki/Ex_(editor)"title="w:Ex (editor)>`_ commands. Unlike the command-line mode you won't return to normal mode automatically. You can enter an Ex command by typing a ``Q`` in normal mode and leave it again with the ``:visual`` command. Note that the Ex mode is designed for Batch processing and as such won't support mappings or command-line editing.

For batch processing the Ex-mode is normally started from outside by calling the editor with the "-E" option. Here are real live example form a `RPM Package Manager <http://en.wikipedia.org/wiki/RPM_Package_Manager"title="w:RPM Package Manager>`_ specification:

<pre>
vim -E -s Makefile <<-EOF
   :%
substitute
/CFLAGS = -g$/CFLAGS =-fPIC -DPIC -g/
   :%
substitute
/CFLAGS =$/CFLAGS =-fPIC -DPIC/
   :%
substitute
/ADAFLAGS =$/ADAFLAGS =-fPIC -DPIC/
   :
update

   :
quit

EOF
</pre>

The RPM uses `Bash <http://en.wikipedia.org/wiki/Bash"title="w:Bash>`_ as script language which make the example a little difficult to understand as two different script languages are mixed in one file.

``vim -E -s``&#160;
    starts vim in improved Ex mode which allows for more advanced commands than the vi compatible Ex-mode <small>(which is started with ``vim -e -s``)</small>.
``<<-EOF``&#160;
    tells bash to copy all lines that follow into the standard input of the external program just started.
``:``&#160;
    are lines with Ex commands which vim will execute. The ``:`` is optional but helpful when two script languages are mixed in one file
``:update``&#160;
    A beginners mistake is to forget to actually save the file after the change - falsely assuming that this happens automatically.
``:quit``&#160;
    Last not least: don't forget to actually exit vim again.
``EOF``&#160;
    marks the end of the standard input redirection - from now on bash will execute the command itself again.
If your shell does not allow such nifty redirection of standard input then you can always use a more classic approach to I/O redirection using two files:

<pre>
vim -E -s Makefile <Makefile-Fix1.vim
</pre>

And if have no standard input redirection available then you can try the ``-c`` option in combination with the ``source`` command:

<pre>
vim -E -s -c "
source
 Makefile-Fix1.vim" Makefile
</pre>

With the improved Ex mode many tasks classically performed by `awk <http://en.wikipedia.org/wiki/AWK_programming_language"title="w:AWK programming language>`_ or `sed <http://en.wikipedia.org/wiki/sed"title="w:sed>`_ can be done with vim and often better so:

* `awk <http://en.wikipedia.org/wiki/AWK_programming_language"title="w:AWK programming language>`_ and `sed <http://en.wikipedia.org/wiki/sed"title="w:sed>`_ are stream oriented - they only read the file forward from beginning to end while vim is buffer oriented - you can move forward and backward in the file as you like.
* vim's `regular expressions <http://en.wikipedia.org/wiki/Regular_expression"title="w:Regular expression>`_ are more powerful than `awk <http://en.wikipedia.org/wiki/AWK_programming_language"title="w:AWK programming language>`_'s and `sed <http://en.wikipedia.org/wiki/sed"title="w:sed>`_'s expressions - for example vim can match over several lines and supports zero matches.
The Vim Tipbook is a collection of tips, hints and HowTos for using the `Vim text editor <http://www.vim.org/"rel="nofollow>`_. It is an outgrowth of the `Vim tips database <http://vim.wikia.com/"rel="nofollow>`_ in a more flexible format, and also includes some helpful posts from the `Vim mailing lists <http://www.vim.org/maillist.php"rel="nofollow>`_.

For information on the general use of Vim, please see the `Learning the vi Editor/Vim </wiki/Learning_the_vi_Editor/Vim" title="Learning the vi Editor/Vim>`_.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Tips_and_Tricks&action=edit&section=T-1" title="Learning the vi Editor/Vim/Tips and Tricks>`_]
 
About this Book

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Tips_and_Tricks&action=edit&section=T-2" title="Learning the vi Editor/Vim/Tips and Tricks>`_]
 
Tips for Editing

--------------------------------------------------------------------------------

* Where possible, extensive personal configurations should be avoided. Keep suggestions within the scope of a single tip. You may wish to link to several other tips that might be used alongside, much in the same way a food cookbook would suggest dishes that go well together.
* Always provide enough information so that a tip can be used from Vim's default ``compatible`` settings.
[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Tips_and_Tricks&action=edit&section=T-3" title="Learning the vi Editor/Vim/Tips and Tricks>`_]
 
Conventions Used

--------------------------------------------------------------------------------

<c>

    A single character, such as 'a' or '1'.
<ESC>
, 
<Ctrl-[>

    Indicates that the Escape (Esc) key on your keyboard should be pressed, which is identical to Control and '['.
<CR>

    Indicates that the Return (Enter) key should be pressed.
<TAB>

    Indicates that the Tabulator key should be pressed
<Ctrl-x>
, 
<C-x>

    Indicates that the Control key and the 'x' key should be pressed simultaneously. 'x' can be almost any other key on your keyboard.
<Shift-x>
, 
<S-x>
, 
<X>

    Indicates that the Shift key and the 'x' key should be pressed simultaneously
<Meta-x>
, 
<M-x>

    Indicates that the Meta or Alt key and the 'x' key should be pressed simultaneously.
:quit
, 
:q

    An Ex command. started with 
<:>
, followed by the command and ends with 
<CR>
. For many Ex commands there is a long form (
:quit
) and a short form (
:q
).
:set
 
**nocompatible**
&#160;
    represents a setting.
**strlen**
 ()&#160;
    represents a function.
/
*pattern*
/
, 
?
*pattern*
?

    A Search pattern. Search pattern in vi are `regular expressions <http://en.wikipedia.org/wiki/regular_expression"title="w:regular expression>`_.
:

*range*

s

/
*search*
/
*replace*
/

*options*
, 
:global
 
/
*pattern*
/
 
delete

    A Search pattern combined with an Ex command.
All commands in *vi* are case sensitive.

Where a series of commands are required to be entered, these might be listed in a preformatted block:

<pre>
 {{Vi/Ex|set}} {{Vi/set|number}}
 {{Vi/Ex|set}} {{Vi/set|textwidth=70}}
 {{Vi/Ex|set}} {{Vi/set|wrap}}
 
</pre>

Which will produce the following formatted text:

<pre>

set
 
**number**

set
 
**textwidth**
=70

set
 
**wrap**

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Tips_and_Tricks&action=edit&section=T-4" title="Learning the vi Editor/Vim/Tips and Tricks>`_]
 
Vim Help

********************************************************************************

If you are new to vi, try the ``vimtutor`` command. It's an excellent guide for the beginner.

Vim has an extensive help system. EVERYTHING is covered. This system is so extensive, however, that finding the needed information is sometimes akin to finding one's own little needle in a huge stack of hay. But even for that, there are Vim tools:

* (assuming ``'nocompatible'`` is already set)
<pre>

set
 
**wildmenu**

</pre>

* Help tag completion: if you think 'foo' is part of something which has a hyperlink in the help system, use
<pre>

help
 foo
<Tab>

</pre>

    where <Tab> means "hit the Tab key", and if there is only one possible completion Vim fills it in for you; if there is more than one the bottom status line is replaced by a menu which can be navigated by hitting the <Left> and <Right> arrow keys; accept a selection by hitting <Enter>, abort by hitting <Esc>.
* The ``:helpgrep`` function: if you think that some regular expression describe text you want to search for in the text of all the help files, use
<pre>

helpgrep
 <pattern>
</pre>

    where <pattern> is a Vim regular expression, like what you can use after / or&#160;? . It may take some time for Vim to look up all its help files, and it may or may not display interim information which may require you to hit Enter to clear the ``|more-prompt|`` (q.v.) When the blinking cursor reappears in your editfile, it means Vim has compiled the list of all help locations where your regexp matches. See them by means of the following
<pre>
 
cfirst
 or :cr
 
cnext
 or :cn
 
cprevious
 or :cprev or :cN
 
clast
 or :cla
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Tips_and_Tricks&action=edit&section=T-5" title="Learning the vi Editor/Vim/Tips and Tricks>`_]
 
Inserting Text From a File or Register

********************************************************************************

If your text is in a file on its own, you can use ``:r`` with a line number (the number of the line after which to insert, or ``0`` for "before first line", or ``.`` for "after cursor line", or ``$`` for "after last line"; default is after cursor line) in the "range" position, i.e. just before the ``r``. The file name comes as an argument at the end.

Example (after line 5):

<pre>
  5r ~/template.txt
</pre>

If your text is in a register, you can use ``:put`` with a line number (again) in the range position and the register name (including ``"``, which must be escaped as ``\"``, for the default register; or ``+`` for the system clipboard) after the ``:put``.

Example (before cursor line):

<pre>
  .-1put \"
</pre>

You can also insert a string directly using ``:put`` and direct assignment:

<pre>
  :put ='This is text to insert.'
</pre>

See

<pre>
  :help :read
  :help :put
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Tips_and_Tricks&action=edit&section=T-6" title="Learning the vi Editor/Vim/Tips and Tricks>`_]
 
Full Screen Mode

********************************************************************************

To achieve a full screen editing window on any version of gvim you can do:

<pre>
  :set go-=m go-=T go-=l go-=L go-=r go-=R go-=b go-=F
  :set lines=999 columns=999
</pre>

* ``'guioptions'``: We remove the flags one-by-one to avoid problems if they appear in the option in a different order, or if some of them do not appear at all. By choosing which ones to remove (or not) you can customize your own flavour of "full-screen Vim".
<pre>
  m   when present, menu bar is present
  T   when present, toolbar is present on versions which support it (W32, GTK1, GTK2, Motif, Photon, kvim)
  l   when present, left scrollbar is always present
  L   when present, left scrollbar is present if there is a vertical split
  r   when present, right scrollbar is always present
  R   when present, right scrollbar is present if there is a vertical split
  b   when present, bottom scrollbar is present
  F   when present, gvim (Motif) will display a footer
</pre>

* ``'lines'``, ``'columns'``: setting them to a large value will maximize the window.
For more, see:

<pre>
  :help 'guioptions'
  :help 'lines'
  :help 'columns'
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-1" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Useful things for programmers to know

********************************************************************************

There are quite a few things programmers ought to know about vim that will make their experience that much easier. Programmers can save hours and weeks of man-hours over the long haul with effective editors. Here are some tricks and tools that vim provides. With the time you save, you might speed up your work and have some extra time for a quick Quake deathmatch or eventually increase your productivity to help justify a larger wage increase.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-2" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Word, variable, function, and line completion

--------------------------------------------------------------------------------

Sometimes the word you're typing is really long. You shouldn't have to type it all out. If it's in your dictionary, or in the current file, you can save a lot of time with 
<Ctrl-P>
 and 
<Ctrl-N>
. Let's take a closer look at how this works:

* *Word/variable/function name Completion*
Generally, any word in the current file, or any of the other files (buffers) you are editing in the same instance of vim, will match for completion. This means once you've typed it once, you can type the first couple letters next time, and press Ctrl-N (several times if you need to cycle through several options) until you find the word you're looking for.

Technically, this isn't true. You can tell vim where to look for words in the ``complete`` function. In Vim 7, the ``complete`` function will generally be set to figure out a lot about what you're typing — drawing information from function libraries (As of the last update on this book, the author knows C and C++ are supported by default). Keyword completion since Vim 7 will also show a popup menu.

You can also define a dictionary of your own for completion. For more detail, you might want to consult the vim help system ":help complete", ":help complete-functions", and so forth.

***Example 1***

As an example, you might edit a C program file, "blah.c". You want a function that starts with "str", but you can't remember what it is. You first type "str". It remains regular text until you press 
<Ctrl-P>
 or 
<Ctrl-N>
. In vim 7, you will see a menu appear, like this:

`<img alt="Vim completion1.jpg" src="http://upload.wikimedia.org/wikibooks/en/9/9a/Vim_completion1.jpg" width="852" height="360" /> </wiki/File:Vim_completion1.jpg>`_

You can use 
<Ctrl-N>
 and 
<Ctrl-P>
 to cycle through the entries shown. In Vim versions 7 and higher, you can actually use the arrow keys to cycle through entries in the menu. There might be too many to show on the screen at once (you will notice the black box on the right represents a scroll position on a gray bar--not all the options are shown on-screen in this example.) The files from which the options were drawn are shown, to help you decide if it's what you're looking for.

(You will also notice in this example that words show up from files the author has recently edited, such as 'strict' from 'cgi-bin/ftplist.pl' -- we certainly don't want that.)

***Example 2***

Now, suppose you need the sine function, but you know it has an odd name. You type ``sin`` and press 
<Ctrl-P>
, and it doesn't show up:

`<img alt="Vim completion2.jpg" src="http://upload.wikimedia.org/wikibooks/en/8/81/Vim_completion2.jpg" width="660" height="343" /> </wiki/File:Vim_completion2.jpg>`_

You're not out of luck, you just haven't included the math library yet. All you have to do is add the line

<pre>
#include <math.h>
</pre>

and try again. This time you see the function name you wanted (it wasn't easy to remember since it has an odd name)

`<img alt="Vim completion3.jpg" src="http://upload.wikimedia.org/wikibooks/en/a/a7/Vim_completion3.jpg" width="660" height="326" /> </wiki/File:Vim_completion3.jpg>`_

* *Line Completion*
You can complete entire lines if you need to, though this is less likely. 
<Ctrl-X>
, 
<Ctrl-L>
 will load the matching lines (white space matters!) into the menu, and from there you can move forward and backward with arrows or 
<Ctrl-P>
 and 
<Ctrl-N>
 (for **P**revious and **N**ext)

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-3" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Indentation

--------------------------------------------------------------------------------

Vim can figure out how to indent most common filetypes.

For most of the popular programming languages, vim can detect the file type by the filename's extension, and from there it will decide how to indent your files. If you don't see it automatically creating the proper indentation for you, try

<pre>
:filetype indent plugin on
</pre>

In the GUI version, you might be able to turn it on at the same time you turn syntax highlighting on for that file. Choose Syntax -> on/off for this file, or Syntax -> Show Filetypes in menu, then go back into the syntax menu and choose the appropriate file type from the list.

You might want to put the above-mentioned ":filetype ..." line in your vimrc file (discussed earlier) and open your program file again, though this really shouldn't be necessary.

If you still have problems, you might want to check that your runtimepath variable is set properly (:help runtimepath). It's also possible (though unlikely) that your programming language is rare enough that nobody has written an indent plugin for it yet. The official site for vim, vim.org, may have an indent plugin file that meets your needs, even if it didn't come with your default installation of vim.

For those times when you've pasted some text in and the indentation is wrong, (your indent plugin must be loaded), you can use the = command. It's probably easiest to type '10=' to re-indent the next ten lines, or to use visual mode and press 
<=>
.

If you want, you can indent lines with ">>" and unindent them with "<<".

If you are in insert mode, use 
<Ctrl-D>
 and 
<Ctrl-T>
 to change the indentation of the line (
<Ctrl-D>
 decreases indentation by one level and Ctrl-T increases it by one level)

If you can't manage to get filetype specific indentation working, you might try setting one or more of the following options: smartindent, autoindent, cindent, and copyindent. Chances are these won't work completely right, so 
<Ctrl-D>
 and 
<Ctrl-T>
 will be more important. To turn autoindent on, type ``:set autoindent``. To turn autoindent off, type ``:set noautoindent``

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-4" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Repeating commands, or Performing the Same Command Many Times

--------------------------------------------------------------------------------

If you feel comfortable with vim, you might record your keystrokes to an invisible register and repeat them later. It might be easier to write a vim script, or even filter your file with another program (such as a perl script) for complex enough actions.

That said, sometimes it really is easier to record a command and reuse it, or even perform it on any matching line. For more advanced execution patterns (e.g. executing one command on the whole file), see below. You might also consider creating a mapping (discussed below) or running a&#160;:global command (also discussed below).

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-5" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Repeating the last single command

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Suppose I want to put a semicolon on the end of a few lines, where I forgot:

<pre>
cout << "Hello world\n"
i = j + k
cout << "i is " << i << endl
</pre>

On the first line, I type ``A;`` followed by the ``ESC`` key. I move to the next line and press ``.`` (the period tells vim to repeat the last command -- don't worry, it doesn't duplicate movement commands).

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-6" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Recording a command macro

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Vim has a powerful form of command repetition available through the use of macros. A user can record a series of commands into a register and run the register as a macro. Macros can be recorded into any of 26 registers (a through z).

To start recording a macro, press ``q`` followed by a register name (any letter ``a`` through ``z`` -- Registers are defined by only one letter of the alphabet, so only one character may be used as the storage buffer). After performing a series of commands, finish recording the command macro by pressing ``q`` again. For example to start recording into register z, press ``qz`` and press ``q`` again to finish recording.

To run a macro from a register, run it with ``@**x**`` where **x** is the register with the desired macro recording. Register ``q`` is the default register for macro recordings, so if you have recorded into register ``q`` you may simply type ``@@`` to run the macro.

(Note: Keep in mind that scripts or mappings may sometimes use an arbitrary register--so if you have a conflict, especially with a third party script or mapping, you should consider recording to a different register. You can view the contents of a register with the *:registers* command.)

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-7" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Example 1

As a simple example, suppose you have the following lines in the buffer, and you want each line to repeat the last word on the line. Initially, the buffer looks like this:

<pre>
The quick brown fox jumps over the lazy dog
The sly gray fox circles around the unsuspecting rabbit
The slow gray fox crawls under the rotting fence
</pre>

And you want the buffer to look like this: (where additions are highlighted in bold)

<pre>
The quick brown fox jumps over the lazy dog **dog**
The sly gray fox circles around the unsuspecting rabbit **rabbit**
The slow gray fox crawls under the rotting fence **fence**
</pre>

To do this, start recording into the default register with ``qq``, then append the line with ``A``, type a space, then ``Ctrl-P``, then press the ``ESC`` key. To finish recording, press ``q`` again. Now the macro has been recorded into register **q**. To repeat the command, move down one line, and repeat the command by typing ``@@`` or ``@q``. You can use ``@@`` to run this macro because q is the default register for macros.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-8" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Example 2

In another example, suppose you have the following lines in the register:

<pre>
The quick brown fox jumps over the lazy dog dog
The sly gray fox circles around the unsuspecting rabbit rabbit
The slow gray fox crawls under the rotting fence fence
</pre>

and you want to put HTML tags around the animal names (fox, dog and rabbit) to make them bold (eg, ``fox`` needs to become ``<b>fox </b>``). Suppose you want to use register **a** for the macro.

To start, move the cursor onto the first animal name--*fox*. Place the cursor somewhere on the word, such as on the 'o' in fox. Begin recording by typing ``qa``. Next, delete the word into register **b** by typing ``"bdaw`` *(see ``:help aw`` and ``:help d`` and ``:help "`` for an explanation of this command)*. Next, enter insert mode by typing ``i`` and then type ``<b>`` followed by ``**Ctrl-O**``, then ``"bP`` *(see ``:help i_CTRL-o`` for an explanation of this command)*. Next, type ``</b>`` and press ESC. Finally, stop the recording by typing ``q``. To repeat the command, move the cursor over the next word you wanted to surround with the HTML tags and run the macro by typing ``@a``. You can see what the macro looks like by examining the register. To do so, you may run the command ``:registers a``. In this case, vim will show the following output:

<pre>
--- Registers ---
"a   "bdawi<b>**^O**"bP</b>**^[**  
</pre>

Note that a recording remembers all your movement commands, so you will need to put the cursor in the correct starting position before you begin recording.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-9" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Example 2b: fixing a macro

Suppose you made a minor mistake in your macro, but the macro is rather complex and you don't want to repeat all those commands again. We would like to modify the contents of a register. In order to do this, we use the feature that typing ``"*x*`` in the escape mode uses the contents of register *x* for the next delete, yank, or put.

Assume that we are using register **a**,

* create a new line (this line will be eventually deleted) and put the register's contents on the line with ``"ap`` in the escape mode. This command is pasting (note the p in the command) the contents of register a (via "a) into the line.
* Make the modifications as needed, and
* put the modified line back into register **a** by moving to the start of the line (with ``|``) and typing ``"ad$`` in the escape mode. (Do not use ``"aD`` because D will capture the newline character in the buffer as well.)
* Test the macro to be sure it is working properly, then use it as needed.
[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-10" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Executing a command macro

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

To execute a macro stored in register ``q`` once, you can just press ``@q``. But often, you would not write a macro to execute it only once and here the full power of Vim kicks in.

To apply the command to the lines 23 through 42, use ``:23,42norm! @q``, to apply it to all lines in your document use you can use ``:%norm! @q``.

The same also works for single commands that you can access with the dot. If you have forgotten semicolons on some lines in your document, you would just execute ``A;`` followed by the ``ESC`` key. Then the command ``:23,42norm! .`` will apply the same action to the lines 23 to 42 and insert a semicolon at the end of each line.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Useful_things_for_programmers_to_know&action=edit&section=T-11" title="Learning the vi Editor/Vim/Useful things for programmers to know>`_]
 
Mapping a command

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

One of the advantages of mapping a new command is that you can put the mapping into your vimrc file for use later. I have the following mapping

<pre>
map <C-k> :!%:p<C-m>  
</pre>

What this does is maps the *normal* command Ctrl-K to run the current file as a script. You could also perform the second "Recording a command" exercise from above (encase a word in bold tags) with this mapping:

<pre>
map <C-x>b "bdawi<b><C-o>"bp</b><ESC>  
</pre>

Note that in this case, I can get away with "<b>" because it doesn't match a special character name. However, if I needed to avoid a conflict (if I wanted to map an insertion of "<ESC>") I would use <lt> and <gt> for the less than and greater-than symbols. (See ":help key-codes")

If you want a to map a command for insert mode, use imap instead of map.

If you want to prevent any of the commands in your map definitions from being interpreted in other mappings, use noremap (or inoremap for insert mode *inoremap meaning **i**nsert mode **no** **re**-**map***)

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-1" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Enhancing VIM

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-2" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
The .vimrc file

--------------------------------------------------------------------------------

You can make a configuration-file called .vimrc in your home directory and save any particular settings. The existence of a **vim**rc has the side effect of making vim enable all of vim's incompatible changes to vi, making it more user-friendly. The name of the file depends on the operation system and userinterface used:

<table border="1" cellpadding="2">
<tr>
<td>.vimrc</td>
<td>Text-User-Interface on UNIX and VMS</td>
</tr>
<tr>
<td>_vimrc</td>
<td>Text-User-Interface on MS-Windows and VMS</td>
</tr>
<tr>
<td>.gvimrc</td>
<td>Graphical-User-Interface on UNIX and VMS</td>
</tr>
<tr>
<td>_gvimrc</td>
<td>Graphical-User-Interface on MS-Windows and VMS</td>
</tr>
</table>

The alternatives with the underscore are for compatiblity with older filesystem. If you use vim on several operating system and use a modern MS-Windows filesystem you don't have to maintain two configurations files. it is perfectly Ok to set _vimrc to:

<pre>

source
 ~/.vimrc
</pre>

and do all your configurations in ``.vimrc``.

This is an example .vimrc file here:

<pre>
"Everything after a double quote is a comment.

"Wrap text after 72 characters
set textwidth=72

"Set tabs to 4 spaces
set tabstop=4
set shiftwidth=4
set stselect=4
set expandtab

"tell vim I use a dark background.  Syntax highlighting (color coded text) will adjust to more appropriate colors.
set background=dark

"misc overwrites of default color highlighting.
hi Comment ctermfg=DarkGreen
hi String ctermfg=DarkMagenta
hi pythonPreCondit ctermfg=Green

"make sure that bottom status bar is running.
set ruler
set laststatus=2

"make a mapping for "Q" which will reformat the current paragraph, comment,
"or code block according to the formatoptions setting:
map Q gqap
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-3" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Syntax Highlighting

--------------------------------------------------------------------------------

Syntax highighting is what allows you to highlight program code and other files for better readability, using colorization, bold, and other font modifications.

You may want to write simple syntax highlighting statements for easily detected patterns in your file. That said, if you are thinking you need syntax highlighting for html, don't worry: most users do not need to define a syntax highlighting file for common filetypes--most of the file types common developers are interested have already been given a default syntax highlighting definition with vim. Even if it doesn't come with vim, you can usually find someone who has shared their work on vim.org. However, if you need to write something simple, this section is for you. (If you need a syntax highlighting definition that will correctly show perl code even inside an HTML "pre" tag inside a perl print statement within a shell heredoc in a shell script, you're probably out of luck and this section probably won't meet your needs--but you might as well search vim.org, just in case someone has done it for you already).

Syntax Highlighting is one of the most powerful features of VIM. However, it can also be one of the most difficult things to set up--if you don't know what you're doing (or if you just don't have the patience, or if you're dealing with complex program language grammars). So lets have a look at some easy highlighting definitions:

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-4" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Lesson 1: Highlight Tabs

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ... or how to highlight a special characters
Say you need to know where in your file are tabs and where are spaces. With the following highlight you make tabs visible:

<pre>

:syntax
 match Special "\t"
</pre>

syntax match matches a regular expression and applies the given color to it. In this case it is the color "Special". You must make sure that the color "Special" has a non standard background - otherwise you won't see a difference:

<pre>

:highlight
 Special guifg=SlateBlue guibg=GhostWhite
</pre>

You can also create a map in your .vimrc - so you can always activate the tab highlight:

<pre>

:nnoremap
 
<F12>

<Tab>
      
:syntax
 match Special "\t"
<CR>

:inoremap
 
<F12>

<Tab>
 
<C-O>

:syntax
 match Special "\t"
<CR>

</pre>

Another approach is to use listchars. These would be tabs, trailing spaces and line ends. Note the use of ">-" instead of the default "^I". That prevents the layout change when showing/hidding listchars:

<pre>

:set
 lcs=tab:>-,trail:%,eol:$ 
<CR>

:map
 
<F12>
 
:set
 list!
<CR>

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-5" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Lesson 2: Highlight Space errors

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ... or how to highlight at the end of line
    ... or how to find spaces and/or tabs
<pre>

:syntax
 match Error "\s\+$"
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-6" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Lesson 3: Highlight Tab errors

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ... or how to not highlight characters serving as delimiter
Knowing where tabs are is good. But what about spaces before tabs? They just waste space in your file. The following highlight will show them to you:

<pre>

:syntax
 match Error " \+\t"me=e-1
</pre>

The regular expression ``" \+\t"`` searches for one or more space followed by a tab. That alone would solve the problem but would highlight the tab as error as well. Even better would be if we could highlight only the spaces and leave the tab as it is. And indeed this is possible and done by the ``me=e-1``. Basically it says: End the highlight one character before the last character found.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-7" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Lesson 4: Highlight Line length

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    ... or how to highlight at a specific column
    ... or how to highlight inside other patterns
    ... or how to allow other pattern inside
The following match will highlight the column 78 when the line is 78 characters long. This can serve as a warning when you have a line which is longer than you wish it to be. Of course, such a highlight should not interfere with any other highlight you might use:

<pre>

:syntax
 match Error "\(^.\{79\}\)\@<=." contains=ALL containedin=ALL
</pre>

Here is a description of how it works:

* The regular expression ``\(^.\{79}\)`` searches for exactly 79 characters from the beginning of the line ``^`` and group ``\( \)`` the result.
* ``\@<=`` will now "zero match" the group from 1. "zero match" means the text must be present, but is ignored once found.
* with ``.`` one more character is matched. This character is highlighted using the Error colour.
* With ``contains=ALL`` we allow other highlight patterns to start inside our pattern.
* ``containedin=ALL`` we allow our highlight pattern to start inside another pattern.
An alternative method is suggested by the vim help system. This pair of commands will highlight all characters in virtual column 79 and more:

<pre>

:highlight
 rightMargin ctermfg=lightblue

:match
 rightMargin /.\%>79v/
</pre>

And this will highlight only column 79:

<pre>

:highlight
 col79 ctermbg=red

:highlight
 col79 guibg=red

:match
 col79 /\%<80v.\%>79v/
</pre>

Note the use of two items to also match a character that occupies more than one virtual column, such as a TAB. In the last example, a separate ctermbg and guibg definition was added so that col79 does something in both vim and gvim.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-8" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Omni Completion

--------------------------------------------------------------------------------

From version 7 onwards vim supports omni completions. This form of completions should work over several files and support all the twirks of a programming language. However, for it to work you need an appropiate "*complete.vim" script in your "autoload/" directory. This script must define a function called 
**...#Complete**
 which does all the completion work for the programming language at hand.

However writing a useful complete function can be a diffcult task. All the provided complete functions span several hundred lines of code.

Here a simple implementation used for the `Ada programming language </wiki/Ada_Programming" title="Ada Programming>`_ described in detail so you can create your own. This implementation need a "tags" file which - for ada - you can create with ``gnat xref -v``.

The full version can be download from the `vim.org side <http://www.vim.org/scripts/script.php?script_id=1609"rel="nofollow>`_

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-9" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Step by Step walkthrough

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Set completion with 
<C-X>
 
<C-O>
 to autoloaded function. This check is in place in case this script is sourced directly instead of using the autoload feature.

<pre>

if
 
**exists**
 ('+omnifunc') && &omnifunc == ""
    
setlocal
 omnifunc=
**adacomplete#Complete**

endif

</pre>

Omnicompletion and autoload won't work with any vim less then 7.00.

<pre>

if
 version < 700
    
finish

endif

</pre>

All 
**complete#Complete**
 functions have to cover two options: ``a:findstart == 1`` and ``a:findstart&#160;!= 1``.

<pre>
    
function
 
**adacomplete#Complete**
 (findstart, base)
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-10" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Findstart equals 1

When ``a:findstart == 1`` then we have to find out how many characters left of the cursor could be a part of an completion:

<pre>
	
if
 a:findstart == 1
</pre>

For our simple example finding the beginning of the word is pretty simple. We look left until we find a character wich cannot be part of a word. For most languages searching for “\i” should do the trick. However, for Ada we want to expand `Attributes </wiki/Ada_Programming/Attributes" title="Ada Programming/Attributes>`_ as well - hence we add “'” to the list of word characters.

<pre>
	    
let
 line = 
**getline**
 ('.')
	    
let
 start = 
**col**
 ('.') - 1
	    
while
 start > 0 && line[start - 1] =~ '\i\|'''
		
let
 start -= 1
	    
endwhile

	    
return
 start
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-11" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Findstart not equal 1

When ``a:findstart&#160;!= 1`` then we need to find possible completions for ``a:base``. There are two option open to return the found completions:

* returning them all as a 
List
 with 
return
.
* calling 
**complete_add**
 for each completion found.
You can also use a combination of both - they will be merged then - so beware not to create duplicates. A completion can either be a 
String
 or a 
Directory
.

In this example we use 
**complete_add**
.

<pre>
	
else

</pre>

The search pattern should look for a:base at the beginning of the text matched.

<pre>
	    
let
 l:Pattern    = '^' . a:base . '.*$'
</pre>

In a first step we add all known Ada `Keywords </wiki/Ada_Programming/Keywords" title="Ada Programming/Keywords>`_, `Pragmas </wiki/Ada_Programming/Pragmas" title="Ada Programming/Pragmas>`_, `Attributes </wiki/Ada_Programming/Attributes" title="Ada Programming/Attributes>`_ and `Types </wiki/Ada_Programming/Types" title="Ada Programming/Types>`_. They have been prepared as a 
List
 of 
Directorys
 by the `Ada file-type plugin <http://www.vim.org/scripts/script.php?script_id=1548"rel="nofollow>`_. All we have to to is iterate over the list and add all where the 
Directory
 entry “word” matches the pattern.

<pre>
	    
if
 
**exists**
 ('g:Ada_Keywords')
		
for
 Tag_Item 
in
 g:Ada_Keywords
		    
if
 l:Tag_Item['word'] =~? l:Pattern
</pre>

Add the value - incl. simple error handling.

<pre>
			
if
 
**complete_add**
 (l:Tag_Item) == 0
			    
return
 []
			
endif

			{{vi/Ex|if} 
**complete_check**
 ()
			    return []
			
endif

		    
endif

		
endfor

	    
endif

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/Enhancing_Vim&action=edit&section=T-12" title="Learning the vi Editor/Vim/Enhancing Vim>`_]
 
Searching for matches

Here the real work is done: We search for matches inside the tag file. Of course you need a tag file first. There are many tools to create vim compatible tag files. Just have a look around for one.

<pre>
	    
let
 l:Tag_List = 
**taglist**
 (l:Pattern)
</pre>

Again we need to iterate over all 
List
 elements found.

<pre>
	    
for
 Tag_Item 
in
 l:Tag_List
		
if
 l:Tag_Item['kind'] == 
		    
let
 l:Tag_Item['kind'] = 's'
		
endif

</pre>

Since the 
Directory
 structure for tags and completions are different the data needs to be converted.

The informations available inside the tag depend on the tag-file creation tool. But the minimum is:

“name”&#160;
    Name of the tag.
“filename”&#160;
    Name of the file where the tag is defined.
“cmd”&#160;
    Ex command used to locate the tag in the file.
“kind”&#160;
    Type of the tag. The value for this entry depends on the language specific kind values generated by the ctags tool.
The contest of the completion is fixed and contains the following:

“word”&#160;
    The actual completion
“kind”&#160;
    The type of completion, one character, i.E. “v” for variable.
“menu”&#160;
    Short extra info displayed inside the completion menu.
“word”&#160;
    Long extra info displayed inside an extra window.
“icase”&#160;
    Ignore case
So for simple tags without any extras the conversion could look like this:

<pre>
	        
let
 l:Match_Item = {
		    \ 'word':  l:Tag_Item['name'],
		    \ 'menu':  l:Tag_Item['filename'],
		    \ 'info':  "Symbol from file " . l:Tag_Item['filename'] . " line " . l:Tag_Item['cmd'],
		    \ 'kind':  l:Tag_Item['kind'],
		    \ 'icase': 1}
		
if
 
**complete_add**
 (l:Match_Item) == 0
		    
return
 []
		
endif

		
if
 
**complete_check**
 ()
		    
return
 []
		
endif

	    
endfor

</pre>

Please note&#160;
    The current Ada plugin has been extended to also support ``ctags`` which gives more information than ``gnat xref -v``. However we have not updated the walkthrough as we want to keep the example simple and easy to follow.
We already added all matches via 
**complete_add**
 so we only return an empty list.

<pre>
	    
return
 []
	
endif

    
endfunction
 
**adacomplete#Complete**

    
finish

endif

</pre>

One last advice: It your tag tool does not sort the entries then you should sort them separately. Searches on sorted tag-files are significantly faster.

VimL is a full feature scripting language, meaning it can solve almost any text processing problem.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-1" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Statements

********************************************************************************

**The text in its current form is incomplete.**

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-2" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Assignment

--------------------------------------------------------------------------------

To set a variable use:

<pre>

let
 *variable* = *expression*
</pre>

To set a built-in setting you have two options:

<pre>

set
 *setting* = *expression*     
" (use the regular command for changing a setting)

let
 &*setting* = "*expression*"  
" (treat the setting as a special kind of variable)

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-3" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Data types

********************************************************************************

There are five datatypes:

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-4" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Number

--------------------------------------------------------------------------------

A 32 bit signed integer.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-5" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
String

--------------------------------------------------------------------------------

A NULL terminated string of 8-bit unsigned characters (bytes). Strings can be created by either ‘'’ or ‘"’ quotes. When using strings quoted with the double quote ‘"’ the text is interpreted i.e. "\n" becomes a new line while strings quoted with a single quote ‘'’ are not interpreted, i.e. '\n' means just that, a backslash and an n. The following two strings are identical:

<pre>
let String_1 = "C:\\WinNT"
let String_2 = 'C:\WinNT'
</pre>

Any other datatype can be converted into a string using the 
**string**
 () function.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-6" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Funcref

--------------------------------------------------------------------------------

A reference to a function. A Funcref can be created from a string by the use of the 
**function**
 function.

<pre>

let
 Function_1 = 
**function**
 ("MyFunc")
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-7" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
List

--------------------------------------------------------------------------------

An ordered sequence of items.

<pre>

let
 List_1 = [
    \ "a",
    \ "b",
    \ "c"]
</pre>

A list can be created from a string by the use of the 
**split**
 function.

<pre>

let
 List_2 = 
**split**
 ("a b c")
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-8" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Dictionary

--------------------------------------------------------------------------------

An associative, unordered array: Each entry has a key and a value.

<pre>

let
 Dictionary_1 = {
    \ 1: 'one', 
    \ 2: 'two',
    \ 3: 'three'}
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-9" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Objects

--------------------------------------------------------------------------------

VIM also supports object oriented programming by combining 
Funcref
 and 
Dictionary
 to an Object:

<pre>

let
 mydict = {
    \'data': [0, 1, 2, 3]}

function
 
**mydict.len**
 () dict
   
return
 
**len**
 (self.data)

endfunction
 
**mydict.len**

</pre>

for more information see `Object oriented programming <#Object_oriented_programming>`_

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-10" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Control Structures

********************************************************************************

The existence of control structures is the main difference between vi's ex commands and vim's scripting language. They make the difference between a simple command set (vi) and a full features script language (vim).

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-11" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
condition

--------------------------------------------------------------------------------
<pre>

if
 *condition*
    *operations*

elseif
 *condition*
    *operations* 

else

    *operations* 

endif

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-12" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
loop

--------------------------------------------------------------------------------

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-13" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
while

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
<pre>

while
 *condition*
    *operations*

endwhile

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-14" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
for

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

For loops are available from vim 7 onwards. They iterate over List or Directory structures.

<pre>

for
 *var* 
in
 *list*
    *operations*

endfor

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-15" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
exceptions

--------------------------------------------------------------------------------
<pre>

try

    *operations*

catch
 /*pattern*/
    *error handling operations*

finally

    *clean-up operations*

endtry

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-16" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Subprograms

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-17" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Simple Subprograms

--------------------------------------------------------------------------------

Like most `Shell-Languages <http://en.wikipedia.org/wiki/Shell_(computing)"title="w:Shell (computing)>`_ all subprograms are stored in separate files which you load either with the 
source
 or 
runtime
 command. The difference lies in the use of a search path. 
runtime
 uses a search path and allows wildcards to find the sub-program while 
source
 need the full path. The following commands do the same - provided that "~/vimfiles" is part of your runtime search path:

<pre>

runtime
 setup.vim

source
  ~/vimfiles/setup.vim
</pre>

For both commands need to add the ``.vim`` extension. Since 
runtime
 supports both a search path and wildcards more than one match is possible. If you want 
runtime
 to load all the matches - and not just the first hit - use 
runtime!
.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-18" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Functions

--------------------------------------------------------------------------------
<pre>

function
 *f* ( *parameter* )
    *operations*

endfunction

</pre>

New with vim 7 is the autoload option for functions. If you name a function *Filename*#*Functionname* or *Directory*#*Filename*#*Functionname* then the function will be automatically loaded on first call. The file containing the function must be placed in one of the "autoload" runtime directories and be named "Filename.vim" or "Directory/Filename.vim". This option is especially useful for functions which you don't always need on in `Object oriented programming <#Object_oriented_programming>`_.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-19" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Commands

--------------------------------------------------------------------------------
<pre>

command
 **Command** *Command*
</pre>

Command are often used as shortcut for functions and subprograms:

<pre>

command
 **C** -nargs=* 
call
 F ( <f-args> )

command
 **C** 
source
 ~/vimfiles/s.vim
</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-20" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Object oriented programming

********************************************************************************

Vim 7 now allows `object oriented programming </wiki/Object_Oriented_Programming" title="Object Oriented Programming>`_. However, in order to make it real you need to combine several features, namely `Dictionaries <#Dictionary>`_, `Funcrefs <#Funcref>`_ and the new `function autoload <#Functions>`_.

The following example class is taken from the gnat compiler plugin for vim. The actual functions implementations have been removed as they are not needed to understand the concept. If you like to have a look at the full version you can download the plugin from `vim.org site <http://www.vim.org/scripts/script.php?script_id=1609"rel="nofollow>`_.

[`edit </w/index.php?title=Learning_the_vi_Editor/Vim/VimL_Script_language&action=edit&section=T-21" title="Learning the vi Editor/Vim/VimL Script language>`_]
 
Step by Step walk-through

--------------------------------------------------------------------------------

We add our new class to a autoload script. That way the class is available when and only when needed:

<pre>

if
 
**exists**
 ("g:loaded_gnat_autoload") || version < 700
    
finish

else

   
let
 g:loaded_gnat_autoload=34
</pre>

Each function we define need to be defined with the "dict" attribute. Apart from that they are just normal scripting functions.

<pre>
   
function
 
**gnat#Make**
 () dict
      ...
      
return

   
endfunction
 gnat#Make

   
function
 
**gnat#Pretty**
 () dict
      ...
      
return

   
endfunction
 gnat#Make

   
function
 
**gnat#Find**
 () dict
      ...
      
return

   
endfunction
 gnat#Find

   
function
 
**gnat#Tags**
 () dict
      ...
      
return

   
endfunction
 gnat#Tags

   
function
 
**gnat#Set_Project_File**
 (...) dict
      ...
      
return

   
endfunction
 
**gnat#Set_Project_File**

   
function
 
**gnat#Get_Command**
 (Command) dict
      ...
      
return
 ...
   
endfunction
 
**gnat#Get_Command**

</pre>

The most important step is the composition of the object. In most OO languages this happens automatically - But with vim we have to do this ourselves. For best flexibility the use of a so called constructor function is suggested. The constructor is not marked with "dict":

<pre>
   
function
 
**gnat#New**
 ()
</pre>

The constructor creates a dictionary which assigns all the object functions to one element of the dictionary:

<pre>
      
let
 Retval = {
	 \ 'Make'	      : 
**function**
 ('gnat#Make'),
	 \ 'Pretty'	      : 
**function**
 ('gnat#Pretty'),
	 \ 'Find'	      : 
**function**
 ('gnat#Find'),
	 \ 'Tags'	      : 
**function**
 ('gnat#Tags'),
	 \ 'Set_Project_File' : 
**function**
 ('gnat#Set_Project_File'),
	 \ 'Get_Command'      : 
**function**
 ('gnat#Get_Command'),
	 \ 'Project_File'     : *,*
</pre>

We optionally can now add data entries to our object:

<pre>
	 \ 'Make_Command'     : '"gnat make -P " . self.Project_File . "  -F -gnatef  "',
	 \ 'Pretty_Command'   : '"gnat pretty -P " . self.Project_File . " "',
	 \ 'Find_Program'     : '"gnat find -P " . self.Project_File . " -F "',
	 \ 'Tags_Command'     : '"gnat xref -P " . self.Project_File . " -v  *.AD*"',
	 \ 'Error_Format'     : '%f:%l:%c: %trror: %m,'   .
			      \ '%f:%l:%c: %tarning: %m,' .
			      \ '%f:%l:%c: (%ttyle) %m'}
</pre>

If needed additional modifications to the object are also possible. At this stage you can already use the OO-way:

<pre>
      
if
 
**argc**
 () == 1 && 
**fnamemodify**
 (
**argv**
 (0), ':e') == 'gpr'
	 
call
 
**Retval.Set_Project_File**
 (argv(0))
      
elseif
  
**strlen**
 (v:servername) > 0
	 
call
 
**Retval.Set_Project_File**
 (v:servername . '.gpr')
      
endif

</pre>

The last operation of the constructor it the return of the newly created object.

<pre>
      
return
 Retval
   
endfunction
 
**gnat#New**

</pre>

It is also possible to defined additional non dict functions. These functions are the equivalent to the "static" or "class" methods of other OO languages.

<pre>
   
function
 
**gnat#Insert_Tags_Header**
 ()
      ...
      
return

   
endfunction
 
**gnat#Insert_Tags_Header**

   
finish

endif

</pre>

[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=9" title="Edit section: vile>`_]
 
vile

================================================================================

[`edit </w/index.php?title=Learning_the_vi_Editor/vile&action=edit&section=T-1" title="Learning the vi Editor/vile>`_]
 
Vile - vi like Emacs

********************************************************************************
<tablestyle="width:250px; float:right; clear:right; margin-left:10px;">
<tr style="vertical-align:middle;">
<td style="padding:0.1em; text-align:center; vertical-align:middle; width:45px; border:none;"><img alt="Wikipedia-logo.png" src="http://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Wikipedia-logo.png/40px-Wikipedia-logo.png" width="40" height="40" /></td>
<td style="color:black; text-align:left; vertical-align:middle; padding:0.5em; padding-left:0em; border:none;">

`Wikipedia <http://en.wikipedia.org/wiki/"title="w:>`_ has related information at `***VILE*** <http://en.wikipedia.org/wiki/VILE"title="wikipedia:VILE>`_

</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vile&action=edit&section=T-2" title="Learning the vi Editor/vile>`_]
 
Overview

--------------------------------------------------------------------------------

**vile** is a vi clone which doesn't claim to be a vi clone. The idea behind vile is to have an editor which works similar to vi but provides features for editing multiple files in multiple window-areas like emacs. In fact, vile development started by using MicroEMACS as the base, and not a vi clone, and also not full blown Emacs. MicroEMACS is an emacs-like editor (MicroEMACS's author didn't like full-blown emacs, and the vile authors didn't like (Micro)EMACS mode-less way of working). So vile was developed.

vile provides the most common vi commands (as used by their authors), but not all vi commands. The implemented commands are supposed to work more or less like the original vi commands. The window management and buffer management came from MicroEMACS.

Much work has gone into the vile documentation after the first versions were almost undocumented. It is recommended to consult the documentation to find out the differences and extensions of vile, compared to vi.

[`edit </w/index.php?title=Learning_the_vi_Editor/vile&action=edit&section=T-3" title="Learning the vi Editor/vile>`_]
 
Resources

--------------------------------------------------------------------------------

* `vile <http://invisible-island.net/vile/"rel="nofollow>`_
* `MicroEMACS <http://uemacs.tripod.com/nojavasc.html"rel="nofollow>`_
[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=10" title="Edit section: BusyBox vi>`_]
 
BusyBox vi

================================================================================

[`edit </w/index.php?title=Learning_the_vi_Editor/BusyBox_vi&action=edit&section=T-1" title="Learning the vi Editor/BusyBox vi>`_]
 
Overview

********************************************************************************
<tablestyle="width:250px; float:right; clear:right; margin-left:10px;">
<tr style="vertical-align:middle;">
<td style="padding:0.1em; text-align:center; vertical-align:middle; width:45px; border:none;"><img alt="Wikipedia-logo.png" src="http://upload.wikimedia.org/wikipedia/commons/thumb/6/63/Wikipedia-logo.png/40px-Wikipedia-logo.png" width="40" height="40" /></td>
<td style="color:black; text-align:left; vertical-align:middle; padding:0.5em; padding-left:0em; border:none;">

`Wikipedia <http://en.wikipedia.org/wiki/"title="w:>`_ has related information at `***BusyBox*** <http://en.wikipedia.org/wiki/BusyBox"title="wikipedia:BusyBox>`_

</td>
</tr>
</table>

BusyBox is a very popular program on many embeded Linux systems. In fact, someone working on an embedded Linux system is very likely to encounter BusyBox. BusyBox combines tiny versions of many common UNIX utilities into a single relatively small executable. One of the included utilities is a vi clone.

The BusyBox vi clone is limited. Among the limits are:

* It does not support all common vi commands.
* It does not support the '!' command to execute a child process and capture its output
* It also lacks the normal vi crash recovery feature.
* It always assumes a vt102 type terminal (emulator)
* Only very few settings are configurable via ``:set``
* ``.exrc`` configuration and configuration via environment variables are not supported
* Line marks are not correctly adjusted if lines are inserted or deleted before the mark.
* Only whole-line undo (uppercase 'U'), no last-change undo (lowercase 'u') is supported.
* Search is done case-insensitive.
* Command-counts need to prefix a command, and
* command counts for ``a``, ``c``, ``d``, ``i``, ``r``, ``y`` and several other commands are not supported.
* Ex commands are not supported.
In short, a lot of information in this vi tutorial is not applicable to BusyBox vi.

However, BusyBox vi also has some differences (considered by some to be enhancements) over classic vi:

* Cursor navigation in insert and command mode
* <INSERT> key changes to insert mode
* No wrapping of long lines. Long lines are displayed via side-scrolling.
[`edit </w/index.php?title=Learning_the_vi_Editor/BusyBox_vi&action=edit&section=T-2" title="Learning the vi Editor/BusyBox vi>`_]
 
Weblinks

--------------------------------------------------------------------------------

* `BusyBox home page <http://busybox.net/"rel="nofollow>`_
* `BusyBox vi source code <http://busybox.net/cgi-bin/viewcvs.cgi/trunk/busybox/editors/vi.c"rel="nofollow>`_
[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=11" title="Edit section: vi Reference>`_]
 
vi Reference

================================================================================

The following conventions are used in this reference.

<c>

    A single character, such as 'a' or '1'.
<ESC>
, 
<Ctrl-[>

    Indicates that the Escape (Esc) key on your keyboard should be pressed, which is identical to Control and '['.
<CR>

    Indicates that the Return (Enter) key should be pressed.
<TAB>

    Indicates that the Tabulator key should be pressed
<Ctrl-x>
, 
<C-x>

    Indicates that the Control key and the 'x' key should be pressed simultaneously. 'x' can be almost any other key on your keyboard.
<Shift-x>
, 
<S-x>
, 
<X>

    Indicates that the Shift key and the 'x' key should be pressed simultaneously
<Meta-x>
, 
<M-x>

    Indicates that the Meta or Alt key and the 'x' key should be pressed simultaneously.
:quit
, 
:q

    An Ex command. started with 
<:>
, followed by the command and ends with 
<CR>
. For many Ex commands there is a long form (
:quit
) and a short form (
:q
).
:set
 
**nocompatible**
&#160;
    represents a setting.
**strlen**
 ()&#160;
    represents a function.
/
*pattern*
/
, 
?
*pattern*
?

    A Search pattern. Search pattern in vi are `regular expressions <http://en.wikipedia.org/wiki/regular_expression"title="w:regular expression>`_.
:

*range*

s

/
*search*
/
*replace*
/

*options*
, 
:global
 
/
*pattern*
/
 
delete

    A Search pattern combined with an Ex command.
All commands in *vi* are case sensitive.

<table cellpadding="5">
<tr>
<td valign="top">*c*</td>
<td>A single character, such as 'a' or '1'.</td>
</tr>
<tr>
<td valign="top">*m*</td>
<td>A single lowercase letter, used to mark text.</td>
</tr>
<tr>
<td valign="top">*string*</td>
<td>Several characters, such as 'abc bed'.</td>
</tr>
<tr>
<td valign="top">*pattern*</td>
<td>A string used in searching, which may contain regular expressions. For example 'abc' or '^ab[123]'.</td>
</tr>
<tr>
<td valign="top">*myfile*</td>
<td>The name of a file to be edited.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-1" title="Learning the vi Editor/vi Reference>`_]
 
Invocation

********************************************************************************
<table cellpadding="5">
<tr>
<td valign="top">**vi myfile**</td>
<td>Open the file *myfile* for editing. If it does not exist, a new file is created. Multiple files can be opened at the same time.</td>
</tr>
<tr>
<td valign="top">**vi +line myfile**</td>
<td>Open the file *myfile* with the cursor positioned at the given line.

* **vi +5 myfile** opens *myfile* at line 5.
* **vi + myfile** opens *myfile* at the last line.
</td>
</tr>
<tr>
<td valign="top">**vi +/string/ myfile**</td>
<td>Open the file *myfile* with the cursor positioned at the first line containing the string. If the string has spaces it should be enclosed in quotes.

* **vi +/"search string"/ myfile** opens *myfile* at the first line containing *search string*.
</td>
</tr>
<tr>
<td valign="top">**vi -r**</td>
<td>Lists recovery copies of files. A recovery copy is taken if a **vi** session is killed or the system crashes.</td>
</tr>
<tr>
<td valign="top">**vi -r myfile**</td>
<td>Opens a recovery copy of the file *myfile*.</td>
</tr>
<tr>
<td valign="top">**view myfile**</td>
<td>**view** is a read only version of **vi**. All **vi** commands, include those to change the file are allowed and act as in **vi**. The difference is that normal attempts to save, **ZZ** or **:wq** do not work. Instead **:x!** or **:w** need to be used.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-2" title="Learning the vi Editor/vi Reference>`_]
 
vi Commands

********************************************************************************

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-3" title="Learning the vi Editor/vi Reference>`_]
 
Movement

--------------------------------------------------------------------------------

**vi** can be set up on most systems to use the keyboard movement buttons, such as *cursor left*, *page up*, *home*, *delete*, etc.

<table cellpadding="5">
<tr>
<td valign="top">
<G>
</td>
<td>Move to the last line of the file. Can be preceded by a number indicating the line to move to, 
<1>

<G>
 moves to the first line of the file.</td>
</tr>
<tr>
<td valign="top">
<h>
</td>
<td>Move left one character, or cursor left. Can be preceded by a number, 
<5>

<h>
 moves left 5 places.</td>
</tr>
<tr>
<td valign="top">
<j>
</td>
<td>Move one line down, or cursor down. Can be preceded by a number, 
<5>

<j>
 moves down 5 lines.</td>
</tr>
<tr>
<td valign="top">
<k>
</td>
<td>Move one line up, or cursor up. Can be preceded by a number, **5k** moves up 5 lines.</td>
</tr>
<tr>
<td valign="top">
<l>
</td>
<td>Move forward one character, or cursor right. Can be preceded by a number, **5l** moves right 5 places.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td>
<H>
</td>
<td>Moves to the line at the top of the screen.</td>
</tr>
<tr>
<td>
<M>
</td>
<td>Moves to the line in the middle of the screen.</td>
</tr>
<tr>
<td>
<L>
</td>
<td>Moves to the line at the bottom of the screen.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<->
</td>
<td>Moves to the first non-whitespace character of the line above. Can be preceded by a number.

* **10-** moves up 10 lines.
</td>
</tr>
<tr>
<td valign="top">
<+>
</td>
<td>Moves to the first non-whitespace character of the line below. Can be preceded by a number.

* **10+** moves down 10 lines.
</td>
</tr>
<tr>
<td valign="top">
<CR>
</td>
<td>Same as 
<+>
.</td>
</tr>
<tr>
<td valign="top">
<>
</td>
<td>Must be preceded by a number. Moves to the specified column on the current line.

* **10|** moves to column 10.
</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<w>
</td>
<td>Moves to the start of the next word, which may be on the next line.</td>
</tr>
<tr>
<td valign="top">
<W>
</td>
<td>As **w** but takes into account punctuation.</td>
</tr>
<tr>
<td valign="top">
<e>
</td>
<td>Moves to the end of the current word or to the next word if between words or at the end of a word.</td>
</tr>
<tr>
<td valign="top">
<E>
</td>
<td>As **e** but takes into account punctuation.</td>
</tr>
<tr>
<td valign="top">
<b>
</td>
<td>Moves backwards to the start of the current word or to the previous word if between words or at the start of a word.</td>
</tr>
<tr>
<td valign="top">
<B>
</td>
<td>As **b** but takes into account punctuation.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<f>
*c*</td>
<td>Find first occurrence of character *c* on the same line.

This command may be repeated using 
<;>
 or 
<,>
 (reverse direction).

* 
<3>

<f>

<x>
 moves forward on the third occurrence of x (if present).
    Same as 
<f>

<x>

<;>

<;>

</td>
</tr>
<tr>
<td valign="top">
<F>
*c*</td>
<td>Same as **f** but backward.</td>
</tr>
<tr>
<td valign="top">
<t>
*c*</td>
<td>Find the character before the first occurrence of character *c* on the same line.</td>
</tr>
<tr>
<td valign="top">
<T>
*c*</td>
<td>Same as **t** but backward, placing the cursor after character *c*.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<0>
</td>
<td>Moves to the start of the current line.</td>
</tr>
<tr>
<td valign="top">
<^>
</td>
<td>Moves to the first non-whitespace character on the current line.</td>
</tr>
<tr>
<td valign="top">
<$>
</td>
<td>Moves to the end of the current line.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<Ctrl-F>
</td>
<td>Move forwards one page.

* **5
<Ctrl-F>
** moves forwards five pages.
</td>
</tr>
<tr>
<td valign="top">**
<Ctrl-B>
**</td>
<td>Move backwards one page.

* **5
<Ctrl-B>
** moves backwards five pages.
</td>
</tr>
<tr>
<td valign="top">**
<Ctrl-D>
**</td>
<td>Move forwards by half a page.</td>
</tr>
<tr>
<td valign="top">**
<Ctrl-U>
**</td>
<td>Move backwards by half a page.</td>
</tr>
<tr>
<td valign="top">**
<Ctrl-E>
**</td>
<td>Display one more line at the bottom of the screen.</td>
</tr>
<tr>
<td valign="top">**
<Ctrl-Y>
**</td>
<td>Display one more line at the top of the screen.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-4" title="Learning the vi Editor/vi Reference>`_]
 
Inserting

--------------------------------------------------------------------------------

All insert commands put **vi** into *insert mode*. *Insert mode* is terminated by the ESC key.

<table cellpadding="5">
<tr>
<td valign="top">
<i>
</td>
<td>Enters *insert mode* at the cursor position.</td>
</tr>
<tr>
<td valign="top">
<I>
</td>
<td>Enters *insert mode* at the start of the current line.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<a>
</td>
<td>Enters *insert mode* after the cursor, or appends.</td>
</tr>
<tr>
<td valign="top">
<A>
</td>
<td>Enters *insert mode* at the end of the current line, or append to the end of the current line.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">
<o>
</td>
<td>Inserts a new line underneath the current line and then goes into *insert mode*.</td>
</tr>
<tr>
<td valign="top">
<O>
</td>
<td>Inserts a new line above the current line and then goes into *insert mode*.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-5" title="Learning the vi Editor/vi Reference>`_]
 
Replacing

--------------------------------------------------------------------------------
<table cellpadding="5">
<tr>
<td valign="top">**r**</td>
<td>Replaces the character underneath the cursor with the next character typed. Can be preceded by a number, **5ra** replaces 5 characters with the letter *a*.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">**R**</td>
<td>Enters *replace mode*. Each time a letter is typed it replaces the one under the cursor and the cursor moves to the next character. *Replace mode* is terminated by the ESC key. Can be preceded by a number, **5Rab** followed by ESC replaces the character under the cursor by *a*, the next character by *b* and then inserts another 4 *ab*s. The original line is placed into the buffer, replacing any text already there.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-6" title="Learning the vi Editor/vi Reference>`_]
 
Deleting

--------------------------------------------------------------------------------

Each time a delete command is used, the deleted text is placed into the buffer, replacing any text already in the buffer. Buffered text can be retrieved by **p** or **P**.

<table cellpadding="5">
<tr>
<td valign="top">**dd**</td>
<td>Deletes the current line. Can be preceded by a number.

* **5dd** deletes five lines. **d5d** is the same as **5dd**.
</td>
</tr>
<tr>
<td valign="top">**de**</td>
<td>Deletes from the character underneath the cursor to the end of the word. Can be preceded by a number.

* **5de** deletes five words. **d5e** is the same as **5de**.
</td>
</tr>
<tr>
<td valign="top">**dE**</td>
<td>As **de** but takes into account punctuation.</td>
</tr>
<tr>
<td valign="top">**dw**</td>
<td>Deletes from the character underneath the cursor to the start of the next word. Can be preceded by a number.

* **5dw** deletes five words. **d5w** is the same as **5dw**.
</td>
</tr>
<tr>
<td valign="top">**dW**</td>
<td>As **dw** but takes into account punctuation.</td>
</tr>
<tr>
<td valign="top">**db**</td>
<td>Deletes from the left of the cursor to the start of the previous word. Can be preceded by a number.

* **5db** deletes five words to the left of the cursor.
</td>
</tr>
<tr>
<td valign="top">**dB**</td>
<td>As **db** but takes into account punctuation.</td>
</tr>
<tr>
<td valign="top">**dt***c*</td>
<td>Deletes from the cursor position to before the first instance of the character.

* **dta** deletes text up and to, but not including, the first letter 'a'.
</td>
</tr>
<tr>
<td valign="top">**df***c*</td>
<td>Deletes from the cursor position to the first instance of the character.

* **dfa** deletes text up and to, and including, the first letter 'a'.
</td>
</tr>
<tr>
<td valign="top">**dG**</td>
<td>Deletes the current line and everything to the end of the file.</td>
</tr>
<tr>
<td valign="top">**d/string**</td>
<td>Deletes from the cursor to the string, either forwards or backwards.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">**D**</td>
<td>Deletes from the cursor to the end of the line.</td>
</tr>
<tr>
<td valign="top">**d$**</td>
<td>Same as **D**.</td>
</tr>
<tr>
<td valign="top">**d^**</td>
<td>Deletes from the left of the cursor to the start of the line.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">**x**</td>
<td>Delete the character underneath the cursor. Can be preceded by a number.

* **5x** deletes the character underneath the cursor and the next 4 characters.
* **xp** swaps the character underneath the cursor with the one to the right of it.
</td>
</tr>
<tr>
<td valign="top">**X**</td>
<td>Delete the character to the left of the cursor, but will not delete the end of line marker or any characters on the next line. Can be preceded by a number.

* **5X** deletes 5 characters to the left of the cursor.
</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-7" title="Learning the vi Editor/vi Reference>`_]
 
Changing

--------------------------------------------------------------------------------

The change commands all select text to be removed, the end of which is indicated by a **$**. Insert mode is entered and new text overwrites or extends the text. When the <ESC> key is pressed to terminate the insert, any remaining original text is deleted.

Text deleted during a change is placed into the buffer, replacing any text already there. Buffered text can be retrieved by **p** or **P**.

<table cellpadding="5">
<tr>
<td valign="top">**C**</td>
<td>Change from the cursor position to the end of the line. Can be preceded by a number.

* **5C** changes 5 lines, the current line and the next 4 lines.
</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">**c***M*</td>
<td>Generally the same as **d***M***i**, where *M* is any movement command.</td>
</tr>
<tr>
<td valign="top">**cc**</td>
<td>Change the current line. Can be preceded by a number.

* **5cc** changes 5 lines, the current line and the next 4 lines.
</td>
</tr>
<tr>
<td valign="top">**ce**</td>
<td>Change the current word. Can be preceded by a number.

* **5ce** changes five words. **c5e** is the same as **5ce**.
</td>
</tr>
<tr>
<td valign="top">**cw**</td>
<td>Exactly the same as **ce**.

This command is inconsistent with the usual vi moving: **cw** and **ce** is the same as **dei** but **dwi** removes also the spaces until the next word.

</td>
</tr>
<tr>
<td valign="top">**ct***c*</td>
<td>Changes from the cursor position to the first instance of the character.

* **cta** changes text up and to, but not including, the first letter 'a'.
</td>
</tr>
<tr>
<td valign="top">**cf***c*</td>
<td>Changes from the cursor position to the first instance of the character (including the character *c*).</td>
</tr>
<tr>
<td valign="top">**cG**</td>
<td>Changes from the start of the current line to the end of the file.</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">**s**</td>
<td>Change the character underneath the cursor. Can be preceded by a number.

* **5s** changes 5 characters, the one under the cursor and the next 4.
</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-8" title="Learning the vi Editor/vi Reference>`_]
 
Cut and Paste

--------------------------------------------------------------------------------

The *yank* commands copy text into the *vi* buffer. Text is also copied into the buffer by delete and change commands. The *put* or *place* commands retrieve text from the buffer.

<table cellpadding="5">
<tr>
<td valign="top">**yy**</td>
<td>Yanks the current line into the buffer. Can be preceded by a number.

* **5yy** yanks five lines.
</td>
</tr>
<tr>
<td valign="top">**Y**</td>
<td>Same as **yy**.</td>
</tr>
<tr>
<td valign="top">**yw**</td>
<td>Yanks from the cursor to the start of the next word into the buffer. Can be preceded by a number.

* **5yw** yanks five words.
</td>
</tr>
<tr>
<td></td>
<td>

----

</td>
</tr>
<tr>
<td valign="top">**p**</td>
<td>If the buffer consists of whole lines, they are inserted after the current line. If it consists of characters only, they are inserted after the cursor.</td>
</tr>
<tr>
<td valign="top">**P**</td>
<td>If the buffer consists of whole lines, they are inserted before the current line. If it consists of characters only, they are inserted before the cursor.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-9" title="Learning the vi Editor/vi Reference>`_]
 
Searching

--------------------------------------------------------------------------------

Searching uses `regular expressions <http://en.wikipedia.org/wiki/regular_expression"title="w:regular expression>`_.

<table cellpadding="5">
<tr>
<td valign="top">
/
*pattern*
/
</td>
<td>Searches for the string, which could be a regular expression. Searching is from the cursor position downwards, stopping at the first match. If not found, it will continue from the start of the file to the cursor position. The trailing slash character is optional.

* 
/
abc
/
 seaches for the first occurrence of *abc*.
</td>
</tr>
<tr>
<td valign="top">
/
*pattern*
/

+
</td>
<td>Goes to the line after the one containing the search string.

* 
/
abc
/

+3
 goes to the third line after the one containing *abc*.
</td>
</tr>
<tr>
<td valign="top">
/
*pattern*
/

e
</td>
<td>Leaves the cursor on the last character of the string that *pattern* matched.* By adding **+***num* or **-***num* after **e** you can supply an offset in characters to where the cursor gets left. For example: 
/
foo
/

e+3
 will leave the cursor 3 characters past the next occurrence of **foo**.* By using **b** instead of **e** you can specify a character offset from the beginning of the matched string.</td>
</tr>
<tr>
<td valign="top">
/
**\c***pattern*
/
</td>
<td>Does a case insensitive search.</td>
</tr>
<tr>
<td valign="top">
?
*pattern*
?
</td>
<td>As 
/
*pattern*
/
 but searches upwards. The trailing question mark character is optional.</td>
</tr>
<tr>
<td valign="top">
?
*pattern*
?

-
</td>
<td>Goes to the line above the one containing the search string.

* 
?
abc
?

-3
 goes to the third line above the one containing *abc*.
</td>
</tr>
<tr>
<td valign="top">
<n>
</td>
<td>Repeat last search.</td>
</tr>
<tr>
<td valign="top">
<N>
</td>
<td>Repeat last search but in the opposite direction.</td>
</tr>
<tr>
<td valign="top">
<f>
*char*</td>
<td>Search forward on the current line for the next occurrence of *char*.</td>
</tr>
<tr>
<td valign="top">
<F>
*char*</td>
<td>Search backward on the current line for the next occurrence of *char*.</td>
</tr>
<tr>
<td valign="top">
<t>
*char*</td>
<td>Search forward on the current line for the next occurrence of *char* and leave the cursor on the character before *char*.</td>
</tr>
<tr>
<td valign="top">
<T>
*char*</td>
<td>Search backward on the current line for the next occurrence of *char* and leave the cursor on the character after *char*.</td>
</tr>
<tr>
<td valign="top">
<;>
</td>
<td>Repeat the last **f** or **F** search.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-10" title="Learning the vi Editor/vi Reference>`_]
 
Search and Replace

--------------------------------------------------------------------------------

Search and replace uses `regular expressions <http://en.wikipedia.org/wiki/regular_expression"title="w:regular expression>`_ and the Ex command 
:substitute
 <small>(short 
:s
)</small> which has syntax similar to the `sed <http://en.wikipedia.org/wiki/sed"title="w:sed>`_ utility - which is not surprising `sed <http://en.wikipedia.org/wiki/sed"title="w:sed>`_, `Ex <http://en.wikipedia.org/wiki/Ex_(text_editor)"title="w:Ex (text editor)>`_ and `w:Vi <http://en.wikipedia.org/wiki/Vi"title="w:Vi>`_ have common roots - the `Ed <http://en.wikipedia.org/wiki/Ed_(text_editor)"title="w:Ed (text editor)>`_ editor.

<table cellpadding="5">
<tr>
<td valign="top">
:

.

s

/
*pattern*
/
*replacement*
/
</td>
<td>Replaces the first occurrence of *pattern* on the current line with *replacement*.* If *pattern* contains **\(** and **\)** they are used to remember what matched between them instead of matching parenthesis characters. For example **:.s/\(\d*\)-\(\d*\)/\2:\1/** could match the string **12345-6789** and substitute **6789:12345** for it.</td>
</tr>
<tr>
<td valign="top">
:

.

s

/
*pattern*
/
*replacement*
/

g
</td>
<td>Replaces all occurrences of *pattern* on the current line with *replacement*.</td>
</tr>
<tr>
<td valign="top">
:

%

s

/
*pattern*
/
*replacement*
/

g
</td>
<td>Replaces all occurrences of *pattern* in the whole file with *replacement*.</td>
</tr>
<tr>
<td valign="top">
:

x,y

s

/
*pattern*
/
*replacement*
/

g
</td>
<td>Replaces all occurrences of *pattern* on lines *x* through *y* with *replacement*.* For example: 
:

14,18

s

/
foo
/
bar
/

g
 will replace all occurrences of **foo** with **bar** on lines 14 through 18.

* The character **.** can be used to indicate the current line and the character **$** can be used to indicate the last line. For example: 
:

.,$

s

/
foo
/
bar
/

g
 will replace all occurrences of **foo** with **bar** on the current line through the end of the file.
</td>
</tr>
</table>

The following meta-characters have special meaning in the replacement pattern:

<table cellpadding="5">
<tr>
<td valign="top">**&**</td>
<td>Replaced by the text that matched the search pattern.</td>
</tr>
<tr>
<td valign="top">**\n**</td>
<td>Replaced by the text matching the search pattern between *\(* and *\)*, where *n* is in the range of 1 through 9 with *\1* being replaced by the match from the first set.</td>
</tr>
<tr>
<td valign="top">**\u**</td>
<td>Capitalize the next character (if the character is a letter).</td>
</tr>
<tr>
<td valign="top">**\l**</td>
<td>Lowercase the next character (if the character is a letter).</td>
</tr>
<tr>
<td valign="top">**\U**</td>
<td>Turn on capitalization mode, where all of the following characters are capitalized.</td>
</tr>
<tr>
<td valign="top">**\L**</td>
<td>Turn on lowercase mode, where all of the following characters are lowercased.</td>
</tr>
<tr>
<td valign="top">**\E**</td>
<td>Turn off capitalization or lowercase mode.</td>
</tr>
<tr>
<td valign="top">**\e**</td>
<td>Turn off capitalization or lowercase mode.</td>
</tr>
</table>

For example **.:s/\(foo\) \(bar\) \(baz\)/\u\1 \U\2\E \3/** could match the string **foo bar baz** and substitute **Foo BAR baz** for it.

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-11" title="Learning the vi Editor/vi Reference>`_]
 
Mark Text

--------------------------------------------------------------------------------

Marked lines can be used when changing or deleting text.

<table cellpadding="5">
<tr>
<td valign="top">
<m>
*m*</td>
<td>Mark the current line with the letter.

* 
<m>

<a>
 marks the current line with the letter *a*.
</td>
</tr>
<tr>
<td valign="top">
<'>
*m*</td>
<td>Move to the line marked by the letter.

* 
<'>

<a>
 moves to the line marked by *a*.
</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-12" title="Learning the vi Editor/vi Reference>`_]
 
Screen Refresh

--------------------------------------------------------------------------------
<table cellpadding="5">
<tr>
<td valign="top">**
<Ctrl-L>
**</td>
<td>Refresh the screen.</td>
</tr>
<tr>
<td valign="top">**z<CR>**</td>
<td>Refreshes the screen so that the current line is at the top. Can be preceded by a line number.

* **35z** refreshes the screen so that line 35 is at the top.
</td>
</tr>
<tr>
<td valign="top">**/pattern/z**</td>
<td>Finds the line with the first occurrence of *string* and then refreshes the screen so that it is at the top.</td>
</tr>
<tr>
<td valign="top">**z.**</td>
<td>Refreshes the screen so that the current line is in the middle of the screen. Can be preceded by a line number, in which case the line is at the middle. The sequence **zz** also has the same effect.

* **35z.** refreshes the screen so that line 35 is in the middle.
</td>
</tr>
<tr>
<td valign="top">**/string/z.**</td>
<td>Finds the line with the first occurrence of *string* and then refreshes the screen so that it is in the middle.</td>
</tr>
<tr>
<td valign="top">**z-**</td>
<td>Refreshes the screen so that the current line is at the bottom. Can be preceded by a line number, in which case the line is at the bottom.

* **35z-** refreshes the screen so that line 35 is at the bottom.
</td>
</tr>
<tr>
<td valign="top">**/string/z-**</td>
<td>Finds the line with the first occurrence of *string* and then refreshes the screen so that it is at the bottom.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-13" title="Learning the vi Editor/vi Reference>`_]
 
Others

--------------------------------------------------------------------------------
<table cellpadding="5">
<tr>
<td valign="top">
<~>
</td>
<td>Changes the case of the character underneath the cursor and moves to the next character. Can be preceded by a number, so that **5~** changes the case of 5 characters.</td>
</tr>
<tr>
<td valign="top">
<.>
</td>
<td>Repeats the last insert or delete. Can be preceded by a number, **dd** followed by **5.** deletes a line and then deletes another 5 lines.</td>
</tr>
<tr>
<td valign="top">
<%>
</td>
<td>Moves the cursor to the matching bracket, any of (), [] or {}.</td>
</tr>
<tr>
<td valign="top">
<Ctrl-G>
</td>
<td>Temporarily displays a status line at the bottom of the screen.</td>
</tr>
<tr>
<td valign="top">
:f
</td>
<td>Same as 
<Ctrl-G>
.</td>
</tr>
<tr>
<td valign="top">
<J>
</td>
<td>Joins the next line to the end of the current line. Can be preceded by a number. Both **1J** and **2J** do the same as **J**.

* **3J** joins three lines together, the current line and the next two lines.
</td>
</tr>
<tr>
<td valign="top">
<u>
</td>
<td>Undoes the last change. A second **u** puts the change back.</td>
</tr>
<tr>
<td valign="top">
<U>
</td>
<td>Undoes all changes to the current line.</td>
</tr>
<tr>
<td valign="top">
<Ctrl-Z>
</td>
<td>Puts *vi* into the background, that is control is returned to the operating system. In UNIX, the *vi* session can be returned to the foreground with **fg**.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-14" title="Learning the vi Editor/vi Reference>`_]
 
Saving and Quitting

--------------------------------------------------------------------------------
<table cellpadding="5">
<tr>
<td valign="top">
<Z>

<Z>
</td>
<td>Saves and quits. It is symbolic of sleep, indicating the end of work.</td>
</tr>
<tr>
<td valign="top">
:quit
:q
</td>
<td>Quits, but only if no changes have been made.</td>
</tr>
<tr>
<td valign="top">
:quit!
:q!
</td>
<td>Quits without saving, regardless of any changes.</td>
</tr>
<tr>
<td valign="top">
:write
:w
</td>
<td>Saves the current file without quitting.

* {Vi/Ex|:write!}} **myfile** saves to the file called *myfile*.
</td>
</tr>
<tr>
<td valign="top">
:write!
*filename*
:w!
*filename*</td>
<td>Saves to the file, overwriting any existing contents.</td>
</tr>
<tr>
<td valign="top">
:wq
:write
|
quit
</td>
<td>Saves and quits.</td>
</tr>
<tr>
<td valign="top">
:exit
:xit
:x
</td>
<td>Saves and quits.</td>
</tr>
<tr>
<td valign="top">
:exit!
:xit!
:x!
</td>
<td>Used to save and quit in **view**.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-15" title="Learning the vi Editor/vi Reference>`_]
 
Files

--------------------------------------------------------------------------------
<table cellpadding="5">
<tr>
<td valign="top">**:e filename**</td>
<td>Quits the current file and starts editing the named file.</td>
</tr>
<tr>
<td valign="top">**:e + filename**</td>
<td>Quits the current file and starts editing the named file with the cursor at the end of the file.

* **:e +5 myfile** quits the current file and begins editing *myfile* at line 5.
</td>
</tr>
<tr>
<td valign="top">**:e!**</td>
<td>The current file is closed, all unsaved changes discarded, and the file is re-opened for editing.</td>
</tr>
<tr>
<td valign="top">**:e#**</td>
<td>Quits the current file and starts editing the previous file.</td>
</tr>
<tr>
<td valign="top">**:n**</td>
<td>When multiple files were quoted on the command line, start editing the next file.</td>
</tr>
<tr>
<td valign="top">**:n files**</td>
<td>Resets the list of files for **:n**. The current file will be closed and the first file in the list will be opened for editing.</td>
</tr>
<tr>
<td valign="top">**:r filename**</td>
<td>Read a file, that is insert a file.

* **:r myfile** inserts the file named *myfile* after the cursor.
* **:5r myfile** inserts the file after line 5.
</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-16" title="Learning the vi Editor/vi Reference>`_]
 
vi Options

********************************************************************************

All options are *ex* options, and so require an initial colon.

Default options may be placed into a file in the user's home directory called **.exrc**. Options in this file do not have the initial colon, e.g.

    **set ic**
<table cellpadding="5">
<tr>
<td valign="top">**:set all**</td>
<td>Displays all the current settings.</td>
</tr>
</table>
<table cellpadding="5" border="border">
<tr>
<td>! Set on</td>
<td>! Set off</td>
<td>! Meaning</td>
</tr>
<tr>
<td valign="top">**:set ignorecase**
**:set ic**</td>
<td>**:set noignorecase**
**:set noic**</td>
<td valign="top">Ignore case. Makes searching case insensitive.</td>
</tr>
<tr>
<td valign="top">**:set list**</td>
<td valign="top">**:set nolist**</td>
<td>Shows control characters. *
<Ctrl-I>
* is tab, *$* is linefeed.</td>
</tr>
<tr>
<td valign="top">**:set number**
**:set nu**</td>
<td>**:set nonumber**
**:set nonu**</td>
<td valign="top">Turns on line numbering.</td>
</tr>
<tr>
<td valign="top">**:set term**</td>
<td></td>
<td>Displays the terminal type.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-17" title="Learning the vi Editor/vi Reference>`_]
 
ex Commands

********************************************************************************

**ex** commands start with **:**, which puts *vi* into *last line mode*, entered on the last line of the screen. Spaces within the command are ignored.

<table cellpadding="5">
<tr>
<td valign="top">**:! command**</td>
<td>Executes the named operating system command and then returns to **vi**.

* **:! ls** runs the UNIX *ls* command.
</td>
</tr>
<tr>
<td valign="top">**:sh**</td>
<td>Starts up a shell. **exit** returns to the **vi** session.</td>
</tr>
<tr>
<td valign="top">**:vi**</td>
<td>Exit *last line mode* and return to normal *command mode*.</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-18" title="Learning the vi Editor/vi Reference>`_]
 
ex line commands

--------------------------------------------------------------------------------

These commands edit lines and have the following syntax:

* No line number, meaning work on the current line.
* With **%**, meaning work on all lines.
* A pair of line numbers, such as '3,5' meaning work on lines 3 to 5 inclusive. Either number can be replaced with **.**, standing for the current line or **$** standing for the last line. So **.,$** means from the current line to the end of the file and **1,$** means the same as **%**. Additionally simple arithmetic may be used, so **.+1** means the line after the current line, or **$-5** means 5 lines before the last line.
<table cellpadding="5">
<tr>
<td valign="top">**co**</td>
<td>Copy, followed by the line position to copy to.

* **:co 5** copies the current line and places it after line 5.
<ul>
<li>**:1,3 co 4** copies lines 1 to 3 and places after line 4.
</li>
</ul>
</td>
</tr>
<tr>
<td valign="top">**d**</td>
<td>Delete.

* **:d** deletes the current line.
<ul>
<li>**:.,.+5d** delete the current line and the next 5 lines.
* **:%d** deletes all lines.
</li>
</ul>
</td>
</tr>
<tr>
<td valign="top">**m**</td>
<td>Move, followed by the line position to move to.

* **:m 10** moves the current line and places it after line 10.
<ul>
<li>**:1,3 m 4** moves lines 1 to 3 and places after line 4.
</li>
</ul>
</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-19" title="Learning the vi Editor/vi Reference>`_]
 
Mapping / Remapping vi Commands

--------------------------------------------------------------------------------
<table cellpadding="5">
<tr>
<td valign="top">**:map**</td>
<td>Create new command or overwrite existing in vi command mode.

* **:map v i--
<Ctrl-[>
** new command **v** will insert *--* and return to command mode. 
<Ctrl-[>
 is the escape character typed as <CTRL-V><ESC>.
</td>
</tr>
<tr>
<td valign="top">**:map!**</td>
<td>Create new command in both command and insert mode.

* **:map!&#160;;r 
<Ctrl-[>
** typing *;r* in insert mode will return to command mode.
</td>
</tr>
</table>

[`edit </w/index.php?title=Learning_the_vi_Editor/vi_Reference&action=edit&section=T-20" title="Learning the vi Editor/vi Reference>`_]
 
External link

********************************************************************************

* `vim Official Reference Manual <http://vimdoc.sourceforge.net/htmldoc/ref_toc.html"rel="nofollow>`_
* `An introduction to the vi editor <http://planzero.org/tutorials/introduction_to_the_vi_editor.php"rel="nofollow>`_
* `Learning Unix in 10min <http://freeengineer.org/learnUNIXin10minutes.html"rel="nofollow>`_
[`edit </w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit&section=12" title="Edit section: Authors>`_]
 
Authors

================================================================================

This book has many authors, including the public: it is open for anyone and everybody to improve. Therefore, this is more properly a list of acknowledgements of contributors than a list of authors. Whoever we are, this is where we get to brag about our accomplishments in writing this book.

[`edit </w/index.php?title=Learning_the_vi_Editor/Authors&action=edit&section=T-1" title="Learning the vi Editor/Authors>`_]
 
List of major contributors

********************************************************************************

* `Dysprosia </wiki/User:Dysprosia" title="User:Dysprosia>`_ (`Contributions </wiki/Special:Contributions/Dysprosia" title="Special:Contributions/Dysprosia>`_)
* `Martin Krischik </wiki/User:Krischik" title="User:Krischik>`_ `Learning the vi Editor/Vim </wiki/Learning_the_vi_Editor/Vim" title="Learning the vi Editor/Vim>`_ (`Contributions </wiki/Special:Contributions/Krischik" title="Special:Contributions/Krischik>`_)
* N.N.(anonymous): The advanced/Power User/Extra Details part (`Learning the vi Editor/Details </wiki/Learning_the_vi_Editor/Details" title="Learning the vi Editor/Details>`_) - whatever it is currently called .
* Others (add your name and description if you made a major contribution)
* Various anonymous persons
Retrieved from "`http://en.wikibooks.org/wiki/Learning_the_vi_Editor/Print_version <http://en.wikibooks.org/wiki/Learning_the_vi_Editor/Print_version>`_"

				
								
				

`Category </wiki/Special:Categories" title="Special:Categories>`_: 
`Learning the vi Editor </wiki/Category:Learning_the_vi_Editor" title="Category:Learning the vi Editor>`_

				
												
				

	<form method="post" action="/w/index.php?title=Special:ReaderFeedback&action=submit" id="mw-feedbackform"><fieldset><legend>**What do you think of this page?**</legend>

*Please take a moment to rate this page below. Your feedback is valuable and helps us improve our website.*

**<label for="wpreliability">Reliability</label>:**&nbsp;<select name="wpreliability" id="wpreliability" onchange="updateFeedbackForm()"><optionvalue="4">Excellent</option>
<optionvalue="3">High</option>
<optionvalue="2">Fair</option>
<optionvalue="1">Low</option>
<optionvalue="0">Poor</option>
<option value="-1" selected="selected">(unsure)</option>
</select>
**<label for="wpcompleteness">Completeness</label>:**&nbsp;<select name="wpcompleteness" id="wpcompleteness" onchange="updateFeedbackForm()"><optionvalue="4">Excellent</option>
<optionvalue="3">High</option>
<optionvalue="2">Fair</option>
<optionvalue="1">Low</option>
<optionvalue="0">Poor</option>
<option value="-1" selected="selected">(unsure)</option>
</select>
**<label for="wpnpov">Neutrality</label>:**&nbsp;<select name="wpnpov" id="wpnpov" onchange="updateFeedbackForm()"><optionvalue="4">Excellent</option>
<optionvalue="3">High</option>
<optionvalue="2">Fair</option>
<optionvalue="1">Low</option>
<optionvalue="0">Poor</option>
<option value="-1" selected="selected">(unsure)</option>
</select>
**<label for="wppresentation">Presentation</label>:**&nbsp;<select name="wppresentation" id="wppresentation" onchange="updateFeedbackForm()"><optionvalue="4">Excellent</option>
<optionvalue="3">High</option>
<optionvalue="2">Fair</option>
<optionvalue="1">Low</option>
<optionvalue="0">Poor</option>
<option value="-1" selected="selected">(unsure)</option>
</select>

<input type="submit" value="Submit" id="submitfeedback" accesskey="b" title="Submit review [b]" /><input type="hidden" value="Special:ReaderFeedback" name="title" />
<input type="hidden" value="Learning_the_vi_Editor/Print_version" name="target" />
<input type="hidden" value="1893697" name="oldid" />
<input type="hidden" value="db5ebd6f0c4ae19ee93ced44f482176b" name="validatedParams" /><input type="hidden" value="submit" name="action" />
<input type="hidden" value="+\" name="wpEditToken" />
<input name="commentary" size="12" value="" style="display:none;" />
</fieldset></form>

				
								

			

			
		

		
		
		

			

	
Personal tools

					<li  id="pt-login">`Log in / create account </w/index.php?title=Special:UserLogin&returnto=Learning_the_vi_Editor/Print_version" title="You are encouraged to log in; however, it is not mandatory [o]" accesskey="o>`_</li>
			
Namespaces

					<li  id="ca-nstab-main">`
Book
 </wiki/Learning_the_vi_Editor/Print_version"  title="View the content page [c]" accesskey="c>`_</li>
					<li  id="ca-talk">`
Discussion
 </w/index.php?title=Talk:Learning_the_vi_Editor/Print_version&action=edit&redlink=1"  title="Discussion about the content page [t]" accesskey="t>`_</li>
			
Variants
` <#>`_

					
Views

					<li id="ca-view">`<a href="/w/index.php?title=Learning_the_vi_Editor/Print_version&action=edit"  title="You can edit this page. Please use the preview button before saving [e]" accesskey="e">
Edit
 </wiki/Learning_the_vi_Editor/Print_version" >
Read
</a></li>
					<li id="ca-edit>`_</li>
					<li id="ca-history">`
View history
 </w/index.php?title=Learning_the_vi_Editor/Print_version&action=history"  title="Past revisions of this page [h]" accesskey="h>`_</li>
			
Actions
` <#>`_

					
<label for="searchInput">Search</label>

<form action="/w/index.php" id="searchform">
		<input type='hidden' name="title" value="Special:Search"/>
				

			<input id="searchInput" name="search" type="text"  title="Search Wikibooks [f]" accesskey="f"  value="" />
			<button id="searchButton" type='submit' name='button'  title="Search the pages for this text"><img src="http://bits.wikimedia.org/skins-1.5/vector/images/search-ltr.png?283-17" alt="Search" /></button>
		

			</form>

			

		

		
		
			

				
					
<a style="background-image: url(http://upload.wikimedia.org/wikibooks/en/b/bc/Wiki.png);" href="/wiki/Main_Page"  title="Visit the main page"></a>

				
				

	
Navigation

					<li id="n-mainpage">`Main Page </wiki/Main_Page" title="Visit the main page [z]" accesskey="z>`_</li>
					<li id="n-help">`Help </wiki/Help:Contents" title="Find help on how to use and edit Wikibooks>`_</li>
					<li id="n-Browse">`Browse </wiki/Wikibooks:Card_Catalog_Office" title="Check out what Wikibooks has to offer>`_</li>
					<li id="n-Cookbook">`Cookbook </wiki/Cookbook:Table_of_Contents" title="Learn recipes from around the world>`_</li>
					<li id="n-Wikijunior">`Wikijunior </wiki/Wikijunior" title="Books for children>`_</li>
					<li id="n-Featured-books">`Featured books </wiki/Wikibooks:Featured_books" title="The best of Wikibooks>`_</li>
					<li id="n-recentchanges">`Recent changes </wiki/Special:RecentChanges" title="The list of recent changes in the wiki [r]" accesskey="r>`_</li>
					<li id="n-sitesupport">`Donations <http://wikimediafoundation.org/wiki/Special:Landingcheck?landing_page=WMFJA1&language=en&utm_source=donate&utm_medium=sidebar&utm_campaign=20101204SB001" title="Support Wikibooks>`_</li>
				
Community

					<li id="n-Reading-room">`Reading room </wiki/Wikibooks:Reading_room" title="Discuss Wikibooks-related questions and concerns with others>`_</li>
					<li id="n-portal">`Community portal </wiki/Wikibooks:Community_Portal" title="Find your way around the Wikibooks community>`_</li>
					<li id="n-currentevents">`Bulletin Board </wiki/Wikibooks:Reading_room/Bulletin_Board" title="Important community news>`_</li>
					<li id="n-maintenance">`Help out! </wiki/Wikibooks:Maintenance" title="Frequent tasks that you can help with>`_</li>
					<li id="n-Policies-and-guidelines">`Policies and guidelines </wiki/Wikibooks:Policies_and_guidelines" title="Pages detailing important rules and procedures>`_</li>
					<li id="n-contact">`Contact us </wiki/Wikibooks:Contact_us" title="Alternative methods of communication>`_</li>
				
Print/export

<ul id="collectionPortletList"><li id="coll-create_a_book">`Create a collection </w/index.php?title=Special:Book&bookcmd=book_creator&referer=Learning+the+vi+Editor%2FPrint+version" title="Create a book or page collection" rel="nofollow>`_</li><li id="coll-download-as-rl">`Download as PDF </w/index.php?title=Special:Book&bookcmd=render_article&arttitle=Learning+the+vi+Editor%2FPrint+version&oldid=1893697&writer=rl" title="Download a PDF version of this wiki page" rel="nofollow>`_</li><li id="t-print">`Printable version </w/index.php?title=Learning_the_vi_Editor/Print_version&printable=yes" title="Printable version of this page [p]" accesskey="p>`_</li></ul>			

	
Toolbox

					<li id="t-whatlinkshere">`What links here </wiki/Special:WhatLinksHere/Learning_the_vi_Editor/Print_version" title="List of all wiki pages that link here [j]" accesskey="j>`_</li>
						<li id="t-recentchangeslinked">`Related changes </wiki/Special:RecentChangesLinked/Learning_the_vi_Editor/Print_version" title="Recent changes in pages linked from this page [k]" accesskey="k>`_</li>
																																					<li id="t-upload">`Upload file <http://commons.wikimedia.org/wiki/Commons:Upload" title="Upload files [u]" accesskey="u>`_</li>
											<li id="t-specialpages">`Special pages </wiki/Special:SpecialPages" title="List of all special pages [q]" accesskey="q>`_</li>
											<li id="t-permalink">`Permanent link </w/index.php?title=Learning_the_vi_Editor/Print_version&oldid=1893697" title="Permanent link to this revision of the page>`_</li>
				<li id="t-rating">`Page rating </w/index.php?title=Special:RatingHistory&target=Learning_the_vi_Editor/Print_version>`_</li>		
<ul id="footer-info">
																	<li id="footer-info-lastmod"> This page was last modified on 18 July 2010, at 23:51.</li>
																							<li id="footer-info-copyright">Text is available under the <a rel="license" href="http://en.wikibooks.org/wiki/Wikibooks:Creative_Commons_Attribution-ShareAlike_3.0_Unported_License">Creative Commons Attribution-ShareAlike License</a><a rel="license" href="http://creativecommons.org/licenses/by-sa/3.0/" style="display:none;"></a>;
additional terms may apply. See `Terms of Use <http://wikimediafoundation.org/wiki/Terms_of_Use>`_ for details.</li>
															</ul>
															<ul id="footer-places">
																	<li id="footer-places-privacy">`Privacy policy <http://wikimediafoundation.org/wiki/Privacy_policy" title="wikimedia:Privacy policy>`_</li>
																							<li id="footer-places-about">`About Wikibooks </wiki/Wikibooks:Welcome" title="Wikibooks:Welcome>`_</li>
																							<li id="footer-places-disclaimer">`Disclaimers </wiki/Wikibooks:General_disclaimer" title="Wikibooks:General disclaimer>`_</li>
															</ul>
										<ul id="footer-icons">
								<li id="footer-icon-poweredby">`<img src="http://bits.wikimedia.org/skins-1.5/common/images/poweredby_mediawiki_88x31.png" height="31" width="88" alt="Powered by MediaWiki" /> <http://www.mediawiki.org/>`_</li>
												<li id="footer-icon-copyright">`<img src="/images/wikimedia-button.png" width="88" height="31" alt="Wikimedia Foundation"/> <http://wikimediafoundation.org/>`_</li>
							</ul>
			

		

		
		
		
		
		

					

