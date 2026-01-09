---
draft: true
title: "Dot files"
dateCreated: 2026-01-08T20:11:08-05:00
date: 2026-01-08T20:11:08-05:00
tags: []
description: ""
type: article
---


Best practice is: **keep your dotfiles in a normal repo directory (not `~`) and *deploy* them into `~` via symlinks (or a tool that does the same thing).** That cleanly solves every issue you listed.

## The common, solid patterns

### 1) “Bare repo” in `~` (popular, elegant)

You store the git metadata somewhere *not* in `~`, but tell git that the *working tree* is `~`.

* Repo data: `~/.dotfiles/` (contains the git dir)
* Working tree: `~`
* Result: files live in `~` like normal, but `~/.git` does **not** exist.

Typical setup:

```bash
git clone --bare <repo-url> ~/.dotfiles
alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dot checkout
dot config --local status.showUntrackedFiles no
```

**Why it solves your bullets**

* You’re not “checking out a repo into `~/.`” in the messy way: there’s no `~/.git`.
* Repo-only files (`.git`, `.gitignore`, etc.) don’t end up in `~`.
* You can version real dotfiles at their real paths (`~/.bashrc`, `~/.config/...`).

**Gotcha:** first checkout may fail if you already have conflicting files; you move/backup them once.

---

### 2) “Repo somewhere + symlink manager” (most explicit, easiest to reason about)

You keep dotfiles in `~/src/dotfiles` (or similar) and use a tool to link them into place.

Tools that are effectively best-practice in this category:

* **GNU Stow** (classic, simple)
* **chezmoi** (more features: templates, secrets, per-machine config)
* **yadm** (dotfile-focused git wrapper; similar vibe to bare repo)

**Layout example (Stow style):**

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

**Why it solves your bullets**

* Repo is not in `~`, so `.git` and repo admin files stay contained.
* Your real dotfile locations are created via symlinks into `~` / `~/.config`.
* You can have multiple “packages” and only link what you want per machine.

---

## What to do about “repo dotfiles” like `.gitignore`

Two approaches depending on the pattern:

* **Bare repo pattern:** you generally don’t need a `.gitignore` in `~` at all. Instead, keep ignores inside git config (recommended):

  ```bash
  dot config --local status.showUntrackedFiles no
  ```

  And if you want ignore rules for *your tools*, put them in the right place (e.g., global gitignore at `~/.config/git/ignore` and set `core.excludesFile`).

* **Symlink-manager pattern:** `.gitignore` lives in the repo root (normal) and never gets linked into `~`, because you only stow/link the files that represent dotfiles.

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
