---
type: article
title: "Managing Linux Software with APT and dpkg"
date: "2024-06-03T21:43:08-0400"
params:
  author: "Vince Veselosky"
  copyright: "© 2024 Vince Veselosky"
  contact: "<vince@control-escape.com>"
---

Managing software on a Linux system can seem daunting to newcomers, but tools like `apt`
and `dpkg` make it straightforward and efficient. This tutorial will guide you through
the basics of using `apt` and `dpkg` to manage software on Debian-based distributions
like Ubuntu.

## What are `apt` and `dpkg`?

- **`apt` (Advanced Package Tool):** A high-level package management system that
  simplifies the process of installing, updating, and removing software packages. It
  automatically handles dependencies, ensuring all required software is installed.

- **`dpkg` (Debian Package):** A low-level package manager for Debian-based systems. It
  handles the installation, configuration, and removal of `.deb` packages but does not
  resolve dependencies on its own.

Let's explore common tasks using `apt` and `dpkg`.

## Installing a Package with `apt`

To install a package with `apt`, use the `install` command. For example, to install the
text editor `vim`:

```bash
sudo apt update
sudo apt install vim
```

- `sudo apt update` refreshes the list of available packages and their versions.
- `sudo apt install vim` installs the `vim` package.

## Uninstalling a Package with `apt`

To remove a package, use the `remove` command. For instance, to uninstall `vim`:

```bash
sudo apt remove vim
```

If you want to remove the package along with its configuration files, use `purge`:

```bash
sudo apt purge vim
```

## Searching for a Package with `apt`

To search for a package, use the `search` command. For example, to find packages related
to `vim`:

```bash
apt search vim
```

This command will list all packages that have `vim` in their name or description.

## Installing Packages from a PPA

Personal Package Archives (PPAs) allow you to install software that is not available in
the official repositories. Here's how to add a PPA and install a package from it. We'll
use the "deadsnakes" PPA, which provides newer versions of Python.

1. **Add the PPA:**

   ```bash
   sudo add-apt-repository ppa:deadsnakes/ppa
   ```

2. **Update the package list:**

   ```bash
   sudo apt update
   ```

3. **Install the desired version of Python (e.g., Python 3.9):**

   ```bash
   sudo apt install python3.9
   ```

## Installing a Downloaded `.deb` File with `dpkg`

Sometimes, you might need to install a package not available in the repositories or
PPAs. You can download a `.deb` file and install it using `dpkg`. Here's how:

1. **Download the `.deb` file.** For example, let's download the `google-chrome-stable`
   package:

   ```bash
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   ```

2. **Install the package using `dpkg`:**

   ```bash
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   ```

3. **Fix any dependency issues:**

   If `dpkg` reports missing dependencies, fix them with:

   ```bash
   sudo apt install -f
   ```

   The `-f` flag tells `apt` to fix broken dependencies.

## Conclusion

Managing software on Linux using `apt` and `dpkg` is efficient and straightforward once
you understand the basic commands. Here's a quick recap:

- Use `apt` for high-level package management (install, remove, search).
- Add PPAs with `add-apt-repository` for additional software sources.
- Use `dpkg` to handle `.deb` files directly, followed by `apt install -f` to resolve
  dependencies.

By mastering these tools, you can ensure your system is always up-to-date with the
software you need. Happy Linuxing!
