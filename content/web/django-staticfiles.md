---
draft: true
title: "Mastering Django Static Files for Production"
linkTitle: "Django Static Files"
dateCreated: 2025-11-15T09:39:11-05:00
date: 2025-11-15T09:39:11-05:00
tags: []
description: ""
type: article
---

One of the most challenging aspects of deploying Django applications to production is managing static files effectively. In this article, we will explore how to handle static files in Django using the built-in `staticfiles` app, third-party storage backends from `django-storages`, and best practices for serving static files in a production environment.<!--more-->

## What are "static files" in Django?

A web application's *source code* consists of two types of files. One type is source files, which are meant to be executed by the server, such as Python scripts and templates. The other type is *static files*, which include assets like CSS, JavaScript, and images that are served directly to the client's browser.

Django makes a distinction between "static" files and "media" files. Static files are part of the application's codebase; they will deploy and change with the code. Media files are user-uploaded content *managed by* the application, *not part of* the application. When you bring up a new environment for the first time, static files will be present, but media files will not.

Although they can be handled similarly, in this article, we will focus on static files.

## TL;DR Configuring static files correctly in production

### Using S3-compatible object storage for static files (recommended)
```python
# myproject/settings.py
from os import environ
INSTALLED_APPS += [
    'django.contrib.staticfiles',
]
# Local directories to READ static files from. May include project-level unprocessed
# static files, and the output directory of your front-end build pipeline.
STATICFILES_DIRS = [BASE_DIR / "static", BASE_DIR / "frontend" / "dist"]
# STATIC_ROOT is not used with S3 storage backends. Files are collected directly to S3.
# Use django-storages to configure a cloud storage backend for static files
AWS_S3_ACCESS_KEY_ID = environ["AWS_S3_ACCESS_KEY_ID"]
AWS_S3_SECRET_ACCESS_KEY = environ["AWS_S3_SECRET_ACCESS_KEY"]
AWS_STORAGE_BUCKET_NAME = environ["AWS_STORAGE_BUCKET_NAME"]
# Set custom domain if using a CDN (recommended). Must NOT end in slash!
# Example: "cdn.example.com"
CUSTOM_DOMAIN = os.environ.get("AWS_S3_CUSTOM_DOMAIN", None)
# Custom: name a function that returns the unique release ID for your project
RELEASE_ID_STRATEGY = "myproject.storage.git_hash_release_id"
# In this example, we use the same bucket for both static and media files, but
# separate them by prefixing with different "locations". You could also use
# separate buckets if you prefer.
STORAGES = {
    # Default file storage for user-uploaded MEDIA files
    "default": {
        "BACKEND": "storages.backends.s3.S3Storage",
        "OPTIONS": {
            "access_key": AWS_S3_ACCESS_KEY_ID,
            "secret_key": AWS_S3_SECRET_ACCESS_KEY,
            "bucket_name": AWS_STORAGE_BUCKET_NAME,
            "custom_domain": CUSTOM_DOMAIN,
            "location": "media",
        },
    },
    # Static file storage for collected STATIC files
    "staticfiles": {
        "BACKEND": "storages.backends.s3.S3ManifestStaticStorage",
        "OPTIONS": {
            "access_key": AWS_S3_ACCESS_KEY_ID,
            "secret_key": AWS_S3_SECRET_ACCESS_KEY,
            "bucket_name": AWS_STORAGE_BUCKET_NAME,
            "custom_domain": CUSTOM_DOMAIN,
            "location": "static",
            "release_id_strategy": RELEASE_ID_STRATEGY,
        },
    },
}
# STATIC_URL MUST end in a slash!
STATIC_URL = f"https://{CUSTOM_DOMAIN}/static/" if CUSTOM_DOMAIN else f"https://{AWS_STORAGE_BUCKET_NAME}.s3.amazonaws.com/static/"
```

```python
# myproject/storage.py
import os.path
from django.conf import settings
from django.core.exceptions import ImproperlyConfigured
from django.utils.module_loading import import_string
from storages.backends.s3 import S3StaticStorage, S3ManifestStaticStorage


def git_hash_release_id():
    """Example release ID strategy that returns the current Git commit hash."""
    import subprocess
    try:
        git_hash = subprocess.check_output(
            ["git", "rev-parse", "--short", "HEAD"],
            cwd=settings.BASE_DIR,
        ).strip().decode("utf-8")
        return git_hash
    except Exception:
        return "unknown-release"


class ReleaseSpecificManifestS3Storage(S3ManifestStaticStorage):
    def __init__(self, *args, **kwargs):
        # Determine the release ID to use for the manifest file location.
        release_id = kwargs.pop("release_id", None)
        release_id_strategy_path = kwargs.pop("release_id_strategy", None)
        if not release_id:
            if not release_id_strategy_path:
                raise ImproperlyConfigured("release_id_strategy or release_id is required for ReleaseSpecificManifestS3Storage")
            release_id_strategy = import_string(release_id_strategy_path)
            release_id = release_id_strategy()

        # Set up the manifest storage to use a subdirectory named after the release ID
        # otherwise using all the same S3 settings as the main storage.
        opts = kwargs.copy() # copy to avoid modifying original
        opts["location"] = os.path.join(kwargs.get("location", ""), release_id)
        manifest_storage = S3StaticStorage(**opts)
        super().__init__(*args, manifest_storage=manifest_storage, **kwargs)
```

### Using local filesystem for static files
```python
INSTALLED_APPS += [
    'django.contrib.staticfiles',
]
# Local directories to READ static files from. May include project-level unprocessed
# static files, and the output directory of your front-end build pipeline.
STATICFILES_DIRS = [BASE_DIR / "static", BASE_DIR / "frontend" / "dist"]

# The disk location where collected static files will be placed. Your web
# server will serve files from this directory. Note this is NOT where your
# project-level static files should be stored. This directory should be empty
# before running `collectstatic` the first time.
STATIC_ROOT="/var/www/example.com/static/"
# The disk location where user-uploaded MEDIA files are stored. This example
# uses a local directory, but in production you should use a cloud storage backend,
# even for single-server setups.
MEDIA_ROOT="/var/www/example.com/media/"
# Custom: name a function that returns the unique release ID for your project
RELEASE_ID_STRATEGY = "myproject.storage.git_hash_release_id"
STORAGES = {
    "default": {
        "BACKEND": "django.core.files.storage.FileSystemStorage",
    },
    "staticfiles": {
        "BACKEND": "myproject.storage.ReleaseSpecificManifestStaticFilesStorage",
        "OPTIONS": {
            # If RELEASE_ID is in an environment variable, pass it directly.
            # "release_id": environ["RELEASE_ID"],
            "release_id_strategy": RELEASE_ID_STRATEGY,
        },
    },
}
# STATIC_URL MUST end in a slash! This may vary based on your web server config,
# but /static/ is typical.
STATIC_URL = '/static/'
```

```python
# myproject/storage.py
import os.path
from django.conf import settings
from django.contrib.staticfiles.storage import StaticFilesStorage, ManifestStaticFilesStorage
from django.core.exceptions import ImproperlyConfigured
from django.utils.module_loading import import_string

def git_hash_release_id():
    """Example release ID strategy that returns the current Git commit hash."""
    import subprocess
    try:
        git_hash = subprocess.check_output(
            ["git", "rev-parse", "--short", "HEAD"],
            cwd=settings.BASE_DIR,
        ).strip().decode("utf-8")
        return git_hash
    except Exception:
        return "unknown-release"

class ReleaseSpecificManifestStaticFilesStorage(ManifestStaticFilesStorage):
    def __init__(self, *args, **kwargs):
        # Determine the release ID to use for the manifest file location.
        release_id = kwargs.pop("release_id", None)
        release_id_strategy_path = kwargs.pop("release_id_strategy", None)
        if not release_id:
            if not release_id_strategy_path:
                raise ImproperlyConfigured("release_id_strategy or release_id is required for ReleaseSpecificManifestStaticFilesStorage")
            release_id_strategy = import_string(release_id_strategy_path)
            release_id = release_id_strategy()

        # Set up the manifest storage to use a subdirectory named after the release ID
        manifest_storage = StaticFilesStorage(location=os.path.join(self.location, release_id))
        super().__init__(*args, manifest_storage=manifest_storage, **kwargs)
```

## Django's staticfiles app

One of Django's strengths is its support for re-usable apps. Each app can include its own static files, which is good for app modularity and reusability. But it also creates a challenge: how do you *find* these static files from various apps when it's time to serve them?

Django's `staticfiles` app addresses this challenge. It provides a framework for collecting static files from each app and other specified locations into a single directory. This collected directory can then be served by a web server in production.

### Why is this even necessary?

Django's `staticfiles` app has some architectural assumptions baked in. The creators of Django knew that dedicated web servers (like Nginx or Apache) are better suited for serving static files than Django itself. Serving static files was considered a solved problem, and they didn't want to reinvent the wheel in Django. They designed Django's `staticfiles` app to help developers collect and manage static files so they can be served by the web server rather than Django.

During development, this architectural assumption is largely hidden from the developer. Django was developed before the emergence of Docker and similar containerization technologies. Expecting it would be difficult and impractical to set up a separate web server for static files during development, the `staticfiles` app provides a built-in mechanism to serve static files directly. The documentation stresses, emphatically, that this is only suitable for development and not for production use.

In production, however, the `staticfiles` app's purpose becomes clear. It provides a way to collect all static files from various apps and locations into a single directory, which can then be served by a dedicated web server.

### How to use `staticfiles` in development and production
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
