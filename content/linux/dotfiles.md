---
draft: true
title: "Dot files"
dateCreated: 2026-01-08T20:11:08-05:00
date: 2026-01-08T20:11:08-05:00
tags: []
description: ""
type: article
---

## What are dotfiles?
“Dotfiles” are configuration files for your user environment, typically stored in your home directory (`~`). They often start with a dot (`.`) to make them hidden by default in file listings. Examples include `.bashrc`, `.zshrc`, `.gitconfig`, and directories like `.config/`.

## Why manage dotfiles with git?
Using git to manage your dotfiles allows you to:
* Version control: track changes over time and revert if needed.
* Synchronization: easily sync your configuration across multiple machines.
* Backup: have a remote copy of your configurations.

Best practice is: **keep your dotfiles in a normal repo directory (not `~`) and *deploy* them into `~` via symlinks (or a tool that does the same thing).** That cleanly solves every issue you listed.

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
* Con: First checkout probably fails because of preexisting files (e.g. there's already a default `.bashrc`); you have to move or remove them.
* Con: Initial setup requires remembering some unusual commands.
* Con: You can't track files that you don't want in `~` (like a setup script or README in the repo root) without extra workarounds.

### 2) Standard repo checkout + symlink manager
Using this method, you keep your dotfiles in a normal git repo directory (e.g., `~/src/dotfiles`) and use a tool to create symlinks from that repo into your home directory. Typically, **GNU Stow** is used for this, but there are other good tools like **chezmoi** and **yadm**.

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
* Con?: Your real dotfile locations are created via symlinks in `~` / `~/.config`.
* Con: Requires an extra tool to manage symlinks (could be problematic if you can’t install software easily).

---

## Practical “best practice” guidance

* Prefer dotfiles under **XDG paths** where possible: `~/.config`, `~/.local/share`, `~/.cache`.
* Split by app/module, not “one giant blob.”
* Add a bootstrap script (`./install.sh` or `./bootstrap`) that:

  * installs dependencies (optional)
  * links files (stow/chezmoi/etc.)
  * sets safe defaults
* Handle machine-specific differences via:

  * separate “profiles”/packages, or
  * templating (chezmoi), or
  * conditional includes (`~/.gitconfig` includes, shell `source` patterns)
* Never commit secrets; use an encrypted store (chezmoi supports this well) or external secret manager.
