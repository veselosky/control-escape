---
type: article
title: "Linux Command Line Basics"
date: "2024-06-08T09:50:00-0400"
dateCreated: "2011-01-03T08:50:00-0500"
lastmod: "2024-06-08T09:50:00-0400"
params:
  author: "Vince Veselosky"
  copyright: "2011 Vince Veselosky."
  contact: "<vince@control-escape.com>"
---

## What is this \"shell\"?

The \"shell\" is another name for the command shell or command interpreter. This is the
program that gives you a command prompt, accepts the commands you type there, and
basically makes the computer do what you tell it to. In DOS the program that did this
was command.com (unless you were a real technogeek and used
[4dos](http://en.wikipedia.org/wiki/4DOS) or something). In Linux, the shell is the
first program that starts when you log in, and it keeps running until you log out,
waiting to do your bidding. Linux is able to use any of several different shells, but
the default Linux shell is called bash and is the only one I will discuss.

## Why It Is Called a Shell

The shell\'s job is to interpret your commands and run the programs you request. Linux
was designed to be a multitasking operating system, which means you can run more than
one program at one time. Linux was also designed as a multi-user OS, which means that
you can have more than one _shell_ running at the same time. (Each user gets his own
shell at login.) As a user, you have access only to the programs you are running, not
the ones other users are running (though you can run your own copy of the same program).
The programs are kept separate because they are \"enclosed\" in a \"shell\".

## Cool Command Line Tricks

Here is the stuff that you MUST know. The command line interface would be completely
unbearable if not for a few simple tricks that make life okay.

### Command History

The shell stores a list of the commands that you have issued. You can navigate up and
down through this list using the Up and Down Arrow keys. To repeat the last command is
just Up Arrow, Enter.

### Command Completion

Linux can have some outrageously long file names, which is great when you\'re reading
them in a list, but it sucks when you have to type it on the command line. At least it
_would_ suck if not for this nifty little feature. Type the first letter or two and then
press the Tab key. The shell will try to complete your command. If you typed enough
letters to uniquely identify the file name, the shell fills the rest in for you. If the
letters match multiple file names, the shell will fill in everything up to the point
where they differ and wait. Hit Tab again and it will give you a list of possibilities.
The shell will also help you complete path names. Try it out. You will _love_ this.

### Multitasking

I\'ll try to expand this later, but here\'s the one minute version. To run a job
(program) in the background, type an ampersand (&) at the end of the command line. To
suspend the currently running job, Ctrl-Z. To force a suspended job to run in the
background, type `bg <job>`. To bring a background job into the foreground, type
`fg <job>`. To see a list of jobs currently running (or suspended) type `jobs`. If you
exclude the [\<job\>] argument on these commands, it defaults to whatever job was last
running in the foreground (not the one currently in the foreground).

## Navigating the Command Line: ls, cd, and pwd

Navigating the Linux filesystem from the command line is a fundamental skill for any
user. The three essential commands for moving around and understanding your location
within the filesystem are `ls`, `cd`, and `pwd`.

### Listing Directory Contents with `ls`

The `ls` command lists the contents of a directory. By default, it displays the files
and directories in your current location:

```bash
ls
```

You can also list the contents of a specific directory by specifying its path:

```bash
ls /path/to/directory
```

Adding options to `ls` can provide more detailed information. For example, `-l` displays
the contents in long format, which includes permissions, number of links, owner, group,
size, and modification time:

```bash
ls -l
```

The `-a` option shows all files, including hidden ones (those starting with a dot `.`):

```bash
ls -a
```

Combining options gives you a comprehensive view:

```bash
ls -la
```

### Changing Directories with `cd`

The `cd` (change directory) command is used to move around the filesystem. To go to a
specific directory, type `cd` followed by the directory's path:

```bash
cd /path/to/directory
```

To move to your home directory, simply use:

```bash
cd
```

Or:

```bash
cd ~
```

To navigate to the parent directory (one level up), use:

```bash
cd ..
```

To move to the root directory, use:

```bash
cd /
```

You can also use relative paths. For example, if you are in `/home/user` and want to go
to `/home/user/documents`, you can simply use:

```bash
cd documents
```

### Printing the Working Directory with `pwd`

The `pwd` (print working directory) command displays the full path of the current
directory. This is useful to confirm your current location within the filesystem:

```bash
pwd
```

### Example Workflow

Here's a typical workflow using these commands:

1. **List the contents of your current directory**:

   ```bash
   ls
   ```

2. **Change to a different directory** (e.g., moving to a directory named `projects`):

   ```bash
   cd projects
   ```

3. **Print the working directory to confirm your new location**:

   ```bash
   pwd
   ```

4. **List the contents of a specific subdirectory within `projects`**:

   ```bash
   ls subdirectory
   ```

By mastering these commands, you can efficiently navigate the Linux filesystem and
manage your files and directories with ease.

## Viewing Text Files: `cat`, `more` or `less`

In Linux, viewing the contents of text files is a common task. There are several
commands available to accomplish this, each with its own advantages. Here, we will cover
`cat`, `more`, and `less`.

### Viewing Files with `cat`

The `cat` (short for "concatenate") command is the simplest way to view the contents of
a file. It displays the entire file content in the terminal.

For example, to view a file named `example.txt`, you would use:

```bash
cat example.txt
```

`cat` is best used for small files because it prints the entire content at once. For
large files, it can be overwhelming as it will flood the terminal with text.

### Paging Through Files with `more`

The `more` command is a pager, meaning it allows you to view the contents of a file one
screen at a time. This is useful for larger files that don't fit in a single screen.

For example, to view `example.txt` one screen at a time:

```bash
more example.txt
```

While viewing the file, you can navigate with:

- **Spacebar**: Move to the next screen.
- **Enter**: Scroll down one line.
- **b**: Go back one screen.
- **q**: Quit and return to the command line.

`more` is a step up from `cat`, but it has limitations, especially with backward
navigation.

### Navigating Files with `less`

The `less` command is similar to `more` but with additional features and better
navigation capabilities. It allows you to move forward and backward through the file
seamlessly.

For example, to view `example.txt` with `less`:

```bash
less example.txt
```

While viewing the file with `less`, you can navigate with:

- **Spacebar**: Move to the next screen.
- **Enter**: Scroll down one line.
- **b**: Go back one screen.
- **Up/Down Arrow Keys**: Move one line up or down.
- **Page Up/Page Down**: Move one screen up or down.
- **g**: Go to the beginning of the file.
- **G**: Go to the end of the file.
- **/search_term**: Search for a term in the file.
- **n**: Go to the next occurrence of the search term.
- **N**: Go to the previous occurrence of the search term.
- **q**: Quit and return to the command line.

`less` is highly recommended for viewing large files due to its robust navigation and
search capabilities.

By mastering these commands, you can efficiently view and navigate through text files of
any size in the Linux environment.

## Creating Files and Directories in Linux

Creating files and directories is a fundamental task in Linux. In this tutorial, we'll
cover three essential commands: `mkdir` for creating directories, `touch` for creating
empty files, and `echo` with redirection for creating and appending to files.

### Creating Directories with `mkdir`

The `mkdir` (make directory) command is used to create new directories.

For example, to create a directory named `new_directory`:

```bash
mkdir new_directory
```

You can also create nested directories by using the `-p` option:

```bash
mkdir -p parent_directory/child_directory
```

This command creates both `parent_directory` and `child_directory` in one step. Without
the `-p` you would get an error if `parent_directory` did not exist. Think of `-p` as
"with parents".

### Creating Empty Files with `touch`

The `touch` command is used to create empty files or update the timestamp of existing
files.

For example, to create an empty file named `new_file.txt`:

```bash
touch new_file.txt
```

If `new_file.txt` already exists, `touch` updates its timestamp to the current time.

### Creating and Appending to Files with `echo` and Redirection

The `echo` command outputs text to the terminal, but combined with redirection, it can
be used to create or append text to files.

#### Creating a New File with `echo`

To create a new file and write text to it, use the `>` (greater than) operator:

```bash
echo "This is some text" > new_file.txt
```

This command creates `new_file.txt` (if it doesn't exist) and writes "This is some text"
into it. **WARNING:** If `new_file.txt` already exists, it will be overwritten, and its
previous contents will be lost. Check your targets!

#### Appending to an Existing File with `echo`

To append text to an existing file, use the `>>` (double greater than) operator:

```bash
echo "This is additional text" >> existing_file.txt
```

This command adds "This is additional text" to the end of `existing_file.txt` without
overwriting its existing contents.

### Example Workflow

Here's a typical workflow using these commands:

1. **Create a new directory**:

   ```bash
   mkdir my_directory
   ```

2. **Navigate into the new directory**:

   ```bash
   cd my_directory
   ```

3. **Create an empty file**:

   ```bash
   touch my_file.txt
   ```

4. **Write text to a new file**:

   ```bash
   echo "Hello, World!" > hello.txt
   ```

5. **Append text to the existing file**:

   ```bash
   echo "Welcome to my file." >> hello.txt
   ```

By mastering `mkdir`, `touch`, and `echo` with redirection, you can efficiently create
and manage files and directories in Linux. These basic commands form the foundation for
more advanced file manipulation and system administration tasks.

## Copying, Moving, and Renaming Files and Directories in Linux

Managing files and directories often involves copying, moving, and renaming them. In
this tutorial, we will cover the `cp` and `mv` commands for these tasks.

### Copying Files and Directories with `cp`

The `cp` (copy) command is used to copy files and directories.

To copy a file, specify the source file and the destination:

```bash
cp file1.txt file2.txt
```

This command copies `file1.txt` to `file2.txt`. If `file2.txt` exists, it will be
overwritten. Check your targets!

To copy directories, use the `-r` (recursive) option:

```bash
# copy the dir1 directory as the new dir2 directory
cp -r dir1 dir2
```

This command copies the contents of `dir1` into `dir2`. If `dir2` does not exist, it
will be created. Note that although these are directories, we do NOT include the `/` at
the end, because that would change the meaning of the command.

```bash
# copy the dir1 directory into an existing dir2 directory. Result: dir2/dir1
cp -r dir1 dir2/
```

```bash
ls dir1
  example.txt
# copy the *contents* of dir1 into an existing dir2 directory, but not dir1 itself
cp -r dir1/ dir2/
ls dir2
  example.txt
```

Watch for these subtle differences in the use of `/` when copying files!

### Moving and Renaming Files and Directories with `mv`

The `mv` (move) command is used to move or rename files and directories. The basic
syntax is:

```bash
mv source destination
```

To move a file into another directory, specify the source file and the destination
directory:

```bash
mv file.txt /path/to/destination/
```

This command moves `file.txt` to the specified directory. Note that the destination ends
in `/` showing it is a directory. This will keep the file name unchanged, so the file
will now reside at `/path/to/destination/file.txt`.

To rename a file, specify the old name and the new name:

```bash
mv oldname.txt newname.txt
```

To move a directory, specify the source directory and the destination:

```bash
mv dir1 /path/to/destination/
```

This command moves `dir1` to the specified destination directory. It now resides at
`/path/to/destination/dir1`.

Using `cp`, `mv`, and `mv` commands, you can efficiently copy, move, and rename files
and directories in Linux. These basic file manipulation commands are essential for
effective file management and organization on your system.

## Deleting Files and Directories in Linux

Managing the deletion of files and directories is an essential task in Linux. In this
tutorial, we'll cover how to delete files and directories using the `rm` and `rmdir`
commands, including how to remove non-empty directories with `rm -r`.

### Deleting Files with `rm`

The `rm` (remove) command is used to delete files.

For example, to delete a file named `example.txt`:

```bash
rm example.txt
```

#### Using Options with `rm`

- **Prompt Before Deleting**: Use the `-i` option to prompt for confirmation before each
  file is deleted:

  ```bash
  rm -i filename
  ```

- **Force Deletion**: Use the `-f` option to force the deletion of files without
  prompting for confirmation:

  ```bash
  rm -f filename
  ```

### Deleting Empty Directories with `rmdir`

The `rmdir` (remove directory) command is used to delete empty directories.

For example, to delete an empty directory named `empty_dir`:

```bash
rmdir empty_dir
```

Note that `rmdir` will only remove directories that are completely empty. If there are
any files or subdirectories inside the target, you will get an error.

```bash
rmdir non_empty_dir
  rmdir: non_empty_dir: Directory not empty
```

### Deleting Non-Empty Directories with `rm -r`

To delete directories that are not empty, use the `rm` command with the `-r` (recursive)
option. This will delete the directory and all its contents:

```bash
rm -r non_empty_dir
```

#### Using Options with `rm -r`

- **Prompt Before Deleting**: Use the `-i` option with `-r` to prompt for confirmation
  before deleting each file and subdirectory:

  ```bash
  rm -r -i directory_name
  ```

- **Force Deletion**: Use the `-f` option with `-r` to force the deletion of directories
  and their contents without prompting:

  ```bash
  rm -r -f directory_name
  ```

This can also be combined as:

```bash
rm -rf directory_name
```

Using `rm` and `rmdir` commands, you can effectively manage the deletion of files and
directories in Linux. Note that all of these commands are permanent -- there is no
"undo". You will not find files deleted in this way in a recycle bin. They are gone for
good. As always, check your targets!
