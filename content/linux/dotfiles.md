---
title: How to Manage Dotfiles With Git (Best Practices Explained)
dateCreated: 2026-01-08T20:11:08-05:00
datePublished: 2026-01-11T14:14:45-05:00
date: 2026-01-11T14:14:45-05:00
tags: []
description: What dotfiles are, why Linux users manage them with Git, and the two most common patterns for keeping configs synced and backed up.
type: article
params:
  cover: img/blue-train-platform.webp
---

## What are dotfiles and why manage them with git?
“Dotfiles” are configuration files for your user environment, typically stored in your home directory (`~`). They often start with a dot (`.`) to make them hidden by default in file listings. Examples include `.bashrc`, `.zshrc`, `.gitconfig`, and directories like `.config/`.

These files control the behavior of your shell, text editors, version control systems, and other applications. Because they define your working environment, having a consistent set of dotfiles across multiple machines can greatly enhance productivity.

Using git to manage your dotfiles has several benefits:
* Version control: track changes over time and revert if needed.
* Synchronization: easily sync your configuration across multiple machines.
* Backup: have a remote copy of your configurations.

But managing dotfiles with git can be tricky because:
* Most dotfiles want to live directly in your home directory (`~`).
* You want to keep your home directory clean (no `.git` folder there).
* You *don't* want to store your *entire* home directory in git!

There are two common patterns to solve these challenges. We'll explore both below.

## Two common patterns for managing dotfiles with git

### 1) “Bare repo” in `~`
This method uses some less-known git features to achieve a clean setup. You store the git metadata somewhere *not* in `~`, but tell git that the *working tree* is `~`.

* Repo data: `~/.dotfiles/` (contains the git dir)
* Working tree: `~`
* Result: files live in `~` like normal, but `~/.git` does **not** exist (in your home directory).

Typical setup:

```bash
# First, you clone your repo "bare", i.e. without a working tree
git clone --bare <repo-url> ~/.dotfiles
# Then, define a convenient alias to work with your dotfiles
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# Now, checkout your files into your home directory. This will probably
# fail the first time if you have conflicting files; move/backup them once.
dot checkout
# Hide untracked files so `dot status` doesn't list literally everything in your home
dot config --local status.showUntrackedFiles no
```

**Pros and cons**

* Pro: Repo-only files (`.git`, `.gitignore`, etc.) don’t end up in `~`.
* Pro?: You can version real dotfiles at their real paths (`~/.bashrc`, `~/.config/...`). No symlinks needed.
* Con: Initial setup requires remembering some unusual commands.
* Con: You can't track files that you don't want in `~` (like a setup script or README in the repo root) without extra workarounds.

### 2) Standard repo checkout + symlink manager
Using this method, you keep your dotfiles in a normal git repo directory (e.g., `~/dotfiles`) and use a tool to create symlinks from that repo into your home directory. Typically, **GNU Stow** is used for this, but there are other good tools like **chezmoi** and **yadm**.

**Repo layout example (Stow style):**

```
dotfiles/
  git/
    .gitconfig
    .config/git/ignore
  zsh/
    .zshrc
    .config/zsh/...
  nvim/
    .config/nvim/...
```

Deploy with:

```bash
cd ~/src/dotfiles
stow git zsh nvim
```

Or better yet, keep a `setup.sh` script in the repo that does it for you.

**Pros and cons**

* Pro: Repo-only files (`.git`, `.gitignore`, etc.) don’t end up in `~`.
* Pro: Initial setup is straightforward and can be easily scripted and documented in-repo.
* Pro: You can have multiple “packages” and only link what you want per machine.
* Con?: Your real dotfile locations are created via symlinks in `~`.
* Con: Requires an extra tool to manage symlinks (could be problematic if you can’t install software easily).

## Which way is "best"?

Both methods are valid and widely used. The choice depends on your preferences:
* If you want a minimal setup without symlinks and don't mind the initial complexity, go with the bare repo method.
* If you prefer simplicity, flexibility, and easier management of multiple configurations, use the standard repo + symlink manager approach.

Personally, I use the second method with GNU Stow. This makes it easier for me to set up new machines: fewer commands to remember, and I can keep setup scripts and documentation in the same repo without issues.
