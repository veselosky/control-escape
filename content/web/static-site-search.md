---
title: A Search Solution for Static Sites with Hugo and Pagefind
date: 2025-11-01T20:36:34-04:00
tags:
    - hugo
keywords:
    - pagefind
    - search
description: Learn how to implement efficient site search on static sites using Pagefind with Hugo for a fast and responsive user experience.
type: article
params:
    cover: img/search.webp
---

In 2025 I relaunched Control-Escape as a statically generated site built with [Hugo](https://gohugo.io). While pre-generated sites have many advantages, one of the drawbacks has traditionally been the difficulty of implementing a site search tool.

With no back end server process to conduct searches, an alternative approach must be used. One such approach is to run the search software in the user's browser using JavaScript (shifted right). This requires building a search index at site build time (shifted left) and shipping that index as part of the site content.

To implement this, I chose [Pagefind](https://pagefind.app), a lightweight and easy-to-use search library designed for this purpose. Pagefind allows you to create a search index during the build process, which is then used by the client-side JavaScript to perform searches directly in the browser. Pagefind stores the search index in compact fragments that are loaded as needed, minimizing the initial load time of the site and keeping performance snappy for any reasonably sized site.

## Setting Up Pagefind with Hugo
Integrating Pagefind with Hugo was surprisingly easy. Here are the basic steps I followed to set it up:

1. **Install Pagefind**: Although Pagefind is a compiled binary program (written in Rust), you can install Pagefind using npm (or pip for Python projects). Run the following command in your terminal:
   ```bash
   npm install pagefind
   ```
2. **Add Search UI**: Include the Pagefind JavaScript and CSS in your site's HTML templates. You can add the following lines to your site's `baseof.html` template:
   ```html
   <!-- Pagefind CSS and JS go in the HEAD -->
   <link href="/pagefind/pagefind-ui.css" rel="stylesheet">
   <script src="/pagefind/pagefind-ui.js"></script>
   <!-- Container where the search form and results will be displayed -->
   <div id="search"></div>
   <!-- Initialize Pagefind UI -->
   <script>
       window.addEventListener('DOMContentLoaded', (event) => {
           new PagefindUI({ element: "#search", showSubResults: true });
       });
   </script>
   ```
3. **Build the Search Index**: After building your Hugo site, run Pagefind to generate the search index:
   ```bash
   npx pagefind --site public/
   ```

Pagefind creates a `pagefind` directory inside your `public` folder containing the search index and necessary assets for rendering the UI and actually searching the index.

## Using the Search UI
Pagefind's JavaScript will draw the search UI and display results for you. If you're happy with their default UI, the above snippet is all you need.

I found the default UI to be sufficient for my needs. The form it renders is keyboard accessible and includes ARIA attributes for screen readers. Accessibility is an often overlooked consideration in JavaScript applications, so it's great to see that Pagefind has taken this into account.

The search results are displayed dynamically as you type, providing a responsive experience.

Pagefind also offers [styling and customization options](https://pagefind.app/docs/ui-usage/) if you want to tweak the appearance or behavior of the search interface. And if you prefer to build your own search UI, you can use the [Pagefind JavaScript API](https://pagefind.app/docs/api/) directly to perform searches and render results however you like.

## Customizing What Gets Indexed
By default, Pagefind indexes all the text inside the `<body>` tags of your HTML files (excluding non-content tags like `<nav>` and `<footer>`). This can result in a lot of cruft making it into your search index. You can customize what gets indexed by adding specific attributes to your HTML elements.

For best integration with a static content site, place the `data-pagefind-body` attribute on your `<main>` tag or whatever element is wrapping your main content. When Pagefind detects this customization, it ignores all content outside the `data-pagefind-body` elements.

In Hugo, it's easy to do this in your `page.html` template. This ensures that your article content gets indexed, but home, section, and other non-article pages won't show up in search results.

In my case, I have some outdated articles on my site. I retain them for historical purposes (so old links don't break), but I don't necessarily want to surface those outdated articles in site searches. I added a front matter parameter `outdated: true` to those articles. Then I modified my Hugo template that renders article content to conditionally add the `data-pagefind-body` attribute only when the article is not outdated.

```
<article class="article-full"{{ if not .Params.outdated }} data-pagefind-body{{ end }}>
```

This way, only current articles are indexed by Pagefind, while outdated articles are excluded from search results.

You can also use `data-pagefind-ignore` to exclude certain sections from being indexed.

Excluding content in this way not only improves the quality of search results, but also helps keep the index size down and reduces indexing time.

## Testing Search Locally
Hugo's built-in server will also serve the Pagefind assets, so you can test your search functionality locally before deploying your site. Just build the site, run Pagefind, and then start the Hugo server:

```bash
hugo build
npx pagefind --site public/
hugo server
```

## Conclusion
Pagefind is dead simple to set up and reasonably fast at indexing, pairing nicely with Hugo's prodigious speed. The site experience is surprisingly responsive, at least for a small site like mine.

For the very small amount of effort required to set it up, I'm quite satisfied with the results.

If you're looking to add search functionality to your static site, I highly recommend giving [Pagefind](https://pagefind.app) a try!
