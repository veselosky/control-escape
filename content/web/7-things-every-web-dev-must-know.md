---
title: 7 Things Every Web Developer Must Know
subtitle: (And Why Frameworks Can’t Do Them for You)
date: 2025-10-25T07:12:37-04:00
tags: []
description: Master web development with these essential skills for building robust, accessible, and high-performing websites.
type: article
params:
    cover: img/making-websites.webp
---

The web isn’t magic. It runs on a handful of simple, powerful ideas that every developer should understand — but too many skip them, trusting frameworks and libraries to handle the details.

That’s fine… until things break. Until your site slows down, your users can’t reach it, or your code becomes an unmaintainable mess.

This article is your roadmap back to the fundamentals. If you truly want to master web development — not just the flavor of the month — you must know these seven core technologies.

## 1️⃣ HTML — Structure and Meaning

HTML is not just a way to get content on the screen. HTML (Hyper-Text Markup Language) describes the **structure and meaning** of a document (commonly called a "web page"). It wraps content elements in tags to give them roles within the document.

Every element in HTML communicates intent: `<header>`, `footer`, `main`, and `<nav>` aren't decoration, they define hierarchy and purpose. Semantic HTML tells browsers, assistive technologies, and search engines what your content *is*, not just how it looks.

**Why it matters:**

* **Accessibility:** Screen readers rely on semantic tags to announce content correctly.
* **SEO:** Search engines parse meaning from elements and their relationships.
* **Maintainability:** Structured markup is easier to understand, extend, and style.
* **Performance:** Semantic HTML often eliminates unnecessary JavaScript, reducing load and interaction latency.

### Best Practices
HTML isn’t just `<div>` and `<span>`. Here are three critical areas of HTML you need to master:

**Landmarks**
Landmarks help search engines, assistive technologies, and other tools understand web pages.

* Put your main page content in `<main>`!
* Use `<header>` and `<footer>` for those static sections of a page.
* Learn to use `<aside>` and `<section>` for in-page navigation.

**Forms**
Stop building your own form elements in JavaScript frameworks!

* `<input>` comes with types like `email`, `search`, `tel` for telephone numbers, `URL`, `number`. Mobile platforms select keyboards according to input type — user experience WIN!
* The browser has date pickers, color pickers, and slider controls all by itself, no JS required!
* Bonus: use `<datalist>` for autocomplete in text inputs.

**Easy Performance Wins**
* `async` and `defer` attributes prevent scripts from blocking page render.
* Images can have `loading="lazy"` for the same reason.
* `<link rel="preload">` ensures important assets load early (but don't over-user it!)

Always choose the correct element for the job: headings for structure, lists for related items, forms for input, tables for tabular data.

* Use the [HTML Living Standard](https://html.spec.whatwg.org/) as your reference.
* Validate your HTML with [W3C Validator](https://validator.w3.org/).

**Remember:** If you can’t explain why you chose each element on a page, you’re not writing HTML — you’re drawing pictures in markup.

## 2️⃣ HTTP — Turning Documents into Applications

Combined with HTML, HTTP **is** the web. Every browser request, every API call, every asset load rides on this protocol. HTTP provides the *verbs* to HTML's *nouns*, turning a collection of documents into an application.

Defined by [RFC 9110](https://www.rfc-editor.org/rfc/rfc9110), HTTP isn’t just about “getting a page.” It defines communication semantics between clients and servers: what each method means, how caching works, how headers control behavior, and how status codes communicate state.

**Key principles:**

* **GET** is safe and cacheable. Never mutate data on GET.
* **POST** submits data for processing. Use for forms and API submissions.
* **PUT/PATCH** update existing resources.
* **DELETE** removes them.
* **HEAD** retrieves metadata only (useful for debugging and validation).
* **Status codes** matter: `200 OK`, `201 Created`, `301 Moved Permanently`, `307 Temporary Redirect`, `404 Not Found`, `410 Gone`, `500 Internal Server Error`. Choose them intentionally.

**Why it matters:**
Without understanding HTTP, developers create insecure APIs, misuse caching, and make debugging nearly impossible.

**Learn more:**

* [Mozilla Developer Network (MDN): HTTP Overview](https://developer.mozilla.org/en-US/docs/Web/HTTP/Overview)
* [RFC 9110 – HTTP Semantics](https://www.rfc-editor.org/rfc/rfc9110)

Understanding HTTP isn’t optional. It’s the skill that separates web developers from framework users.

## 3️⃣ HTTP Caching — Performance and Scalability

The difference between a site that feels instant and one that drags often comes down to caching strategy. It’s not about luck or CDN magic, it’s about mastering the rules defined in [RFC 9111](https://www.rfc-editor.org/rfc/rfc9111).

**Core ideas:**

* **Cache-Control** defines freshness: `max-age`, `no-store`, `must-revalidate`, and `immutable` govern reuse.
* **ETag** and **Last-Modified** enable *conditional requests*, so browsers re-download only when necessary.
* **Vary** prevents cross-contamination (e.g., `Vary: Accept-Encoding` keeps gzip and brotli caches distinct).
* **Public vs Private:** `Cache-Control: public` allows CDN caching; `private` restricts it to individual users.
* **Stale-While-Revalidate / Stale-If-Error** let you serve old content while fetching new content — vital for resilience.

**Why it matters:**

* Reduces bandwidth and CPU usage.
* Increases scalability: your origin server handles fewer requests.
* Improves user experience: instant responses even on slow networks.

**Learn more:**

* [RFC 9111 – HTTP Caching](https://www.rfc-editor.org/rfc/rfc9111)
* [Web.dev: HTTP Caching Best Practices](https://web.dev/http-cache/)

Get caching right, and your app feels speedy. Get it wrong, and you’ll waste compute cycles and deliver stale or inconsistent content.

## 4️⃣ DNS — The Internet’s Phonebook

Every web request begins with DNS, the **Domain Name System**. It translates a human-friendly name like `example.com` into an IP address.

But DNS is more than name resolution. It defines how browsers, servers, cookies, TLS certificates, and security boundaries interact.

**Why web developers need to understand DNS:**

* **Hosting and Virtual Servers:** Multiple sites often share one IP; DNS and the HTTP Host header route traffic correctly.
* **Cookies:** The `Domain` attribute controls which subdomains can access a cookie. Misconfigurations can leak session data.
* **TLS (HTTPS):** Certificates are issued for domain names, not servers. Wildcards (`*.example.com`) and SAN certs depend on DNS control.
* **CORS:** “Same-origin” policies are domain-based. Knowing what constitutes an origin (scheme + host + port) prevents cross-site errors.
* **Authentication:** OAuth, SAML, and similar systems depend on exact domain matching. DNS misrouting breaks them.

**Learn more:**

* [MDN: What is DNS?](https://developer.mozilla.org/en-US/docs/Learn/Common_questions/What_is_DNS)
* [Cloudflare Learning Center: DNS Explained](https://www.cloudflare.com/learning/dns/what-is-dns/)

DNS is the foundation. If you don’t understand it, you’re guessing every time your app connects to something.

## 5️⃣ CSS — The Language of Design

Modern CSS is a programming language for layout, interaction, and animation. If you think CSS is “just styling,” you’ve missed the revolution.

**Why it matters:**
CSS now does the heavy lifting that used to require JavaScript. With Grid, Flexbox, and custom properties, you can design responsive, accessible interfaces that perform at native speed.

**Core capabilities:**

* **The Cascade is a feature, not a bug.** Understanding specificity, inheritance, and the order of precedence is the key to predictable design.
* **CSS Grid and Flexbox** have replaced most layout hacks. Stop nesting divs. Learn how to design adaptive, two-dimensional layouts that just work.
* **Custom properties (`--variables`)** enable theme systems and runtime changes without build tools. They cascade, just like the rest of CSS.
* **Container Queries and Media Queries** let your components adapt to *their context*, not just the viewport. True responsive design starts here.
* **Modern Selectors** (`:is()`, `:where()`, `:has()`) simplify your stylesheets and reduce specificity wars.
* **Transitions and Animations** let you add motion and feedback directly in CSS — no JS event loops needed.
* **Accessibility and User Preferences** are built in: respect `prefers-color-scheme`, `prefers-reduced-motion`, and use semantic HTML for real visual harmony.
* **@supports** lets you opt into new features while supporting older browsers.

**Learn more:**

* [MDN: Learn CSS](https://developer.mozilla.org/en-US/docs/Learn/CSS)
* [CSS Snapshot 2023](https://www.w3.org/TR/css-2023/)
* [Smashing Magazine: Modern CSS Techniques](https://www.smashingmagazine.com/tag/css/)

Modern CSS lets you do more with less. Learn it deeply, and your designs will be lighter, faster, and far easier to maintain.

## 6️⃣ Vanilla JavaScript — Progressive Enhancement with Interaction

In 99% of cases, JavaScript should *not* be your starting point for a web site or web application. JavaScript allows web developers to build interactive features that browsers don't expose directly to users. It's a tool for *enhancement* of web applications, not a base building block. Nevertheless, it can be an essential element of many web apps.

JavaScript is the only programming language built into every browser.
Frameworks abstract it, but they can’t replace understanding it.

**Why you must know it:**

* Every modern web framework compiles *to* or runs *on top of* JavaScript.
* Debugging, profiling, and optimizing require understanding what the browser is doing.

**Core areas to master:**

* **The DOM (Document Object Model)** is how your JavaScript sees the page. Learn to create, read, and modify elements directly. It’s the foundation every framework wraps.
* **Events drive everything.** Clicks, keypresses, fetches, timers, all flow through the event loop. Understand propagation, bubbling, and `preventDefault()` to stay sane.
* **Asynchronous code is core.** Promises, `async/await`, and callbacks are the only way to keep UIs responsive and APIs efficient.
* **Closures and scopes** aren’t just academic, they’re how memory and data persistence actually work in your code.
* **Modules and imports** are now native in browsers. Stop relying on bundlers that hide how dependencies load.
* **Fetch and the Web APIs** (like `localStorage`, `IntersectionObserver`, `MutationObserver`) give you massive power without installing a single package.
* **Performance starts in the browser.** Know what blocks the main thread, how to debounce events, and how to use `requestAnimationFrame` wisely.

**Learn more:**

* [MDN: JavaScript Guide](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide)
* [WHATWG: DOM Standard](https://dom.spec.whatwg.org/)
* [Jake Archibald’s “In The Loop” talk](https://www.youtube.com/watch?v=cCOL7MC4Pl0)

Master vanilla JS, and frameworks become power tools, not crutches.

## 7️⃣ Accessibility (WCAG) — Building On-ramps, not Barriers

Accessibility is not an ivory tower academic concept. Accessibility means ensuring your users can actually use your app (even if they use assistive technologies to do so).

A simple example: using color consistently to convey information is good. Using *only* color to convey information is bad. One person in 20 is color blind.

If your site serves the public, accessibility isn’t optional. It’s **a legal requirement** in many countries — and a moral one everywhere.

The [Web Content Accessibility Guidelines (WCAG) 2.1](https://www.w3.org/TR/WCAG21/) define measurable standards for inclusive design.

**Key principles (POUR):**

* **Perceivable:** Everyone must be able to perceive your content (alt text, captions, contrast).
* **Operable:** Interfaces must work via keyboard and assistive tech.
* **Understandable:** Language, forms, and navigation must be predictable.
* **Robust:** Your site must be interoperable with assistive tools, and should work on all manner of devices from low-powered phones to expansive desktops.

**Essential practices:**

* Use semantic HTML for structure.
* Ensure visible focus states.
* Label all form inputs clearly.
* Test with keyboard-only and screen readers.
* Provide sufficient color contrast (WCAG 2.1 AA = 4.5:1).

**Learn more:**

* [W3C: WCAG 2.1 Specification](https://www.w3.org/TR/WCAG21/)
* [Deque University: Accessibility Training](https://dequeuniversity.com/)
* [WebAIM: Contrast Checker](https://webaim.org/resources/contrastchecker/)

Accessibility isn’t a checklist, it’s a mindset. Build for everyone, and you build better for all.

## ⚙️ Conclusion — The Framework Can’t Save You

Frameworks and libraries are incredible productivity tools. But they sit *on top* of these seven foundations.

If you don’t understand HTML, HTTP, caching, DNS, CSS, JavaScript, and accessibility, you’re delegating critical thinking to code you didn’t write. And when it breaks — as it always does — you won’t know where to look.

Learn these seven deeply.
They don’t change. They don’t go out of fashion. They’re what make the web *the web.*

Once you master them, you can pick up any framework, any stack, any tool, and truly *understand* what it’s doing.
That’s what makes you a **real web developer.**
