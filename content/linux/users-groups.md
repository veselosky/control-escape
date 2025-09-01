---
type: article
title: "Users and Groups"
description: Learn how users, groups, and admin privileges keep your Linux system secure.
date: "2024-06-07T16:20:00-0400"
publishDate: "2011-06-03T22:53:15-0400"
lastmod: "2024-06-07T16:20:00-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2011 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

Linux puts a lot of power at your fingertips. That\'s the best reason to switch to
Linux; it\'s also the most dangerous thing about the system. Linux controls how much
power you can use on the computer based on your Login ID. It keeps a database of all
users, and it keeps track of which user owns which files, and which users have
permission to view, edit, and execute each file, folder or program. An ordinary user
will not be able to do really dangerous things, like editing the user database, or
deleting every file on the system.

Understanding Linux user permissions is crucial for managing a secure and efficient
system. This article will delve into the essentials of Linux user and group permissions,
covering key concepts and configurations.
<!--more-->

## Identity and Permissions

In Linux, every file and process is owned by a user and a group. These ownerships
determine who can access or modify files and execute commands. The system uses three
types of permissions:

1. **Read (r)**: Permission to read the file or list directory contents.
2. **Write (w)**: Permission to modify the file or directory.
3. **Execute (x)**: Permission to execute a file or traverse a directory.

Permissions are assigned to three categories:

- **User (u)**: The owner of the file.
- **Group (g)**: Users who are members of the file's group.
- **Others (o)**: All other users.

A typical permission set might look like `rwxr-xr--`, where:

- `rwx` applies to the user.
- `r-x` applies to the group.
- `r--` applies to others.

This means the user can read, write, and execute; the group can read and execute; and
others can only read.

## User and SuperUser

Linux systems have a special user called the **superuser** or **root**. The root user
has unrestricted access to all commands and files on the system. This power is necessary
for system administration tasks but can be dangerous if misused.

Normal users have limited permissions for security reasons. For instance, they can only
modify their files and cannot affect system-wide settings or other users' files.

When you are logged in as root, you are not just an ordinary user, you are SuperUser.
(SuperUser is a real Unix term, synonymous with root.) There are no restrictions on your
power. You have the ability to crash the system and make it otherwise unusable in more
ways than you can imagine. As a novice it is very easy to make your system completely
unusable with a single erroneous command. Believe me. I speak from experience. The first
weekend after I installed Linux, I had to reinstall it FOUR times before I finally got
smart and quit destroying it. And I\'m a pretty savvy guy around computers, so don\'t
think you\'re immune just because you know your way around a PC.

Because it is so dangerous to be logged in as root, you should never use this account
unless you have to. The root account is meant to be used by the System Administrator to
perform certain duties which can be destructive and therefore should only be performed
by an expert. Some examples are emptying log files, mounting and unmounting file systems
(more on this later under [Getting to CD's and Floppies](/linux/lx-mounting)), installing or
removing programs, and creating or deleting user accounts.

## Becoming SuperUser

Sometimes, regular users need to perform tasks that require higher privileges.

No phone booth needed. The obvious way is simply to login as root. That may be the best
way to do it if you plan on doing a bunch of system maintenance type stuff, but
operating as root regularly is a bad idea, as you lose all the security protections that
Linux provides. Logging in as the root user is generally discouraged and is in fact
prohibited on some Linux systems by default. Fear not, there are several ways to
temporarily gain superuser privileges:

### Using `su`

The `su` (substitute user) command allows a user to switch to another user account,
including the superuser. Type the following, and enter the _root password_ at the
password prompt.

```bash
su -
```

Bang! Just like that, you are SuperUser! A few cautions: Although you are now SuperUser,
this is not a \"login\" shell, so your environment hasn\'t changed. The biggest way this
will effect you is that some programs you normally run as root may appear to be missing.
That\'s because your PATH environment variable, the list of places Linux looks for
executables, does not contain `/sbin` or `/usr/sbin`. If you try to run a command like
`shutdown` (see below) and it complains, try typing `/sbin/shutdown` instead. That
should do it.

When you are finished with your maintenance tasks you should immediately change back to
normal user mode:

    [root]# exit
    [user]$

Notice that while you are SuperUser, your command prompt looks different. An ordinary
user is prompted with the dollar sign (`$`) while SuperUser gets a pound sign or
hashmark (`#`). This makes it easy to tell which mode you are in. (This is true on most
Linux distributions, but your prompts may be different, and they can be customized.)

### Using `sudo`

The `sudo` (superuser do) command allows permitted users to execute a command as the
superuser or another user, as specified by the security policy:

```bash
sudo <command>
```

For example, to update the system package list:

```bash
sudo apt-get update
```

At the password prompt, type _your password_, not the root password. If it works, you
will have just executed a command _as superuser_. Congratulations!

If you got an error about not being in the sudoers file, see the section below on
[configuring sudo](#configuring-sudo).

## Configuring sudo

To configure `sudo` permissions, the `/etc/sudoers` file must be edited. This file
defines which users can execute which commands via `sudo`.

### Editing `/etc/sudoers`

To safely edit the `/etc/sudoers` file, use the `visudo` command. This command checks
the file for syntax errors before saving, preventing potential misconfigurations:

```bash
sudo visudo
```

A typical entry in the sudoers file looks like this:

```bash
username ALL=(ALL:ALL) ALL
```

This grants the user `username` the ability to execute any command as any user on the
system. It's also possible to restrict permissions to specific commands:

```bash
username ALL=(ALL:ALL) /usr/bin/apt-get
```

This line allows `username` to run the `apt-get` command with superuser privileges.

### Adding Users to the sudo Group

Another common practice is to add users to the `sudo` group. Members of this group are
granted sudo privileges without having to be individually listed in the sudoers file:

```bash
sudo usermod -aG sudo username
```

This command adds `username` to the `sudo` group.

## Conclusion

Understanding and properly configuring user and group permissions in Linux is
fundamental for maintaining a secure and efficient system. By knowing how to manage
identities and permissions, use the superuser account judiciously, and configure `sudo`,
you can ensure your system runs smoothly while minimizing security risks.
