

Things you MUST know about the Linux shell
================================================================================
:author: Vince Veselosky
:description: Explains the nature, purpose and use of the Linux shell, bash.

Note: I've tried to create diagrams in this page using HTML tables rather
than graphics. They look right on my browsers, but they may not on
yours.

What is this "shell"?
********************************************************************************
The "shell" is another name for the command shell or command interpreter. This
is the program that gives you a command prompt, accepts the commands you type
there, and basically makes the computer do what you tell it to. In DOS the
program that did this was command.com (unless you were a real technogeek and
used 4dos). In Linux, the shell is the first program that starts when you log
in, and it keeps running until you log out, waiting to do your bidding. Linux
is able to use any of several different shells, but the default Linux shell is
called bash and is the only one I will discuss.

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

<table width="100%" border="0" cellspacing="0" cellpadding="4"
bgcolor="c0c0c0">
<tbody>
<tr valign="top">
<th colspan="4" width="50%" bgcolor="#808080">

Vince's Shell

</th>
<th colspan="4" width="50%" bgcolor="#c0c0c0">

Fred's Shell

</th>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="13%" bgcolor="#c0c0c0">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

Program:
finding files in background

</td>
<td width="12%" bgcolor="#ffffff">

Program:
editing a text document

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#808080">

Program:
Playing Solitaire

</td>
<td width="12%" bgcolor="#ffffff">

Program:
Compiling a new kernel

</td>
<td width="13%" bgcolor="#c0c0c0">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="13%" bgcolor="#c0c0c0">

</td>
</tr>
</tbody>
</table>

In the diagram, my programs are kept separate from Fred's programs by our
shells, (represented here by table borders and color changes in the cells to
show separation). It is even possible to have a shell running inside another
shell. This is common when using X11.

<table width="100%" border="0" cellpadding="4" cellspacing="0">
<tbody>
<tr>
<th colspan="8" width="100%" valign="top" bgcolor="#808080">

Vince's Shell

</th>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

Program:
X Server

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

Program:
xtetris

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="13%" bgcolor="#808080">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="13%" bgcolor="#808080">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0"><p align="left">
Program: 
xeyes

</td>
<td width="12%" bgcolor="#808080">

</td>
<td colspan="4" width="50%" bgcolor="#c0c0c0">

xterm (another shell)

</td>
<td width="13%" bgcolor="#808080">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#808080">

Program:
Compiling kernel

</td>
<td width="12%" bgcolor="#ffffff">

Program:
microcom 

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="13%" bgcolor="#808080">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="12%" bgcolor="#c0c0c0">

</td>
<td width="13%" bgcolor="#808080">

</td>
</tr>
<tr valign="top">
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="12%" bgcolor="#808080">

</td>
<td width="13%" bgcolor="#808080">

</td>
</tr>
</tbody>
</table>

----

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
(program) in the background, type an ampersand (&) at the end of the
command line. To suspend the currently running job, Ctrl-Z. To force a
suspended job to run in the background, type `bg &lt;job>`:kbd:. 
To bring a background job into the foreground, type 
`fg &lt;job>`:kbd:. To see a list of jobs currently running (or 
suspended) type `jobs`:kbd:. If you exclude the &lt;job>
argument on these commands, it defaults to whatever job was last running in
the foreground (not the one currently in the foreground).

