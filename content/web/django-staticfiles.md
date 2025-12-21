---
title: Mastering Django Static Files for Production
linkTitle: Django Static Files
dateCreated: 2025-11-15T09:39:11-05:00
date: 2025-11-15T09:39:11-05:00
tags: []
description: Learn how to handle Django static files in production using staticfiles, S3, CDNs, and manifest storage—plus solutions for rolling deployment pitfalls.
type: article
params:
  cover: img/magic-pony-django.webp
---

One of the most challenging aspects of deploying Django applications to production is managing static files effectively. In this article, we will explore how to handle static files in Django using the built-in `staticfiles` app, third-party storage backends from `django-storages`, and best practices for serving static files in a production environment.<!--more-->

## What are "static files" in Django?

A web application's *source code* consists of two types of files. One type is source files, which are meant to be executed by the server, such as Python scripts and templates. The other type is *static files*, which include assets like CSS, JavaScript, and images that are served directly to the client's browser.

Django makes a distinction between "static" files and "media" files. Static files are part of the application's codebase; they will deploy and change with the code. Media files are user-uploaded content *managed by* the application, *not part of* the application. When you bring up a new environment for the first time, static files will be present, but media files will not.

Although they can be handled similarly, in this article, we will focus on static files.

## TL;DR Configuring static files correctly in production
For a working example project with code you can crib from, see the [Django staticfiles example repository](https://github.com/veselosky/django-staticfiles-example).

For scalable deployments, use a dedicated object storage service (like Amazon S3, Google Cloud Storage, or Azure Blob Storage) to host your static files. Use the `django-storages` package to integrate with these services. Use a custom storage backend that creates a release-specific subdirectory for static files to avoid manifest conflicts during rolling deployments. [Example configuration.](https://github.com/veselosky/django-staticfiles-example/blob/master/example/settings_s3.py)

For single-server deployments, use a custom storage backend that creates a release-specific subdirectory for static files to avoid manifest conflicts during rolling deployments. [Example configuration.](https://github.com/veselosky/django-staticfiles-example/blob/master/example/settings_custom.py)

[Example custom storage backends that create release-specific subdirectories.](https://github.com/veselosky/django-staticfiles-example/blob/master/example/storages.py)

## Django's staticfiles app

One of Django's strengths is its support for re-usable apps. Each app can include its own static files, which is good for app modularity and reusability. But it also creates a challenge: how do you *find* these static files from various apps when it's time to serve them?

Django's `staticfiles` app addresses this challenge. It provides a framework for collecting static files from each app and other specified locations into a single directory. This collected directory can then be served by a web server in production.

### Why is this even necessary?

Django's `staticfiles` app has some architectural assumptions baked in. The creators of Django knew that dedicated web servers (like Nginx or Apache) are better suited for serving static files than Django itself. Serving static files was considered a solved problem, and they didn't want to reinvent the wheel in Django. They designed Django's `staticfiles` app to help developers collect and manage static files so they can be served by the web server rather than Django.

During development, this architectural assumption is largely hidden from the developer. Django was developed before the emergence of Docker and similar containerization technologies. Expecting it would be difficult and impractical to set up a separate web server for static files during development, the `staticfiles` app provides a built-in mechanism to serve static files directly. The documentation stresses, emphatically, that this is only suitable for development and not for production use.

In production, however, the `staticfiles` app's purpose becomes clear. It provides a way to collect all static files from various apps and locations into a single directory, which can then be served by a dedicated web server.

### Using `staticfiles` in development
To use Django's `staticfiles` app, you need to add it to your `INSTALLED_APPS` in your `settings.py` file (already included in the default Django project template):

```python
INSTALLED_APPS = [
    ...
    'django.contrib.staticfiles',
    ...
]
```

Next, you need to define the locations of your static files. You can specify multiple directories where Django will look for static files using the `STATICFILES_DIRS` setting:

```python
STATICFILES_DIRS = [
    BASE_DIR / "static",
    BASE_DIR / "frontend" / "dist",
]
```

There's another setting that's relevant, although you probably will never need to touch it: `STATICFILES_FINDERS`. This setting defines the mechanisms Django uses to find static files. The default includes two finders: `FileSystemFinder`, which searches the directories in `STATICFILES_DIRS`, and `AppDirectoriesFinder`, which searches the "static" subdirectory of each app in your `INSTALLED_APPS`.

In development, that's all you need to do. The `staticfiles` app will automatically serve static files from the specified directories when you run the development server (when `DEBUG` is `True`).

### Collecting static files for production
When you're ready to deploy your Django application to production, you need to collect all static files into a single directory that your web server can serve. This is done using the `collectstatic` management command:

```bash
python manage.py collectstatic --noinput
```

This command will gather all static files from the locations specified in `STATICFILES_DIRS` and from each app's "static" subdirectory, and copy them into the directory specified by the `STATIC_ROOT` setting (when using a `FileSystemStorage` backend, see more about storages below).

### Serving static files in production
There are three common methods of serving static files in production:

1. **Using a dedicated web server**: Configure a web server like Nginx or Apache to serve the static files from the `STATIC_ROOT` directory. In a traditional deployment scenario, the web server fields requests to your site first, and serves static files directly, passing only application requests to Django.
2. **Using object storage services**: If you can't or don't want to use a dedicated web server, use services like Amazon S3, Google Cloud Storage, or Azure Blob Storage to host your static files. This approach is scalable and offloads the serving of static files from your web server. This pattern is commonly used to manage and serve *media* files, so repeating the pattern for static files is straightforward. The [`django-storages`](https://django-storages.readthedocs.io/en/latest/) package provides storage backends for these services, making it easy to integrate them with Django's `staticfiles` app.
3. **Using WhiteNoise**: [WhiteNoise](https://whitenoise.readthedocs.io/en/stable/django.html) is a popular third-party package that allows Django to serve static files directly in production. While not as efficient as using a dedicated web server or object storage, it can be a simpler solution for smaller applications or when deploying to platforms that don't support custom web server configurations.

## Storage backends and CDNs
When serving static files in production, it's important to consider caching and versioning. Regardless of which method you choose to serve static files, you should always use a CDN (Content Delivery Network). A CDN offloads the delivery of static files to edge locations closer to your users, improving load times and reducing latency for them, and reducing the load on your origin server.

Even if you don't use a CDN (you really should), browsers cache static files to improve performance, and this can lead to issues when you update your static files, so you still have to deal with caching implications. If a browser has cached an old version of a file, it may not fetch the updated version, leading to inconsistencies in your application's appearance or functionality.

To address this, Django provides "manifest" storage backends that append a hash of the file's contents to its filename. This ensures that when a static file is updated, its filename changes, prompting browsers to fetch the new version. As a result, you can set long cache expiration times for your static files without worrying about users receiving stale content.

### How manifest storage backends work
When your run `collectstatic` command with a manifest storage backend, after collecting all the static files, the `collectstatic` command calls the `post_process` method of the storage backend. This method processes each static file, computes a hash of its contents, and saves a new copy of the file to include this hash in its filename (e.g., `style.css` might become `style.abc123.css`). It's important to note that the original files are retained, not replaced; the hashed versions are additional copies.

As part of this process, Django scans the contents of the static files for references to other static files (e.g., in CSS files referencing images or fonts) and updates those references to point to the new hashed filenames. This ensures that all internal references within your static files remain consistent.

Finally, Django generates a manifest file that maps the original filenames to their hashed versions. This manifest is used to look up the correct filename when you reference static files in your templates using the `{% static %}` template tag.

### The manifest "gotcha" with rolling deployments
There's a hidden challenge when using manifest storage backends in production, specifically in environments with rolling deployments, where multiple versions of your application may be running simultaneously. Each version of your application has its own set of static files with different hashes. The catch is, the manifest file itself is not hashed or versioned by default; it always has the same name (`staticfiles.json`). This can lead to bugs, because after you run `collectstatic` for a new deployment, the manifest file will be updated to reflect the new static files, but older versions of your application may still be running and expecting the old manifest file. This can lead to serving static files that don't match the templates referencing them, or even 500 errors if the manifest file is missing entries for the older version's static files.

To solve this problem, you can create a custom manifest storage backend that stores the manifest file in a subdirectory named after a unique release identifier (e.g., a Git commit hash or a timestamp). This way, each deployment has its own manifest file, and older versions of your application can still access their corresponding static files without conflict. The example code above demonstrates how to implement such a custom storage backend for both S3 and local filesystem storage backends.

## Conclusion
Managing static files in Django for production can be complex, but with the right tools and practices, it can be made straightforward. By leveraging Django's `staticfiles` app, using appropriate storage backends, and implementing caching strategies with CDNs, you can ensure that your static files are served efficiently and reliably in a production environment.
