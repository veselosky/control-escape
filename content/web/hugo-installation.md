---
title: Installing Hugo Static Site Generator
date: 2025-11-08T15:01:05-05:00
tags:
  - hugo
description: ""
type: article
draft: true
---

*Build fast, reliable, no-nonsense websites with the Hugo static site generator.*

Hugo is a modern static site generator designed to be fast, simple to use, and highly flexible. It transforms Markdown files and templates into a complete website that can be deployed anywhere: GitHub Pages, Netlify, your own server, or even a USB drive.

This guide walks through installing **Hugo Extended** (the version most people need) on **Windows**, **macOS**, and **Linux**, including platform-specific package managers and alternative methods.
<!--more-->

## Which Version Do You Need?

There are three builds of Hugo:

| Version      | Includes                                           | Required For                                               |
| ------------ | -------------------------------------------------- | ---------------------------------------------------------- |
| **Standard** | Core generator only                                | Basic sites using pure Markdown and HTML                   |
| **Extended** | SCSS/SASS compiler, additional templating features | Themes that use SCSS (most modern themes), advanced builds |
| **Extended/Deploy** | Extended plus ability to deploy to S3-compatible services | Deploying to S3 or similar services                        |

**Recommendation:** Install **Hugo Extended** unless you are certain you don’t need SCSS support. If you know you will be deploying to S3-compatible services, consider the Extended/Deploy version.

## Check Your Installation

Once installed, verify using:

```bash
hugo version
```

Look for the word **extended** in the output:

```
hugo v0.129.0-extended linux/amd64 ...
```

If "extended" is not shown, you don’t have the correct version.

## Installing Hugo on Windows

### Option 1: Using Scoop (Recommended)

If you don’t already use Scoop (a lightweight Windows package manager), install it first:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

Then install Hugo Extended:

```powershell
scoop install hugo-extended
```

### Option 2: Using Chocolatey

If you're using Chocolatey:

```powershell
choco install hugo-extended
```

### Option 3: Manual Download

1. Visit: [https://github.com/gohugoio/hugo/releases](https://github.com/gohugoio/hugo/releases)
2. Download the latest `hugo_extended_0.xx.x_Windows-64bit.zip`
3. Extract to a folder like `C:\Hugo\bin`
4. Add that folder to your `PATH` environment variable.

## Installing Hugo on macOS

### Option 1: Homebrew (Recommended)

```bash
brew install hugo
```

This installs the **extended** version automatically if available.

Confirm with:

```bash
hugo version
```

### Option 2: MacPorts

```bash
sudo port install hugo
```

### Option 3: Manual Install

1. Download a `hugo_extended_*.tar.gz` file from the releases page.
2. Extract and move `hugo` into `/usr/local/bin` or `~/bin`.

---

## Installing Hugo on Linux

### Option 1: Homebrew on Linux (Easiest / Most Consistent)

```bash
brew install hugo
```

If you don’t have Homebrew, you can install it with:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Option 2: Snap (Ubuntu / Debian)

```bash
sudo snap install hugo --channel=extended/stable
```

> [!NOTE]
> Snap may not always have the newest version. If you need the very latest, use Homebrew or manual install.

### Option 3: Fedora / RHEL / CentOS

```bash
sudo dnf install hugo
```

Check whether this package includes Extended. Many distributions ship **Standard** only.

### Option 4: Arch Linux

```bash
sudo pacman -S hugo
```

Arch typically ships the Extended build by default.

### Option 5: Manual Install (Linux Universal)

1. Go to: [https://github.com/gohugoio/hugo/releases](https://github.com/gohugoio/hugo/releases)
2. Download the file ending in `hugo_extended_*.tar.gz` for your architecture.
3. Extract:

   ```bash
   tar -xvf hugo_extended_*.tar.gz
   ```
4. Move to a directory in your PATH:

   ```bash
   sudo mv hugo /usr/local/bin/
   ```

## Updating Hugo

Updating is as simple as re-running the install command:

* **Homebrew (macOS / Linux)**

  ```bash
  brew upgrade hugo
  ```
* **Scoop (Windows)**

  ```powershell
  scoop update hugo-extended
  ```
* **Chocolatey (Windows)**

  ```powershell
  choco upgrade hugo-extended
  ```
* **Snap (Linux)**

  ```bash
  sudo snap refresh hugo
  ```

## Testing Your Setup

Generate a new site:

```bash
hugo new site mysite
cd mysite
```

Add a theme (example: Hugo’s Ananke theme):

```bash
git init
git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke themes/ananke
echo 'theme = "ananke"' >> hugo.toml
```

Start the server:

```bash
hugo server
```

Visit:

```
http://localhost:1313
```

You now have a working Hugo development environment.

## Conclusion

Installing Hugo is straightforward, but the **Extended** version is essential for modern theme development. Whether you're building a personal blog or a professional documentation site, Hugo provides a stable, fast, and flexible foundation — without the cost and complexity of database-driven platforms.
