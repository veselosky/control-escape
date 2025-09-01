---
title: "Using uv to Manage Django Projects"
date: "2024-08-28T18:23:34-04:00"
keywords: ["uv", "django"]
description: "Crash course in managing Django projects with Astral's uv"
type: article
params:
   cover: img/uv-girl.webp
---

`uv` is a tool from [Astral.sh](https://astral.sh) that helps you manage Python tools
and development projects. For all the details you can
[read the docs](https://docs.astral.sh/uv/), but here's a quick lesson in what it can do
and how it can help Python developers in the daily grind of developing Python software.
We'll walk through managing a hypothetical Django project.
<!--more-->

## Installing and/or Running Python Tools

Django has a command for starting new projects: `django-admin startproject myproject`.

But of course, you have this chicken and egg problem. In order to start a Django
project, you must first have Django installed. `uv`'s `tool` subcommand fixes this
problem. `uv tool run` (and its shortcut alias, `uvx`) will create a temporary virtual
environment, install the requested tool into it, and run it from there.

So to bootstrap my Django project with `uv` I can:

```bash
uvx --from django django-admin startproject myproject
```

The `--from` tells `uv` which package to install. You can leave that out if the package
and the command have the same name.

If you don't already have Python installed, `uv` can install it for you:

```bash
uv python install 3.12
```

`uv` will work with whatever Pythons you already have installed, but it's nice to know
you can install alternate versions with a single command.

## Initializing a Project (Creating `pyproject.toml`)

Now that I've started my Django project, I need to initialize `uv` in the project.

```bash
cd myproject
uv init
```

This will:

- Create an empty README.md file
- Create a basic `pyproject.toml` file
- Create a "source layout" module by creating `scr/myproject/__init__.py`

If this were a standard Python module that would be a good place to start, but since
this is a Django project and already has a `myproject` directory at the top, we'll just
remove the one `uv` created.

```bash
rm -r src
```

The `pyproject.toml` contents look like this:

```toml
[project]
name = "myproject"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.12"
dependencies = []

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

It uses the Hatchling build back end by default, but you're welcome to change that to
setuptools or whatever you're comfortable with. You might have a different
`requires-python` depending what versions you have installed.

## Adding Requirements

Let's start by adding some standard requirements I use in all my Django projects.

```bash
$ uv add django django-environ django-extensions pillow docutils
Using Python 3.12.4
Creating virtualenv at: .venv
Resolved 9 packages in 291ms
   Built myproject @ file:///Users/vince/Devel/cctest/myproject
Prepared 8 packages in 691ms
Installed 8 packages in 361ms
 + asgiref==3.8.1
 + django==5.1
 + django-environ==0.11.2
 + django-extensions==3.2.3
 + docutils==0.21.2
 + myproject==0.1.0 (from file:///Users/vince/Devel/cctest/myproject)
 + pillow==10.4.0
 + sqlparse==0.5.1
```

A lot just happened there (in a very short time). `uv` started by creating a virtual
environment for the project, since we didn't have one already. It installed all the
packages I asked for (and their dependencies), just as if I had used `pip install`, into
the virtual environment. It also added those packages to the `dependencies` in the
`pyproject.toml`:

```toml
[project]
name = "myproject"
version = "0.1.0"
description = "Add your description here"
readme = "README.md"
requires-python = ">=3.12"
dependencies = [
    "django>=5.1",
    "django-environ>=0.11.2",
    "django-extensions>=3.2.3",
    "pillow>=10.4.0",
    "docutils>=0.21.2",
]

[build-system]
requires = ["hatchling"]
build-backend = "hatchling.build"
```

Notice how it installed the latest versions of all dependencies, but it allows for newer
version in the future.

It also created a `uv.lock` file pinning the exact versions installed to facilitate
repeatable builds. I won't print the contents here because it's quite long.

If you edit the dependencies manually, `uv sync` will bring your `uv.lock` file up to
date and ensure your virtualenv exactly matches it.

You can also create a standard `requirements.txt` lock file with:

```bash
uv pip compile -o requirements.txt pyproject.toml
```

But that file won't be kept up to date with `uv sync` so remember to update it yourself
(or use a pre-commit hook to regenerate it).

## Adding development-only requirements

I want to have some dev tools installed in my development environment, but not in
production. `uv` supports this:

```bash
$ uv add --dev django-debug-toolbar coverage pytest pytest-cov pytest-django
Resolved 18 packages in 244ms
   Built myproject @ file:///Users/vince/Devel/cctest/myproject
Prepared 9 packages in 749ms
Uninstalled 1 package in 1ms
Installed 9 packages in 32ms
 + coverage==7.6.1
 + django-debug-toolbar==4.4.6
 + iniconfig==2.0.0
 ~ myproject==0.1.0 (from file:///Users/vince/Devel/cctest/myproject)
 + packaging==24.1
 + pluggy==1.5.0
 + pytest==8.3.2
 + pytest-cov==5.0.0
 + pytest-django==4.8.0
```

As before, the `uv.lock` and `pyproject.toml` files were updated, and the virtual
environment was synchronized to match the lock file. The `pyproject.toml` now has a new
table to hold the dev dependencies:

```toml
[tool.uv]
dev-dependencies = [
   "django-debug-toolbar>=4.4.6",
   "coverage>=7.6.1",
   "pytest>=8.3.2",
   "pytest-cov>=5.0.0",
   "pytest-django>=4.8.0",
]
```

## Using local sources for apps

One extremely useful feature of `uv` is sources.

Let's say I want my django project to use a reusable Django app that I develop called
`django-sitevars`.

```bash
$ uv add django-sitevars
Resolved 19 packages in 285ms
   Built myproject @ file:///Users/vince/Devel/cctest/myproject
Prepared 2 packages in 733ms
Uninstalled 1 package in 1ms
Installed 2 packages in 4ms
 + django-sitevars==1.0.2
 ~ myproject==0.1.0 (from file:///Users/vince/Devel/cctest/myproject)
```

But maybe I'm making some changes to `django-sitevars` locally and I want to test them
out in the context of my project. I can do that easily by adding just a couple of lines
to my `pyproject.toml`:

```toml
[tool.uv.sources]
django-sitevars = { path = "../django-sitevars", editable = true }
```

Now a quick (and I mean quick) `uv sync` and my virtualenv will load `django-sitevars`
from my local development sources instead of installing from PyPI.

When I regenerate my `requirements.txt` I don't want it pointing to a local directory
for django-sitevars, though. So I use:

```bash
uv pip compile --no-sources -o requirements.txt pyproject.toml
```

## `uv` is awesome!

That's whirlwind tour of using `uv` to manage a project. Check out
[the official documentation](https://docs.astral.sh/uv/) to find out all the other
awesome things `uv` can do.
