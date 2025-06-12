---
type: article
title: "Introducing WordPerfect 8 for Linux"
description: "How to obtain, install and use Corel WordPerfect 8 for Linux"
date: "2011-06-04T23:16:21-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
  orphan: "True"
---

{{< warning >}}
Note: Corel no longer makes Wordperfect for Linux. This article is out of date and is
retained for historical reference only.
{{< /warning >}}
<!--more-->

## Obtaining WordPerfect

WordPerfect can be downloaded from the Internet without charge or purchased on CD-ROM
from several Internet vendors. See [Resources](#resources) below for a list of sources.
The downloaded version must be registered at
[Corel\'s Linux Site](http://linux.corel.com) to be functional after 30 days, but there
is no charge for registration.

There are two ways to download WordPerfect, either as one big file (about 25MB) or as
several pieces. If you chose the one big file method, you should end up with a file
called GUILG00.GZ. This is the first problem you will run into (okay, the second, the
first is completing a 25mb download!). The file _should_ have been called
guilg00.tar.gz, because it is tarred and then gzipped and Linux is case sensitive with
the default being lower case. If you use the Linux version of Netscape to download it,
the file naming scheme will be further aggravated by Netscape, which tries to be helpful
by unzipping \*.gz files when it downloads them, but neglects to remove the .gz file
extension. So when the download is complete, you are left with a file called GUILG00.GZ
that should have been called guilg00.tar.

If you choose the multiple segment download, you will end up with seven (I think) files,
named GUI00.GZ, GUI01.GZ, etc. Again, the files are incorrectly named in upper case. As
it happens, the WordPerfect installation script _requires_ that the file names be _lower
case_, so your install will fail if you don\'t correct this! All the other warnings
apply too, they are actually tar.gz files and Netscape might unzip them without telling
you.

Note that the installation files will be altered during the setup process, so you should
save these downloaded archives in case you need to reinstall WordPerfect in the future.

## Installation

Ordinarily when installing new software you should be logged on as \"root\", the system
administrator account, so that you have access to system directories. At one time Corel
had announced that there was a potential security hole in WordPerfect if it is installed
by root. This problem has (I hope) long since been fixed, but it would be wise to check
the [Corel Linux Web site](http://linux.corel.com). For now, log on with your normal
user account (see [User and SuperUser](users-groups)). WordPerfect doesn\'t need to
write anything to your library directories, so this should not effect your install, but
it will effect where you are allowed to install it, since as a regular user you probably
do not have permission to write to the `/usr` directory tree. Since this edition of
WordPerfect is for personal use only, it is not unreasonable to install it to your home
directory. More on this later.

First, create an empty directory to store the setup files: `mkdir corel` Then, move the
downloaded files to that directory and extract them. This is a good time to correct
those upper case file names: `mv GUI00.GZ corel/gui00.tar.gz` #(Repeat for each file.)
`cd corel` `gunzip gui00.tar.gz` #(Repeat for each file. If Netscape already unzipped
the files, #this step will fail. Just move on to the next step.) `tar xvf gui00.tar`
#(Repeat for each file.)

Once the setup files are extracted, you should find two important files named Readme and
Runme. After reading the Readme (**always** read the readme file!), run the Runme
script. It may ask you a few simple questions, like whether you have untarred the
downloaded files and whether you are using X (you should be). Then kapow! A lovely setup
wizard appears! I\'m starting to like this! It asks for an installation directory, and I
assign it to `/usr/local/corel/`. There is no indication of what the default might have
otherwise been, so be sure to type something here so your files won\'t get lost. If you
are installing as a normal user (you should be), you may not be able to write to
`/usr/local/`. Instead, you should give it a place to live in your home directory, for
example: `/home/vince/corel`

The setup also offers to borrow information from a previous install of WordPerfect. If
you don\'t have one just tell it to continue. After agreeing to the license and a few
other things, setup completes.

After install, you may want to give WordPerfect administration privileges to regular
users. (If you installed as a user, you should already have admin permission). This will
allow the named users to change printer drivers or global settings. Start WordPerfect
with the command `/usr/local/corel/wpbin/xwp -adm`. Click Preferences, Admin and add
your user name to the list (or you could create a WPAdmin group and give privileges to
all its members). Don\'t make any other changes while WordPerfect is in Admin mode. You
want to keep the global settings at their defaults so that if you really screw something
up you can just delete your own customization files (in &#36;HOME/.xwprc) and get back
to the installation defaults. Close WordPerfect down now and (if you\'re not already)
log on as yourself (that is, a regular user). Start WordPerfect with the command
`/usr/local/corel/wpbin/xwp` (altering the path as appropriate to your install) and
let\'s begin!

## Personalizing

The first thing you\'ll want to do is personalize your copy of WordPerfect using the
\"Preferences\" menu. There\'s a place for your name and initials for times when it
wants to insert those in documents. It defaults to your login name, so you may want to
change this. The important thing for me was to hit Preferences, Files and point it to my
default data directory. WordPerfect defaults to your &#36;HOME directory, but mine is so
cluttered with config files and automatically created junk that I have a subdirectory
called \"Data\" where all my _real_ files are stored. Setting the default folders for
all kinds of files is easy, as is opening and saving files, thanks to WordPerfect\'s
nifty file manager. (Just press the browse button!) You can also change the color
scheme, design your own custom status bar (called the \"Application Bar\"), and adjust
various other visual properties from here. I\'ll leave it to you to explore.

### Styles

I don\'t know how other people feel, but the first thing I like to do when I adopt a new
word processor is to personalize my own style sheet. I must have spent a month or more
(off and on) tweaking my document template for MS Word back when I still used Windows. I
remember being impossibly frustrated because none of the options seemed to do what I
expected, and they were all hidden behind menu after menu or buried under three dialogs.
(Who says Windows doesn\'t have a learning curve?) I\'ve only been working with
WordPerfect for a couple of hours and I\'ve already got the styles figured out. I still
think they could be easier to find and use, but at least it didn\'t take me a month to
be satisfied with the results.

The first thing I didn\'t like was the font. It defaulted to Courier, and I don\'t like
to use a mono-spaced font unless I\'m typing code or columnar data in a text file. What
stumped me was that the Style box on the toolbar said \"\<None\>\". How could I
customize a style that didn\'t exist? After poking through the help files and
experimenting quite a bit, I discovered that \<None\> actually meant it was using a
style called InitialStyle. This style corresponds to the Normal.dot or default document
template in Word. You can use it to set not only the default font but also properties
like page margins, page numbering, columns, etc. To edit this (or any other) style,
click Format-\>Styles, select InitialStyle from the list and hit the Edit button. Make
your changes in the Style Editor and click OK. Make sure to select the button \"Use as
Default\", otherwise your changes will effect only the current document. Once you\'ve
got the defaults set the way you want them, you can start building your own personal
style sheet.

WordPerfect comes with a ton of built in paragraph styles, but they are all hidden by
default. Weird, huh? To see them, choose Format-\>Styles-\>Options-\>Setup and select
\"System Styles\" under Display. There are way too many styles there to work with on a
daily basis, so I decided to copy a few to my personal style library. To do this, select
the style from the list and choose Options-\>Copy. Pick your personal library, assign
the style a new name when prompted, and you now have your own style library. Then I
chose to display the styles from my personal library in the default list
(Format-\>Styles-\>Options-\>Setup).

## Compatibility

If you\'re looking for compatibility with MS Office, look elsewhere. Although
WordPerfect is able to import some documents saved in MS Word 97 format, its capacity is
limited. It does not support the Word \"fast save\" format (which Word turns on by
default), so many documents will not import. When I tried to import a password protected
document, WordPerfect hung. (StarOffice was also unable to read the file, but correctly
reported that the file was password protected and continued to operate.) I tried to
import some large files with macros and WordPerfect crashed completely, while StarOffice
was able to import the documents with little trouble. WordPerfect also crashed when I
tried to import data from a \"monthly budget\" spreadsheet in Excel 97 format. When I
tried to import a very simple spreadsheet the program did not crash, but I was informed
that WordPerfect does not understand this file format. The only spreadsheets listed in
the file import filters are various versions of Lotus 123. (It can\'t even import
Corel\'s own Quattro Pro format?!)

WordPerfect is unable to import or export StarOffice format, and reciprocally StarOffice
does not support WordPerfect format, so migrating between them is likely to be a bear of
a problem. (A recent StarOffice 5 Filter Update added support for WordPerfect format,
but you must purchase the CD-ROM edition to get the filter, it is not available in the
free download edition). WordPerfect claims to understand Applix Words 4.0 format, but I
was unable to test this since I don\'t have a copy of Applix.

WordPerfect does a decent job of exporting WordPerfect documents to HTML. The resulting
HTML code is much cleaner than many word processors, and is quite readable in a text
editor. Oddly, WordPerfect for Linux saves HTML as DOS text rather than Unix text, so
your text editor will show Control-M characters (carriage returns) at the end of every
line. This has no effect on how the page displays in a web browser. If you use the
built-in system styles it correctly translates them into their HTML counterparts (but
styles you create will be approximated with \<font\> tags). It even generates \<em\> and
\<strong\> tags to represent italic and bold text, and replaces mark-up characters like
\< with the proper entity references. Unfortunately, it won\'t let you work natively in
HTML; you have to save the document in WordPerfect format and then direct it to export a
separate web page copy. This should suffice if you have some pre-existing documents that
you need to publish on the web, but being forced to save every document twice would be a
nightmare trying to build a full web site. If web design is your thing, you\'ll need
other tools.

## Miscellaneous

WordPerfect provides a usable outline mode, but lacks an analogue to MS Word\'s Document
Map feature, making the outline feel somewhat featureless. Once in outline mode, I found
it impossible to get _out_ of outline mode. The button that claimed to exit outline mode
just broke my outline styles at the cursor.

The optional correct-as-you-type feature is very powerful and effective, and doesn\'t
just call the spell-checker but also the grammar checker and thesaurus. Yes with one
click of the mouse, you can retrieve a list of synonyms for whatever word is under the
cursor, which I think is really cool!

WordPerfect is capable of importing jpg and (some) gif files, but does not support
interlaced gifs, so many gif images will be inaccessible. Table support seems adequate,
including simple formulae which should suffice for simple household budgets and the
like, but for serious calculation you\'ll need a real spreadsheet package.

The free download version includes only the barest minimum of fonts. To get the extended
font package and clip art, you\'ll need to buy the CD-ROM version. All the fonts are
Adobe type 1, which means they look great on paper, and look readable but not so great
on screen. This is not a WordPerfect problem, it\'s true of just about all X software.
(Oh, how I long for universal TrueType support!)

## Summary

Corel WordPerfect 8 for Linux is a solid word processing program with a few kinks to be
worked out. Although it does its word processing job very well if you use it alone, its
weakness in interoperability with other software makes it hard to migrate from another
word processor. Its HTML support is good, but not good enough to use it as a
professional web development tool.

In my informal use, I found StarOffice from Star Division to be more capable for about
the same price. (A new StarOffice release available for download appears to have
corrected some stability problems and improved it\'s import filters). Both programs are
free for non-commercial use and can be downloaded from the Internet, so take them both
for a test drive and decide for yourself.

## Resources

[Corel\'s Linux Site](http://linux.corel.com)

Download or register Corel WordPerfect 8 for Linux here. Also you can check out Corel\'s
WordPerfect Office 2000 for Linux, and their new CorelDRAW! Graphics Suite for Linux.
