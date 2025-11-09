---
date: '2025-10-26T14:12:52-04:00'
draft: true
title: 'Anatomy of a Hugo Site'
tags:
    - hugo
---

In this article, we’ll explore the basic structure of a Hugo site, including its key directories and configuration files. Understanding this anatomy will help you navigate and customize your Hugo projects effectively. <!--more-->

Before we dive in, make sure you have Hugo installed. If you haven’t done that yet, read the guide: [Installing Hugo Static Site Generator](/web/hugo-installation) guide.

## Creating a New Hugo Site
We'll need a Hugo site to explore its structure. Open your terminal and run:

```
vince@Xena:sites$ hugo new site hugo-practice --format yaml
Congratulations! Your new Hugo site was created in /home/vince/Devel/hugo/sites/hugo-practice.

Just a few more steps...

1. Change the current directory to /home/vince/Devel/hugo/sites/hugo-practice.
2. Create or install a theme:
   - Create a new theme with the command "hugo new theme <THEMENAME>"
   - Or, install a theme from https://themes.gohugo.io/
3. Edit hugo.yaml, setting the "theme" property to the theme name.
4. Create new content with the command "hugo new content <SECTIONNAME>/<FILENAME>.<FORMAT>".
5. Start the embedded web server with the command "hugo server --buildDrafts".
```

Let's follow Hugo's advice and create a new theme. We'll call it "bare" and we'll add the `--format yaml` option, as I find it a bit easier to read and write.

```bash
vince@Xena:sites$ cd hugo-practice
vince@Xena:hugo-practice$ hugo new theme bare --format yaml
Creating new theme in /home/vince/Devel/hugo/sites/hugo-practice/themes/bare
```

Add the theme to the `hugo.yaml` file (the other stuff is from the boilerplate):

```yaml
baseURL: https://example.org/
languageCode: en-us
title: My New Hugo Site
theme: bare
```

Now you can run the development server and see your new Hugo site!
```bash
hugo server --buildDrafts
```

Open your web browser and navigate to `http://localhost:1313/` to see your site in action. It's not exactly pretty, but it's a start!

## Hugo Site Structure
Now that we have a Hugo site set up, let's take a look at what Hugo has created for us.

```
hugo-practice/
├── archetypes
│   └── default.md
├── assets
├── content
├── data
├── hugo.yaml
├── i18n
├── layouts
├── public
│   ├── categories
│   ├── css
│   ├── favicon.ico
│   ├── index.html
│   ├── index.xml
│   ├── js
│   ├── posts
│   ├── sitemap.xml
│   └── tags
├── static
└── themes
    └── bare
```

At the top level, Hugo has created several directories, mostly empty, and a `hugo.yaml` configuration file. Each of these directories serves a specific purpose in the Hugo ecosystem:

- `archetypes/`: Archetype files are templates for creating new content. Hugo has provided us with a single archetype file called `default.md`.
- `assets/`: Holds asset files like SCSS, JavaScript, or images that need processing.
- `content/`: The main content directory where your markdown files and other content live.
- `data/`: For storing data files in formats like JSON, YAML, or TOML that can be accessed in templates.
- `hugo.yaml`: The main configuration file for your Hugo site.
- `i18n/`: Contains translation files for multilingual sites.
- `layouts/`: Houses the HTML templates of your site. Notice that it is empty. Hugo will use the templates from your theme unless you add your own here.
- `public/`: The output directory where the generated site is built (you typically don't edit files here directly).
- `static/`: Contains static files that are served directly. The difference between `static/` and `assets/` is that files in `static/` are copied to the `public/` directory as-is at build time, while files in `assets/` can be processed by Hugo's asset pipeline, and are only copied to `public/` if they are needed.
- `themes/`: Where themes are stored; in this case, it contains our "bare" theme.

## Default Theme Content
Surprisingly, there's already a home page and several posts on our site!

What? Yes, fun fact, a "theme" isn't just for templates and style sheets. Themes can also contribute *content* to a site, as well as data, translations, and archetypes. The starter theme template includes all this:

```
themes/bare/
├── archetypes
│   └── default.md
├── assets
│   ├── css
│   │   └── main.css
│   └── js
│       └── main.js
├── content
│   ├── _index.md
│   └── posts
│       ├── _index.md
│       ├── post-1.md
│       ├── post-2.md
│       └── post-3
│           ├── bryce-canyon.jpg
│           └── index.md
├── data
├── hugo.yaml
├── i18n
├── layouts
│   ├── baseof.html
│   ├── home.html
│   ├── page.html
│   ├── _partials
│   │   ├── footer.html
│   │   ├── head
│   │   │   ├── css.html
│   │   │   └── js.html
│   │   ├── header.html
│   │   ├── head.html
│   │   ├── menu.html
│   │   └── terms.html
│   ├── section.html
│   ├── taxonomy.html
│   └── term.html
└── static
    └── favicon.ico

14 directories, 24 files
```

The theme includes a default archetype (used for creating content with `hugo new content`), a home page with some text of its own (`content/_index.md`), and three sample posts, two that are plain markdown files (`content/posts/post-1.md` and `content/posts/post-2.md`) and a third that demonstrates a [page bundle](https://gohugo.io/content-management/organization/#page-bundles) that includes an image (`content/posts/page-3/index.md` and `content/posts/post-3/bryce-canyon.jpg`).

Notice how the directory structure of the theme mirrors that of the site itself. This is a clever and useful feature of Hugo, making it easy to convert a site to a theme, among other things.

## Theme Configuration

The theme also includes its own `hugo.yaml` file. This file can define default configuration values for the theme, which can be overridden by the site's main `hugo.yaml` file. For example, the theme's `hugo.yaml` might specify default parameters for colors, fonts, or layout options that the user can customize in their own configuration file.

Although a theme's `hugo.yaml` file provides some default settings, many of the settings in a theme's `hugo.yaml` file are intentionally ignored by Hugo. This is a security feature, as we'll see later when we dive into Hugo configuration in depth. For now, just assume that only a theme's `params` section is used by Hugo; the rest is just documentation for the user.
